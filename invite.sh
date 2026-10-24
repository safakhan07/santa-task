#!/bin/bash
# Usage: ./invite.sh mail.txt database.txt

if [ $# -ne 2 ] || [ ! -f "$1" ] || [ ! -f "$2" ]; then
    echo "Usage: $0 mail_text_file database_file" >&2
    exit 1
fi

shopt -u patsub_replacement 2>/dev/null

template=$(cat "$1")

while IFS=';' read -r name address time || [ -n "$name" ]; do
    [ -z "$name" ] && continue
    letter="$template"
    letter="${letter//<name>/$name}"
    letter="${letter//<address>/$address}"
    letter="${letter//<time>/$time}"
    echo "$letter"
    echo "----------------------------------------"
done < "$2"
