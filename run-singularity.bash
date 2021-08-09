#!/bin/bash

args=''
for i in "$@"; do 
    i="${i//\\/\\\\}"
    args="$args \"${i//\"/\\\"}\""
done

if [ "$args" == "" ]; then args="/bin/bash"; fi

hostname=$(hostname -s)
if [[ $hostname =~ ^g[v,r] ]]; then nv="--nv"; fi

singularity \
    exec $nv \
    --overlay /home/wang/python-embedding/pytorch-1.9.0.ext3:ro \
    /scratch/work/public/singularity/cuda11.1.1-cudnn8-devel-ubuntu20.04.sif \
    /bin/bash -c "
source /ext3/env.sh
$args
"


    
