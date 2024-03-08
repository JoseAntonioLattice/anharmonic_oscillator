module parameters

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  integer(i4) :: L
  real(dp) :: dt
  character(100) :: input_file

  namelist /input_parameters/ L, dt

contains

  subroutine read_input()

    if( L < 0) error stop "L must be > 0"
    if( dt < 0) error stop "dt must be > 0"

  end subroutine read_input
    
end module parameters
