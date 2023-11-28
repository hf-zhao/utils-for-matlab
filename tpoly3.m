%TPOLY3 Cubic polynomial trajectory generation
% 
% @Description:
% tpoly3 三次多项式规划生成
% 
% @Example:
% [p, pd, pdd] = tpoly3(0, 3, 0, 0, linspace(0,10,100))
% 
% @Relate:
% see also tpoly5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [p, pd, pdd] = tpoly3(q0, qf, qd0, qdf, timeSequence)
    % 判断t是否为标量
    if isscalar(timeSequence)
        error('参数t只接受时间序列');
    end
    
    tx = max(timeSequence);
    % 参数矩阵
    Tx = [
        1       0       0       0  
        1       tx      tx^2    tx^3
        0       1       0       0
        0       1       2*tx    3*tx^2
    ];
    % 获取多项式系数
    coeffs = (Tx \ [q0 qf qd0 qdf]')';
    coeffs_x = flip(coeffs);
    coeffs_v = coeffs_x(1:3).* (3:-1:1);
    coeffs_a = coeffs_v(1:2).* (2:-1:1);
    
    % 输出
    % matlab系统函数
    p = polyval(coeffs_x, timeSequence);
    pd = polyval(coeffs_v, timeSequence);
    pdd = polyval(coeffs_a, timeSequence);
end