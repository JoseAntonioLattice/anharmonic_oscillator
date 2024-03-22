program main

  use parameters
  use arrays
  use dynamics
  use periodic_boundary_conditions
  use measurements
  implicit none

  call read_input()
  call set_memory_arrays(L)
  call set_boundary_conditions(L)
  call thermalization(start, x, epsilon, dt, 0.0_dp, 500)
  call measures(500)

end program main
