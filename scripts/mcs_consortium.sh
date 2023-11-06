
aspefmIR=(clingo ../aspefm/clingoLP.py ../aspefm/mcsLP.lp4)
aspefmIR="${aspefmIR[@]}"

params=(-c nstrict=0 -c accuracy=10 --heuristic Domain --enum-mode domRec --stats=2 -c epsilon="(1,3)" --verbose=3)
params="${params[@]}"

mcschecker=../aspefm/extensions/mcs_checker.py

cstr=$PWD/params/consortium.mcs.constr.lp4
target=$PWD/params/consortium.mcs.target.lp4

echo ":- 17 {cutset(R) : reaction(R)}." > $cstr # taille max = 16
echo ':- not support("mcs_rsub_52_rsub_494_tgt").' > $target

# check
MC=../models/reduced/consortium_reduced.xml
# network
consortium=../models/reduced/consortium_reduced_mcs.lp4

# run aspefm on consortium with time limit 1.5 days
(cd ../aspefm/; $aspefmIR $mcschecker $consortium $params $target $cstr -n 0 -c nb=100000 -c mcscheckfile=\"$MC\" --time-limit=129600) > output_mcs.consortium.new.txt





