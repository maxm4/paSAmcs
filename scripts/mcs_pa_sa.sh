aspefmIR=(clingo ../aspefm/clingoLP.py ../aspefm/mcsLP.lp4)
aspefmIR="${aspefmIR[@]}"

params=(-c nstrict=0 -c accuracy=10 --heuristic Domain --enum-mode domRec --stats=2 --verbose=3)
params="${params[@]}"

mcschecker=../aspefm/extensions/mcs_checker.py

LPSAKP=../models/sa_pa/sa_reduced_mcs.lp4
LPPAKP=../models/sa_pa/pa_reduced_mcs.lp4
TGSAKP=$PWD/params/target_sa.lp4
TGPAKP=$PWD/params/target_pa.lp4
CSTRSAPA=$PWD/params/cstr_sa_pa.lp4

MCPA=../models/sa_pa/pa_reduced.xml
MCSA=../models/sa_pa/sa_reduced.xml

echo ':- not support("mcs_rsub_51_tgt").' > $TGPAKP
echo ':- not support("mcs_rsub_12_tgt").' > $TGSAKP
echo ":- 4 {cutset(R) : interest(R)}. 1 {cutset(R) : interest(R)} 3." > $CSTRSAPA # max size = 3

# NO MCS CHECKER

(cd ../aspefm/; $aspefmIR -n 0 $LPPAKP $params $TGPAKP $CSTRSAPA -c epsilon="(1,3)" --solve-limit=325000 -c nb=1000 --trans-ext=integ --sat-prepro=3 --eq=4) > output_mcs_compressed_pa_noMcsCheck.txt &

(cd ../aspefm/; $aspefmIR -n 0 $LPSAKP $params $TGSAKP $CSTRSAPA -c epsilon="(5,2)" --solve-limit=600000 -c nb=1000 --trans-ext=integ --sat-prepro=3 --eq=4) > output_mcs_compressed_sa_noMcsCheck.txt &

# MCS CHECKER

(cd ../aspefm/; $aspefmIR $mcschecker -n 184 -c mcscheckfile=\"$MCPA\" $LPPAKP $params $TGPAKP $CSTRSAPA -c epsilon="(1,3)" -c nb=1000 --trans-ext=integ --sat-prepro=3 --eq=4) > output_mcs_compressed_pa_McsCheck.txt &

(cd ../aspefm/; $aspefmIR $mcschecker -n 279 -c mcscheckfile=\"$MCSA\" $LPSAKP $params $TGSAKP $CSTRSAPA -c epsilon="(5,2)" -c nb=1000 --trans-ext=integ --sat-prepro=3 --eq=4) > output_mcs_compressed_sa_McsCheck.txt
