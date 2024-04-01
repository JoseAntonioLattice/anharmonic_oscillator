module statistics

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

contains

  function mean(x) result(m)

    integer(i4) :: i
    real(dp), dimension(:), intent(in) :: x
    real(dp) :: s, m

    s = 0.0_dp

    do i = 1, size(x)
       s = s + x(i)
    end do

    m = s/size(x)

  end function mean

  function standard_deviation(x) result(sd)

    integer(i4) :: i
    real(dp), dimension(:), intent(in) :: x
    real(dp) :: s, m, sd

    s = 0.0_dp
    m = mean(x)
    
    do i = 1, size(x)
       s = s + (x(i) - m)**2
    end do

    sd = SQRT(s/(size(x)-1))

  end function standard_deviation

  function standard_error(x) result(se)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: sd, se

    sd = standard_deviation(x)

    se = sd/SQRT(REAL(size(x)))

  end function standard_error

  subroutine mean_n_standard_error(N_measurements)

  integer(i4), intent(in) :: N_measurements
  integer(i4) :: i, unit
  real(dp), dimension(N_measurements) :: s, e
  real(dp) :: m, sd, se

  open(newunit = unit, file = 'data/measurements.dat', status = 'old', action = 'read')
  do i = 1, N_measurements
     read(unit, *) s(i), e(i)
  end do
  close(unit)
  
  m = mean(e)
  sd = standard_deviation(e)
  se = standard_error(e)

  print*, m, se
    
  end subroutine mean_n_standard_error

  
end module statistics
