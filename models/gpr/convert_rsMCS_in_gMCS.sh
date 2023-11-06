# convert_rsMCS_in_gMCS.sh - Maxime Mahout
# converts compressed MCSs in gMCSs using ASP logic programming

# description of instances:
# common cutsets = single species common to both bacteria
# nlg cutsets = single species that are no longer cutsets on the consortium

clingo gMCS_from_rsMCS.lp4 consortium_instance_common_cutsets.lp4 consortium_gpr.lp4 consortium_gpr_rev.lp4  consortium_mcsReactionSubsets.lp4 -c pklfile=\"consortium_instance_common_cutsets.pkl\" -n 0 --heuristic Domain --enum-mode domRec

clingo gMCS_from_rsMCS.lp4 consortium_instance_nlg_cutsets.lp4 consortium_gpr.lp4 consortium_gpr_rev.lp4 consortium_mcsReactionSubsets.lp4 -c pklfile=\"consortium_instance_nlg_cutsets.pkl\" -n 0 --heuristic Domain --enum-mode domRec
         
# output: pickle file, contains a Python dict
# associates all solution identifiers (from the rsMCSs instance lp4 file) to a list of gMCSs
# the list contains all possible decompressed solutions according to GPR rules
