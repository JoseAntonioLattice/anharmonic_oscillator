program main

  use parameters
  use arrays
  use starts
  use dynamics

  implicit none

  call read_input()
  call set_memory_arrays(L)
  call hot_start(x)
  print*, x
  call sweeps(x, epsilon, 1.0_dp, 2)

end program main
