module arrays

  use iso_fortran_env, only: dp => real64, i4 => int32

  implicit none

  real(dp), allocatable, dimension(:) :: x

contains

  subroutine set_memory_arrays(L)

    integer(i4), intent(in) :: L
    
    allocate(x(L))

  end subroutine set_memory_arrays


end module arrays
