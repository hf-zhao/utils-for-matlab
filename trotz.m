%TROTZ Calculate a 4x4 rotation matrix about Z axis
% 
% @Description:
% trotz 计算绕x轴旋转的4x4矩阵
% 
% @Example:
% T = trotz(pi/3)
% T = trotz(45, 'deg')
% 
% @Relate:
% see also trotx, troty

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function T = trotz(angle, unitSystem)
    if nargin == 2 && strcmp('deg', unitSystem)
        angle = deg2rad(angle); 
    end
    
    T = [
            cos(angle), -sin(angle),    0,  0;
            sin(angle), cos(angle),     0,  0;
            0,          0,              1,  0;
            0,          0,              0,  1;
        ];
end