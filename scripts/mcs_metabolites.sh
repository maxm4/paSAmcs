aspefmIR=(clingo ../aspefm/clingoLP.py ../aspefm/mcsLP.lp4)
aspefmIR="${aspefmIR[@]}"

params=(-c nstrict=0 -c accuracy=10 --heuristic Domain --enum-mode domRec --stats=2 -c epsilon="(1,3)" --verbose=3)
params="${params[@]}"

mcschecker=../aspefm/extensions/mcs_checker.py

cstr=$PWD/params/consortium.mcs.constr.lp4
target=$PWD/params/consortium.mcs.target.lp4

echo ":- 9 {cutset(R) : reaction(R)}." > $cstr # max size = 8

# check
MC_pa=../models/reduced/consortium_reduced_pa.xml
MC_sa=../models/reduced/consortium_reduced_sa.xml

# network
consortium_pa=../models/reduced/consortium_reduced_mcs_pa.lp4
consortium_sa=../models/reduced/consortium_reduced_mcs_sa.lp4

# if PA_NLG and SA_NLG not created
unzip ../outputs/aspefm_pa_metabolites.zip # creates PA_NLG
unzip ../outputs/aspefm_sa_metabolites.zip # creates SA_NLG

PA_NLG=$PWD/PA_NLG/
SA_NLG=$PWD/SA_NLG/

# executions to be 'parallelized'

# PA
deb=0
fin=36

echo ':- not support("mcs_rsub_52_tgt").' > $target

for i in `seq $deb $fin`; do
    (cd ../aspefm/; $aspefmIR $mcschecker $consortium_pa $params $target $cstr -n 0 -c nb=100000 --time-limit=129600 -c mcscheckfile=\"$MC_pa\" ${PA_NLG}cstr_${i} ${PA_NLG}nlg_${i}) > ${PA_NLG}output_${i} #&
done

read -p "Press any key to resume ..."

# SA
deb=0
fin=79

echo ':- not support("mcs_rsub_494_tgt").' > $target

for i in `seq $deb $fin`; do
    (cd ../aspefm/; $aspefmIR $mcschecker $consortium_sa $params $target $cstr -n 0 -c nb=100000 --time-limit=129600 -c mcscheckfile=\"$MC_sa\" ${SA_NLG}cstr_${i} ${SA_NLG}nlg_${i}) > ${SA_NLG}output_${i} #&
done


