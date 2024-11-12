#!/bin/env bash

# Only start dropbox if it exists
if [[ -x $(command -v dropbox) ]]; then
  dropbox
fi
