%ROTX Calculate a 3x3 rotation matrix about X axis
% 
% @Description:
% rotx 计算绕x轴旋转的3x3矩阵
% 
% @Example:
% R = rotx(pi/3)
% R = rotx(45, 'deg')
% 
% @Relate:
% see also roty, rotz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function R = rotx(angle, unitSystem)
    if nargin == 2 && strcmp('deg', unitSystem)
        angle = deg2rad(angle); 
    end
    
    R = [
            1,  0,  0;
            0,  cos(angle), -sin(angle);
            0,  sin(angle), cos(angle);
        ];
end