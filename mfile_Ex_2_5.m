clear all;clc;
close all;

%Ex2-5
S_rated = 15000
Vp_rated = 2300
Vs_rated = 230
%Low voltage side experimental result
Voc = 230; %V
Ioc = 2.1;%A
Poc = 50; %W

%High voltage side experimental result
Vsc = 47;
Isc = 6.0;
Psc = 160;

a = Vp_rated/Vs_rated;


%Open loop Test
PF_open = Poc/Voc/Ioc;
Theta_open = acos(PF_open)
Theta_open_Deg = acos(PF_open)*180/pi

Y_Open_Real = Ioc/Voc*cos(Theta_open)
Y_Open_Img = -Ioc/Voc*sin(Theta_open)

Rc = 1/Y_Open_Real
Xm = -1/Y_Open_Img

PF_Short = Psc/Vsc/Isc;
Theta_Short = acos(PF_Short)
Zshort_Real = Vsc/Isc*cos(Theta_Short);
Zshort_Img  = Vsc/Isc*sin(Theta_Short);
Req = Zshort_Real
Xeq = Zshort_Img

%a)
Rc_p = Rc*a^2
Xm_p = Xm*a^2
Req_P = Req
Xeq_P = Xeq

%b)
Rc_s = Rc
Xm_s = Xm
Req_s = Req/a/a
Xeq_s = Xeq/a/a

%c) Full rated Current
%0.8 Lagging PF
PF= 0.8;
Is_rated =  S_rated/Vs_rated;
Theta_I = -acos(PF);
Is_rated_Real = Is_rated*cos(Theta_I);
Is_rated_Imag = Is_rated*sin(Theta_I);
Is_rated_comp = complex(Is_rated_Real,Is_rated_Imag);
Zs_rated_comp = complex(Req_s, Xeq_s);

Vp_a =  Vs_rated + Is_rated_comp*Zs_rated_comp;
Vp_a_mag_Lag =  abs(Vp_a)
Vp_a_ang_deg_Lag =  angle(Vp_a)*180/pi
VR_Lag = (Vp_a_mag_Lag - Vs_rated)/Vs_rated*100

%1.0 Lagging PF
PF= 1.0;
Is_rated =  S_rated/Vs_rated
Theta_I = -acos(PF)
Is_rated_Real = Is_rated*cos(Theta_I)
Is_rated_Imag = Is_rated*sin(Theta_I)
Is_rated_comp = complex(Is_rated_Real,Is_rated_Imag)
Zs_rated_comp = complex(Req_s, Xeq_s)

Vp_a =  Vs_rated + Is_rated_comp*Zs_rated_comp
Vp_a_mag =  abs(Vp_a)
Vp_a_ang_deg =  angle(Vp_a)*180/pi
VR_Lag_unity = (Vp_a_mag - Vs_rated)/Vs_rated*100

%0.8 Leading PF
PF= 0.8;
Is_rated =  S_rated/Vs_rated
Theta_I = acos(PF)
Is_rated_Real = Is_rated*cos(Theta_I)
Is_rated_Imag = Is_rated*sin(Theta_I)
Is_rated_comp = complex(Is_rated_Real,Is_rated_Imag)
Zs_rated_comp = complex(Req_s, Xeq_s)

Vp_a =  Vs_rated + Is_rated_comp*Zs_rated_comp
Vp_a_mag =  abs(Vp_a)
Vp_a_ang_deg =  angle(Vp_a)*180/pi
VR_Lag_Leading = (Vp_a_mag - Vs_rated)/Vs_rated*100

%e)
Pculoss = Is_rated^2*Req_s;
Pcore   = Vp_a_mag_Lag^2/Rc_s;
P_out   = S_rated*0.8;
Eta     = P_out/(P_out+Pcore+Pculoss)*100.0




