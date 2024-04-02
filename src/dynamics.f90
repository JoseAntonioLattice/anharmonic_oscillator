module dynamics

  use iso_fortran_env, only : dp => real64, i4 => int32
  use local_update_algorithms
  use starts
  use euclidean_lagrangian
  implicit none

contains

  subroutine sweep(x, epsilon, dt, lambda)

    integer(i4) :: i
    real(dp) :: r, xn, DS
    real(dp), intent(in) :: epsilon, dt, lambda
    real(dp), intent(inout), dimension(:) :: x

    !x_array = [ x(j), x(ip(j)), x(im(j)),  xprime ]
    
    do i = 1, size(x)

       call random_number(r)
       xn = (2*r-1)*epsilon + x(i)
       call deltaS([x(i), x(ip(i)), x(im(i)),  xn ],  dt , lambda, DS)
       call metropolis(x(i), xn, DS)
       
    end do
    
  end subroutine sweep

  subroutine thermalization(start, x, epsilon, dt, lambda, N_thermalization)

    integer(i4) :: i, j, unit
    integer(i4), intent(in) :: N_thermalization
    real(dp), intent(in) :: epsilon, dt, lambda
    real(dp) :: action, energy
    real(dp), intent(inout), dimension(:) :: x
    real(dp), dimension(size(x), N_thermalization) :: u
    character(100), intent(in) :: start

    if ( start == "hot" ) then
       call hot_start(x)
    else if ( start == "cold") then
       call cold_start(x)
    else
       error stop "Wrong start / Please select one: hot or cold"
    end if
    
    open(newunit = unit, file = "./data/action.dat")
    open(unit = 1, file = "./data/trajectories.dat")
    
    call numerical_action(x,  dt, lambda, action)
    call ground_state_energy(x, energy)
    write(unit, *) action, energy
    
    do i = 1, N_thermalization
 
       u(:,i) = x
       
       call sweep(x, epsilon, dt, lambda)
       call ground_state_energy(x, energy)
       call numerical_action(x,  dt, lambda, action)
       write(unit, *) action, energy
       
    end do

    do j = 1, size(x)
       write(1, *) u(j,:)  
    end do

    close(1)
    close(unit)
    
  end subroutine thermalization

  subroutine measure_sweeps(x, epsilon, dt, lambda, N_measurements, N_skip)

    integer(i4) :: i, unit
    integer(i4), intent(in) :: N_measurements, N_skip
    real(dp), intent(in) :: epsilon, dt, lambda
    real(dp) :: action, energy
    real(dp), intent(inout), dimension(:) :: x
    
    open(newunit = unit, file = "./data/measurements.dat")
    
    do i = 1, N_measurements*N_skip
       
       call sweep(x, epsilon, dt, lambda)
       
       if ( mod(i, N_skip) == 0 ) then
          call numerical_action(x,  dt, lambda, action)
          call ground_state_energy(x, energy)
          write(unit, *) action, energy 
       end if
       
    end do

    close(unit)
    
  end subroutine measure_sweeps

  subroutine ground_state_energy(x_array, val)
  
   real(dp),intent(in), dimension(:) :: x_array
   real(dp), intent(out) :: val

   integer(i4) :: index, L
   L = size(x_array)
   val = 0.0_dp
 
   do index = 1, L
      val =  val + (x_array(index))**2
   end do
   val = val/L
   !val = sum(x_array**2)/size(x_array)
   
 end subroutine ground_state_energy

  
end module dynamics

