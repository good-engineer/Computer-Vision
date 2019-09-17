dirname1='../data/q3/scene1'; %data path
dirname2='../data/q3/scene2'; %data path

[globalImg1, directImg1] = separateGlobalDirect(dirname1);
[globalImg2, directImg2] = separateGlobalDirect(dirname2);

figure(1);
imshow(globalImg1);
title('global Image s1');
figure(2);
imshow(directImg1);
title('direct Image s1');
figure(3);
imshow(globalImg2);
title('global Image s2');
figure(4);
imshow(directImg2);
title('direct Image s2');