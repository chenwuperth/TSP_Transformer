#!/bin/bash
# Run nvidia container for profiling.
#
# Once inside the container:
#   1. Get the profile
#         dlprof python profile_tsp.py
#   2. Inspect the results
#         tensorboard --logdir event_files
# Sources:
#   https://docs.nvidia.com/deeplearning/frameworks/dlprof-user-guide/
docker run --rm --gpus=1 --shm-size=1g --ulimit memlock=-1 \
  --ulimit stack=67108864 -it -p6006:6006 \
  -v $(pwd):/workspace \
  nvcr.io/nvidia/pytorch:21.04-py3
