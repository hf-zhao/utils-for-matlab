%ROTZ Calculate a 3x3 rotation matrix about Z axis
% 
% @Description:
% rotz 计算绕z轴旋转的3x3矩阵
% 
% @Example:
% R = rotz(pi/3)
% R = rotz(45, 'deg')
% 
% @Relate:
% see also rotx, roty

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function R = rotz(angle, unitSystem)
    if nargin == 2 && strcmp('deg', unitSystem)
        angle = deg2rad(angle); 
    end
    
    R = [
            cos(angle), -sin(angle),    0;
            sin(angle), cos(angle),     0;
            0,          0,              1;
        ];
end