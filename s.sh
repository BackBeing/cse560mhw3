#!/bin/bash

for pf in 256 512 # 1024 2048 4096
do
	for iq in 4 8 16 32 64 128 256
	do
		for rob in 4 8 16 32 64 128 256
		do
		$GEM5/build/ARM/gem5.opt hw3config.py -c $GEM5/../test_progs/daxpy/daxpy_arm_big --cpu-type="DerivO3CPU" --caches --l2cache --pf_num=$pf --rob_num=$rob --iq_num=$iq
		printf "%-5s %-4s %-4s\n" $pf $rob $iq >> sim_seconds.txt
		printf "%-5s %-4s %-4s\n" $pf $rob $iq >> fp_rename_lookups.txt
		printf "%-5s %-4s %-4s\n" $pf $rob $iq >> iq_rate.txt
		printf "%-5s %-4s %-4s\n" $pf $rob $iq >> IdleCycles.txt
		printf "%-5s %-4s %-4s\n" $pf $rob $iq >> ROBFullEvents.txt
		printf "%-5s %-4s %-4s\n" $pf $rob $iq >> miss_rate.txt
		grep -E 'sim_seconds' m5out/stats.txt >> sim_seconds.txt
		grep -E 'system.cpu.rename.fp_rename_lookups' m5out/stats.txt >> fp_rename_lookups.txt
		grep -E 'system.cpu.iq.rate' m5out/stats.txt >> iq_rate.txt
		grep -E 'system.cpu.rename.IdleCycles' m5out/stats.txt >> IdleCycles.txt
		grep -E 'system.cpu.rename.ROBFullEvents' m5out/stats.txt >> ROBFullEvents.txt
		grep -E 'system.l2.overall_mshr_miss_rate::total' m5out/stats.txt >> miss_rate.txt
		done
	done
done