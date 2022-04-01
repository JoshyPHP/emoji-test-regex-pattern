#!/bin/bash

for infile in dist/*/sequences.txt;
do
	dir="${infile%/*}"
	cmd="vendor/bin/build-regexp --infile $infile --overwrite"

	$cmd --preset java       --outfile "$dir/java.txt"
	$cmd --preset javascript --outfile "$dir/javascript.txt"
	$cmd --preset javascript --outfile "$dir/javascript-u.txt" --flags u
	$cmd --preset re2        --outfile "$dir/cpp-re2.txt"
done
