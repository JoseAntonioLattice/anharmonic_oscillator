module set_memory_arrays

  use iso_fortran_env, only: dp => real64, i4 => int32
  use parameters

  implicit none

  real(dp), allocatable, dimension(:) :: t, x

contains

  subroutine set_memory_arrays(t, x, L)

    integer(i4), intent(in) :: L
    real(dp), intent(out), dimension(:) :: t, x
    
    allocate(t(L),x(L))

  end subroutine set_memory_arrays


end module set_memory_arrays
