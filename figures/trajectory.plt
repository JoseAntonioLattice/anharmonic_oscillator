set terminal gif animate delay 1

set output 'trajectory.gif'

set title "Trajectory"

set xlabel "t_E"
set ylabel "X"

set xrange[0.0:100.0]
set yrange[-1.0:1.0]

do for [i = 1 : 1000 ]{
pl '../data/trajectories.dat' u 0:i  w l t sprintf( "Markov time t = %i ", i)
}