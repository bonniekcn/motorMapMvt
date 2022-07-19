clc;
close all; % Close all figures (except those of imtool.)
clear; % Erase all existing variables. Or clearvars if you want.
workspace; % Make sure the workspace panel is showing.
%%
Prompt='Please enter the number of Unique sites: ';
Number_Unique_sites = input(Prompt); % Num of unique sites without repeatition
numPointsClicked = 0;
allDataPoints = zeros (Number_Unique_sites, 3); %the matrix with all datapoints and site numbers
%% Loading the Image file
I = imread(''); %put in the name of image file
imshow(I);
xaxe = xlim;
yaxe = ylim;
hold on;
%% Give the user the information
promptMessage = sprintf('Left click up to %d points.\nMiddle click to remove point.', Number_Unique_sites);
titleBarCaption = 'Continue?';
button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
if strcmpi(button, 'Cancel')
    return;
end
%% structure of the system

while sum(allDataPoints(:,1)) < (Number_Unique_sites*(1+Number_Unique_sites))/2
%w=waitforbuttonpress
%if w==1
zoom on
pause() %press any keyboard key when done with zooming
zoom off
numPointsClicked = numPointsClicked + 1;
[x(numPointsClicked), y(numPointsClicked), button] = ginput(1);
%%%%%%%%%%%%%%%%
if button == 1 %left clicking
    prompt = {'Enter site number:'};
    dlgtitle = 'Site number';
    dims = [1 35];
    definput = {sprintf('%g',numPointsClicked)};
    answer = inputdlg(prompt,dlgtitle,dims,definput);
    answer = str2num(answer{1});
    if answer > Number_Unique_sites
        msgbox("Exceeded the total number of sites")
    else
        if ismember(answer, allDataPoints(:, 1))
            msgbox(sprintf("Site number %d already existed", answer));
        else
            plt(numPointsClicked) = plot(x(numPointsClicked), y(numPointsClicked), 'r+', 'MarkerSize', 20);
            allDataPoints(answer, 1) = answer;
            allDataPoints(answer, 2) = x(numPointsClicked);
            allDataPoints(answer, 3) = y(numPointsClicked);
        end
    end
elseif button == 2 
    Idx = knnsearch(allDataPoints(:, 2), x(numPointsClicked));
    msgbox(sprintf('Site %d deleted', allDataPoints(Idx,1)));
    delete(plt);
    if exist("newplt") == 1
        delete(newplt)
    end
    allDataPoints(Idx, :) = 0;
    newplt = plot(allDataPoints(:, 2), allDataPoints(:, 3),'r+', 'MarkerSize', 20);
end
% zoom out

end

% Print to command window
x;
y;
msgbox('Done collecting points');
%% flipping the Y in data grabber
allDataPoints(:,[3])=-1*allDataPoints(:,[3]);
writematrix(allDataPoints,'allDataPoints.csv');

close all;


