%TROTY Calculate a 4x4 rotation matrix about Y axis
% 
% @Description:
% troty 计算绕x轴旋转的4x4矩阵
% 
% @Example:
% T = troty(pi/3)
% T = troty(45, 'deg')
% 
% @Relate:
% see also trotz, trotx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function T = troty(angle, unitSystem)
    if nargin == 2 && strcmp('deg', unitSystem)
        angle = deg2rad(angle); 
    end
    
    T = [
            cos(angle),     0,  sin(angle), 0;
            0,              1,  0,          0;
            -sin(angle),    0,  cos(angle), 0;
            0,              0,  0,          1;
        ];
end