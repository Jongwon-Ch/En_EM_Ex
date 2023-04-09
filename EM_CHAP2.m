%Ex 2-2
Voc = 240; %V
Ioc = 7.133;%A
Poc = 400; %W

Vsc = 489;
Isc = 2.5;
Psc = 240;

a = 8000/240;

%Open loop Test
PF_open = Poc/Voc/Ioc;
Theta_open = acos(PF_open)

Y_Open_Real = Ioc/Voc*cos(Theta_open);
Y_Open_Img = -Ioc/Voc*sin(Theta_open);

Rc = 1/Y_Open_Real;
Xm = -1/Y_Open_Img;

PF_Short = Psc/Vsc/Isc;
Theta_Short = acos(PF_Short)
Zshort_Real = Vsc/Isc*cos(Theta_Short);
Zshort_Img  = Vsc/Isc*sin(Theta_Short);
Req = Zshort_Real;
Xeq = Zshort_Img;

%SR4
I = 1;
Fs = 60;
Omega = Fs*2*pi;
N1 = 5;
N2 = 10;
MMF = N1*I;
Permeance = 0.001;
Reluctance = 1/Permeance;
Flux = MMF*Permeance
Induced_Vol = Omega*N2*Flux

%Problem 2-1
Rp = 5;
Rs = 0.005;
Xp = 6;
Xs = 0.006;
Rc = 50*10^3;
Xm = 10*10^3;
Fs = 60;
Omega = Fs*2*pi;
KVA = 100*10^3;
Vp = 8000;
Vs  = 277;
a = Vp/Vs;

Lp = Xp/Omega
Ls = Xs/Omega
Lm = Xm/Omega

%a)
Rp_ = Rp/a/a
Xp_ = Xp/a/a
Rc_ = Rc/a/a
Xm_ = Xm/a/a
Vp_ = Vp/a

%b) PU
Ibase = KVA/Vs
Zbase = Vs^2/KVA

Rp_PU = Rp_/Zbase
Xp_PU = Xp_/Zbase
Rc_PU = Rc_/Zbase
Xm_PU = Xm_/Zbase
RsPU = Rs/Zbase
XsPU = Xs/Zbase

%C) Input Regulation 
PF = 0.85;
IsRate_mag = KVA/Vs
Theta_I = -acos(PF)
IsRate_Real = IsRate_mag*cos(Theta_I)
IsRate_Imag = IsRate_mag*sin(Theta_I)
IsRate_comp = complex(IsRate_Real,IsRate_Imag)
ZsRate_comp = complex(Rp_+ Rs, Xp_+Xs)

Vp_a =  Vs + IsRate_comp*ZsRate_comp
Vp_a_mag =  abs(Vp_a)
Vp_a_ang_deg =  angle(Vp_a)*180/pi

VR_per = (Vp_a_mag - Vs)/Vs*100

%D) Copper loss and Iron loss
Pcu = IsRate_mag^2*(Rp_+ Rs)
Pcore = Vp_a_mag^2/Rc_

%e) Efficieny
Eta = (KVA*PF)/(KVA*PF+Pcu+Pcore)

%SR7

%Open loop Test
Popen = 1280.0;
IpOpen = 1.15378/sqrt(2);

%Open loop Test
PF_open = Popen/Vp/IpOpen;
Theta_open = acos(PF_open)

Y_Open_Real = IpOpen/Vp*cos(Theta_open);
Y_Open_Img = -IpOpen/Vp*sin(Theta_open);

Rc_op = 1/Y_Open_Real
Xm_op = -1/Y_Open_Img

Psopen = 1281.28;
IsOpen =33.3026/sqrt(2);
PF_open = Psopen/Vs/IsOpen;
Theta_open = acos(PF_open)

Y_Open_Real = IsOpen/Vs*cos(Theta_open);
Y_Open_Img = -IsOpen/Vs*sin(Theta_open);

Rc_op = 1/Y_Open_Real
Xm_op = -1/Y_Open_Img

Rc_op_ = Rc_op*a^2
Xm_op_ = Xm_op*a^2

%Short Circuit Test
Vp_sc = 115/sqrt(2)
Pp_sc = 295.544;
Ip_sc = 8.03/sqrt(2);

PF_Short = Pp_sc/Vp_sc/Ip_sc;
Theta_Short = acos(PF_Short)
Zshort_Real = Vp_sc/Ip_sc*cos(Theta_Short);
Zshort_Img  = Vp_sc/Ip_sc*sin(Theta_Short);
Req = Zshort_Real
Xeq = Zshort_Img

