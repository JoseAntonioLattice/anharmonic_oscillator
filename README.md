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

### Program Structuree
```
.
├── src
│   ├── arrays.f90 (Module for intitialize arrays) 
│   ├── parameters.f90 (Module for user input parameters) 
│   ├── periodic_boundary_conditions.f90 (Module for implementing the periodic boundary conditions)
│   ├── euclidean_lagrangian.f90 (Module that defines the numerical euclidean lagrangian)  
```