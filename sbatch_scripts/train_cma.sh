cd ..

# alias python=/cluster/home/hanwang/miniconda3/envs/habitat/bin/python

export GLOG_minloglevel=2
export MAGNUM_LOG=quiet


bsub -n 8 -R "rusage[mem=8000,ngpus_excl_p=1]" -W 48:00 -oo logs python 
    run.py \
    --exp-config vlnce_baselines/config/r2r_baselines/cma.yaml \
    --run-type train
