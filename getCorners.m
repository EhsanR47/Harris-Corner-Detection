%Harris Corner Detection
function [score, points] = getCorners(I, sigma, kappa, theta)
disp('kappa is :');
disp(kappa)
[M11, M12, M22] = M(I, sigma);
disp('sigma is :');
disp(sigma)
% compute score using det and trace
%det (MATLAB Functions) d = det(X) returns the determinant of the square matrix X . If X contains only integer entries, the result d is also an integer. Using det(X) == 0 as a test for matrix singularity is appropriate only for matrices of modest order with small integer entries.
detM = M11 .* M22 - M12.^2;
traceM = M11 + M22;
score = detM - kappa * traceM.^2;
%disp(score)
%score is : Harris-Cornerness-function
%imagesc(C) displays the data in array C as an image that uses the full range of colors in the colormap. Each element of C specifies the color for one pixel of the image. The resulting image is an m-by-n grid of pixels where m is the number of rows and n is the number of columns in C. The row and column indices of the elements determine the centers of the corresponding pixels.
% display score (for debugging)
imagesc(sign(score) .* abs(score).^(1/4));
%c=colorbar;
%imshow(c)

% you can disable non-maximum suppression (for debugging)
max_only = 1;

% padded image for easier non-max suppression check
score_pad = -inf * ones(size(I) + 2);
score_pad(2:end-1, 2:end-1) = score;

%find (MATLAB Functions) k = find(X) returns the indices of the array X that point to nonzero elements. If none is found, find returns an empty matrix. [i,j] = find(X) returns the row and column indices of the nonzero entries in the matrix X .
% find corners
[y, x] = find( score > theta ...
             & ( ~max_only ...
               | ( score > score_pad(1:end-2, 2:end-1) ...
                 & score > score_pad(3:end  , 2:end-1) ...
                 & score > score_pad(2:end-1, 1:end-2) ...
                 & score > score_pad(2:end-1, 3:end))));

points = [x y];

end

