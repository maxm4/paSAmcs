import cobra
from cobamp.wrappers import KShortestMCSEnumeratorWrapper
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('--sbml')

parser.add_argument('--filename')

parser.add_argument('--stop-criteria', type=int)

parser.add_argument('--target-1')
parser.add_argument('--target-2')
parser.add_argument('--enable-target-2', action='store_true')

args = parser.parse_args()

filename = args.filename if args.filename is not None else 'cobamp_solutions_new.txt'
stopcri = int(args.stop_criteria) if args.stop_criteria is not None else 5000 # 3
target1 = args.target_1 if args.target_1 is not None else 'rsub_52_494'
target2 = args.target_2 if args.target_2 is not None else '' # 'rsub_494'
sbml = args.sbml if args.sbml is not None else 'consortium_reduced_cobamp.xml'

print('Using default time limit: 1.5 days')
print(args)

f = open(filename, 'w')

model = cobra.io.read_sbml_model(sbml)

ksefm = KShortestMCSEnumeratorWrapper(
    model=model,
    target_flux_space_dict={target1: (1, None), target2: (1, None)} if args.enable_target_2 else {target1: (1, None)},
    target_yield_space_dict={},
    algorithm_type=KShortestMCSEnumeratorWrapper.ALGORITHM_TYPE_ITERATIVE, #POPULATE,
    stop_criteria=stopcri,
    solver='CPLEX')

enumerator = ksefm.get_enumerator()

import time
start = time.time()

import signal
from contextlib import contextmanager

class TimeoutException(Exception): pass

@contextmanager
def time_limit(seconds):
    def signal_handler(signum, frame):
        raise TimeoutException("Timed out!")
    signal.signal(signal.SIGALRM, signal_handler)
    signal.alarm(seconds)
    try:
        yield
    finally:
        signal.alarm(0)

with time_limit(129600):
    solutions = [sol for sol in enumerator]

end = time.time()

print(end-start, file=f)
print(solutions, file=f)

f.close()
