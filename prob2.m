%% HW3 Problem 2
%only using case 3 of previous code to not have clutter
prompt='Type Value of M1 for First Oblique Shock: \n';
s=input(prompt);
M1=s;
    prompt='Type Value of Theta in Degrees (Weak Shock): \n';
    t=input(prompt);
    theta=t*pi/180;
%weak shock
    myfun=@(bet,thet) -tan(thet)+(2*cot(bet)*(M1^2*sin(bet)^2-1)/((M1^2*(1.4+cos(2*bet)))+2));
    thet=theta;
    fun=@(bet)myfun(bet,thet);
    %wave angle initial guess
        bet=fzero(fun,30*pi/180);
    %EQN
        Mn=M1*sin(bet);
        rho_rat=((2.4)*Mn^2)/(2+(0.4*Mn^2));
        p_rat=1+(2.8/2.4)*(Mn^2-1);
        Mn2=sqrt((1+0.2*Mn^2)/(1.4*Mn^2-0.2));
        M2=(Mn2)/sin(bet-theta);
        s_rat=p_rat*(rho_rat)^-1;
        stag_p_rat=p_rat*(s_rat^-1)^3.5;
                    p1=p_rat;
            sp1=stag_p_rat;
    %fprintf
        fprintf('Mach 2: %6.4f \n',M2)
        fprintf('Pressure Ratio: %6.4f \n',p_rat)
        fprintf('Stagnation Pressure Ratio: %6.4f \n',stag_p_rat)
prompt='Type M1 for Second Oblique Shock (is M2 of last part): \n';
p=input(prompt);
M1=p;
    prompt='Type Value of Theta in Degrees (Weak Shock): \n';
    t=input(prompt);
    theta=t*pi/180;
%weak shock
    myfun=@(bet,thet) -tan(thet)+(2*cot(bet)*(M1^2*sin(bet)^2-1)/((M1^2*(1.4+cos(2*bet)))+2));
    thet=theta;
    fun=@(bet)myfun(bet,thet);
    %wave angle initial guess
        bet=fzero(fun,30*pi/180);
    %EQN
        Mn=M1*sin(bet);
        rho_rat=((2.4)*Mn^2)/(2+(0.4*Mn^2));
        p_rat=1+(2.8/2.4)*(Mn^2-1);
        Mn2=sqrt((1+0.2*Mn^2)/(1.4*Mn^2-0.2));
        M2=(Mn2)/sin(bet-theta);
        s_rat=p_rat*(rho_rat)^-1;
        stag_p_rat=p_rat*(s_rat^-1)^3.5;
            p2=p_rat;
            sp2=stag_p_rat;
    %fprintf
        fprintf('Mach 2: %6.4f \n',M2)
        fprintf('Pressure Ratio: %6.4f \n',p_rat)
        fprintf('Stagnation Pressure Ratio: %6.4f \n',stag_p_rat)


prompt='Type Value of Mach for Normal Shock: \n';
w=input(prompt);
MN=w;
        rho_rat=((2.4)*MN^2)/(2+(0.4*MN^2));
        p_rat=1+(2.8/2.4)*(MN^2-1);
        Mn2=sqrt((1+0.2*MN^2)/(1.4*MN^2-0.2));
        M2=(Mn2)/sin(bet-theta);
        s_rat=p_rat*(rho_rat)^-1;
        stag_p_rat=p_rat*(s_rat^-1)^3.5;
            p3=p_rat;
            sp3=stag_p_rat;
    %fprintf
        fprintf('Mach 2: %6.4f \n',M2)
        fprintf('Pressure Ratio: %6.4f \n',p_rat)
        fprintf('Stagnation Pressure Ratio: %6.4f \n',stag_p_rat)
        
    %full pressure ratios
    p=p1*p2*p3;
    sp=sp1*sp2*sp3;
    fprintf('P3/Pa: %6.4f \n', p)
    fprintf('Po3/Poa: %6.4f \n', sp)