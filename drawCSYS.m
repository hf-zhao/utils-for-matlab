%DRAWCSYS Draw a 3D coordinate system
% 
% @Description:
% drawCSYS 绘制三维坐标系
% 
% @Example:
% drawCSYS(trotx(pi/3), 1) 坐标系大小为1
% 
% @Relate:
% see also drawArrow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VERSION: 0.1.0 
% 
% Data: 2023/11/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function drawCSYS(T, ratio)
    axis_x = T(1:3, 1)';
    axis_y = T(1:3, 2)';
    axis_z = T(1:3, 3)';
    loc_ori = T(1:3, 4)';
    
    px = loc_ori+axis_x * ratio;
    py = loc_ori+axis_y * ratio;
    pz = loc_ori+axis_z * ratio;
    
    fig =  findobj('Type', 'figure');
    if isempty(fig)
       view(3);
       hold on;
       grid on;
       axis tight;
       axis equal;
    end
    
    drawArrow(loc_ori, px, 'arrow_color', 'r', 'size_ratio', ratio*0.25);
    drawArrow(loc_ori, py, 'arrow_color', 'g', 'size_ratio', ratio*0.25);
    drawArrow(loc_ori, pz, 'arrow_color', 'b', 'size_ratio', ratio*0.25);
    scatter3(loc_ori(1), loc_ori(2), loc_ori(3), ...
        'MarkerEdgeColor','k',...
        'MarkerFaceColor',[0 .75 .75], ...
        'Marker', '.');
    text(px(1), px(2), px(3), 'x', 'FontSize', 14);
    text(py(1), py(2), py(3), 'y', 'FontSize', 14);
    text(pz(1), pz(2), pz(3), 'z', 'FontSize', 14);
end