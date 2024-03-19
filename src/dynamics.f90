module dynamics

  use iso_fortran_env, only : dp => real64, i4 => int32
  use local_update_algorithms
  use starts
  implicit none

contains

  subroutine sweeps(x, epsilon, ds, n)

    integer(i4) :: i, j, unit
    integer(i4), intent(in) :: n
    real(dp) :: r, xn
    real(dp), intent(in) :: epsilon, ds 
    real(dp), intent(inout), dimension(:) :: x

    open(newunit = unit, file = "./data/actions.dat", position = "append")
    
    do j = 1, n
       
       write(unit, *) j, x
    
    do i = 1, size(x)

       call random_number(r)
       xn = (2*r-1)*epsilon + x(i)
       call metropolis(x(i), xn, ds)
       
    end do
    
    end do

    close(unit)
    
  end subroutine sweeps

  subroutine thermalization(start, x, epsilon, ds)

    real(dp), intent(in) :: epsilon, ds
    real(dp), intent(inout), dimension(:) :: x
    character(100), intent(in) :: start

    if ( start == "hot" ) then
       call hot_start(x)
    else if ( start == "cold") then
       call cold_start(x)
    else
       error stop "Wrong start / Please select one: hot or cold"
    end if
    
    call sweeps(x, epsilon, ds, 100)

  end subroutine thermalization
  
end module dynamics

