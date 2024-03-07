module boundary
    !!This module contains the boundary functions
    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none
  
    
  
  contains
  
  function ip(i) result(y)

  real(dp) :: y
  real(dp), intent(in) :: i
  y = i +1 
end function  ip

function im(i) result(y)

  real(dp) :: y
  real(dp), intent(in) :: i
  y = i - 1  
end function  im


      
  end module boundary