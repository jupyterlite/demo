from scipy.integrate import odeint
import math


def rhs(y, t):
    return math.exp(-t) * (-math.sin(10 * t) * 10 - math.cos(10 * t))


def test():
    import numpy as N

    a = 0
    b = 10
    y0 = 1.0

    import pylab

    #correct solution
    t = N.arange(a, b, 0.01)
    #y = N.exp(-t) * N.cos(10 * t)
    #pylab.plot(t, y, label='correct solution')

    #approximate solution odeint
    yscipy = odeint(rhs, y0, t)

    pylab.figure(figsize=(8, 3.5))
    pylab.plot(t, yscipy, label="odeint's approximation")

    #make student plot
    pylab.axis([8, 10, -4e-4, 4e-4])
    pylab.xlabel('t')
    pylab.ylabel('y(t)')
    pylab.legend()

    pylab.savefig('solution8to10.png')
    pylab.savefig('odeintsolution8to10.png')
    pylab.savefig('odeintsolution8to10.pdf')
    pylab.axis([0, 10, -1, 1])

    #pylab.show()


if __name__ == "__main__":
    """This will only be executed if the file is run 'on its own'.

    If we import a method from this file, then this section will
    not be reached."""

    test()
