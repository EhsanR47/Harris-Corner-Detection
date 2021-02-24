%Harris Corner Detection
disp('Harris Corner Detection')
disp(' ')
I=imgread('pic3.png');
%%
imshow(I)
%%
tic
[score, points] = getCorners(I, 2, 0.05, 1e-7);
t=toc;
disp('time needed for getHarrisCorners');
disp(t);
%%
showplot(I,points)