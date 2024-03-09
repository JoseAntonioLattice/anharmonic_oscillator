program main

  use parameters
  use arrays
  use starts

  implicit none

  call read_input()
  call set_memory_arrays(L)
  call hot_start(x,L)

  print*, x

end program main
