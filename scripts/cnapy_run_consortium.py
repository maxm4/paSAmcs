import straindesign as sd
import cobra

sa_pa = cobra.io.read_sbml_model('consortium_sa_pa.xml')

module_suppress = sd.SDModule(sa_pa,sd.names.SUPPRESS,constraints='PAO1_Biomass_PA + BIOMASS_iYS_wild_type_SA>=0.001')
module_protect = sd.SDModule(sa_pa, sd.names.PROTECT, constraints='')

import time

start = time.time()

import logging
logging.basicConfig(level=logging.INFO)
# Compute strain designs
sols = sd.compute_strain_designs(sa_pa,
                                 sd_modules = [module_suppress, module_protect],
                                 time_limit = 129600,
                                 max_solutions = 10000,
                                 max_cost = 16,
                                 solution_approach = sd.names.ANY)
# Print solutions
#print(f"One compressed solution with cost {sols.sd_cost[0]} found and "+\
#      f"expanded to {len(sols.reaction_sd)} solutions in the uncompressed netork.")
#print(f"Example knockout set: {[s for s in sols.reaction_sd[0]]}")

end = time.time()

print(end-start)


sols.save('cnapy_sols_new.save')

f = open('cnapy_sols_new.txt', 'w')
print(sols.get_strain_designs(), file=f)
f.close()

import pickle
fb = open('cnapy_sols_new.pkl', 'wb')
pickle.dump(sols, fb)
fb.close()
