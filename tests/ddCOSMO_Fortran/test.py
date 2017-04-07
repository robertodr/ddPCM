#!/usr/bin/env python

import os
import sys

sys.path.append(os.path.join(os.path.dirname(__file__), '..'))

from runtest import version_info, get_filter, cli, run
from runtest_config import configure

assert version_info.major == 2

# Construct a filter list
energy = [ get_filter(string='ddcosmo electrostatic solvation energy (kcal/mol):', abs_tolerance=1.0e-10) ]
# Invoke the command line interface parser which returns options
options = cli()

ierr = run(options,
            configure,
            input_files='Input.txt',
            filters={'out': energy})

sys.exit(ierr)
