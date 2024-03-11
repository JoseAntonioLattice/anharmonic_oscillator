module euclidean_lagrangian
    !!This module contains the functions that defines de euclidean lagrangian
    !!for the anharmonic oscillator
    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none
  
    integer(i4), allocatable, dimension(:) :: ip
    integer(i4), allocatable, dimension(:) :: im
    
  
  contains

  function lagrangian(x_i, index, dt, lambda) result(L)
    
    integer, intent(in) :: x_i, lambda, index
    real(dp) :: L, dt, x_i_1
    x_i_1 = (index + 1)*dt
    
    L = 0.5*((x_i_1 - x_i)/dt)**2 + 0.5 * x_i**2 +lambda*x**4
  
    
  end function lagrangian

end module euclidean_lagrangian
  