%% voronoi diagram generation

allDataPoints = readmatrix('allDataPoints.csv');

[VL, CL, XY] = VoronoiLimit(allDataPoints(:,2),allDataPoints(:,3));

hold on;

voronoi(allDataPoints(:,2),allDataPoints(:,3));
text(allDataPoints(:,2),allDataPoints(:,3),num2str(allDataPoints(:,1)), 'FontSize', 8);


%% Finding the order of points 
TransferFunction=zeros(size(allDataPoints,1),1);
for lis=1:1:size(allDataPoints,1)
[q, idx] = ismember(XY,allDataPoints(lis,2:3), 'rows');
[row,col] = find(q);
TransferFunction(lis)=row;
end



%% filling ceertain cells

newMatrix = readtable("siteMvt.xlsx");

i = 0;
for i = 1:size(newMatrix,1)
    fill(VL(CL{TransferFunction(newMatrix.(1)(i))},1),VL(CL{TransferFunction(newMatrix.(1)(i))},2),'r');
end


text(allDataPoints(:,2),allDataPoints(:,3),num2str(allDataPoints(:,1)), 'FontSize', 8);