module boundary
  !!This module contains the boundary functions
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


  
!function lagrangian(index, x,  dt) result(L) 
 ! integer(i4) :: index
  !real(dp), intent(out) :: L
 ! real(dp), intent(in) :: dt
 ! real(dp), intent(out), dimension(:) :: x
  
 ! L = 1/2*( (x(index + 1) - x(index) ) /dt)**2 + 1/2*/(x(index))**2
 ! L=1
  
!end function lagrangian

      
  end module boundary
