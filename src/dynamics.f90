module dynamics

  use iso_fortran_env, only : dp => real64, i4 => int32
  use local_update_algorithms
  use starts
  use euclidean_lagrangian
  implicit none

contains

  subroutine sweep(x, epsilon, dt, lambda)

    integer(i4) :: i
    real(dp) :: r, xn, DS
    real(dp), intent(in) :: epsilon, dt, lambda
    real(dp), intent(inout), dimension(:) :: x

    !x_array = [ x(j), x(ip(j)), x(im(j)),  xprime ]
    
    do i = 1, size(x)

       call random_number(r)
       xn = (2*r-1)*epsilon + x(i)
       call deltaS([x(i), x(ip(i)), x(im(i)),  xn ],  dt , lambda, DS)
       call metropolis(x(i), xn, DS)
       
    end do
    
  end subroutine sweep

  subroutine thermalization(start, x, epsilon, dt, lambda, N_thermalization)

    integer(i4) :: i, unit
    integer(i4), intent(in) :: N_thermalization
    real(dp), intent(in) :: epsilon, dt, lambda
    real(dp) :: action, energy
    real(dp), intent(inout), dimension(:) :: x
    character(100), intent(in) :: start

    if ( start == "hot" ) then
       call hot_start(x)
    else if ( start == "cold") then
       call cold_start(x)
    else
       error stop "Wrong start / Please select one: hot or cold"
    end if

    open(newunit = unit, file = "./data/action.dat")
    call numerical_action(x,  dt, lambda, action)
    write(unit, *) action
    
    do i = 1, N_thermalization
       
       call sweep(x, epsilon, dt, lambda)
       call expected_value(x, energy)
       call numerical_action(x,  dt, lambda, action)
       write(unit, *) action, energy
       
    end do

    close(unit)
    
  end subroutine thermalization
  
end module dynamics

