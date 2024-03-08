module boundary
    !!This module contains the boundary functions
    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none

    real(dp), allocatable, dimension(:) :: t, x
  
    
  
  contains
  
  function ip(x, index) result(y)
    real(dp), intent(inout), dimension(:) :: x
    real(dp), intent(out), dimension(:) :: y
    integer(i4) :: index
    integer(i4) :: Rightindex, Leftindex
    
    Rightindex=  size(x)
    Leftindex=  1

   
    if ( index == Rightindex ) then
      y(index) = x(Leftindex) 
    else 
      y(index) = x(index + 1) 

    end if
end function  ip

function im(x, index) result(y)
  real(dp), intent(inout), dimension(:) :: x
  real(dp), intent(out), dimension(:) :: y
  integer(i4) :: index
  integer(i4) :: Rightindex, Leftindex
  
  Rightindex=  size(x)
  Leftindex=  1

 
  if ( index == Leftindex ) then
    y(index) = x(Rightindex) 
  else 
    y(index) = x(index - 1) 

  end if
end function  im



      
  end module boundary