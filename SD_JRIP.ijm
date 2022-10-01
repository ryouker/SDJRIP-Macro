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


