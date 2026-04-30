# Script Explanation

This project runs Gemma 4 locally on Jetson using llama.cpp.

Key concepts:
- nvpmodel: sets max power mode
- jetson_clocks: locks max performance
- Docker: runs llama.cpp container
- Volumes: persist model files
- -c: context size
- -ngl: GPU offload layers
- --no-mmproj: disables multimodal (saves memory)
