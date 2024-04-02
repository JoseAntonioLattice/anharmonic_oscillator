program main

  use parameters
  use arrays
  use dynamics
  use periodic_boundary_conditions
  use statistics
  
  call read_input()
  call set_memory_arrays(L)
  call set_boundary_conditions(L)
  call thermalization(start, x, epsilon, dt, lambda, N_thermalization)
  call measure_sweeps(x, epsilon, dt, lambda, N_measurements, N_skip)
  call mean_n_standard_error(N_measurements)
  
end program main
