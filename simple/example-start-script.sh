#!/bin/bash

for i in {0..7}
do	
	name=$(printf "/nishome/artem/Projects/Pipe/test_compare_2015/test_8/Calc_%02d/" $i)
	echo "$i $name"
	cd $name
	# Start a job
	mpirun -np 4 lmp_auto < input.in &
	# Store the PID so we can wait on it.
	DEPS_PID=$!
	# Wait until Node deps is done
	wait $DEPS_PID
done

#for i in {0..5}
#do
#	name=$(printf "/nishome/artem/Projects/Pipe/test_compare_2015/Calc_%02d.00/" $i)
#	echo "$i $name"
#	cd $name
#	# Start a job
#	lmp_auto < input.in &
#	# Store the PID so we can wait on it.
#	DEPS_PID=$!
#	# Wait until Node deps is done
#	wait $DEPS_PID
#done

# Wait for all remaining jobs to finish
wait
