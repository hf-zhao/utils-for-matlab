%DRAWARROW Draw 3D arrows
% 
% @Description:
% drawArrow 绘制三维箭头
% 
% @Example:
% drawArrow([3,4,5]', [4,2,4]')
% drawArrow([3,4,5]', [4,2,4]', 'shape_ratio', 0.4) % 箭头底部半径与高度的比值，默认 0.2/1
% drawArrow([3,4,5]', [4,2,4]', 'size_ratio', 0.5) % 箭头大小比值，默认 0.2
% drawArrow([3,4,5]', [4,2,4]', 'arrow_color', 'b') % 箭头颜色，默认红色
% drawArrow([3,4,5]', [4,2,4]', 'stem_width', 2) % 箭柄的宽度，默认 1
% 
% @Relate:
% see also drawCSYS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function drawArrow(start_pos, end_pos, varargin)  
    % 验证输入参数的个数
    narginchk(2, 7);
    opt = argparse(varargin);
   
    T = transform(start_pos, end_pos);
    r = opt.shape_ratio : -0.01 : 0;
    [X, Y, Z] = cylinder(r, 30);
    X = X * opt.size_ratio;
    Y = Y * opt.size_ratio;
    Z = (Z-1) * opt.size_ratio;
    [L, W] = size(Z);
    for i = 1:L
        for j = 1:W
            temp = T * [X(i,j) Y(i,j) Z(i,j) 1]';
            X(i,j) = temp(1);
            Y(i,j) = temp(2);
            Z(i,j) = temp(3);
        end
    end
    
    fig =  findobj('Type', 'figure');
    if isempty(fig)
       view(3);
       hold on;
       grid on;
       axis tight;
       axis equal;
    end
    
	surf(X, Y, Z, 'FaceColor', opt.arrow_color, 'EdgeColor', 'none');
    plot3([start_pos(1) end_pos(1)], [start_pos(2) end_pos(2)], [start_pos(3) end_pos(3)], opt.stem_color, 'LineWidth',opt.stem_width);
end

function T = transform(start_pos, end_pos)
    % 判断输入是否为列向量，不是则转成列向量
    if ~iscolumn(start_pos)
        start_pos = start_pos';
    end
    if ~iscolumn(end_pos)
        end_pos = end_pos';
    end
    % 旋转前后的矢量
    P1 = [0 0 1]';
    P2 = end_pos - start_pos;
    
    % 轴角
    % 两向量夹角
    q = acos(dot(P1, P2) / (norm(P1) * norm(P2)));
    if (q - 0) < eps
        T = [eye(3), end_pos;
                0 0 0 1];
        return;
    end
    % 旋转轴
    e = [P1(2)*P2(3) - P1(3)*P2(2);
        P1(3)*P2(1) - P1(1)*P2(3);
        P1(1)*P2(2) - P1(2)*P2(1)];
    e = e/norm(e);
    R = [e(1)^2*(1-cos(q))+cos(q), e(1)*e(2)*(1-cos(q))-e(3)*sin(q), e(1)*e(3)*(1-cos(q))+e(2)*sin(q);
        e(1)*e(2)*(1-cos(q))+e(3)*sin(q), e(2)^2*(1-cos(q))+cos(q), e(2)*e(3)*(1-cos(q))-e(1)*sin(q);
        e(1)*e(3)*(1-cos(q))-e(2)*sin(q), e(2)*e(3)*(1-cos(q))+e(1)*sin(q), e(3)^2*(1-cos(q))+cos(q)];
    
    T = [R, end_pos;
        0 0 0 1];
end

function opt = argparse(args)
    % 箭头底部半径与箭头高度(默认高度为单位1)的比例
    index = strcmp('shape_ratio', args);
    if ~any(index)
        opt.shape_ratio = 0.2;
    else
        index = find(index)+1;
        opt.shape_ratio = args{index};
    end
    
    % 箭头大小比例
    index = strcmp('size_ratio', args);
    if ~any(index)
        opt.size_ratio = 0.2;
    else
        index = find(index)+1;
        opt.size_ratio = args{index};
    end
    
    % 箭头颜色
    index = strcmp('arrow_color', args);
    if ~any(index)
        opt.arrow_color = 'r';
    else
        index = find(index)+1;
        opt.arrow_color = args{index};
    end
    
    % 箭柄宽
    index = strcmp('stem_width', args);
    if ~any(index)
        opt.stem_width = 1;
    else
        index = find(index)+1;
        opt.stem_width = args{index};
    end
    
    % 箭柄颜色
    index = strcmp('stem_color', args);
    if ~any(index)
        opt.stem_color = 'k';
    else
        index = find(index)+1;
        opt.stem_color = args{index};
    end
end