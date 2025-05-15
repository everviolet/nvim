#!/usr/bin/env bash

nvim --headless "$@" -c 'luafile minidoc.lua' +"quit"
