program test
  !use boundary
  !To compile manually this program use 
  !gfortran boundary_test.f90 -J ./
  
  !use euclidean_lagrangian
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  
  !call set_boundary_conditions(10)

  !print*, im
  !print*, ip 
  
  !eal(dp), dimension(:) :: x

  real(dp), dimension(4) :: x_array
  real(dp) dt, lambda, DS
  
  x_array = [1,2,3,4]
  dt = 0.1
  lambda = 0.2
  
  call deltaS(x_array,dt, lambda, DS)
  print*, DS
    
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
              - lagrangian(xjplus1, xj, dt, lambda) - lagrangian(xj, xjplus1, dt, lambda)) 

  

  
end subroutine deltaS


subroutine numerical_action(x_array,  dt, lambda, action)

  !x_array = [x(1), ...x (n) ]
  real(dp),intent(in), dimension(:) :: x_array
  real(dp), intent(in) :: dt, lambda
  real(dp), intent(out) :: action
  integer(i4) :: N,i

  action = 0.0
  N = size(x_array)

  do i = 1, N

    action =  action + lagrangian(x_array(i), x_array(ip(i)), dt, lambda)

  end do


  

  
end subroutine numerical_action

function lagrangian(x_i, x_i_1, dt, lambda) result(L)
  
  real(dp), intent(in) :: x_i, x_i_1, dt, lambda
  real(dp) :: L

  
  L = 0.5*((x_i_1 - x_i)/dt)**2 + 0.5 * x_i**2 + lambda*x_i**4

  
end function lagrangian


end program test


