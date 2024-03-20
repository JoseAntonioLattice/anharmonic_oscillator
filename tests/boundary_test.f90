program test
  !use boundary
  
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  
  !call set_boundary_conditions(10)

  !print*, im
  !print*, ip 
  
  real(dp), dimension(:) :: x
    
contains

function lagrangian(x_i, index, dt, lambda) result(L)
    
  integer, intent(in) :: x_i, lambda, index
  real(dp) :: L, dt, x_i_1
  x_i_1 = (index + 1)*dt
  
  L = 0.5*((x_i_1 - x_i)/dt)**2 + 0.5 * x_i**2 + lambda*x_i**4

  
end function lagrangian


end program test


