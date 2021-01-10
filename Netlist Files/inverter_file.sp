

.include './hp7nfet.pm'
.include './hp7pfet.pm'

*define parameters 
.param vdd=0.7 
.param vss=0 
.param fin_height=18n 
.param fin_width=7n 
.param lg=11n 
.param n_fin = 11
.param p_fin = 13

VSS Gnd 0 'vss'

.param LoadCap = 1f

*add transistors  
mp1 Z Y X Y pfet L=lg NFIN=p_fin
mn2 Z Y 0 Y nfet L=lg NFIN=n_fin

*add cap
Cz Z Gnd 'LoadCap'

*add voltage source
VX X 0 'vdd'

VY Y 0 PULSE(0 0.7 0 10p 10p 1u 2.2u)

*define the initial condition of V(Z)
*.IC V(Z)='vdd'

*do transient analysis
	*syntax: .TRAN tiner tstop START=stval 
	*tiner - time step
	*tstop - final time
	*stval - initial time (default 0)
.tran 0.1u 20u 

*print the V(Z) to waveform file *.tr0
.print V(Z)
.print V(X)
.print V(Y)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement
.measure tran RTL TRIG AT=0 TARG v(Z) VAL=0.55 FALL=1
.measure tran avg_current AVG I(Cz) from 0 to 'RTL'
.measure tran avg_power AVG p(Cz) 
*.measure tran tdlay trig Z val=10p td=10p rise=
.measure tran t_delay_fall TRIG V(Y) VAL=0.35 rise=2 TARG V(Z) VAL=0.35 fall=2
.measure tran t_delay_rise TRIG V(Y) VAL=0.35 fall=2 TARG V(Z) VAL=0.35 rise=2
.measure tran t_rise_Z TRIG V(Z) VAL=0.14 TD=1n RISE=1 TARG V(Z) VAL=0.56 TD=1n RISE=1
.measure tran t_fall_Z TRIG V(Z) VAL=0.56 TD=1n FALL=1 TARG V(Z) VAL=0.14 TD=1n FALL=1




 
.alter case 2x:
.param p_fin=26
.param n_fin=22

.alter case 4x:
.param p_fin=52
.param n_fin=44
 


.end
