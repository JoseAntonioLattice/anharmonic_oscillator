program main

  use parameters
  use arrays
  use dynamics

  implicit none

  call read_input()
  call set_memory_arrays(L)
  call thermalization(start, x, epsilon, dt, lambda, 1000)

end program main
