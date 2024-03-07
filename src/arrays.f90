module arrays

  use iso_fortran_env, only: dp => real64, i4 => int32
  use parameters

  implicit none

  real(dp), allocatable, dimension(:) :: t, x

contains

  subroutine set_arrays(t, L, dt)

    integer(i4) :: i
    integer(i4), intent(in) :: L
    real(dp), intent(in) :: dt
    real(dp), intent(out), dimension(:) :: t

    t(1) = 0.0
    do i = 2, L 
       t(i) = i*dt
    end do

  end subroutine set_arrays


end module arrays
