module euclidean_lagrangian
  !!This module contains the functions that defines de euclidean lagrangian
  !!for the anharmonic oscillator
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none


contains





function lagrangian(x_i, x_i_1, dt, lambda) result(L)
  
  integer, intent(in) :: x_i, lambda
  real(dp) :: L, dt, x_i_1 

  
  L = 0.5*((x_i_1 - x_i)/dt)**2 + 0.5 * x_i**2 +lambda*x_i**4

  
end function lagrangian

end module euclidean_lagrangian
