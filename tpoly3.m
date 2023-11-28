%TPOLY3 Cubic polynomial trajectory generation
% 
% @Description:
% tpoly3 ���ζ���ʽ�滮����
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
    % �ж�t�Ƿ�Ϊ����
    if isscalar(timeSequence)
        error('����tֻ����ʱ������');
    end
    
    tx = max(timeSequence);
    % ��������
    Tx = [
        1       0       0       0  
        1       tx      tx^2    tx^3
        0       1       0       0
        0       1       2*tx    3*tx^2
    ];
    % ��ȡ����ʽϵ��
    coeffs = (Tx \ [q0 qf qd0 qdf]')';
    coeffs_x = flip(coeffs);
    coeffs_v = coeffs_x(1:3).* (3:-1:1);
    coeffs_a = coeffs_v(1:2).* (2:-1:1);
    
    % ���
    % matlabϵͳ����
    p = polyval(coeffs_x, timeSequence);
    pd = polyval(coeffs_v, timeSequence);
    pdd = polyval(coeffs_a, timeSequence);
end