set terminal gif animate delay 1

set output 'trajectorie.gif'

set title "Trajectorie"

set xlabel "X"
set ylabel "L"

#set xrange[0.0:500.0]
#set yrange[0.0:200.0]

do for [i = 1 : 500 : 10]{
pl '../data/trajectories.dat' u 0:i w l t sprintf( "step t = %i ", i)}