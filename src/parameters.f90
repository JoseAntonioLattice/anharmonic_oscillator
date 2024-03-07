module parameters

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  integer(i4) :: L
  real(dp) :: dt
  character(100) :: input_file

  namelist /input_parameters/ L, dt

contains

  subroutine read_input(input_file)

    integer(i4) :: unit
    character(100), intent(inout) :: input_file

    read(*,*) input_file

    open(newunit = unit, file = input_file)
    read(unit, nml = input_parameters)
    close(unit)

    if ( L*dt < 0 ) then
       print*, "¡Tanto L como dt deben ser positivos!"
       print*, "Prueba con otros valores"
       stop
    end if

  end subroutine read_input
    
end module parameters
