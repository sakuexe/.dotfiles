#!/usr/bin/env sh

TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n 1)

# make the icon responsive!
ICON=""

if (( $TEMP > 40 )); then
  ICON=""
fi
if (( $TEMP > 50 )); then
  ICON=""
fi
if (( $TEMP > 60 )); then
  ICON=""
fi

echo "{\"text\": \"${ICON} ${TEMP}°C\", \"tooltip\": \"NVIDIA GPU Temp\"}"
