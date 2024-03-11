module periodic_boundary_conditions
  !!This module contains the periodic boundary conditions 
  !!for a lattice
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  integer(i4), allocatable, dimension(:) :: ip
  integer(i4), allocatable, dimension(:) :: im
  

contains

  subroutine set_boundary_conditions(L)
    integer(i4) :: index
    integer(i4) :: L
    
    allocate( ip(L), im(L) )
    
    do index = 1, L
       ip(index) = index + 1
       im(index) = index - 1
    end do

    ip(L) = 1
    im(1) = L

  end subroutine set_boundary_conditions



end module periodic_boundary_conditions
