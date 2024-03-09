module starts

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  integer(i4) :: i

contains
  
  subroutine cold_start(x, L)

    integer(i4), intent(in) :: L
    real(dp), intent(out), dimension(L) :: x

    do i = 1, L
       x(i) = 0
    end do
    
  end subroutine cold_start

  subroutine hot_start(x, L)

    integer(i4), intent(in) :: L
    real(dp), dimension(L) :: r 
    real(dp), intent(out), dimension(L) :: x 

    call random_number(r)
    
    do i = 1, L
       x(i) = 2*r(i) - 1
    end do
    
  end subroutine hot_start

end module starts
