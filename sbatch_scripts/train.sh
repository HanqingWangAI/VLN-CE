cd ..

# alias python=/cluster/home/hanwang/miniconda3/envs/habitat/bin/python

export GLOG_minloglevel=2
export MAGNUM_LOG=quiet


bsub -n 16 -R "rusage[mem=8000,ngpus_excl_p=4]" -R "select[gpu_model0==NVIDIATITANRTX]" -W 72:00 -oo logs python -u -m torch.distributed.launch \
    --use_env \
    --nproc_per_node 4 \
    run.py \
    --exp-config vlnce_baselines/config/r2r_waypoint/6.yaml \
    --run-type train
