#!/usr/bin/env sh

TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n 1)
echo "{\"text\": \" ${TEMP}°C\", \"tooltip\": \"NVIDIA GPU Temp\"}"
