module starts

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

contains
  
  subroutine cold_start(x)

    real(dp), intent(out), dimension(:) :: x
    
     x = 0.0_dp
    
  end subroutine cold_start

  subroutine hot_start(x)
 
    real(dp), intent(out), dimension(:) :: x
    real(dp), dimension(size(x)) :: r

    call random_number(r)
    
    x = 2*r - 1.0_dp
    
  end subroutine hot_start

end module starts
