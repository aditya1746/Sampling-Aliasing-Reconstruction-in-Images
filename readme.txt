---------------------------- ECN-316 Digital Image Processing -------------------------------

-------------- Project Presentation, Group 4 --------------------------------------

-------------- Sampling, Aliasing and Reconstruction ----------------------------------------

---------------------------- Group Members -------------------------------

1. Aditya Raj Singh Gour 19116005
2. Sparsh Agrawal 19116076
3. Suyash Jain 19116078

------------------- General instructions -----------------------------

1. Keep all files, images in the same folder
2. Dont forget to change the colored image into grayscale before processing


---------------------------- Code Files ----------------------------

1. chess_aliasing_example.py
	
	----for simulating the aliasing in chess pattern when the resolution of camera sensor is very low
	----input image 'chess_512_512.png'
	----simply run the python file 
	----you could change the resoltions and size in the resize function
	
2. sin_aliased.m

	----for showiing aliasing in 1-D signal when sampling rate is less than the Nyquist Rate
	----simply run the file in MatLab
	
3. sin_not_aliased.m

	----for showiing that there is no aliasing in 1-D signal when sampling rate is more than the Nyquist Rate
	----simply run the file in MatLab
	
4. aliasing_examples.more

	----for showing aliasing in the 'original_bricks.jpg' and 'A.png'
	----simply run the file in MatLab
	
5. aliasing_examples2.more

	----for showing aliasing in the zoneplates and 'house.png'
	----simply run the file in MatLab
	
6. imzoneplate.m

	----for generating zoneplates, it is a user defined function, which is called from other matlab files.
	
7. glp.m

	----User defined function for forming the Gaussian Low Pass Filter
	
7. blp.m

	----User defined function for forming the ButterWorth Low Pass Filter
	
-----------------------------------------------------------------------------

	----You could test with other sample images as well just by changing the input images in the codes
	----aliasing_examples.m and aliasing_examples2.m does the same thing, they could be assumed to be same.
	----A pdf is also attached for presnting the project
	----For any query, contact - aditya_r@ec.iitr.ac.in, sparsh_a@ec.iitr.ac.in, suyash_j@ec.iitr.ac.in

	