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

    do j = 1, n

       open(newunit = unit, file = "./data/actions.dat", position = "append")
       write(unit, *) j, x
       close(unit)
    
    do i = 1, size(x)

       x0 = x(i)

       do
          if ( x0 /= x(i) ) exit
          call random_number(r)
          xn = 2*epsilon*r + x0 - epsilon
          call metropolis(x(i), xn, ds)
       end do
       
    end do
    
    end do
    
  end subroutine sweeps

end module dynamics

