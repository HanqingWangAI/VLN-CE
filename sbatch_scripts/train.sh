cd ..

# alias python=/cluster/home/hanwang/miniconda3/envs/habitat/bin/python

export GLOG_minloglevel=2
export MAGNUM_LOG=quiet


bsub -n 16 -R "rusage[mem=8000,ngpus_excl_p=1]" -W 4:00 -oo logs python -u -m torch.distributed.launch \
    --use_env \
    --nproc_per_node 1 \
    run.py \
    --exp-config vlnce_baselines/config/r2r_waypoint/6-hpn-__.yaml \
    --run-type train
