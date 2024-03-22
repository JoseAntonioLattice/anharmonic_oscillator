module parameters

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  integer(i4) :: L, N_thermalization, N_measurements, N_skip
  real(dp) :: dt, epsilon
  character(100) :: input_file, start

  namelist /input_parameters/ N_thermalization, N_measurements, N_skip, L, dt, epsilon, start

contains

  subroutine read_input

    integer(i4) :: unit

    read(*,*) input_file

    open(newunit = unit, file = input_file)
    read(unit, nml = input_parameters)
    close(unit)

    if( L <= 0 ) error stop "L must be > 0"
    if( dt <= 0 ) error stop "dt must be > 0"
    if( epsilon <= 0 ) error stop "epsilon must be > 0"
    if( N_thermalization <= 0 ) error stop "N_thermalization must be > 0"
    if( N_measurements <= 0 ) error stop "N_measurements must be > 0"
    if( N_skip <= 0 ) error stop "N_skip must be > 0"

    write(*, nml = input_parameters)

  end subroutine read_input
    
end module parameters
