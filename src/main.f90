program main

  use parameters
  use arrays
  use starts
  use local_update_algorithms

  implicit none

  call read_input()
  call set_memory_arrays(L)
  call cold_start(x)
  print*, x
  call hot_start(x)
  print*, x
  call metropolis(x(1), 2.0_dp, 1.0_dp)
  print*, x(1)

end program main
