#!/bin/bash

subject=$1
message=$2
name=$3
recipient=$4

echo -e "Subject:$subject\n\n$message" | ssmtp -F"$name" $recipient

