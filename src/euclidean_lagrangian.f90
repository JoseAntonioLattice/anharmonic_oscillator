module euclidean_lagrangian
  !!This module contains the functions that defines de euclidean lagrangian
  !!for the anharmonic oscillator
  use iso_fortran_env, only : dp => real64, i4 => int32
  use periodic_boundary_conditions

  implicit none


contains


subroutine deltaS(x_array,  dt, lambda, DS)

  !x_array = [ x(j), x(ip(j)), x(im(j)),  xprime ]


  real(dp),intent(in), dimension(4) :: x_array
  real(dp), intent(in) :: dt, lambda
  real(dp), intent(out) ::  DS
  real(dp) :: xj, xjplus1, xjminus1, xjprime
  xj = x_array(1)
  xjplus1 = x_array(2)
  xjminus1 = x_array(3)
  xjprime = x_array(4)
  
  DS = dt * (lagrangian(xjminus1, xjprime, dt, lambda) + lagrangian(xjprime, xjplus1, dt, lambda) &
              - lagrangian(xjminus1, xj, dt, lambda) - lagrangian(xj, xjplus1, dt, lambda)) 

  

  
end subroutine deltaS


subroutine numerical_action(x_array,  dt, lambda, action)

  real(dp),intent(in), dimension(:) :: x_array
  real(dp), intent(in) :: dt, lambda
  real(dp), intent(out) :: action
  integer(i4) :: N,i

  action = 0.0_dp
  N = size(x_array)

  do i = 1, N

    action =  action + lagrangian(x_array(i), x_array(ip(i)), dt, lambda)*dt

  end do
  
end subroutine numerical_action





function lagrangian(x_i, x_i_1, dt, lambda) result(L)
  
  real(dp), intent(in) :: x_i, x_i_1, dt, lambda
  real(dp) :: L

  
  L = 0.5*((x_i_1 - x_i)/dt)**2 + 0.5 * x_i**2 + lambda*x_i**4

  
end function lagrangian

end module euclidean_lagrangian
