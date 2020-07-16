EE 475 HOMEWORK 2
BERKAY GÜMÜŞ 2015401183
>>>>>>>>>>>>>>>>>>>>>>>>>Functions
>>>equalization.m
Takes a gray image as input, equalizes and gives equalized image as output.
>>>equalization2.m
Takes a gray image as input ,disregard 0 and 255 values, equalizes and gives equalized image as output.
>>>matching.m
Takes two gray images (first one is the image which will be matched and second one is reference) as input,
gives the matched image as output. 
>>>chiDistance.m
Takes two gray images as input, calculates their Chi and KL distances and gives them as output.
>>>plotImg.m
Takes 4 images (A, B, C and D), their figure name and title name as input,
shows these images and their histograms. There is no output.  

>>>>>>>>>>>>>>>>>>>>>>>>>Scripts and Questions
>>>>>q22.m for Q2.A
Reads gray 'lumbercamp.jpg' file at the same folder, equalizes the image with my equalization, 
histeq and adapthisteq function, shows their result images and histograms.
>>>>>q23.m for Q2.B
Reads RGB'moon.jpg' file at the same folder, equalizes the image with my equalization, 
histeq and adapthisteq function, shows their result images and histograms.
If the moon.jpg is gray image, the 3. line must be changed with "I = imread('moon.jpg');"
>>>>>q31.m for Q3
image A >> 'subject1_photo2.jpg'
image B >> 'subject1_photo3.jpg'
image C >> 'subject1_photo1.jpg'
image D >> 'subject2_photo1.jpg'
Reads RGB 'subject1_photo1.jpg', 'subject1_photo2.jpg','subject1_photo1.jpg','subject2_photo1.jpg',
equalizes these images by using equalization2.m function(disregarding 0 and 255),
matches B,C and D images with respect to A image,
calculates chi and KL distances between reference A image and other matched B, C, D images.
>>>>>q41.m for Q4
Reads RGB 'kugu.jpg' and 'beach.jpg', 
equalizes RGB values,
equalizes intensity values,
equalizes saturation values and
shows these result images.


