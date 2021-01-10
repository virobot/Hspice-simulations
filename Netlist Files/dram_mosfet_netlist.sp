
.include './lp32nm.pm'

*define parameters 
.param vdd=0.7 
.param vss=0 
.param Wp = 64n
.param lg=32n 
.param LoadCap = 1f

VSS Gnd 0 'vss'
VDD Vdd 0 'vdd'

*add transistors 
*pfet is for the finfet nfet 
mp1 Z 0 X vdd pmos L=lg W=Wp

*add cap
Cz Z Gnd 'LoadCap'

*add voltage sourse
VX X 0 'vdd/2'
VY Y 0 'vdd'

*define the initial condition of V(Z)
.IC V(Z)='vdd'

*do transient analysis
	*syntax: .TRAN tiner tstop START=stval 
	*tiner - time step
	*tstop - final time
	*stval - initial time (default 0)
.tran 0.1n 5u

*print the V(Z) to waveform file *.tr0
.print V(Z)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement
.measure tran RTL TRIG AT=0 TARG v(Z) VAL=0.35 FALL=1
.measure tran avg_current AVG I(Cz) from 0 to 'RTL'
.measure tran avg_power AVG p(Cz)

.alter case 2:
.param Wp = 64n
.param LoadCap= 1f
 
.alter case 3:
.param Wp = 64n
.param LoadCap= 5p
 
.alter case 4:
.param Wp = 64n
.param LoadCap= 10p
 
.alter case 5:
.param Wp = 64n
.param LoadCap= 15p
 
.alter case 6:
.param Wp = 64n
.param LoadCap= 20p
 
.alter case 7:
.param Wp = 64n
.param LoadCap= 25p
 
.alter case 8:
.param Wp = 64n
.param LoadCap= 30p
 
.alter case 9:
.param Wp = 64n
.param LoadCap= 35p
 
.alter case 10:
.param Wp = 64n
.param LoadCap= 40p
 
.alter case 11:
.param Wp = 64n
.param LoadCap= 45p
 
.alter case 12:
.param Wp = 64n
.param LoadCap= 50p
 
.alter case 13:
.param Wp = 128n
.param LoadCap= 1f
 
.alter case 14:
.param Wp = 128n
.param LoadCap= 5p
 
.alter case 15:
.param Wp = 128n
.param LoadCap= 10p
 
.alter case 16:
.param Wp = 128n
.param LoadCap= 15p
 
.alter case 17:
.param Wp = 128n
.param LoadCap= 20p
 
.alter case 18:
.param Wp = 128n
.param LoadCap= 25p
 
.alter case 19:
.param Wp = 128n
.param LoadCap= 30p
 
.alter case 20:
.param Wp = 128n
.param LoadCap= 35p
 
.alter case 21:
.param Wp = 128n
.param LoadCap= 40p
 
.alter case 22:
.param Wp = 128n
.param LoadCap= 45p
 
.alter case 23:
.param Wp = 128n
.param LoadCap= 50p
 
.alter case 24:
.param Wp = 192n
.param LoadCap= 1f
 
.alter case 25:
.param Wp = 192n
.param LoadCap= 5p
 
.alter case 26:
.param Wp = 192n
.param LoadCap= 10p
 
.alter case 27:
.param Wp = 192n
.param LoadCap= 15p
 
.alter case 28:
.param Wp = 192n
.param LoadCap= 20p
 
.alter case 29:
.param Wp = 192n
.param LoadCap= 25p
 
.alter case 30:
.param Wp = 192n
.param LoadCap= 30p
 
.alter case 31:
.param Wp = 192n
.param LoadCap= 35p
 
.alter case 32:
.param Wp = 192n
.param LoadCap= 40p
 
.alter case 33:
.param Wp = 192n
.param LoadCap= 45p
 
.alter case 34:
.param Wp = 192n
.param LoadCap= 50p
 
.alter case 35:
.param Wp = 256n
.param LoadCap= 1f
 
.alter case 36:
.param Wp = 256n
.param LoadCap= 5p
 
.alter case 37:
.param Wp = 256n
.param LoadCap= 10p
 
.alter case 38:
.param Wp = 256n
.param LoadCap= 15p
 
.alter case 39:
.param Wp = 256n
.param LoadCap= 20p
 
.alter case 40:
.param Wp = 256n
.param LoadCap= 25p
 
.alter case 41:
.param Wp = 256n
.param LoadCap= 30p
 
.alter case 42:
.param Wp = 256n
.param LoadCap= 35p
 
.alter case 43:
.param Wp = 256n
.param LoadCap= 40p
 
.alter case 44:
.param Wp = 256n
.param LoadCap= 45p
 
.alter case 45:
.param Wp = 256n
.param LoadCap= 50p
 
.alter case 46:
.param Wp = 320n
.param LoadCap= 1f
 
.alter case 47:
.param Wp = 320n
.param LoadCap= 5p
 
.alter case 48:
.param Wp = 320n
.param LoadCap= 10p
 
.alter case 49:
.param Wp = 320n
.param LoadCap= 15p
 
.alter case 50:
.param Wp = 320n
.param LoadCap= 20p
 
.alter case 51:
.param Wp = 320n
.param LoadCap= 25p
 
.alter case 52:
.param Wp = 320n
.param LoadCap= 30p
 
.alter case 53:
.param Wp = 320n
.param LoadCap= 35p
 
.alter case 54:
.param Wp = 320n
.param LoadCap= 40p
 
.alter case 55:
.param Wp = 320n
.param LoadCap= 45p
 
.alter case 56:
.param Wp = 320n
.param LoadCap= 50p
 
.alter case 57:
.param Wp = 384n
.param LoadCap= 1f
 
.alter case 58:
.param Wp = 384n
.param LoadCap= 5p
 
.alter case 59:
.param Wp = 384n
.param LoadCap= 10p
 
.alter case 60:
.param Wp = 384n
.param LoadCap= 15p
 
.alter case 61:
.param Wp = 384n
.param LoadCap= 20p
 
.alter case 62:
.param Wp = 384n
.param LoadCap= 25p
 
.alter case 63:
.param Wp = 384n
.param LoadCap= 30p
 
.alter case 64:
.param Wp = 384n
.param LoadCap= 35p
 
.alter case 65:
.param Wp = 384n
.param LoadCap= 40p
 
.alter case 66:
.param Wp = 384n
.param LoadCap= 45p
 
.alter case 67:
.param Wp = 384n
.param LoadCap= 50p
 
.alter case 68:
.param Wp = 448n
.param LoadCap= 1f
 
.alter case 69:
.param Wp = 448n
.param LoadCap= 5p
 
.alter case 70:
.param Wp = 448n
.param LoadCap= 10p
 
.alter case 71:
.param Wp = 448n
.param LoadCap= 15p
 
.alter case 72:
.param Wp = 448n
.param LoadCap= 20p
 
.alter case 73:
.param Wp = 448n
.param LoadCap= 25p
 
.alter case 74:
.param Wp = 448n
.param LoadCap= 30p
 
.alter case 75:
.param Wp = 448n
.param LoadCap= 35p
 
.alter case 76:
.param Wp = 448n
.param LoadCap= 40p
 
.alter case 77:
.param Wp = 448n
.param LoadCap= 45p
 
.alter case 78:
.param Wp = 448n
.param LoadCap= 50p
 
.alter case 79:
.param Wp = 512n
.param LoadCap= 1f
 
.alter case 80:
.param Wp = 512n
.param LoadCap= 5p
 
.alter case 81:
.param Wp = 512n
.param LoadCap= 10p
 
.alter case 82:
.param Wp = 512n
.param LoadCap= 15p
 
.alter case 83:
.param Wp = 512n
.param LoadCap= 20p
 
.alter case 84:
.param Wp = 512n
.param LoadCap= 25p
 
.alter case 85:
.param Wp = 512n
.param LoadCap= 30p
 
.alter case 86:
.param Wp = 512n
.param LoadCap= 35p
 
.alter case 87:
.param Wp = 512n
.param LoadCap= 40p
 
.alter case 88:
.param Wp = 512n
.param LoadCap= 45p
 
.alter case 89:
.param Wp = 512n
.param LoadCap= 50p
 
.alter case 90:
.param Wp = 576n
.param LoadCap= 1f
 
.alter case 91:
.param Wp = 576n
.param LoadCap= 5p
 
.alter case 92:
.param Wp = 576n
.param LoadCap= 10p
 
.alter case 93:
.param Wp = 576n
.param LoadCap= 15p
 
.alter case 94:
.param Wp = 576n
.param LoadCap= 20p
 
.alter case 95:
.param Wp = 576n
.param LoadCap= 25p
 
.alter case 96:
.param Wp = 576n
.param LoadCap= 30p
 
.alter case 97:
.param Wp = 576n
.param LoadCap= 35p
 
.alter case 98:
.param Wp = 576n
.param LoadCap= 40p
 
.alter case 99:
.param Wp = 576n
.param LoadCap= 45p
 
.alter case 100:
.param Wp = 576n
.param LoadCap= 50p
 
.alter case 101:
.param Wp = 640n
.param LoadCap= 1f
 
.alter case 102:
.param Wp = 640n
.param LoadCap= 5p
 
.alter case 103:
.param Wp = 640n
.param LoadCap= 10p
 
.alter case 104:
.param Wp = 640n
.param LoadCap= 15p
 
.alter case 105:
.param Wp = 640n
.param LoadCap= 20p
 
.alter case 106:
.param Wp = 640n
.param LoadCap= 25p
 
.alter case 107:
.param Wp = 640n
.param LoadCap= 30p
 
.alter case 108:
.param Wp = 640n
.param LoadCap= 35p
 
.alter case 109:
.param Wp = 640n
.param LoadCap= 40p
 
.alter case 110:
.param Wp = 640n
.param LoadCap= 45p
 
.alter case 111:
.param Wp = 640n
.param LoadCap= 50p
 
.alter case 112:
.param Wp = 704n
.param LoadCap= 1f
 
.alter case 113:
.param Wp = 704n
.param LoadCap= 5p
 
.alter case 114:
.param Wp = 704n
.param LoadCap= 10p
 
.alter case 115:
.param Wp = 704n
.param LoadCap= 15p
 
.alter case 116:
.param Wp = 704n
.param LoadCap= 20p
 
.alter case 117:
.param Wp = 704n
.param LoadCap= 25p
 
.alter case 118:
.param Wp = 704n
.param LoadCap= 30p
 
.alter case 119:
.param Wp = 704n
.param LoadCap= 35p
 
.alter case 120:
.param Wp = 704n
.param LoadCap= 40p
 
.alter case 121:
.param Wp = 704n
.param LoadCap= 45p
 
.alter case 122:
.param Wp = 704n
.param LoadCap= 50p
 
.alter case 123:
.param Wp = 768n
.param LoadCap= 1f
 
.alter case 124:
.param Wp = 768n
.param LoadCap= 5p
 
.alter case 125:
.param Wp = 768n
.param LoadCap= 10p
 
.alter case 126:
.param Wp = 768n
.param LoadCap= 15p
 
.alter case 127:
.param Wp = 768n
.param LoadCap= 20p
 
.alter case 128:
.param Wp = 768n
.param LoadCap= 25p
 
.alter case 129:
.param Wp = 768n
.param LoadCap= 30p
 
.alter case 130:
.param Wp = 768n
.param LoadCap= 35p
 
.alter case 131:
.param Wp = 768n
.param LoadCap= 40p
 
.alter case 132:
.param Wp = 768n
.param LoadCap= 45p
 
.alter case 133:
.param Wp = 768n
.param LoadCap= 50p
 
.alter case 134:
.param Wp = 832n
.param LoadCap= 1f
 
.alter case 135:
.param Wp = 832n
.param LoadCap= 5p
 
.alter case 136:
.param Wp = 832n
.param LoadCap= 10p
 
.alter case 137:
.param Wp = 832n
.param LoadCap= 15p
 
.alter case 138:
.param Wp = 832n
.param LoadCap= 20p
 
.alter case 139:
.param Wp = 832n
.param LoadCap= 25p
 
.alter case 140:
.param Wp = 832n
.param LoadCap= 30p
 
.alter case 141:
.param Wp = 832n
.param LoadCap= 35p
 
.alter case 142:
.param Wp = 832n
.param LoadCap= 40p
 
.alter case 143:
.param Wp = 832n
.param LoadCap= 45p
 
.alter case 144:
.param Wp = 832n
.param LoadCap= 50p
 
.alter case 145:
.param Wp = 896n
.param LoadCap= 1f
 
.alter case 146:
.param Wp = 896n
.param LoadCap= 5p
 
.alter case 147:
.param Wp = 896n
.param LoadCap= 10p
 
.alter case 148:
.param Wp = 896n
.param LoadCap= 15p
 
.alter case 149:
.param Wp = 896n
.param LoadCap= 20p
 
.alter case 150:
.param Wp = 896n
.param LoadCap= 25p
 
.alter case 151:
.param Wp = 896n
.param LoadCap= 30p
 
.alter case 152:
.param Wp = 896n
.param LoadCap= 35p
 
.alter case 153:
.param Wp = 896n
.param LoadCap= 40p
 
.alter case 154:
.param Wp = 896n
.param LoadCap= 45p
 
.alter case 155:
.param Wp = 896n
.param LoadCap= 50p
 
.alter case 156:
.param Wp = 960n
.param LoadCap= 1f
 
.alter case 157:
.param Wp = 960n
.param LoadCap= 5p
 
.alter case 158:
.param Wp = 960n
.param LoadCap= 10p
 
.alter case 159:
.param Wp = 960n
.param LoadCap= 15p
 
.alter case 160:
.param Wp = 960n
.param LoadCap= 20p
 
.alter case 161:
.param Wp = 960n
.param LoadCap= 25p
 
.alter case 162:
.param Wp = 960n
.param LoadCap= 30p
 
.alter case 163:
.param Wp = 960n
.param LoadCap= 35p
 
.alter case 164:
.param Wp = 960n
.param LoadCap= 40p
 
.alter case 165:
.param Wp = 960n
.param LoadCap= 45p
 
.alter case 166:
.param Wp = 960n
.param LoadCap= 50p
 
.alter case 167:
.param Wp = 1024n
.param LoadCap= 1f
 
.alter case 168:
.param Wp = 1024n
.param LoadCap= 5p
 
.alter case 169:
.param Wp = 1024n
.param LoadCap= 10p
 
.alter case 170:
.param Wp = 1024n
.param LoadCap= 15p
 
.alter case 171:
.param Wp = 1024n
.param LoadCap= 20p
 
.alter case 172:
.param Wp = 1024n
.param LoadCap= 25p
 
.alter case 173:
.param Wp = 1024n
.param LoadCap= 30p
 
.alter case 174:
.param Wp = 1024n
.param LoadCap= 35p
 
.alter case 175:
.param Wp = 1024n
.param LoadCap= 40p
 
.alter case 176:
.param Wp = 1024n
.param LoadCap= 45p
 
.alter case 177:
.param Wp = 1024n
.param LoadCap= 50p

.end