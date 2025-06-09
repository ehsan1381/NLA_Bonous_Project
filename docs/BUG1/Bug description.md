# Bug description
For matrix from example 4-5 of the book and the initial vector `V = [4.682757207317119e-01, 7.178334305157332e+00, 7.251762067575939e+00].'` the program fails to converge. It is actually correct to say, the condition of checking for convergence is not met for this specific case. With this specific vector, here is the first few iterations \
	```matlab
		 1.096624118018050e+01
	    -1.996596284049524e+01
	    -1.592072892335798e+02
	    -9.513031836822219e+01
	```
 \
	- As you can see, the difference between the first two approximations of $\mu$ is `3.093220402067574e+01`, then between second and third is `1.392413263930845e+02`, and between third and fourth is `6.407697086535765e+01`. To make this pattern more visible, the file pic1.png contains a plot
