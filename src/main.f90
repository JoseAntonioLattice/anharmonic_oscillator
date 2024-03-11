program main

  use parameters
  use arrays
  use starts

  implicit none

  call read_input()
  call set_memory_arrays(L)
  call cold_start(x)
  print*, x
  call hot_start(x)
  print*, x

end program main
