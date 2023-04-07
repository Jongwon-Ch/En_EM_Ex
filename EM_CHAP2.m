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
