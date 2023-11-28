%ROTY Calculate a 3x3 rotation matrix about Y axis
% 
% @Description:
% roty 计算绕y轴旋转的3x3矩阵
% 
% @Example:
% R = roty(pi/3)
% R = roty(45, 'deg')
% 
% @Relate:
% see also rotz, rotx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function R = roty(angle, unitSystem)
    if nargin == 2 && strcmp('deg', unitSystem)
        angle = deg2rad(angle); 
    end
    
    R = [
            cos(angle),     0,  sin(angle);
            0,              1,  0;
            -sin(angle),    0,  cos(angle);
        ];
end