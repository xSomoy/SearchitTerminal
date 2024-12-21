#!/usr/bin/env bash
parameter="$1"
opParam="$2"
tmpquery="$@"

echo "$parameter"
echo "$opParam"
echo "$tmpquery"

#nohup $parameter  > /dev/null 2>&1 &