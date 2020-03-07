#!/bin/bash

CONFIGPATH="/etc/toshi"
CONFIGFILE="$CONFIGPATH/config.yml"
CONFIG='host = "0.0.0.0"
port = '$PORT'
path = "'$DATAPATH'"
writer_memory = '$WRITERMEMORY'
log_level = "'$LOGLEVEL'"
json_parsing_threads = '$JSONPARSINGTHREADS'
bulk_buffer_size = '$BULKBUFFERSIZE'
auto_commit_duration = '$AUTOCOMMITDURATION'
experimental = false

[experimental_features]
master = true
nodes = [
    "127.0.0.1:8081"
]

[merge_policy]
kind = "'$KIND'"
min_merge_size = '$MINMERGESIZE'
min_layer_size = '$MINLAYERSIZE'
level_log_size = '$LEVELLOGSIZE'
'

if [ ! -f "$CONFIGPATH" ]; then
    mkdir -p $CONFIGPATH
fi

if [ ! -f "$CONFIGFILE" ]; then
    echo "$CONFIG" >> $CONFIGFILE
fi

/bin/toshi -c $CONFIGFILE