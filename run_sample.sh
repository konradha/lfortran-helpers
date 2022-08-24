#!/bin/bash

good=0
bad=0


#integrate: 52 / 57 
#interpolate: 64 / 86 
#io: 0 / 1
#linalg: ??? -> 1 tokenizer bug halting it all
#odr: 4/5 (3/4 need `INTRINSIC`enabled) 
#optimize: ???  

#sparse ???

#special: 2 ICE, lots of `INTRINSIC`, `PARAMETER`, `EXTERNAL`
#stats:

all=$(find /home/konrad/code/forks/lfortran/../../scipy/scipy/optimize/minpack -name "*.f" | wc -l)
for src in $(find /home/konrad/code/forks/lfortran/../../scipy/scipy/optimize/minpack -name "*.f")
do     
    #curr=$(echo $good "+" $bad | bc) 
    #echo $curr "/" $all ": " $src 
    #{
    #IFS=$'\n' read -r -d '' CAPTURED_STDERR;
    #IFS=$'\n' read -r -d '' CAPTURED_STDOUT;
    #} < <((printf '\0%s\0' "$(/home/konrad/code/forks/lfortran/src/bin/lfortran --no-warnings --no-color --fixed-form --implicit-typing --show-asr $src)" 1>&2) 2>&1) 
    ##} < <((printf '\0%s\0' "$(gfortran -c $src)" 1>&2) 2>&1)
    #if [[ -z $CAPTURED_STDERR ]]
    #then
    #    bad=$((bad+1))
    #else
    #    good=$((good+1))
    #fi
    /home/konrad/code/forks/lfortran/src/bin/lfortran --no-warnings --no-color --fixed-form --implicit-typing --show-asr $src
    #echo $src $good $bad 
done

echo "number of all files: $all" 
echo "compiling files: " $good
echo "bad files: " $bad
