# SDJRIP-Macro
A ImageJ macro to create artistic pictures from raw tiff images

The SD Jovian Raw Image Processor (SDJRIP) ImageJ macro was created in response to the NASA Space International Apps Challenge 2022 competition. The “Visualizing Jovian System Like Never Before” problem tasked competitors with creating an open-source image editing program that uses innovative methods to process raw JunoCam raw images for scientific, artistic, or other fun purposes. The authors chose to tackle the problem by using the freeware program ImageJ and specifically the “batteries included” version of ImageJ called FIJI (Its just ImageJ).
A macro was created that runs in FIJI and allows the user to process raw JunoCam images. The Macro performs the following operations on the JunoCam images: 1) converts image to 16-bit greyscale, 2) duplicates image, 3) duplicate image is blurred using Gaussian filter, 4) the blurred image is subtracted from original, 5) a fire lookup table (LUT) is applied, 6) the brightness and contrast is adjusted, and 7) the view is magnified 2xfold to see detail. The final image is an artistic rendering of the original and enhances details of the swirling clouds of Jupiter, due to loss pass effect of Gaussian filter, with loss of some information and blurring of the image. The loss of information and slight blurring is okay given the purpose of the macro is to create “pretty artistic” pictures. The macro can be used on the raw framelets, RGB image, or individual RGB channels. 

Code in the SDJRIP macro is listed below:

 //SD_Jovian_raw_image_processor macro 
  //this macro can be used to process raw grayscale images from Junocam to enhance details and pseudocolor
  //please see instruction manual 1.0 for installation and use 
  //this macro has been tested using Imagej version 1.53q and Java 1.8.0_322 (64-bit) on windows machine
  
  //open(path); // open the file
 path = File.openDialog("Select an Image to Make Super Cool");
  dir = File.getParent(path);
  name = File.getName(path);
  print("Path:", path);
  print("Name:", name);
  print("Directory:", dir);
  list = getFileList(dir);
  print("Directory contains "+list.length+" files");
 open(path); 
 
//rename open image1
rename("image1");

//convert image to 16-bit greyscale 
run("16-bit");

//duplicates image1 and names duplicate image2_to_blur
run("Duplicate...", "title=[image2_to_blur]");

//performs gaussian blur filter on image2
run("Gaussian Blur...", "sigma=3");

//subtracts blur image2 from image1
imageCalculator("Subtract create", "image1","image2_to_blur");

//renames Result of Image1 to Result_of_Image1
rename("Result_of_Image1")

selectWindow("Result_of_Image1");

//adds Fire LUT to resultant image
run("Fire");

//opens brightness/contrast command 
run("Brightness/Contrast...");

//sets brightness min and max
setMinAndMax(0, 8);

close("B&C")

//close all windows but active image
close("\\Others")

//zooms in on image
run("In [+]");
