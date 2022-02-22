# cd ..

# alias python=/cluster/home/hanwang/miniconda3/envs/habitat/bin/python

export GLOG_minloglevel=2
export MAGNUM_LOG=quiet


python -u -m torch.distributed.launch \
    --use_env \
    --nproc_per_node 4 \
    run.py \
    --exp-config vlnce_baselines/config/r2r_waypoint/7.yaml \
    --run-type train
