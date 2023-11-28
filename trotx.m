%TROTX Calculate a 4x4 rotation matrix about X axis
% 
% @Description:
% trotx 计算绕x轴旋转的4x4矩阵
% 
% @Example:
% T = trotx(pi/3)
% T = trotx(45, 'deg')
% 
% @Relate:
% see also troty, trotz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function T = trotx(angle, unitSystem)
    if nargin == 2 && strcmp('deg', unitSystem)
        angle = deg2rad(angle); 
    end
    
    T = [
            1,  0,          0,              0;
            0,  cos(angle), -sin(angle),    0;
            0,  sin(angle), cos(angle),     0;
            0,  0,          0,              1;
        ];
end