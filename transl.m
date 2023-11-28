%TRANSL calculate a 4x4 homogeneous matrix along XYZ axis
% 
% @Description:
% transl 计算沿坐标轴平移的4x4齐次矩阵
% 
% @Example:
% T = transl(3, 4, 5)
% 
% @Relate:
% see also trotx, troty, trotz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function T = transl(x_offset, y_offset, z_offset)
    if nargin == 3
        T = [
        1,  0,  0,  x_offset;
        0,  1,  0,  y_offset;
        0,  0,  1,  z_offset;
        0,  0,  0,  1;
        ];
    else
        error('使用错误');
    end
    
end