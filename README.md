# Running Gemma 4 on Jetson Orin Nano (8GB) — Constraints & Optimization

## 🎯 Goal
Run a modern LLM (Gemma 4) on constrained edge hardware (Jetson Orin Nano 8GB) with stable performance and no cloud dependencies.

## ⚙️ Setup

See scripts/run-gemma4.sh

## 🧠 Key Learnings
- CUDA OOM issues require tuning -ngl
- Context size directly impacts RAM usage
- Docker must use persistent volumes to avoid re-downloads
- llama.cpp works better than Ollama on Jetson

## 🚀 Result
- Local LLM inference
- Remote API access
- Stable 4096 context on 8GB device

## 📊 Monitoring (jtop)

Below is the system running Gemma 4 locally on the Jetson Orin Nano:

![jtop](./assets/jtop1.png)