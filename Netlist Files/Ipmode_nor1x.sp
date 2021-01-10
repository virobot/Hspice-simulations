.include './hp7nfet.pm'
.include './hp7pfet.pm'

*define parameters 
.param vdd=0.7 
.param vss=0 
.param fin_height=18n 
.param fin_width=7n 
.param lg=11n 
.param n_fin = 6
.param p_fin = 16

VSS Gnd 0 'vss'

.param LoadCap = 1f

*add transistors  
mp1 C A X X pfet L=lg NFIN=p_fin
mp2 Z B C X pfet L=lg NFIN=p_fin
mn1 Z A 0 0 nfet L=lg NFIN=n_fin
mn2 Z B 0 0 nfet L=lg NFIN=n_fin

*add cap
Cz Z Gnd 'LoadCap'

*add voltage source
VX X 0 'vdd'

Vin1 A 0 PULSE(0 0.7 1n 10p 10p 1u 2u)
Vin2 B 0 PULSE(0 0.7 1n 10p 10p 2.001u 4u)

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
*.print V(X)
*.print V(Y)
.print V(A)
.print V(B)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement
.measure tran RTL TRIG AT=0 TARG v(Z) VAL=0.55 FALL=1
.measure tran avg_current AVG I(Cz) from 0 to 'RTL'
.measure tran avg_power AVG p(Cz) 
*.measure tran tdlay trig Z val=10p td=10p rise=
.measure tran t_delay_fall TRIG V(A) VAL=0.35 TD=2.5u rise=1 TARG V(Z) VAL=0.35 TD=2.5u fall=1
.measure tran t_delay_rise TRIG V(A) VAL=0.35 TD=2.5u fall=1 TARG V(Z) VAL=0.35 TD=2.5u rise=1
.measure tran t_rise_Z TRIG V(Z) VAL=0.14 TD=1n RISE=1 TARG V(Z) VAL=0.56 TD=1n RISE=1
.measure tran t_fall_Z TRIG V(Z) VAL=0.56 TD=1n FALL=1 TARG V(Z) VAL=0.14 TD=1n FALL=1

*measure for leakage power (1,1) (a,b)
.measure tran avg_power_static_one_one AVG p(VX) from=2n to=999n

*measure for leakage power (0,1) (a,b)
.measure tran avg_power_static_zero_one AVG p(VX) from=1001n to=1999n

*measure for leakage power (1,0) (a,b)
.measure tran avg_power_static_one_zero AVG p(VX) from=2001n to=2999n

*measure for leakage power (0,0) (a,b)
.measure tran avg_power_static_zero_zero AVG p(VX) from=2001n to=2999n


***********measure the switching power for rise time
.measure tran rise_1
+ WHEN V(Z) = 0.14 TD=2u rise=1

.measure tran rise_2
+ WHEN V(Z) = 0.56 TD=2u rise=1

.measure tran switching_pow_rise AVG p(VX)
+ FROM = 'rise_1' TO = 'rise_2'

***************************************************************

*******measure the switching power for the fall time
.measure tran fall_1
+ WHEN V(Z) = 0.56 TD=2u fall=1

.measure tran fall_2
+ WHEN V(Z) = 0.14 TD=2u fall=1

.measure tran switching_pow_fall AVG p(VX)
+FROM = 'fall_1' TO = 'fall_2'

***************************************************************

.measure tran switchingenergy_rise PARAM = 'switching_pow_rise*t_rise_Z'
.measure tran switchingenergy_fall PARAM = 'switching_pow_fall*t_fall_Z'

.end
