module local_update_algorithms

  use iso_fortran_env, only : dp => real64
  implicit none

contains

  subroutine metropolis(xo, xn, ds)

    real(dp) :: r, p
    real(dp), intent(inout) :: xo
    real(dp), intent(in) :: xn, ds

    call random_number(r)
    p = MIN(1.0_dp, EXP(-ds))

    if ( r < p ) then
       xo = xn
    end if
    
  end subroutine metropolis

  subroutine glauber(xo, xn, ds)

    real(dp) :: r, p
    real(dp), intent(inout) :: xo
    real(dp), intent(in) :: xn, ds

    call random_number(r)
    p = 1/(EXP(ds)+1.0_dp)

    if ( r < p ) then
       xo = xn
    end if
    
  end subroutine glauber
  
end module local_update_algorithms
