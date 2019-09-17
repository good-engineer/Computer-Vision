Iin= imread('./data/taj1r.png');
Iref=imread('./data/taj2r.png');
% H=? to make Iin in the frame of Iref?
H= [1 0 1; 0 1 2; 0 0 0]; % did choose manually 
[Iwarp, Imerge] = warpImage(Iin, Iref, H);

baseFileName = 'taj1r_warped.png'; 
fullFileName = fullfile('./result/', baseFileName);
imwrite(unit8(Iwarp), fullFileName);
baseFileName2 = 'taj_merged.png'; 
fullFileName2 = fullfile('./result/', baseFileName2);
imwrite(unit8(Imerge), fullFileName2);