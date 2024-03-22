module measurements

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

contains

  subroutine measures(N_thermalization)

    integer(i4) :: i, unit
    integer(i4), intent(in) :: N_thermalization
    real(dp), allocatable, dimension(:) :: l

    allocate(l(N_thermalization))
    
    open(newunit = unit, file = "./data/action.dat", status = 'old', action = 'read')
    
    do i = 1, N_thermalization 
       read(unit, *) l(i)
    end do
 
    close(unit)

    open(newunit = unit, file = "./data/measures.dat")

    do i = 1, N_thermalization, 10
       write(unit, *) l(i)
    end do

    close(unit)
    
  end subroutine measures
  
end module measurements
