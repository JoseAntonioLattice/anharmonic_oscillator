# Anharmonic Oscillator

This repository implements the numerical solution for the anharmonic quantum oscillator adopting the Markov chain Monte Carlo approach to solve the imaginary time path integral of the system.

The classical Euclidean lagrangian is given by


$$L_E(x(\tau))= \frac{m}{2}\left(\frac{dx}{d\tau}\right)^2+ \frac{1}{2}m\omega^2x^2 + \lambda x^4$$ 

we are assumming units in where $\hbar = \omega = 1$. 

### Lattice

We assume a lattice with $L$ time increments of $\Delta t$ and each lattice point is given by $x_n= n\Delta t$ for $n= 0,1,2,\dots ,L$. Periodic boundary conditions are imposed on the lattice. The action is given by

$$
S({x_k}) = \sum _{i=1}^{L}\left[\frac{(x_{i+1} - x_i)^2}{\Delta t^2} + \frac{x_i^2}{2} + \lambda x_i^4\right]
$$


<br/>

### Program Structure
```
.
├── src 
│   ├── arrays.f90 (Module for intitialize arrays) 
│   ├── parameters.f90 (Module for user input parameters) 
│   ├── periodic_boundary_conditions.f90 (Module for implementing the periodic boundary conditions)
│   ├── euclidean_lagrangian.f90 (Module that defines the numerical euclidean lagrangian)  
│   ├── main.f90 (Module that contains the main calls for subroutine and functions)  
│   ├── starts.f90 (Module containing cold and hot start subroutine)  
│   ├── statistics.f90 (Module that implements a variety of useful statistics functions)
│   ├── dynamics.f90 (Module that implements a variety of useful subroutines to the main thermalization algorithm)
│   ├── local_update_algorithms.f90 (Module that contains the Metropolis and Glauber algorithms)
├── data (folder to store the output data)
├── figures (folder to store output animation)


  
```

# Usage and Compilation

-----------

The main code is standard Fortran 95 and can be compiled
with any standard f95 conforming compiler.

## Intitial Conditions
You can modifiy the ``parameters.dat`` file to enter different settings for the input parameters. The defult ones are: 

```
&input_parameters
L = 100,
dt = 0.1,
epsilon = 1.0,
lambda = 0.0,
start = "hot"
/
```

To run the program execute the following line in the terminal:
```
bash compile.sh
```
