C = rgb2gray(imread('subject1_photo1.jpg'));
A = rgb2gray(imread('subject1_photo2.jpg'));
B = rgb2gray(imread('subject1_photo3.jpg'));
D = rgb2gray(imread('subject2_photo1.jpg'));

%%% original 
plotImg(A,B,C,D,"original photos","img");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% equalization for each image

eqA = equalization2(A);
eqB = equalization2(B);
eqC = equalization2(C);
eqD = equalization2(D);

plotImg(eqA,eqB,eqC,eqD,"equalized original photos","equalized img");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% matching for each image

ref = A;
matchedB = matching(B,A);
matchedC = matching(C,A);
matchedD = matching(D,A);

plotImg(ref,matchedB,matchedC,matchedD,"matched original photos wrt image A","matched img");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%histogram distances

[befABchi,befABkl] = chiDistance(A,B);
[befACchi,befACkl] = chiDistance(A,C);
[befADchi,befADkl] = chiDistance(A,D);
[befBCchi,befBCkl] = chiDistance(B,C);
[befBDchi,befBDkl] = chiDistance(B,D);
[befCDchi,befCDkl] = chiDistance(C,D);

[aftABchi,aftABkl] = chiDistance(A,matchedB);
[aftACchi,aftACkl] = chiDistance(A,matchedC);
[aftADchi,aftADkl] = chiDistance(A,matchedD);
[aftBCchi,aftBCkl] = chiDistance(matchedB,matchedC);
[aftBDchi,aftBDkl] = chiDistance(matchedB,matchedD);
[aftCDchi,aftCDkl] = chiDistance(matchedC,matchedD);












