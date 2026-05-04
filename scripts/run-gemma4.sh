cat > ~/jetson-gemma4-llm/scripts/run-gemma4.sh <<'EOF'
#!/usr/bin/env bash
set -e

MODEL="/data/models/huggingface/models--unsloth--gemma-4-E2B-it-GGUF/snapshots/90f9618340396838ee7ff5b0ba2da27da62953d3/gemma-4-E2B-it-Q4_K_S.gguf"

docker run --rm \
  --runtime nvidia \
  --network host \
  -v /ssd/models:/data/models/huggingface \
  ghcr.io/nvidia-ai-iot/llama_cpp:latest-jetson-orin \
  bash -lc "export LD_LIBRARY_PATH=/usr/local/lib:/opt/llama.cpp/install/lib:/opt/llama.cpp/build/bin:\$LD_LIBRARY_PATH && llama-server \
    -m \"$MODEL\" \
    --host 0.0.0.0 \
    --port 8080 \
    -ngl 0 \
    -c 2048 \
    -b 16 \
    -ub 8 \
    --parallel 1 \
    --flash-attn off"
EOF

chmod +x ~/jetson-gemma4-llm/scripts/run-gemma4.sh

▶️ Run it
cd ~/jetson-gemma4-llm/scripts
./run-gemma4.sh