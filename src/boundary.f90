module boundary
  !!This module contains the boundary functions
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none



  contains
  

  function ip(x, index) result(y)
    !!This functions has an input 
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

function lagrangian(index, x,  dt) result(L) 
  integer(i4) :: index
  real(dp), intent(out) :: L
  real(dp), intent(in) :: dt
  real(dp), intent(out), dimension(:) :: x
  
  L = 1/2*( (x(index + 1) - x(index) ) /dt)**2 + 1/2*/(x(index))**2

end function lagrangian

      
  end module boundary