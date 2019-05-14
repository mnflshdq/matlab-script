% -----> Rizki <-----%
clc
clear

syms s

num = 2.25;
den = [1 0.5 2.25];

Gs_tf = tf(num,den);
display(Gs_tf);

snum = poly2sym(num, s);
sden = poly2sym(den, s);

Wn = sqrt(den(3));
display(Wn);

% -----> Eko <-----%
Z = den(2)/(2*Wn);
display(Z);

Tp = pi/(Wn*sqrt(1-Z^2));
display(Tp);

Ts = 4/(Z*Wn);
display(Ts);

Tr = (1.76*Z^3 - 0.417*Z^2 + 1.039*Z + 1)/Wn;
display(Tr);

OS = exp(-(Z*pi/sqrt(1-Z^2)))*100;
display(OS);

% -----> Naufal <-----%
Gs_step = (1/s)*(snum/sden);
% Gs_step = vpa(Gs_step);
% display(Gs_step);

[snum_step, sden_step] = numden(Gs_step);
% display(snum_step);
% display(sden_step);

num_step = sym2poly(snum_step);
% display(num_step);
den_step = sym2poly(sden_step);
% display(den_step);
Gs_step_tf = tf(num_step,den_step);
display(Gs_step_tf);

gt = ilaplace(Gs_step);
display(gt);

stepplot(Gs_tf);