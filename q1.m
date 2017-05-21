%Question 1 maths
clear 
clc
format shortEng
format compact

% Individual stages
A1 = [  0.1,            -100             ; 
        100*10^(-9),    -100*10^(-6)    ]
A2 = [  0.01,           -20              ;
        50*10^(-9),     -100*10^(-6)    ]
A3 = [  0.5,            -25         ;
        20*10^(-6),     -1 * 10^(-3)              ]

% Combined stages
A = A1*A2*A3;
fprintf('\n A = A1*A2*A3\n   =  \n');
disp(A)

% Source and load resistances
Rs = 50 *10^3
Rl = 400

% Overall Gain
Gtot = Rl / ( (A(1,1) + A(2,1)*Rs)*Rl - A(1,2) - A(2,2)*Rs )

