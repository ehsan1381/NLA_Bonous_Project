# Description
This project is an implementation of power method to find largest (in terms of norm) eigenvalue and
corresponding eigenvector of a given matrix in MATLAB as part of bonus project in a numerical linear
algebra course

# Testing
As a way of performing tests of correctness, performance, convergence and of tolerance, we need a
few test matrices. We takes these matrices from the main text book used within this course. There
are two matrices provided in the book. We perform three different tests. In the first, we simply run
the program with the given starting vector of the test matrix from the book and see if the returned
value satisfies the equation of eigenvectors and values within a certain tolerance. \
In the second test we do the same thing with a different matrix and starting vector. \
In the third test we take the second matrix but submit random starting vectors to test the program
for convergence and tolerance of approxiamtions.\

# A bug found in the code
In one of the versions of this repository, a certain input vector in the last test would result in
early termination of the program. This was a simple logic error. The program would converge to the
eigenvector and eigenvalye of the matrix if the assrtion that caused the termination was removed.

# Analysis of the program
Although the tests performed were fairly limited, the program showed well performance and was
consistently in the margin of tolerance. \
In addition to these tests, the program is capable of detecting input errors, and certain exceptions
of underflow and overflow. \
This specific implementation is not loopless. This program could, theoretically, be written in a
loopless fashion, yet since the algorithm is iterative in its nature, a loppless implementation
would raise memory and CPU load of the program.
