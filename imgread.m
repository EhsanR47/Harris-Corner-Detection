%Harris Corner Detection
%Read Image
function I = imgread(file)
I=im2double(imread(file)) ;

% sz = size(A) returns a row vector whose elements are the lengths of the corresponding dimensions of A. For example, if A is a 3-by-4 matrix, then size(A) returns the vector [3 4].
% 
% If A is a table or timetable, then size(A) returns a two-element row vector consisting of the number of rows and the number of table variables.

if(size(I,3) > 1)
  I = rgb2gray( I ) ;
end


%I2 = im2double( I ) converts the image I to double precision. I can be a grayscale intensity image, a truecolor image, or a binary image. im2double rescales the output from integer data types to the range [0, 1]. I2 = im2double( I ,'indexed') converts the indexed image I to double precision.
%The rgb2gray function converts RGB images to grayscale by eliminating the hue and saturation information while retaining the luminance. If you have Parallel Computing Toolbox™ installed, rgb2gray can perform this conversion on a GPU. newmap = rgb2gray( map ) returns a grayscale colormap equivalent to map .