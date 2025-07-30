#!/bin/bash

get_stats() {
    # Call nordvpn status and settings once and store the output
    local status_output=$(nordvpn status)
    local status=$(echo "$status_output" | awk -F': ' '/Status/ {print $2}')
    if [[ "$status" == "Connected" ]]; then

        # Parse the stored output
        local location=$(echo "$status_output" | awk -F': ' '/Country/ {print $2}')
        local transfer=$(echo "$status_output" | awk -F': ' '/Transfer/ {print $2}')

        local down_float=$(echo "$transfer" | awk -F'[ :]' '{print $1}')
        local down_int=$(echo "scale=0; ($down_float + 0.5)/1" | bc)
        local down_units=$(echo "$transfer" | awk -F'[ :]' '{print $2}')

        local up_float=$(echo "$transfer" | awk -F'[ :]' '{print $4}')
        local up_int=$(echo "scale=0; ($up_float + 0.5)/1" | bc)
        local up_units=$(echo "$transfer" | awk -F'[ :]' '{print $5}')

        echo "🌏$location ⬇${down_int} ${down_units} ⬆${up_int} ${up_units}"
    else
        echo "VPN Off"
    fi
}

toggle() {
    local status=$(nordvpn status | awk -F': ' '/Status/ {print $2}')
    if [[ "$status" == "Connected" ]]; then
        nordvpn disconnect
    else
        nordvpn connect US
    fi
}

case "$1" in
    toggle)
        toggle
        ;;
    *)
        get_stats
        ;;
esac
