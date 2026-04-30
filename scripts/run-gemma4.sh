#!/bin/bash

sudo nvpmodel -m 0
sudo jetson_clocks

sudo docker run -it --rm \
  --runtime=nvidia \
  --network host \
  -v \$HOME/jetson-llm/models:/data/models/huggingface \
  -v \$HOME/.cache/huggingface:/root/.cache/huggingface \
  ghcr.io/nvidia-ai-iot/llama_cpp:latest-jetson-orin \
  llama-server \
  -hf unsloth/gemma-4-E2B-it-GGUF:Q4_K_S \
  -c 4096 \
  -ngl 1 \
  --no-mmproj \
  --host 0.0.0.0 \
  --port 8080
