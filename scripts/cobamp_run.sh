# cobamp_run.sh

# Run cobamp on uncompressed single-species models

python cobamp_run.py --sbml ../models/iPae_1146_medium.xml --filename output_cobamp_PA.txt --target-1 PAO1_Biomass

python cobamp_run.py --sbml ../models/iYS854_medium.xml --filename output_cobamp_SA.txt --target-1 BIOMASS_iYS_wild_type

# Run cobamp on compressed consortium

python cobamp_run.py --sbml ../models/reduced/consortium_reduced_cobamp.xml --filename output_cobamp_consortium.txt --target-1 rsub_52_494
