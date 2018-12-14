% Image Segmentation 
function [bin_image]= img_segmentation(input_image,isNoisy)
% Convert to grayscale
pothole_image = rgb2gray(input_image);

% 5 by 5 median filter to reduce noise
if(isNoisy)
    pothole_image = medfilt2(pothole_image, [5 5]);
end

% triangle algorithm
[counts, binLocations] = imhist(pothole_image);
hist = medfilt1(counts,5);
[threshold] = triangle_th(hist, 256);
disp(threshold);
bin_image = imbinarize(pothole_image,threshold);

figure;
imshow(pothole_image);
figure;
imshow(bin_image);