#!/usr/bin/env bash

# Set-DisplayEnvironmentVariable.ps1 が作る
# DISPLAY_BASE環境変数をxauthに登録する
xauth add ${DISPLAY_BASE} . $(xxd -l 16 -p /dev/urandom)
