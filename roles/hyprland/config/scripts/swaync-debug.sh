#!/bin/env bash

logfile=/home/aleksandra/swaync.log
logfile_bak=/home/aleksandra/swaync.bak.log

if [[ -f "$logfile" ]]; then
  mv "$logfile" "$logfile_bak"
fi

G_MESSAGES_DEBUG=all swaync &> $logfile
