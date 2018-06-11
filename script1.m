clc;
close all;
clear;
fid = fopen('I_avg_00010_0001.mvd');
fseek(fid,128,'bof');
A = fread(fid,[1280 128],'ushort');

%h = imtool(A',[2768 5649]);
h = imtool(A',[4153 5649]);
saveas(h,'myGray.png');
pause(3);


B = imread('myGray.png');
B = rgb2gray(B);
%B = imcrop(B);
%B(B<170) = 0;
%B(B>110) = 255;
B1 = edge(B,'canny');
imshow(B);
%B1 = A < 5000;
%imagesc(B1)
[centers,radii] = imfindcircles(B1,[10 20],'Sensitivity',0.93)

%stats = regionprops('table', B, 'Centroid', 'Eccentricity', 'EquivDiameter');
%stats( stats.Eccentricity > .5 , : ) = []
%stats( stats.EquivDiameter > 5 | stats.EquivDiameter < 20 , : ) = []
%imshow(B1)
viscircles(centers,radii);
