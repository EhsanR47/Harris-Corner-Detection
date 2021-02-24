%Harris Corner Detection
function [M11, M12, M22] = M(I, sigma)
% Compute structure tensor

% spatial gradient using central differences
Ix = 0.5*(I(:,[2:end end]) - I(:,[1 1:end-1]));
Iy = 0.5*(I([2:end end],:) - I([1 1:end-1],:));
%disp('Ix is :');
%disp(Ix)
%disp('Iy is :');
%disp(Iy)
% Gaussian kernel
%Y = ceil( X ) rounds each element of X to the nearest integer greater than or equal to that element. Y = ceil( t ) rounds each element of the duration array t to the nearest number of seconds greater than or equal to that element.
k = ceil(4*sigma+1);
G = fspecial('gaussian', k, sigma);
%g = fspecial('motion', len , theta ) returns a filter to approximate, once convolved with an image, the linear motion of a camera. len specifies the length of the motion and theta specifies the angle of motion in degrees in a counter-clockwise direction. The filter becomes a vector for horizontal and vertical motions.


%C = conv2( A , B ) returns the two-dimensional convolution of matrices A and B . C = conv2( u , v , A ) first convolves each column of A with the vector u , and then it convolves each row of the result with the vector v . C = conv2(___, shape ) returns a subsection of the convolution according to shape .
M11 = conv2(Ix .* Ix, G, 'same');
M12 = conv2(Ix .* Iy, G, 'same');
M22 = conv2(Iy .* Iy, G, 'same');

%For the 'same' case, conv2 returns the central part of the convolution. If there are an odd number of rows or columns, the "center" leaves one more at the beginning than the end. This example first computes the convolution of A using the default ( 'full' ) shape, then computes the convolution using the 'same' shape.


% Note: We do not need to compute M21 sparately, since M is symmetrical and
% therefore M21 == M12

end


