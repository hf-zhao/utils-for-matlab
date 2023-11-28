%TPOLY5 Cubic polynomial trajectory generation
% 
% @Description:
% tpoly5 三次多项式规划生成
% 
% @Example:
% [p, pd, pdd] = tpoly5(0, 3, 0, 0, 0, linspace(0,10,100))
% 
% @Relate:
% see also tpoly3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [p, pd, pdd] = tpoly5(q0, qf, qd0, qdf, qdd0, qddf, timeSequence)
    % 判断t是否为标量
    if isscalar(timeSequence)
        error('参数t只接受时间序列');
    end
    
    tx = max(timeSequence);
    % 参数矩阵
    Tx = [      
        1       0       0       0       0       0
        1       tx      tx^2    tx^3    tx^4    tx^5
        0       1       0       0       0       0
        0       1       2*tx    3*tx^2  4*tx^3  5*tx^4
        0       0       2       0       0       0
        0       0       2       6*tx    12*tx^2 20*tx^3  
    ];
    % 获取多项式系数
    coeffs = (Tx \ [q0 qf qd0 qdf qdd0 qddf]')';
    coeffs_x = flip(coeffs);
    coeffs_v = coeffs_x(1:5).* (5:-1:1);
    coeffs_a = coeffs_v(1:4).* (4:-1:1);

    % 输出
    % matlab系统函数
    p = polyval(coeffs_x, t);
    pd = polyval(coeffs_v, t);
    pdd = polyval(coeffs_a, t);
end