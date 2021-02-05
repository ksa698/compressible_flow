%% Notes
%thet=turn angle
%bet=wave angle
%values: beta, theta, M1, M1n, M2, M2n, rho ratio, pressure ratio
%EQN: tan(thet)=2*cot(bet)*(M1^2*sin(bet)^2-1)/(M1^2*(1.4+cos(2*bet)+2));
    %wave, turn, m1n, m2n, rho ratio and pressure ratio of m2n, m2
    %repeat this process for each case
    %lecture 15-17 slide 4
    
%% HW 3 Oblique Shock Relations Problem 1
% Case 1: M1 and Beta (Wave Angle)
prompt='Type 1 if given M1 and Beta \nType 2 if given M1 and M1n \nType 3 if given M1 and Theta \n';
x=input(prompt);
if x==1
    prompt='Type Value of M1: \n';
    q=input(prompt);
    M1=q;
        prompt='Type Value of Beta in Degrees: \n';
        w=input(prompt);
        bet=w*pi/180;
    %EQNS
        theta=atan2(2*cot(bet)*(M1^2*sin(bet)^2-1),(M1^2*(1.4+cos(2*bet))) + 2);
        Mn=M1*sin(bet);
        rho_rat=((2.4)*Mn^2)/(2+(0.4*Mn^2));
        p_rat=1+(2.8/2.4)*(Mn^2-1);
        Mn2=sqrt((1+0.2*Mn^2)/(1.4*Mn^2-0.2));
        M2=(Mn2)/sin(bet-theta);
    %fprintf
        disp('Case 1 Values (M1 and Beta Known)')
        fprintf('Beta in Deg: %6.4f \n',bet*180/pi)
        fprintf('Theta in Deg: %6.4f \n',theta*180/pi)
        fprintf('Mach 1 Normal: %6.4f \n',Mn)
        fprintf('Mach 2: %6.4f \n',M2)
        fprintf('Mach 2 Normal: %6.4f \n',Mn2)
        fprintf('Density Ratio: %6.4f \n',rho_rat)
        fprintf('Pressure Ratio: %6.4f \n',p_rat)
%Case 2: M1 and M1n 
else if x==2  
        prompt='Type Value of M1: \n';
        e=input(prompt);
        M1=e;
            prompt='Type Value of Mn: \n';
            r=input(prompt);
            Mn=r;
        %EQN
            bet=asin(Mn/M1);
            theta=atan2(2*cot(bet)*(M1^2*sin(bet)^2-1),(M1^2*(1.4+cos(2*bet))) + 2); %in radians
            rho_rat=((2.4)*Mn^2)/(2+(0.4*Mn^2));
            p_rat=1+(2.8/2.4)*(Mn^2-1);
            Mn2=sqrt((1+0.2*Mn^2)/(1.4*Mn^2-0.2));
            M2=(Mn2)/sin(bet-theta);
        %fprintf
            disp('Case 2 Values (M1 and M1n Known)')
            fprintf('Beta in Deg: %6.4f \n',bet*180/pi)
            fprintf('Theta in Deg: %6.4f \n',theta*180/pi)
            fprintf('Mach 1 Normal: %6.4f \n',Mn)
            fprintf('Mach 2: %6.4f \n',M2)
            fprintf('Mach 2 Normal: %6.4f \n',Mn2)
            fprintf('Density Ratio: %6.4f \n',rho_rat)
            fprintf('Pressure Ratio: %6.4f \n',p_rat)            
%Case 3: M1 and Theta(Turn Angle) Strong v.s Weak      
    else 
        prompt='Type Value of M1: \n';
        s=input(prompt);
        M1=s;
            prompt='Type Value of Theta in Degrees: \n';
            t=input(prompt);
            theta=t*pi/180;
        prompt='Type 1 if Strong Shock \nType 2 if Weak Shock \n';
        y=input(prompt);
        if y==1
            myfun=@(bet,thet) -tan(thet)+(2*cot(bet)*(M1^2*sin(bet)^2-1)/((M1^2*(1.4+cos(2*bet)))+2));
            thet=theta;
            fun=@(bet)myfun(bet,thet);
            %wave angle initial guess
                bet=fzero(fun,90*pi/180);
            %EQN
                Mn=M1*sin(bet);
                rho_rat=((2.4)*Mn^2)/(2+(0.4*Mn^2));
                p_rat=1+(2.8/2.4)*(Mn^2-1);
                Mn2=sqrt((1+0.2*Mn^2)/(1.4*Mn^2-0.2));
                M2=(Mn2)/sin(bet-theta);
            %fprintf
                disp('Case 3 Values (M1 and Theta of Strong Shock)')
                fprintf('Beta in Deg: %6.4f \n',bet*180/pi)
                fprintf('Theta in Deg: %6.4f \n',theta*180/pi)
                fprintf('Mach 1 Normal: %6.4f \n',Mn)
                fprintf('Mach 2: %6.4f \n',M2)
                fprintf('Mach 2 Normal: %6.4f \n',Mn2)
                fprintf('Density Ratio: %6.4f \n',rho_rat)
                fprintf('Pressure Ratio: %6.4f \n',p_rat)    
        else %weak shock
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
            %fprintf
                disp('Case 3 Values (M1 and Theta of Weak Shock) \n')
                fprintf('Beta in Deg: %6.4f \n',bet*180/pi)
                fprintf('Theta in Deg: %6.4f \n',theta*180/pi)
                fprintf('Mach 1 Normal: %6.4f \n',Mn)
                fprintf('Mach 2: %6.4f \n',M2)
                fprintf('Mach 2 Normal: %6.4f \n',Mn2)
                fprintf('Density Ratio: %6.4f \n',rho_rat)
                fprintf('Pressure Ratio: %6.4f \n',p_rat)
        end
    end
end

    

