#!/bin/bash
for pf in 256 512 1024 2048 4096
do
	for iq in 4 8 16 32 64 128 256
	do
		for rob in 4 8 16 32 64 128 256
		do
		$GEM5/build/ARM/gem5.opt hw3config.py -c $GEM5/../test_progs/daxpy/daxpy_arm_big --cpu-type="DerivO3CPU" --caches --l2cache --num-phys-float-regs=$pf --num-rob-entries=$rob --num-iq-entries=$iq
		grep -E 'sim_seconds|system.cpu.rename.fp_rename_lookups|system.cpu.iq.rate|system.cpu.rename.IdleCycles|system.cpu.rename.ROBFullEvents|system.l2.overall_mshr_miss_rate::total' m5out/stats.txt
		done
	done
done