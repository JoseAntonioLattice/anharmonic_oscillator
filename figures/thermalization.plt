set terminal gif animate delay 1

set output 'thermalization.gif'

set title "Thermalization"

set xlabel "Steps"
set ylabel "Action"

set xrange[0.0:500.0]
set yrange[0.0:200.0]

do for [i = 1 : 500 : 10]{
pl '../data/action.dat' every :: 1 :: i u 0:1 w l t sprintf( "step t = %i ", i)
}