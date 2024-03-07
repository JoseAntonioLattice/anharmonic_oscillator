program main_test

  use parameters
  use arrays

  implicit none

  call read_input(input_file)
  allocate(t(L),x(L))
  call set_arrays(t, L, dt)
  
  write(*,nml = input_parameters)
  write(*,*) t

end program main_test
