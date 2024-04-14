import scipy.io
import numpy as np

#create two numpy arrays
a = np.linspace(0, 50, 11)
b = np.ones((4, 4))

#save as mat-file
#create dictionary for savemat
tmp_d = {'a': a,
         'b': b}
scipy.io.savemat('data.mat', tmp_d)
