Param
(
    [Parameter(Mandatory=$true)]
    $Text,
    $OutputFilePath = "${env:TEMP}\tts.wav",
    $SkipTts = $false,
    $SkipPlay = $false,
    $ModelName = "tts_models/en/ljspeech/glow-tts",
    $VocoderName = "vocoder_models/en/ljspeech/multiband-melgan"
)

If (-Not $SkipTts) {
    # virtualenvのactivateスクリプトのパスを作成
    # $env:USERPROFILE\venvs\tts\Scripts\activate.ps1
    $ActivatePath = (Join-Path -Path "$env:USERPROFILE" -ChildPath "venvs" `
      | Join-Path -ChildPath "tts" `
      | Join-Path -ChildPath "Scripts" `
      | Join-Path -ChildPath "activate.ps1")

    . $ActivatePath

    tts `
      --model_name "$ModelName" `
      --vocoder_name "$VocoderName" `
      --text "$Text" `
      --out_path "$OutputFilePath"
}

If (-Not $SkipPlay) {
    $PlayWav = New-Object Media.SoundPlayer
    $PlayWav.SoundLocation = Resolve-Path "$OutputFilePath"
    Write-Host Play: $PlayWav.SoundLocation
    $PlayWav.PlaySync()
}

# Local Variables:
# coding: utf-16-dos
# End:
