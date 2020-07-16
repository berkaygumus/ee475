Berkay Gümüş 2015401183
EE475 HW5

>>Files
q1.m
q2a.m
q2b.m
q3.m
EP.m
q4.m

berkeley_horses.mat
and other image sources

>>Question1
The name of code file is q1.m. There is a part at the beginning of the code about input. You can change file name and n value for clustering. 
Average run time is about 2 minute if the first iteration image is similar to result image otherwise it may generates wrong results.
These cases(depends on the seed points chosen randomly) takes longer time or causes uneffective and many iterations, 
at these situations if you run again, you can take better and shorter results.

>>Question2
There are two code file for two images: q2a.m and q2b.m
q2a.m takes about 20 seconds and gives initial image, ground truth image, result image and 
the ratio of intersections to unions for the region1, region2, region3 and whole image(success rate).

q2b.m takes about 5 minutes and gives initial image, ground truth image(takes from berkeley_horses.mat file), result image and 
the ratio of intersections to unions for the background, horse1, horse 2 and whole image(success rate).

q2b_hist.m file is used to check histograms.

>>Question3
The code file is q3.m
It generates edge detection results for noiseless image, noisy images with variance 144 and 484 by using sobel, log and canny edge detection methods.
It calculates edge detection performances by using EP.m function file.

>>Question 4
The code file is q4.m
It generates hough transformation for canny edge detection result and 
hough lines(I checked the hough transformation and found peak values) by using the peak values at the transformation.