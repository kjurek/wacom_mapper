#!/bin/bash

INPUTS=$(xsetwacom --list devices | rev | awk '{print $3}' | rev)
OUTPUTS=$(xrandr --listactivemonitors | sed '1d' | rev | awk '{print $1}' | rev)

PS3='Please select output device: '
select OUTPUT in $OUTPUTS
do
    for INPUT in $INPUTS
    do
        xsetwacom --set "$INPUT" MapToOutput "$OUTPUT"
    done
    break
done

