module dynamics

  use iso_fortran_env, only : dp => real64, i4 => int32
  use local_update_algorithms
  implicit none

contains

  subroutine sweeps(x, epsilon, ds, n)

    integer(i4) :: i, j, unit
    integer(i4), intent(in) :: n
    real(dp) :: r, x0, xn
    real(dp), intent(in) :: epsilon, ds 
    real(dp), intent(inout), dimension(:) :: x

    open(newunit = unit, file = "./data/actions.dat", position = "append")
    
    do j = 1, n
       
       write(unit, *) j, x
    
    do i = 1, size(x)

       call random_number(r)
       xn = 2*epsilon*r + x(i) - epsilon
       call metropolis(x(i), xn, ds)
       
    end do
    
    end do

      close(unit)
    
  end subroutine sweeps

end module dynamics

