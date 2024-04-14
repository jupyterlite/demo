# create octave data without octave
import scipy.io
import numpy as np

#create two numpy arrays
a = np.linspace(-1, 4, 11)

tmp_a = {'a': a}
scipy.io.savemat('octave_a.mat', tmp_a)


