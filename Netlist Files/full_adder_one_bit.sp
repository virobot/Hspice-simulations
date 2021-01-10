
.include './hp7nfet.pm'
.include './hp7pfet.pm'

*define parameters 
.param vdd=0.7 
.param vss=0 
.param fin_height=18n 
.param fin_width=7n 
.param lg=11n 
.param pfin = 4
.param nfin = 3
.param minfin = 1
.param LoadCap = 1f

VSS Gnd 0 'vss'
VDD Vdd 0 'vdd'

*add transistors 
*pfet is for the finfet nfet 
mp1 D A Vdd A pfet L=lg NFIN=2*pfin
mp2 D B Vdd B pfet L=lg NFIN=2*pfin
mp3 Y C D C pfet L=lg NFIN=2*pfin


mp4 G B Vdd B pfet L=lg NFIN=minfin
mp5 Y A G A pfet L=lg NFIN=minfin
mp6 CO Y Vdd Y pfet L=lg NFIN=pfin
mp7 H A Vdd A pfet L=lg NFIN=minfin
mp8 H B Vdd B pfet L=lg NFIN=minfin
mp9 H C Vdd C pfet L=lg NFIN=minfin
mp10 Z Y H Y pfet L=lg NFIN=minfin
mp11 J C Vdd C pfet L=lg NFIN=minfin
mp12 K B J B pfet L=lg NFIN=minfin
mp13 Z A K A pfet L=lg NFIN=minfin
mp14 S Z Vdd Z pfet L=lg NFIN=pfin

mn1 E A Gnd A nfet L=lg NFIN=2*nfin
mn2 E B Gnd B nfet L=lg NFIN=2*nfin
mn3 Y C E C nfet L=lg NFIN=2*nfin
mn4 F B Gnd B nfet L=lg NFIN=minfin

mn5 Y A F A nfet L=lg NFIN=minfin
mn6 CO Y Gnd Y nfet L=lg NFIN=nfin
mn7 I A Gnd A nfet L=lg NFIN=minfin

mn8 I B Gnd B nfet L=lg NFIN=minfin
mn9 I C Gnd C nfet L=lg NFIN=minfin
mn10 Z Y I Y nfet L=lg NFIN=minfin

mn11 M C Gnd C nfet L=lg NFIN=minfin
mn12 L B M B nfet L=lg NFIN=minfin
mn13 Z A L A nfet L=lg NFIN=minfin
mn14 S Z Gnd Z nfet L=lg NFIN=nfin

*add cap

*add voltage sourse
*VX X 0 'vdd/2'
VA A 0 PULSE(0 Vdd 0.5n 10p 10p 0.49n 1n)
VB B 0 PULSE(0 Vdd 1n 10p 10p 0.99n 2n)
VC C 0 PULSE(0 Vdd 2n 10p 10p 1.99n 4n)

*define the initial condition of V(Z)
.IC V(CO)=0
.IC V(S)=0
.IC V(A)=0
.IC V(B)=0
.IC V(C)=0

*do transient analysis
	*syntax: .TRAN tiner tstop START=stval 
	*tiner - time step
	*tstop - final time
	*stval - initial time (default 0)
.tran 0.01n 10n 

*print the V(Z) to waveform file *.tr0
.print V(CO)
.print V(S)
.print V(A)
.print V(B)
.print V(C)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement
.measure tran Rise_delay_CO TRIG V(A) VAL=Vdd/2 TD=0 RISE=2 TARG V(CO) VAL=Vdd/2 RISE=1
.measure tran Fall_delay_CO TRIG V(A) VAL=Vdd/2 TD=0 RISE=1 TARG V(CO) VAL=Vdd/2 FALL=1
.measure tran Rise_delay_S TRIG V(A) VAL=Vdd/2 TD=0 RISE=1 TARG V(S) VAL=Vdd/2 RISE=1
.measure tran Fall_delay_S TRIG V(A) VAL=Vdd/2 TD=0 RISE=2 TARG V(S) VAL=Vdd/2 FALL=1

.end