program main

  use parameters
  use arrays
  use dynamics

  implicit none

  call read_input()
  call set_memory_arrays(L)
  call thermalization(start, x, epsilon, 1.0_dp)

end program main
