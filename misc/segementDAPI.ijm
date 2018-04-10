// Macro to segment and analyse cell nuclei
// Adam Tyson | 2018-04-04 | adam.tyson@icr.ac.uk

open("V:/Adam/Teaching/ImageAnalysisCourse/Course_materials/exercises/DAPI3.tif");

run("Duplicate...", " ");

// Remove background
run("Gaussian Blur...", "sigma=200");
imageCalculator("Subtract create", "DAPI3.tif","DAPI3-1.tif");

// Threshold
selectWindow("Result of DAPI3.tif");
setAutoThreshold("Default dark");
//run("Threshold...");
//setThreshold(5, 255);
setOption("BlackBackground", true);
run("Convert to Mask");

// Clean up
run("Erode");
run("Erode");
run("Erode");
run("Erode");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Fill Holes");
run("Watershed");

// Analyse
run("Set Measurements...", "area centroid perimeter redirect=None decimal=3");
run("Analyze Particles...", "display exclude clear");
