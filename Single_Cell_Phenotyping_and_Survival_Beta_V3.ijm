var Instructions = "<html>"
+"<h1>Single Cell Phenotyping and Survival Analysis.</h1><br>"
+"By Derek H. Oakley MD, PhD. Massachusetts General Hospital & Harvard Medical School.<br>"
+"Mail: doakley at partners dot org.<br><br>"
+"Please Cite: Oakley DH, Klickstein N, Commins C, Chung M, Dujardin S, Bennett RE, Hyman BT, Frosch MP. Continuous Monitoring of Tau-Induced Neurotoxicity in Patient-Derived iPSC-Neurons. J Neurosci. 2021 May 12;41(19):4335-4348. doi: 10.1523/JNEUROSCI.2590-20.2021. Epub 2021 Apr 23. PMID: 33893219; PMCID: PMC8143197. <br>"
+"Written on Fiji ImageJ 1.52e. <br>"
+"<br>"
+"<u><b>Overview:</u></b><br>"
+"The Single Cell Phenotyping and Survival Analysis toolset facilitates stereologic counting and tracking of individual cells in time-lapse images and scoring of user-defined primary and secondary morphologic phenotypes as well as cell death. Survival analysis allows censoring of individual cells that are lost or become obscured. Designed to work with imaging experiments performed in standard multiwell plates, up to 96 wells. Contains built-in Z-stack batch processor pre-set for image naming from Biotek Cytation5 instruments, but user-adjustable to other file types. <br>"
+"<br>"
+"Outputs include: Survival probability curves optionally stratified by primary or secondary features, cumulative event plots for primary and secondary features, and montaged Z-stacks of individually tracked cells, sorted by user-defined criteria. Annotated and flattened images of each counted Z-stack are also produced. Statistical comparisons are performed for survival or cumulative event analyses of two groups using the log-rank test and p values are reported in 0.05, 0.01, 0.001, and 0.0001 increments based on the Chi-squared distribution. Multiple pairwise-comparisons can subsequently be displayed on the same plot. Additional features include combination of single cell data from multiple replicates with an option to change well designations and resampling of data to change the first timepoint, allowing improved group-assignment for survival analysis. <br>"
+"<br>"
+"<u><b>Notes:</b></u><br>"
+"- Requires 'Action Bar' plugin for toolbar functionality and contains Cycloid Grid Macro for stereology grid application (http://imagejdocu.tudor.lu/doku.php?id=plugin:utilities:action_bar:start & https://imagej.nih.gov/ij/macros/Cycloid_grid.txt)<br>"
+"- Must be installed in the ImageJ/macros/toolsets folder.<br>"
+"- Designed for image names starting with standard well name and ending with a three digit frame number (i.e.B9_..._001.tif).<br>"
+"- Keyboard shortcuts [x] are used to call individual macros. <br>"
+"- Cell tracking is done with a custom ImageJ tool. Phenotypes are set with Cell State [a] macro.<br>"
+"- Cell State macro allows cell death and location tracking, censoring of lost cells, and assignment of up to two features per timepoint.<br>"
+"- Results are saved in subfolders created in the user-designated output folder.<br>"
+"- Automatic output during cell tracking includes .csv files of individual cell location and phenotype for every timepoint counted, overlays of counted cells and cycloid grid if used, and text files summarizing data from each individual cell counted. <br>"
+"- Single cell text data files are strings in the format described below and can be read into R for confirmatory survival and event analysis using the R survminer package or other software.<br>"
+"- Survival and event analysis is performed in a guided fashion from the toolbar (see below).<br>"
+"- Additional outputs generated from the data analysis portion of the toolbar include Kaplan-Meier survival probability curves comparing user-defined groups, text files describing group survival at each timepoint, aggregated group statistics, and extracted/montaged single cells.<br>"
+"- Kaplan-Meier survival probability and log-rank calculations are performed as described in Bewick et. al Critical care 2004, 8:389-394.<br>"
+"<br>"
+"<u><b>Installation:</b></u><br>"
+"- Place macro file in the '/macros/toolsets' directory of FIJI or ImageJ and restart ImageJ.<br>"
+"- Select '>>' on the right side of the ImageJ toolbar and then click on the macro name to install.<br>"
+"- The macro and toolbar should then auto-run. If not, press [t] to call toolbar.<br>"
+"- A cross-shaped cell tracking tool (Survival Tool) will install in the ImageJ toolbar and is used in conjunction with the 'Cell State [a]' macro to set and track cell states.<br>"
+"- Optional: Run the first part of the Setup macro to create a ring-shaped cursor for improved visibility of small objects during tracking. Creates a file called 'crosshair-cursor.gif' in the '/images' directory of FIJI or ImageJ. Requires ImageJ restart to take effect. Deleting the 'crosshair-cursor.gif' file will revert ImageJ back to the default cursor.<br>"
+"<br>"
+"<u><b>Standard order of operations:</b></u><br>"
+"<u>1. Prepare Images:</u><br>"
+"-Run Setup macro<br>"
+"-Align Z-stacks (optional)<br>"
+"-Merge multichannel images (optional)<br>"
+"<u>2. Data Aqcuisition:</u><br>"
+"-Open Z-Stack [o]<br>"
+"-Apply Cycloid Grid for unbiased counting [c] (optional)<br>"
+"-Set Cell State of first cell to count [a] <br>"
+"-Click through Z-stack, following a single cell with the Survival Tool (+) and update cell state with [a] as necessary.<br>"
+"<u>3. Data Analysis:</u><br>"
+"-If desired, resample data to change first timepoint, combine replicates, rename wells, or extract single cell images.<br>" 
+"-Calculate results and plot survival curves and/or cumulative events [g].<br>"
+"<br>"
+"<u><b>Toolbar Functions:</b></u><br>"
+"-Toolbar menu can be called with [t] keyboard shortcut.<br>"
+"<br>"
+"<u>Instructions: </u>  Calls this HTML window.  <br>"
+"<br>"
+"<u><b>1. Prepare Images: </b></u> <br>"
+"<u>Setup: </u> Must be run prior to tracking cells. Prompts user to name the project (for folder and file naming purposes), designate if starting with Z-stacks or unstacked frames, and designate if  using Biotek Cytation5 or other image naming format. Input and output directories are also selected. <br>"
+"<br>"
+"<u>Change Working Dir: </u> Allows user to alter the working directories used to find files during data acquisition and analysis. Can be useful if moving files or troubleshooting errors. <br>"
+"<br>"
+"<u>Z-Stack Align: </u> Allows user to stack single frames into Z-stacks and optionally perform SIFT alignment of images. Also permits left- or right truncation of Z-stack time series (to begin or end the experiment not at the first or last frame of acquired data)  <br>"
+"<br>"
+"<u>Merge Channels: </u> Merges multi-wavelength image stacks based on the detected wavelengths present. <br>"
+"<br>"
+"<u><b>2. Data Acquisition: </b></u> <br>"
+"<u>Open Z-Stack [o]:</u> Opens next Z-stack in list. Requires user to select a well. Image counter in menu displays the overall file number of the image in the folder and can be re-set to zero to move backwards (i.e. from row D to row A or column 12 to column 1) <br>"
+"<br>"
+"<u>Manual Set Well [m]: </u> Allows user to manually set well metadata for an image. Useful if Z-stack opener has an error or using images with non-standard names. <br>"
+"<br>"
+"<u>Cycloid Grid: </u> Applies the cycloid grid macro for stereology. Optional. Default settings can be overridden to use full macro (https://imagej.nih.gov/ij/macros/Cycloid_grid.txt)<br>"
+"<br>"
+"<u>Symbol Key [k]: </u> Generates a key for the symbols used on flattened images to track the primary feature in counted cells. Reports cell classes as 'initial state'+'endstate'+'endlife'. In positions 1 & 2: A=Primary Feature, O=No Primary Feature, In position 3: A=Alive, D=Dead (at last timepoint counted). Different symbols reflect different cell classes/censoring as indicated in the key. <br>"
+"<br>"
+"<u>Cell State [a]: </u> Allows the user to iteratively change the cell state with respect to: Life, Primary Feature, Secondary Feature, and Censoring. Also allows deletion of cells with errors and movement on to the next image for tracking. There is also an option to allow use on non-Z-stacks for counting of single timepoints. <br>"
+"<br>"
+"<u><b>3. Data Analysis: </b></u> <br>"
+"<u>Resample First Timepoint: </u> Allows left truncation of experiments and re-assigns cell fates at the newly designated t0. Can be helpful when using a primary or secondary feature occurring before a certain timepoint to define groups for survival analysis because cells must survive until the development of the feature, which biases the beginning of survival curves. <br>"
+"<br>"
+"<u>Combine Replicates or Rename Wells: </u> Allows combination of single cell text files from multiple replicates or wells by renaming the well names and files and moving into a common folder for later analysis. <br>"
+"<br>"
+"<u>Extract and Montage Cells:</u> Uses Results/Location .CSV files and Z-stacks to extract centered time-lapse Z-stacks of each tracked cell. Individual tracked cell images are placed into a folder from which they are then called for montage creation. Montages of user-defined size can be sorted by Cell Survival, Primary Feature, Secondary Feature, or left unsorted. There are two ways to montage cells from specific wells. 1. Place corresponding locations files in a separate folder, then change the .csv folder location with the Change Working Dir button and run the macro. 2. Alternatively, well-specific single cell images can be placed in a distinct folder prior to montage generation. It is also possible to extract tracked xyz positions from images with file names that do not match those on which tracking was initially performed (i.e. single wavelengths or brightfield images). To do this, replace the 'ImageName' columns in the .CSV location files with the desired file names using find/replace. Concatenating .CSV files prior to name replacement will speed the process (in windows cmd.exe from Locations folder: copy *.csv AllWells.csv), then remove extra column headings, move new file into empty directory and run extraction macro). <br>"
+"<br>"
+"<u>Survival and Event Analysis: </u> Uses single cell summary data text files to create Kaplan-Meier survival probability curves or Cumulative Event graphs comparing one or multiple groups. Allows comparison of cell death in the following categories: Within wells (subset by Primary or Secondary Feature), Between wells (with option to subset by Primary or Secondary Feature), For all cells in the single cell data folder (subset by Primary or Secondary Feature), or Cumulative Event Analysis comparing the occurrence of the Primary or Secondary Feature between two groups of wells.  Statistical calculations are performed as noted above for comparisons of two groups. All plots have customizable legends and axis titles. Plots with two curves have user specified line colors. Plots with more than two curves have the option of several color palettes. <br>"
+"<br>"
+"Note: Toolbar functionality is dependent on maintaining both macro file name and file location in '/macros/toolsets' <br>"
+"<br>"
+"<u><b>List of data folders created in output directory:</b></u><br>"
+"<u>Useful folders:</u><br>"
+"_Aligned_Z_Stacks\\: Contains aligned and stacked images from single frames. Will contain unaligned Z-stacks if SIFT alignment is not used. Contains channels as separate images.<br>"
+"_Merged_Z_Stacks\\: Contains merged and aligned Z-stacks. This is the folder that is used to open color Z-stacks for counting.<br>"
+"_Raw_Data_Single_Cells\\: Contains individual cell .txt files. These files are saved after every cell and contain summary data for each tracked cell. These are the data files used by the graphing macro and are also used for importing data into R (see below).<br>"
+"_CSV_Location_Files\\: Contains .CSV files with location and cell phenotype information from every cell tracked at every timepoint. Separate file per image. CSV files also contain data from deleted cells - indicated by the delete column.<br>"
+"_Aggregate_Group_Survival_Plots\\: Contains plot images created by grapher. Autosaved when plots are produced.<br>"
+"_Probability_Group_Survival\\: Contains the survival probabilities and cumulative event probabilities. <br>"
+"_Aggregate_Group_Lifespan_Statistics\\: Contains statistics about each group graphed in the graphing macro.<br>"
+"<br>"
+"<u>Less useful, but needed for data analysis:</u><br>"
+"_Raw_Group_Survival\\: Contains raw survival and cumulative event data.<br>"
+"_Aggregate_Group_Lifespan\\: Contains raw lifespan data from graphing macro.<br>"
+"_Aggregate_Group_Histogram\\: Used in survival and cumulative event analysis calculations.<br>"
+"_Aggregate_Group_Censor_Lifespan\\: Contains the lifespans of censored objects, used in accounting for censoring in data analysis and graphing.<br>"
+"_Aggregate_Group_Censor_Histogram\\: Used in survival and cumulative event analysis calculations.<br>"
+"<br>"
+"<u><b>Lookup for string identities in single cell .txt data:<b></u><br>"
+"[x] designates the array element number needed to call the specific string feature after splitting string by ';' (arrays in ImageJ begin with 0).<br>"
+"Notes: Integer values below default to 9999 if unfilled by data. '9999' is subsequently used to indicate the absence of an event.<br>"
+"This program was initially written to track protein aggregate formation in neurons as a primary feature, so variables referring to primary feature often refer to an 'aggregate'.<br>"
+"<br>"
+"String identities in single cell .txt data (****=most useful fields for data analysis in R or other program):<br>"
+"[0]CellClass - A string describing the state of the cell with respect to the primary feature. Reports cell class as 'initial state'+'endstate'+'endlife'. In positions 1 & 2: A=Primary Feature, O=No Primary Feature, In position 3: A=Alive, D=Dead (at last timepoint counted)<br>"
+"[1]well+-+position+-+CellName+ (CellName2) - Unique cell identifier (per experiment, will be non-unique across replicates)<br>"
+"[2]lifespan - lifespan of cell max is = timepoints counted****<br>"
+"[3]xorig - the x position of the cell in the first counted frame<br>"
+"[4]yorig - the y position of the cell in the first counted frame<br>"
+"[5]aggregatelifespan; - lifespan of the primary feature****<br>"
+"[6]aggstartx - the x position of the cell when the primary feature occurs - an asumption is made that cells to not enter, leave, and then re-enter the primary feature state. True for below as well.<br>"
+"[7]aggstarty - the y position of the cell when the primary feature occurs<br>"
+"[8]aggstartz - the z position of the cell when the primary feature occurs - this is equivalent to timepoint.****<br>"
+"[9]feature2lifespan  - lifespan of the secondary feature****<br>"
+"[10]f2startx - the x position of the cell when the secondary feature occurs<br>"
+"[11]f2starty - the y position of the cell when the secondary feature occurs<br>"
+"[12]f2startz - the z position of the cell when the secondary feature occurs - this is equivalent to timepoint.****<br>"
+"[13]well - Well that the cell is located in (i.e. A1, C5)****<br>"
+"[14]name -Image name<br>"
+"[15]project - User specified project name<br>"
+"[16]initialstate - First element in cell class above. The primary feature state of the cell at time 0: A=Primary Feature, O=No Primary Feature<br>"
+"[17]endstate - Second element in cell class above. The primary feature state of the cell at the endpoint: A=Primary Feature, O=No Primary Feature<br>"
+"[18]endlife - the Alive/Dead state of the cell at the endpoint: A=Alive D=Dead<br>"
+"[19]timepoints - number of timepoints (Z-planes) in the experiment - used for calculations of survival and censoring****<br>"
+"[20]censor - whether or not the cell is 'censored' vs 'uncensored'****<br>"
+"<br>"
+"The following lines of code can be used to <u><b>import a folder of single cell .txt files into R</b></u> from the folder 'datapath' for analysis with Survminer or other package: <br>"
+"<u>Replace single quotes with double quotes below prior to running.</u> <br>"
+"<br>"
+"setwd(datapath) <br>"
+"filelist &lt;- list.files(path = datapath, pattern = '*.txt')<br>"
+"datalist &lt;- lapply(filelist, FUN=read_delim, ';', escape_double = FALSE, col_names = FALSE, trim_ws = TRUE) <br>"
+"data.df = do.call('rbind', datalist) <br>"
+"colnames(data.df) &lt;- c('CellClass','well-position-CellName','lifespan','xorig','yorig','aggregatelifespan','aggstartx','aggstarty','aggstartz','feature2lifespan','f2startx','f2starty','f2startz','well','name','project','initialstate','endstate','endlife','timepoints','censor')<br>"
+"<br>"
+"Note: final timepoints must be censored prior to analysis in R and groups must be defined based on Well or Features. The 'mutate' command is useful for both.<br>"
+"<br>"
+"<u><b>Example code for survival analysis in R(Studio) after data import:</u></b><br>"
+"# see this website for tutorial: https://www.datacamp.com/community/tutorials/survival-analysis-R#third<br>"
+"<br>"
+"library(readr)<br>"
+"library(survival)<br>"
+"library(survminer)<br>"
+"library(dplyr)<br>"
+"library(ggplot2)<br>"
+"<br>"
+"#Set censor values to binary, and binaraze the event start time to stratify. '9999' is used in ImageJ macro to indicate absence of event.<br>"
+"dataP.df &lt;- dataP.df %>% mutate(censor_group = ifelse(censor=='censored', 0, 1))<br>"
+"<br>"
+"#Create cutoff for group assignment (in timepoints). Cutoff is 24 in this example.<br>"
+"cuttoff &lt;- 24<br>"
+"<br>"
+"#Assign cells with event before cutoff to the 'Early' group, and cells with events after or no events to the 'Others' Group (Aggregates in this example).<br>"
+"dataP.df &lt;- dataP.df %>% mutate(EarlyAggregate_group = ifelse((aggstartz <=cuttoff) & (aggstartz !=9999), 'Early', 'Others'))<br>"
+"<br>"
+"#Make the grouping variable 'EarlyAggregate_group' into a factor.<br>"
+"dataP.df$EarlyAggregate_group &lt;- factor(dataP.df$EarlyAggregate_group)<br>"
+"<br>"
+"#Censor cells that sruvive to final timepoint creating censor_group_Corr, the final censor variable. Max timepoint is 85 in this example.<br>"
+"maxtimepoint &lt;- 85<br>"
+"dataP.df &lt;- dataP.df %>% mutate(censor_group_Corr = ifelse(lifespan==maxtimepoint, 0, censor_group))<br>"
+"<br>"
+"#Select dataframe for graphing<br>"
+"data.df &lt;- dataP.df<br>"
+"<br>"
+"#Begin survival model, time = survival time, event = censoring<br>"
+"surv_object &lt;- Surv(time = data.df$lifespan, event = data.df$censor_group_Corr)<br>"
+"surv_object<br>"
+"fit1 &lt;- survfit(surv_object ~ EarlyAggregate_group, data = data.df)<br>"
+"summary(fit1)<br>"
+"<br>"
+"#PLOT RESULTS<br>"
+"ggsurvplot(fit1, data = data.df, pval = TRUE) + ggtitle('Survival Plot')<br>"
+"<br>"
+"#Plot of cumulative hazard<br>"
+"ggsurvplot(fit1, data = data.df, pval = TRUE, fun = 'cumhaz')<br>"
+"<br>"
+"#Full plot options<br>"
+"p &lt;- ggsurvplot(fit1, data = data.df,<br>"
+"           conf.int = TRUE,<br>"
+"           pval = TRUE,<br>"
+"           fun = 'pct',<br>"
+"           risk.table = TRUE,<br>"
+"           #facet.by = data.df$OtherVariables,<br>"
+"           size = 1,<br>"
+"           linetype = 'strata',<br>"
+"           palette = c('#E7B800',<br>"
+"                       '#2E9FDF'),<br>"
+"           legend = 'bottom',<br>"
+"           legend.title = '',<br>"
+"           legend.labs = c('Early','Others'))<br>"
+"<br>"
+"p &lt;- p + ggtitle('Survival Plot')<br>"
+"p<br>"
+"<br>"
+"# Cox proportional hazards<br>"
+"fit.coxph &lt;- coxph(surv_object ~ EarlyAggregate_group, <br>"
+"                   data = data.df)<br>"
+"ggforest(fit.coxph, data = data.df)<br>"
+"<br>"
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//name of macro file for call of toolbar by action bar plugin. This name MUST match the filename.
var macroname = "Single_Cell_Phenotyping_and_Survival_Beta_V1.ijm"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Global variables below. Some redundancy present.
//Variables for setup macro
var input = "Test"; //Unstacked images
var output = "Test"; //Subfolders created here
var output2 = "Test"; //same as dir2 below
var dir = "Test"; // Same at output
var dir2 = "Test"; // output for aligned images (pre-merged)
var stringpath = "Test";
var project = "Test";
var stringpath2 = "Test";
var stringpath3 = "Test";
var stringpath4 = "Test";
var stringpath5 = "Test";
var stringpath6 = "Test";
var stringpath7 = "Test";
var stringpath8 = "Test";
var plotpath = "Test";
var mergeoutput = "Test";
var CSVpath = "Test";
var ImageFormat = "Cytation5";

//Variables for cell state tracker default values
var life = "1.0";
var aggregate = "0.0"; //feature 1 or primary feature
var endimage = "No";
var feature2 = "0.0";
var delete = "No";
var ZstackOnly = true;
var aggregatestate = "No";
var feature2state = "No";
var lifestate = "Alive";
Afeature2 = newArray(1, 0);

//Extract and Montage Variables. Establish global variables for calling image saving macro CellName is overwritten below by Z stack tool, which takes priority
var CellName ="Empty";
var outExtract = "Undefined";
var dirZstack = "Undefined";
var outMontage =  "Undefined";
var PriorName="None";
var Agz = 0;
var lifespan = 0;
var censor = "Undefined";
var Agcount = 0;
var Agprior = 0;
var CellClass = "";
var CellClassPrior = "";
var secondary = 0;
var Secondarycount = 0;
var Feature2prior = 0;
var choice = "";

//Variables for z stack tool and tracker
var ImageType = "Single Frames";
var slice = 1;
var rowNumber = (slice-1);
var value = 1;
var life = "9999";
var aggregate = "9999" ;
var max = 9999;
var results = 9999;
var CellName = 1;
//var endimage = 9999; //(Legacy variable)
var grid = "9999";
var ImageName = "9999";
var startpositions = 0;
var timepoints = 9999;
var list = "Test";
var startsuffix="TEST";
var row ="Test";
var column = "Test";
var well = "Test";
var position = "Test";
var roistart = 9999;
var SIFT = "Yes";
var BLEACH = "No";
var startprefix = "";
var d = 0;
var zp = 0;

//Merge Channels variables
Awavelengths = newArray();
Ausedwavelengths = newArray();
var channelpos = 4; // channel designation in Cytation5 image
var exposurepos = 2; //Exposure position - there can be multiple exposures per channel
var channel ="Test";
var exposure = "Test";
var file3 ="Test";
Afile = newArray();
var filereset = "Test";
var channel = "Test";

//Example image names E4_03_4_2_RFP_001, C3_03_1_1_RFP_001 D3_03_1_16_RFP_001 D3_03_2_16_CY5_001 (well, ignore, exposuremumber, position, wavelength, time)   
//Auto-detect image position, can change for other file structures
var separator = "_" //separator in Cytation5 files
var separatorpos = 3 //	 To define position: Apos = split(namez, separator); position = Apos[separatorpos];

//Output variables for output strings
var resultrow = 0
var CellClass = "xxx"
var lifespan = 0
var xorig = 9999
var yorig = 9999
var aggregatelifespan = 0
var feature2lifespan = 0
var aggstartx=9999
var aggstarty=9999
var aggstartz=9999
var f2startx=9999
var f2starty=9999
var f2startz=9999
var name=9999
var initialstate="9999"
var endstate="9999"
var endlife="9999"
var censor="uncensored"

//ROI shapes global variables
var pointcolor = "Test";
var pointtype = "Test";
var markersize = "Test";
var nROIs = 1;

//variable for Cycloid grid
var x0, y0, tmax, newStart = newArray(2)

//Variables and arrays for grapher/analyzer plugin
var legacyhistogram = "Legacy"// Use image histogram to detect cell death events from lists of lifespans and total number of timepoints. "Legacy" is default. 
//Will process with histogram method unless "deathcounts" is selected (deathcounts method currently not working with cumulative events).
//var legacyhistogram = "deathcounts" //
Arawsurvival = newArray( );
Asurvivalprob = newArray ( );
AGroups = newArray( );
ALifespan = newArray( );
ACensorLifespan = newArray( );
ALifeStats = newArray( );  
AAggregate = newArray( );
AHistogram = newArray( ); 
ASurvival = newArray( );
//Line thickness for plots - Plot.setLineWidth(3);
var survline = 3;
var censorline = 3;
var plotfont = 24;
//Set up colors for graphs
//Palettes list
Palettes = newArray("IJColors","BrewerPaired","BrewerDark2","RSafe","OkabeIto");
//ImageJColors 
IJColors = newArray("black", "blue", "cyan", "darkGray", "gray", "green", "lightGray", "magenta", "orange", "pink", "red");
//Brewer colors from R
BrewerPaired = newArray("#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928");
//BrewerDark2 from R
BrewerDark2 = newArray("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666");
//Cartocolors "Safe" from R
RSafe = newArray("#7F3C8D", "#11A579", "#3969AC", "#F2B701", "#E73F74", "#80BA5A", "#E68310", "#008695", "#CF1C90", "#f97b72", "#4b4b8f", "#A5AA99");
//palette_OkabeIto from R
OkabeIto = newArray("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999");
//Select default color scheme to IJColors
colorsChoice = newArray( );
//Asigning as ImageJColors above. 
colorsChoice = newArray("black", "blue", "cyan", "darkGray", "gray", "green", "lightGray", "magenta", "orange", "pink", "red");
//Assign default color set here.
colorsA = Array.copy(colorsChoice);
//Default colors for plots of two groups
var G1Color =  "#2E9FDF";
var G2Color =  "#E7B800";
//Cell Classes (Legacy, unused in this version)
Aanyaggregate = newArray("AAA","AAD","OAA","OAD", "AOA", "AOD","TransA", "TransD");
Anoaggregate = newArray("OOA","OOD");
AtOaggregate = newArray("AAA","AAD","AOA","AOD");
AtOnoaggregate = newArray("OAA","OAD","TransA","TransD","OOA","OOD");
var n2 = 0
var n = 0
var string = "Test";
var outputstring = "";
var outputstring2 = "";
var groupid = "";
var combine = "Yes";
Acombine = newArray("Yes", "No");

var plotgroup = ""; //Naming variable for plot auto-saved images
Aplotgroup = newArray(); //Holds names of current two graphign groups
var groupgraph = 0; //used for graphing groups of 2
var CompareTo = ""; //String variable used to define > or <= or other comparisons
//Can change below numbers to read strings with different organization
var GroupStringLocation = 0
var LifespanStringLocation = 2
var AggregateStringLocation = 5
var Feature2LifespanStringLocation = 9
var TimepointStringLocation = 19
var CensorStringLocation = 20

//Added Variables in 2020 macro
var AggstartZLocation = 8
var Feature2LifespanLocation = 9
var Feature2StartZLocation = 12
var WellLocation = 13
var TimepointsStringLocation = 19
var comparison = "";

//Graphing added variables
Feature = 0; //Numeric variable for comparison in grapher. 

//auto legend for graph
var legend = ""
var rot = 0 //Rotate colors in group plots
var customlegend = "No"
Acustomlegend = newArray("Yes", "No");

//Default graph labels for Survival and Cumulative Events plots
var Plotlabel = "Probability of Survival";
var SPlotlabel = "Probability of Survival";
var CumPlotlabel = "Cumulative Events";
var Xlabel = "Timepoints";
var Ylabel = "Probability of Survival";
var SYlabel = "Probability of Survival";
var CumYlabel = "Cumulative Event Frequency";
//2021
var RiskPlotlabel = "Risk of Death";
var RiskYlabel = "Risk of Death";

//survival probability calculation variables
var priorP = 0;
var alive = 0;
var current = 0;
var future = 0;
var loss = 0;
var censor = 0;                  
var currentP = 0; 
var priorP = 0;

//Log rank function output variables
var significance = "test";
var plotcounter = 0;
Alegend = newArray();
var prestring2 = "";
var file2 = "";
var index = 0;

//2021 Plot updates
var plottype = "Survival"; // vs "Risk of Death"
var plotprofile = "Linear"; // vs "Step"
 
//////////////////////////////////////////////////////////////////////START OF MACROS/////////////////////////////////////////////////////////////////////
macro "Instructions" {
showMessage("Overview & Instructions", Instructions);
}

macro "Setup" {
run("Close All");
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
project = ""+year+"-"+month+1+"-"+dayOfMonth;
Dialog.create("SETUP");
Dialog.addRadioButtonGroup("Create Ring Cursor? (Optional on first run, requires ImageJ restart):", newArray("Yes", "No"), 1, 2, "No");
//2Dialog.addMessage("-----SET PROJECT NAME AND CREATE FOLDERS FOR IMAGES AND DATA-----");
Dialog.addString("Enter project name to create output folders.", project, 15);
Dialog.addRadioButtonGroup("Start with single frames, unmerged Z-stacks, or ready to use images:", newArray("Single Frames", "Z-Stack", "Merged images or otherwise ready to use"), 3, 1, ImageType);
Dialog.addRadioButtonGroup("Image name format:", newArray("Cytation5", "Other"), 2, 1, "Cytation5");
Dialog.addString("File name separator if changing image format", separator);
Dialog.show(); 
project = Dialog.getString();
//Need to keep string over 1 due to downstream error in logrank function
if (lengthOf(project) < 2){
	project = project+"x";
}

RingCursor = Dialog.getRadioButton();
if (RingCursor == "Yes"){
newImage("crosshair-cursor", "8-bit white", 32, 32, 1);
setLineWidth(1);
setColor(128);
drawOval(0, 0, 31, 31);
run("Input/Output...", "gif=255");
selectWindow("crosshair-cursor");
saveAs("Gif", "images/crosshair-cursor.gif");
exit("Ring cursor created as 'images/crosshair-cursor.gif'. Restart ImageJ to apply changes.");
}

ImageType = Dialog.getRadioButton();
//Z-stacks open from dir2 so if ImageType is already a z-stack, then dir2 must equal input. 
ImageFormat = Dialog.getRadioButton();
separator = Dialog.getString();

//Define directories
input = getDirectory("Choose an input directory");
output = getDirectory("Choose an output directory for general use");

dir=output;
output2 = output+project+"_Aligned_Z_Stacks\\";
stringpath = output+project+"_Raw_Data_Single_Cells\\";
stringpath2 = output+project+"_Aggregate_Group_Lifespan\\";
stringpath3 = output+project+"_Aggregate_Group_Lifespan_Statistics\\";
stringpath4 = output+project+"_Aggregate_Group_Histogram\\";
stringpath5 = output+project+"_Raw_Group_Survival\\";
stringpath6 = output+project+"_Probability_Group_Survival\\";
stringpath7 = output+project+"_Aggregate_Group_Censor_Lifespan\\";
stringpath8 = output+project+"_Aggregate_Group_Censor_Histogram\\";
plotpath = output+project+"_Aggregate_Group_Survival_Plots\\";
mergeoutput = output+project+"_Merged_Z_Stacks\\";
CSVpath = output+project+"_CSV_Location_Files\\";

if (File.exists(output2)==0){
File.makeDirectory(output2);
}


if (File.exists(stringpath)==0){
File.makeDirectory(stringpath);
}

if (File.exists(stringpath2)==0){
File.makeDirectory(stringpath2);
}

if (File.exists(stringpath3)==0){
File.makeDirectory(stringpath3);
}

if (File.exists(stringpath4)==0){
File.makeDirectory(stringpath4);
}

if (File.exists(stringpath5)==0){
File.makeDirectory(stringpath5);
}

if (File.exists(stringpath6)==0){
File.makeDirectory(stringpath6);
}

if (File.exists(stringpath7)==0){
File.makeDirectory(stringpath7);
}

if (File.exists(stringpath8)==0){
File.makeDirectory(stringpath8);
}

if (File.exists(plotpath)==0){
File.makeDirectory(plotpath);
}

if (File.exists(mergeoutput)==0){
File.makeDirectory(mergeoutput);
}

if (File.exists(CSVpath)==0){
File.makeDirectory(CSVpath);
}

dir2=output2;

//Z-stacks open from dir2 so if ImageType is already a z-stack, then dir2 must equal input. 
if(ImageType == "Z-Stack"){
dir2=input;
print("Z-stack source set to: "+dir2);
print("Log file added to: "+output);
File.saveString("Pre-stacked Z-stacks opened from "+input, output+"Z-stack_Log.txt");
//run("Merge Channels"); //Remove fom this area to allow other image formats to be used. 
}

if(ImageType == "Merged images or otherwise ready to use"){
dir2=input;
print("Z-stack source set to: "+dir2);
print("Log file added to: "+output);
File.saveString("Ready to-use Z-stacks opened from "+input, output+"Z-stack_Log.txt");
}


if(ImageFormat=="Other"){
list1 = getFileList(input);
ExampleName = list1[0];
//This line for debugging// ExampleName = "D3_03_2_16_CY5_001";
separator = "_";
Anewname = split(ExampleName, separator);
NaArray = newArray("None");
AnewnameSlice = Array.slice(Anewname,1,(Anewname.length -1));
Aexposure = Array.concat(AnewnameSlice, NaArray);
Dialog.create("Change image name format");

Dialog.addMessage("Image name must start with standard well name (i.e. B9, C10)");
Dialog.addMessage("Image name must end with timepont (i.e. _001)");
Dialog.addMessage("First image in input folder: "+ExampleName);
Dialog.addMessage("Define name format below (check only one box per row):");
Dialog.addMessage("Well: "+Anewname[0]);
Dialog.addMessage("Channel:");
Dialog.addCheckboxGroup(1,4, AnewnameSlice, newArray(AnewnameSlice.length));
Dialog.addMessage("Stage Position:");
Dialog.addCheckboxGroup(1,4, AnewnameSlice, newArray(AnewnameSlice.length));
Dialog.addMessage("Exposure (optional):");
Dialog.addCheckboxGroup(1,5, Aexposure, newArray(Aexposure.length));
Dialog.addMessage("Timepoint: "+Anewname[Anewname.length-1]);
Dialog.show();

for (j = 0; j < AnewnameSlice.length; j++) {
x = Dialog.getCheckbox();
if(x==true){
channelpos = (j+1);
}
}

for (j = 0; j < AnewnameSlice.length; j++) {
x = Dialog.getCheckbox();
if(x==true){
separatorpos = (j+1);
}
}

var exposuredetect = false;
//Keep same length below so NA is not detected (actual array used is one element larger than Anewname...
for (j = 0; j < AnewnameSlice.length; j++) {
x = Dialog.getCheckbox();
if(x==true){
exposurepos = (j+1);
exposuredetect = true; //detects if a new exposure was added to 
}
}

if(exposuredetect == false){
exposurepos = "None";
}

print("Channel location (from 0): "+channelpos);
print("Stage position location (from 0): "+separatorpos);
print("Exposure location (from 0): "+exposurepos);

if(channelpos == separatorpos || channelpos == exposurepos || separatorpos == channelpos || separatorpos == exposurepos ){
exit("Error: Same element selected for more than one image property. Re-run setup");
}

}

if(ImageType == "Z-Stack"){
run("Merge Channels");
}
 /*
  * Defaults
var channelpos = 4
var exposurepos = 2
var separatorpos = 3 //should be stage position position....bad variable name
var separator = "_"

//Example image name E4_03_4_2_RFP_001, C3_03_1_1_RFP_001 D3_03_1_16_RFP_001 D3_03_2_16_CY5_001 (well, ignore, exposuremumber, position, wavelength, time)   
//Auto-detect image position, can change for other file structures
var separator = "_" //separator in Cytation5 files

*/


}

macro "Stack Handler" {
//Stacks and aligns single timepoint images - only used if startign with single frames.
if(ImageType == "Z-Stack"){
exit("Z-stack alignment only available when starting with single frames.");
}

//startposition counter must start at 0 for counter to work
startpositions=0;
//timepoints is calculated later with the number of start positions and list.length for i
timepoints=0;

//Start designator not including file extension, which is removed elsewhere-THIS CAN BE ALTERED FOR DIFFERENT FORMATS
startsuffix="_001";

//Get list of files in the input directory and set it as an array called "list"
list = getFileList(input);
FileNumber = list.length;

//display file list (not necessary, used for troubleshooting)
//Array.show(list);

//Count number of start positions and timepoints
for (i = 0; i < list.length; i++){
//remove file extenstion
prename = list[i];
dotIndex = indexOf(prename, "."); 
name = substring(prename, 0, dotIndex );
//Count start positions
start = endsWith(name, startsuffix);
		if (start==1) {	
			startpositions=(startpositions+1);
		}}
		

//Calculate number of timepoints from file number (list.length) divided by number of start positions		
timepoints=FileNumber/startpositions;

//Check for correct number of timepoints and start positions/stacks and select well for analysis
beep;
ASIFT = newArray("Yes", "No");
ABLEACH = newArray("Yes", "No");
Dialog.create("Select Timepoints to be Aligned");  
Dialog.addMessage("Detected "+timepoints+" timepoints and "+startpositions+" stacks.");
Dialog.addString("Override/Set Start Timepoint:", startsuffix);
Dialog.addNumber("Override/Set Final Timepoint:", timepoints);
Dialog.addRadioButtonGroup("Align with SIFT?", ASIFT, 1, 2, "Yes");
Dialog.addRadioButtonGroup("Photobleaching correction?", ABLEACH, 1, 2, "No");  
Dialog.addMessage("Begin Aligning All Stacks in folder?");  
Dialog.show(); 
startsuffix = Dialog.getString();
timepoints = Dialog.getNumber();
SIFT = Dialog.getRadioButton();
BLEACH = Dialog.getRadioButton();
//Count number of stacks in specified well
wellstartpositions = 0;
for (i = 0; i < list.length; i++){
//remove file extenstion
prename = list[i];
dotIndex = indexOf(prename, "."); 
name = substring(prename, 0, dotIndex );

//Count start positions in specified well - uncomment below to restore single image capability
start = endsWith(name, startsuffix);
//welltrue = startsWith(name, well);
		if (start==1) {	
			wellstartpositions=(wellstartpositions+1);
		}}
//Define start position array
astartpositions = Array.getSequence(wellstartpositions+1);
//Trim 0 value from start of array
astartpositions = Array.slice(astartpositions, 1, wellstartpositions+1);


//Check for correct well and expected number of stacks and timepoints
//Uncomment below to restore single image capability
Astart = newArray("Yes");
Dialog.create("Begin Alignment?");  
Dialog.addMessage("Analyzing "+timepoints+" timepoints times "+wellstartpositions+" image stacks.");
//Dialog.addChoice("Align TO which image stack? (1-"+wellstartpositions+")", astartpositions);
Dialog.show(); 
//position = Dialog.getChoice();
//position = parseInt(position);

//Close open files
run("Close All");

//For the specified well, open each image stack via virtual stack, align, correct photobleaching, then go to next stack. Photobleach correction causes errors if there is no observable photobleaching.
//Remove "//" to restore single well stacking. Single image stacking can be cumbersome.  
setBatchMode(true);
pcounter = 0;
for (i = 0; i < list.length; i++){
path = input+list[i];
prename = list[i];
dotIndex = indexOf(prename, "."); 
name = substring(prename, 0, dotIndex );
UnderIndex = lastIndexOf(name, "_");
filename = substring(name, 0, UnderIndex);
print("File: "+filename);
print("Name: "+name);
start = endsWith(name, startsuffix);
//welltrue = startsWith(name, well);
///Startposition of i+1 gets the image sequence opener to go the correct file - if this is not here, will just open the first 3 images of the entire folder every time!
startposition=i+1;
		if (start==1) {	

			run("Image Sequence...", "open=path number=timepoints file="+filename+" increment=1 scale=100 convert sort use");
			if (SIFT=="Yes"){
			run("Linear Stack Alignment with SIFT", "initial_gaussian_blur=1.60 steps_per_scale_octave=3 minimum_image_size=64 maximum_image_size=1024 feature_descriptor_size=4 feature_descriptor_orientation_bins=8 closest/next_closest_ratio=0.92 maximal_alignment_error=25 inlier_ratio=0.05 expected_transformation=Rigid interpolate");
			selectWindow("Aligned "+timepoints+" of "+timepoints);
			} 
			if (BLEACH=="Yes"){
			run("Bleach Correction", "correction=[Exponential Fit]");
			selectWindow("Aligned "+timepoints+" of "+timepoints);
			} 
			//rename(name+"_Aligned"); kept for debugging
			saveAs("Tiff", dir2+name+"_Aligned.tif");
			print(list[i]+" Complete");
			print("i="+i);
			print(path+"--PATH");
			print(FileNumber+"FileNumber");
			print(startposition+"StartPOS");
			print(input+list[i]+"input+list");
			print("NewSequence"); 
			//waitForUser("Proceed with manual counting. Click OK to exit macro"); //Can be re-enabled to slow down process if needed
			run("Close All");
			}}
setBatchMode(false);
}

macro "Manual Set Well [m]" {
//Sets image paramaters that are ignored in shortened Z stack handler above - used in naming results strings and excel rows. Optional use
Arows = newArray("A", "B", "C", "D", "E", "F", "G", "H");
Acolumns = newArray("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12");
Aposition = newArray("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24","25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36");
Dialog.create("Manually set well and position data for open image (if needed)");  
Dialog.addRadioButtonGroup("Row:", Arows, 1, 8, row);
Dialog.addRadioButtonGroup("Column:", Acolumns, 1, 12, column);
Dialog.addRadioButtonGroup("Stage Position:", Aposition, 6, 6, position);
Dialog.show(); 

row = Dialog.getRadioButton();
column = Dialog.getRadioButton();
position = Dialog.getRadioButton();
column=parseInt(column);
position=parseInt(position);
well = row+column;
}

macro "Cycloid Grid [c]" {
//Adds overlay for unbiased counting of cells intersecting lines sets default conditions

Agrid = newArray("Yes", "No", "Custom");
Dialog.create("Cycloid Arc");  
Dialog.addMessage("Creates Cycloid Arc to count non-aggregate cells");
Dialog.addRadioButtonGroup("Create Cycloid Arc?", Agrid, 1, 3, "Yes"); 
Dialog.show(); 
grid = Dialog.getRadioButton();
if (grid=="Yes") {
if (roiManager("count")>0){
roiManager("Deselect");
roiManager("Delete");
}
run("Cycloid_Grid");

//ADD TO ROI MANAGER FOR COUNTING MACRO		
run("To ROI Manager");
roistart = roiManager("count");
roiManager("Show All without labels");
waitForUser("Press A to designate cell state, then use macro tool to track cells.");
}

if (grid=="Custom") {
if (roiManager("count")>0){
roiManager("Deselect");
roiManager("Delete");
}
run("Cycloid_Grid_Full");

//ADD TO ROI MANAGER FOR COUNTING MACRO		
run("To ROI Manager");
roistart = roiManager("count");
roiManager("Show All without labels");
waitForUser("Press A to designate cell state, then use macro tool to track cells.");
}
}

//Sets cell state (Alive, Aggregate, death, end of image)
macro "Cell State [a]" {
//Default alive cell without aggregte and not end of image, not being deleted 
life = "1.0"; //Always set to alive 
lifestate = "Alive"; //Always set to alive (dead cells are only clicked once)
//Read in aggregate (feature 1) state and feature 2 state, as these will be constant for several timepoints until being changed with [a]
if (aggregate == "1.0") {
aggregatestate = "Yes";
}

if (aggregate == "0.0") {
aggregatestate = "No";
}
////
if (feature2 == "1.0") {
feature2state = "Yes";
}

if (feature2 == "0.0") {
feature2state = "No";
}
////

//Alwats set endimage and delete to No as this means next cell or image when it is clicked. censored is always uncensored to start the box. (this is written into the dialog box below).
endimage = "No";
delete = "No";
//Create dialog box 
Dialog.create("Set Cell States");  
Dialog.addMessage("Call this dialog box with [a] when there is a change in cell state.");  
Dialog.addRadioButtonGroup("LIFE:", newArray("Alive", "Dead"), 1, 2, lifestate);
Dialog.addRadioButtonGroup("PRIMARY FEATURE:", newArray("Yes", "No"), 1, 2, aggregatestate);
Dialog.addRadioButtonGroup("SECONDARY FEATURE:", newArray("Yes", "No"), 1, 2, feature2state);
Dialog.addRadioButtonGroup("CENSOR cell?", newArray("uncensored", "censored"), 1, 2, "uncensored");
Dialog.addRadioButtonGroup("DELETE cell?", newArray("No", "Delete"), 1, 2, "No");
Dialog.addRadioButtonGroup("NEXT IMAGE? (Select, then click on Z-stack to save overlay)", newArray("No", "Yes"), 1, 2, endimage);
Dialog.addCheckbox("Allow tool use only on Z-stacks.", ZstackOnly);
Dialog.addMessage("Press *OK* and THEN click on index cell to add states.");
Dialog.addMessage("Cell results saved on image click at end of stack, cell death/censoring, or next image button.");
Dialog.show(); 
//Binary variables that are eventually used as numbers (makes adding lifespans easier in excel files if/when that is desired)
//2020 Cleaned up interface and manually assigned these values to life, aggregate, and feature2 (binary string operators from V1 "1.0" and "0.0")
lifestate = Dialog.getRadioButton();
if(lifestate == "Alive"){
life = "1.0";
}
if(lifestate == "Dead"){
life = "0.0";
}

aggregatestate = Dialog.getRadioButton();
if(aggregatestate == "Yes"){
aggregate = "1.0";
}
if(aggregatestate == "No"){
aggregate = "0.0";
}

feature2state = Dialog.getRadioButton();
if(feature2state == "Yes"){
feature2 = "1.0";
}
if(feature2state == "No"){
feature2 = "0.0";
}

//String variables
censor = Dialog.getRadioButton();
delete = Dialog.getRadioButton();
endimage = Dialog.getRadioButton();
ZstackOnly = Dialog.getCheckbox();


}

     
 ///Survival Tool: Creates an imagej tool to follow individual cells through a z-stack, the tool looks like a "+". Counts cursor clicks and not Z-stack plane to allow for object appearing part-way through timecourse.
macro "Survival Tool - C0a0L18f8L818f" {
	 
	 //Check for Z-stack and exit if single image (option to disable by commenting out)
	Stack.getDimensions(width, height, channels, slices, frames);
	if (slices <= 1 && ZstackOnly == true){
	exit("Not a Z-Stack. Disable Z-stack reqirement in Cell State macro [a] to use on single images");
    }
	 
	 name = getTitle();
	 slice = getSliceNumber();
     rowNumber = (slice-1);
     results = nResults();
     ImageName = name;
     WellName = well;
     CellClass = "Undefined";
     max = nSlices;
	
	
     
     if (life=="9999" || aggregate=="null" || aggregate=="9999"){
     	run("Cell State [a]");
     	exit ("Cell state set - continue");
     	}
     
 //Tally states///////
    if (life!="9999"){
      	if (life=="1.0" && censor=="uncensored" && endimage=="No"){
     	lifespan = lifespan+1;
      	}
      	if (aggregate=="1.0" && censor=="uncensored" && endimage=="No"){
     	aggregatelifespan = aggregatelifespan+1;
      	}
      		if (feature2=="1.0" && censor=="uncensored" && endimage=="No"){
     	feature2lifespan = feature2lifespan+1;
      	}
      	
     	if (slice==1 && endimage=="No") {
     		if (aggregate=="1.0") {
     		   initialstate = "A";
     		}
     		if (aggregate=="0.0"){
     			initialstate = "O";
     	}}
     	     
     	if (aggregatelifespan==1){
     	getCursorLoc(x, y, z, flags);
     	aggsgartx = x;
     	aggstarty = y;
     	aggstartz = z;
     	}

     	if (feature2lifespan==1){
     	getCursorLoc(x, y, z, flags);
     	f2sgartx = x;
     	f2starty = y;
     	f2startz = z;
     	}
     	
   ////Set end state variables
     	if (life=="0.0" || slice==max || censor=="censored" || delete=="Delete") {
           
           if (aggregate=="1.0") {
     		   endstate = "A";
     		}
     		if (aggregate=="0.0"){
     			endstate = "O";
     	    }
            if (life=="1.0") {
     		   endlife = "A";
     		}
     		if (life=="0.0"){
     			endlife = "D";
     	    } 
     	}
     	
     	}
///How to deal with outcomes below
      
         
     if (endimage=="No" && life=="1.0" && censor=="uncensored" && delete=="No"){ 
       getCursorLoc(x, y, z, flags);
       makePoint(x, y);
       run("Add Selection...");
       setResult("X", results, x);
       setResult("Y", results, y);
       setResult("Z", results, z);
       setResult("Life", results, life); 
       setResult("Feature1", results, aggregate);
       setResult("Feature2", results, feature2);
       setResult("CellName", results, well+"-"+position+"-"+CellName);
       setResult("Stack", results, position);
       setResult("ImageName", results, ImageName);
       setResult("WellName", results, WellName);
       setResult("CellClass", results, CellClass);
       setResult("Lifespan", results, lifespan);
       setResult("Censor", results, censor);
       setResult("Delete", results, delete);
       }
       if (slice==1 && endimage=="No" && life!="9999") {
       	roiManager("add");
       	xorig = x;
       	yorig = y;
       }
       
       if (slice<max && life!="9999") {
       run("Next Slice [>]");
       }

       //set life and other values to 0 for censored and deleted cells to auto-fill remaining results rows 
       if (censor=="censored" || delete=="Delete") {
       life = "0.0";
       aggregate = "0.0";
       feature2 = "0.0";
       }
       
       if (life=="0.0") {
       getCursorLoc(x, y, z, flags);
       makePoint(x, y);
       run("Add Selection...");
       for (i=slice; i<max+1; i++) {
       results = nResults();
       setResult("X", results, x);
       setResult("Y", results, y);
       setResult("Z", results, i-1);
       setResult("Life", results, life);    
       setResult("Feature1", results, aggregate);
       setResult("Feature2", results, feature2);
       setResult("CellName", results, well+"-"+position+"-"+CellName);
       setResult("Stack", results, position);
       setResult("ImageName", results, ImageName);
       setResult("WellName", results, WellName);
       setResult("CellClass", results, CellClass);
       setResult("Lifespan", results, lifespan);
       setResult("Censor", results, censor);
       setResult("Delete", results, delete);
       }

       //CellName=CellName+1;
       selectWindow("Results");
       saveAs("Results", CSVpath+name+"_Results.csv");
       run("Remove Overlay");
       }
       	
       if (slice==max)  {
       //CellName=CellName+1;
       //CellClassCalcullation and re-write into excel sheet
       selectWindow("Results");
       saveAs("Results", CSVpath+name+"_Results.csv");
       run("Remove Overlay");
       }
       


 //Cell Class results writer and text saver (File.saveString(string, stringpath) - Saves string as a file. Also writes delete and censor in all rows for respective cells in the results/CSV file. 
  if(slice==max || life=="0.0" || censor=="censored" || delete=="Delete"){
  run("Cell Class Calculator");
  results = nResults();
  resultrow = 0;
  for (i=1; i<max+1; i++) {
       resultrow = results-i;
       selectWindow("Results");
       setResult("CellClass", resultrow, CellClass);
       setResult("Censor", resultrow, censor);
       setResult("Delete", resultrow, delete);
       //Add update results
       updateResults();
       }
       
       selectWindow("Results");
       saveAs("Results", CSVpath+name+"_Results.csv");
       
       if (delete=="No"){
       	//2020 added to prevent error where timepoints is not detected
       timepoints = max;
       File.saveString(CellClass+";"+well+"-"+position+"-"+CellName+";"+lifespan+";"+xorig+";"+yorig+";"+aggregatelifespan+";"+aggstartx+";"+aggstarty+";"+aggstartz+";"+feature2lifespan+";"+f2startx+";"+f2starty+";"+f2startz+";"+well+";"+name+";"+project+";"+initialstate+";"+endstate+";"+endlife+";"+timepoints+";"+censor+";", stringpath+CellClass+"_"+well+"-"+position+"-"+CellName+".txt");
       print("Delete Status= "+delete+". Saving: "+stringpath+CellClass+"_"+well+"-"+position+"-"+CellName+".txt");
       }
       
       ///designate appropriate ROI symbol. Does not work on frist ROI - need to press "r" before moving on to second ROI//
       nROIs = roiManager("count");
       roiManager("Select", nROIs-1);
       if (delete=="No"){
       run("ROI Symbol Updater [r]");
       }
       if (delete=="Delete"){
       roiManager("Delete");
       }
      
       ////Reset counters and variables
       lifespan = 0;
       aggregatelifespan = 0;
       feature2lifespan = 0;
       initialstate = "Test";
       endstate = "Test";
       endlife = "Test";
       CellClass = "Undefined";
       xorig = 9999;
       yorig = 9999;
       aggstartx=9999;
       aggstarty=9999;
       aggstartz=9999;
       f2startx=9999;
       f2starty=9999;
       f2startz=9999;
       resultrow = 0;
       
       }
       if(slice==max || life=="0.0" || censor=="censored" || delete=="Delete"){
      //Next Cell
       setSlice(1);
       roiManager("Show All without labels");
       censor="uncensored";
       feature2 = "0.0";
       delete = "No";
       run("Cell State [a]");
       	//debug cell ROI updater here
       	if(CellName==1){
       roiManager("Select", 0);
       run("ROI Symbol Updater [r]");
       	}
       //Advance cell name
       CellName=CellName+1;
       }
       
       if (endimage=="Yes") {
       	endimage="No";
       	life="9999";
       	setSlice(1);
       	roiManager("Show All without labels");
       	run("Flatten", "slice");
       	saveAs("Tiff", dir+name+"_Overlay.tif");
       	close("\\Others"); 
       	roiManager("Deselect");
        roiManager("Delete");
        run("Remove Overlay");
        CellName=1;
        delete = "No";
         //Uncommented below to create separate .csv files for each image - simpler to find thing things this way although need more files.
         //Can comment out the next two lines to concactenate the .csv as cells are scored, re-saving under each new image name. This will change downstream extract cells workflow however.
        run("Clear Results");
        run("Close All");
       }     
 
       }
 //Above "}" ends Survival tool

    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////Cycloid Grid Macro (Not of my creation - See below) https://imagej.nih.gov/ij/macros/Cycloid_grid.txt
//Uses pre-set grid settings. Can be modified during macro.
/*Makes a grid based on cycloid grid from Baddeley, A.J., 
H.J.G. Gundersen, and L.M. Cruz-Orive, J. of Microsc. 1986, 
142:259-276. for stereological quantification on vertical uniform 
random sections as non-destructive overlay.

Image vertical axis should be aligned with the grid vertical axis
(placed on the left side). 

Do not forget to "Set Scale" to get correct printout of the grid parameters, 
which are reflected in the "Cycloid grid parameters" window.

"Central Points" makes two points in every tile.
"Line Points" makes 4 additional points per tile.
"Segmented lines" makes circular arcs  with total length
2 times shorter than solid lines.

Test line per point (l/p) constant is used to estimate surface density (surface
area per unit volume) in uniform random sections. 

Version: 1.0
Date: 04/09/2014
Author: Aleksandr Mironov amj-box@mail.ru
*/

//requires("1.49g");
//Variables defined at top of macro
//var x0, y0, tmax, newStart = newArray(2);

macro "Cycloid_Grid" {


html = "<html>"
	+"<h1><font color=navy>Cycloid Grid</h1>"
	+"<font color=navy>is a linear test system for vertical uniform random sections<font color=black><br><br>"
	+"<font color=navy>based on Baddeley, Gundersen, Cruz-Orive (J. of Microsc. 1986, 142:259-276)<font color=black><br><br>"
	+"<font color=purple><b><u>Options:</u></b><br>"
	+"<b>Tile density</b> - determines density of the grid <br>"
	+"<b>Central Points</b> - two points per grid tile <br>"
	+"<b>Line Points</b> - 4 additional points per grid tile <br><br>"
	+"<b>New Overlay</b> - removes previous overlays<br>"
	+"<b>Random Offset</b> - randomizes grid location<br>"
	+"<b>Segmented lines</b> - arcs with half of total length of solid lines<br><br>"
	+"<font color=red><b>Set Scale</b><font color=black> to get correct printout of the grid parameters,<br>" 
	+"which are reflected in the 'Cycloid grid parameters' window<br><br>"
	+"<font color=green><b>Useful parameters:</b><br><br>"
	+"<i><u>Area per point</u></i> can be used to estimate an area in 2D samples<br>" 
	+"or volume density in uniform random sections<br><br>"
	+"<i><u>Test line per point</u></i> constant is used to estimate surface density<br>"
	+"(surface area per unit volume) in vertical uniform random sections<br><br>"
	
// Cycloid settings
tmax = 3.251;
nPoints = 30;
getDimensions(w, h, channels, slices, frames);
name = getTitle();
stSegm = random;

//Creating dialog box
Dialog.create("Cycloid Grid, ver. 1.0"); 
Dialog.addNumber("Tile density  =", 9,0,2,"within height");    
Dialog.addCheckbox("Central Points", false); 
Dialog.addCheckbox("Line Points (x2 of central)", false);
Dialog.addMessage("\n ");
Dialog.addChoice("Line type", newArray("solid", "segmented"));
Dialog.addNumber("Line thickness =", 1,0,2,"pixels");
Dialog.addChoice("Line color:", newArray("cyan", "red", "green", "magenta", "blue", "yellow", "orange", "black", "white"));
Dialog.addChoice("Central Point color:", newArray("green", "cyan", "red", "magenta", "blue", "yellow", "orange", "black", "white"));
Dialog.addCheckbox("New Overlay", true);  
Dialog.addCheckbox("Random Offset", true);
Dialog.addCheckbox("Show Vertical Axis", false); 
Dialog.addHelp(html); 
Dialog.show(); 

//grid parameters
ntiles = Dialog.getNumber();;
tile = h/ntiles;
rad = tile/4;
cycles = w/PI/4/rad;
point = Dialog.getCheckbox();;
points = Dialog.getCheckbox();;
typeCycloid = Dialog.getChoice();
th = Dialog.getNumber();
color = Dialog.getChoice();
colorC = Dialog.getChoice();
new = Dialog.getCheckbox();
if (new == true) Overlay.remove;

//Creating offset
off1 = random;
off2 = random;
offset = Dialog.getCheckbox(); 
if (offset == false) off1 = off2 = 0;
xoff = -round(off1*PI*tile);
yoff = -round(off2*tile);
newStart[0] = xoff;
newStart[1] = yoff;

//vertical axis
arrow = Dialog.getCheckbox();

//Filling image with grid tiles
for (i = 0; i <= ntiles+1; i++){
	for (j = 0; j <= cycles+1; j++){
		startSegm = stSegm;
		drawCurve(typeCycloid, startSegm);
		run("Select None");
		}
	newStart[0] = xoff;
	newStart[1] = newStart[1] + tile;
	
	for (j = 0; j <= cycles+1; j++){
		startSegm = 1-stSegm;
		drawCurve(typeCycloid, startSegm);
		run("Select None");
		}
	newStart[0] = xoff;
	newStart[1] = newStart[1] + tile;
}

if (arrow == true){
	makeArrow(th*2, h, th*2, 0, "notched large outline");
	Roi.setStrokeWidth(th*2);
	Roi.setStrokeColor(colorC);
	run("Add Selection...");
}

//Drawing one segment of cycloid
function makeSegm(x, y, rad, tmax, k1, k2, type){
		xArr = newArray(nPoints);
		yArr = newArray(nPoints);
		
		for (pt = 0; pt < nPoints; pt++){
		t = pt/nPoints * tmax; 
		xArr[pt] = newStart[0] + rad * (t+k1*sin(t));
		yArr[pt] = newStart[1] + k2*rad * (1-cos(t));
		}
		if (type == "solid"){
		makeSelection("polyline", xArr, yArr);
		run("Add Selection...", "width="+th+" stroke="+color);
		}
		//last segment coordinates
		newStart[0] = xArr[pt-1];
		newStart[1] = yArr[pt-1];
		return newStart;
		}

//Drawing cycloid from segments
function drawCurve(typeCycloid, startSegm){

		//First segment
		if (typeCycloid == "segmented" && startSegm <= 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = k2 = -1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineV();
			}
		if (point == true){
			kk = 1;
			drawCentralPoint(kk);
			}

		//Second segment
		if (typeCycloid == "segmented" && startSegm > 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = k2 = 1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineH();
			}

		//Third segment
		if (typeCycloid == "segmented" && startSegm <= 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = -1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineV();
			}
		if (point == true){
			kk = -1;
			drawCentralPoint(kk);
			}

		//Fourth segment
		if (typeCycloid == "segmented" && startSegm > 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = 1;
		k2 = -1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineH();
			}
		}

//Vertical End Points
function drawEndLineV(){
		setColor(color);
		setLineWidth(th);
		y1 = newStart[1] - tile/24;
		y2 = newStart[1] + tile/24;
		x = newStart[0];
		Overlay.drawLine(x,y1,x,y2); 
		Overlay.add;
		Overlay.show;
		}

//Horizontal End Points
function drawEndLineH(){
		setColor(color);
		setLineWidth(th);
		x1 = newStart[0] - tile/24;
		x2 = newStart[0] + tile/24;
		y = newStart[1];
		Overlay.drawLine(x1,y,x2,y); 
		Overlay.add;
		Overlay.show;
		}

//Central Points
function drawCentralPoint(kk){
		setColor(colorC);
		setLineWidth(th);
		x1 = newStart[0] - tile/24;
		x2 = newStart[0] + tile/24;
		y = newStart[1] + kk*tile/2;
		x = newStart[0];
		y1 = newStart[1] + kk*tile/2 - tile/24;
		y2 = newStart[1] + kk*tile/2 + tile/24;
		Overlay.drawLine(x,y1,x,y2); 
		Overlay.add;
		Overlay.drawLine(x1,y,x2,y); 
		Overlay.add;
		Overlay.show;
		}


}
}

//Runs full cycloid grid macro for alternate stereology shapes.///
macro "Cycloid_Grid_Full"{

//help
html = "<html>"
	+"<h1><font color=navy>Cycloid Grid</h1>"
	+"<font color=navy>is a linear test system for vertical uniform random sections<font color=black><br><br>"
	+"<font color=navy>based on Baddeley, Gundersen, Cruz-Orive (J. of Microsc. 1986, 142:259-276)<font color=black><br><br>"
	+"<font color=purple><b><u>Options:</u></b><br>"
	+"<b>Tile density</b> - determines density of the grid <br>"
	+"<b>Central Points</b> - two points per grid tile <br>"
	+"<b>Line Points</b> - 4 additional points per grid tile <br><br>"
	+"<b>New Overlay</b> - removes previous overlays<br>"
	+"<b>Random Offset</b> - randomizes grid location<br>"
	+"<b>Segmented lines</b> - arcs with half of total length of solid lines<br><br>"
	+"<font color=red><b>Set Scale</b><font color=black> to get correct printout of the grid parameters,<br>" 
	+"which are reflected in the 'Cycloid grid parameters' window<br><br>"
	+"<font color=green><b>Useful parameters:</b><br><br>"
	+"<i><u>Area per point</u></i> can be used to estimate an area in 2D samples<br>" 
	+"or volume density in uniform random sections<br><br>"
	+"<i><u>Test line per point</u></i> constant is used to estimate surface density<br>"
	+"(surface area per unit volume) in vertical uniform random sections<br><br>"
	
// Cycloid settings
tmax = 3.251;
nPoints = 30;
getDimensions(w, h, channels, slices, frames);
name = getTitle();
stSegm = random;

//Creating dialog box
Dialog.create("Cycloid Grid, ver. 1.0"); 
Dialog.addNumber("Tile density  =", 6,0,2,"within height");    
Dialog.addCheckbox("Central Points", true); 
Dialog.addCheckbox("Line Points (x2 of central)", true);
Dialog.addMessage("\n ");
Dialog.addChoice("Line type", newArray("segmented", "solid"));
Dialog.addNumber("Line thickness =", 1,0,2,"pixels");
Dialog.addChoice("Line color:", newArray("cyan", "red", "green", "magenta", "blue", "yellow", "orange", "black", "white"));
Dialog.addChoice("Central Point color:", newArray("green", "cyan", "red", "magenta", "blue", "yellow", "orange", "black", "white"));
Dialog.addCheckbox("New Overlay", true);  
Dialog.addCheckbox("Random Offset", true);
Dialog.addCheckbox("Show Vertical Axis", true); 
Dialog.addHelp(html); 
Dialog.show(); 

//grid parameters
ntiles = Dialog.getNumber();;
tile = h/ntiles;
rad = tile/4;
cycles = w/PI/4/rad;
point = Dialog.getCheckbox();;
points = Dialog.getCheckbox();;
typeCycloid = Dialog.getChoice();
th = Dialog.getNumber();
color = Dialog.getChoice();
colorC = Dialog.getChoice();
new = Dialog.getCheckbox();
if (new == true) Overlay.remove;

//Creating offset
off1 = random;
off2 = random;
offset = Dialog.getCheckbox(); 
if (offset == false) off1 = off2 = 0;
xoff = -round(off1*PI*tile);
yoff = -round(off2*tile);
newStart[0] = xoff;
newStart[1] = yoff;

//vertical axis
arrow = Dialog.getCheckbox();

//Filling image with grid tiles
for (i = 0; i <= ntiles+1; i++){
	for (j = 0; j <= cycles+1; j++){
		startSegm = stSegm;
		drawCurve(typeCycloid, startSegm);
		run("Select None");
		}
	newStart[0] = xoff;
	newStart[1] = newStart[1] + tile;
	
	for (j = 0; j <= cycles+1; j++){
		startSegm = 1-stSegm;
		drawCurve(typeCycloid, startSegm);
		run("Select None");
		}
	newStart[0] = xoff;
	newStart[1] = newStart[1] + tile;
}

if (arrow == true){
	makeArrow(th*2, h, th*2, 0, "notched large outline");
	Roi.setStrokeWidth(th*2);
	Roi.setStrokeColor(colorC);
	run("Add Selection...");
}

//Drawing one segment of cycloid
function makeSegm(x, y, rad, tmax, k1, k2, type){
		xArr = newArray(nPoints);
		yArr = newArray(nPoints);
		
		for (pt = 0; pt < nPoints; pt++){
		t = pt/nPoints * tmax; 
		xArr[pt] = newStart[0] + rad * (t+k1*sin(t));
		yArr[pt] = newStart[1] + k2*rad * (1-cos(t));
		}
		if (type == "solid"){
		makeSelection("polyline", xArr, yArr);
		run("Add Selection...", "width="+th+" stroke="+color);
		}
		//last segment coordinates
		newStart[0] = xArr[pt-1];
		newStart[1] = yArr[pt-1];
		return newStart;
		}

//Drawing cycloid from segments
function drawCurve(typeCycloid, startSegm){

		//First segment
		if (typeCycloid == "segmented" && startSegm <= 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = k2 = -1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineV();
			}
		if (point == true){
			kk = 1;
			drawCentralPoint(kk);
			}

		//Second segment
		if (typeCycloid == "segmented" && startSegm > 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = k2 = 1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineH();
			}

		//Third segment
		if (typeCycloid == "segmented" && startSegm <= 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = -1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineV();
			}
		if (point == true){
			kk = -1;
			drawCentralPoint(kk);
			}

		//Fourth segment
		if (typeCycloid == "segmented" && startSegm > 0.5){
			type = "empty";
			} else {
			type = "solid";
			}
		k1 = 1;
		k2 = -1;
		makeSegm(x0, y0, rad, tmax, k1, k2, type);
		if (points == true){
			drawEndLineH();
			}
		}

//Vertical End Points
function drawEndLineV(){
		setColor(color);
		setLineWidth(th);
		y1 = newStart[1] - tile/24;
		y2 = newStart[1] + tile/24;
		x = newStart[0];
		Overlay.drawLine(x,y1,x,y2); 
		Overlay.add;
		Overlay.show;
		}

//Horizontal End Points
function drawEndLineH(){
		setColor(color);
		setLineWidth(th);
		x1 = newStart[0] - tile/24;
		x2 = newStart[0] + tile/24;
		y = newStart[1];
		Overlay.drawLine(x1,y,x2,y); 
		Overlay.add;
		Overlay.show;
		}

//Central Points
function drawCentralPoint(kk){
		setColor(colorC);
		setLineWidth(th);
		x1 = newStart[0] - tile/24;
		x2 = newStart[0] + tile/24;
		y = newStart[1] + kk*tile/2;
		x = newStart[0];
		y1 = newStart[1] + kk*tile/2 - tile/24;
		y2 = newStart[1] + kk*tile/2 + tile/24;
		Overlay.drawLine(x,y1,x,y2); 
		Overlay.add;
		Overlay.drawLine(x1,y,x2,y); 
		Overlay.add;
		Overlay.show;
		}

// Printing the parameters of the grid
getPixelSize(unit, pw, ph, pd); 
window = isOpen("Cycloid grid parameters"); 
title = "[Cycloid grid parameters]"; 
if (window == false){  
	run("Text Window...", "name="+ title +"width=60 height=16 menu"); 
	setLocation(0, 0); 
	}
if (point == true) cp = 2; 
else	cp = 0;
if (points == true)ep = 4; 
else	ap = 0;
if (typeCycloid == "segmented") lr = 2;
else lr = 1;

print(title, "\nCycloid Grid for sample ["+name+"]"); 
print(title, "\n\nImage size = "+w+"x"+h+" pixels");
print(title, "\nPixel size = "+pw+" "+unit);
print(title, "\nScale = "+1/pw+" pixels/"+unit);
print(title, "\n\nGrid tiles per image = "+ntiles*w/PI/tile);
print(title, "\nLine length per tile = "+tile*4*pw/lr+" "+unit);
if (point || points == true) {
	print(title, "\nArea per point ="+tile*tile*2*PI*pw*ph/(cp+ep)+"  "+unit+"^2");
	print(title, "\nTest line per point(l/p) ="+pw*PI*tile/(cp+ep)/lr+"  "+unit);
	}
print(title, "\n_______________________\n");

}

//Cell Class Calculator Macro
//Requires previously defiend global variables initialstate, endstate, endlife, aggregatelifespan, lifespan
//Calculates a cell class based on the primary phenotype "Aggregate" 
//Reports cell class as "initial state"+"endstate"+"endlife". In positions 1 & 2: A=aggregate, O=no aggregate, In position 3: A=alive, D=dead (at last timepoint counted)

macro "Cell Class Calculator" {
if (initialstate=="A" && endstate=="A" && endlife=="A" && aggregatelifespan==lifespan) {
    CellClass="AAA"; 
    }

//A_A_Dead//Fix this lifespan counter debug
if (initialstate=="A" && endstate=="A" && endlife=="D" && aggregatelifespan==lifespan+1) {
	
	CellClass="AAD";
	}

//O_O_Alive
if (initialstate=="O" && endstate=="O" && endlife=="A" ) {
	
	CellClass="OOA";
	}

//O_O_Dead
if (initialstate=="O" && endstate=="O" && endlife=="D" ) {
	
	CellClass="OOD";
	}

//O_A_Alive
if (initialstate=="O" && endstate=="A" && endlife=="A" ) {
	
	CellClass="OAA";
}

//O_A_Dead
if (initialstate=="O" && endstate=="A" && endlife=="D" ) {

CellClass="OAD";
}

//A_O_Alive - don't expect these cells to exist
if (initialstate=="A" && endstate=="O" && endlife=="A" ) {
	
	CellClass="AOA";
}

//A_O_Dead - don't expect these cells to exist
if (initialstate=="A" && endstate=="O" && endlife=="D" ) {
	
	CellClass="AOD";
}

//TransientAg_Alive - don't expect these cells to exist
if (initialstate=="O" && endstate=="O" && endlife=="A" && aggregatelifespan>0) {
	
	CellClass="TransA";
}

//TransientAg_Dead - don't expect these cells to exist
if (initialstate=="O" && endstate=="O" && endlife=="D" && aggregatelifespan>0) {
	CellClass="TransD";
}
}

/////////////////////ROI SYMBOL UPDATER///////////// Updates ROI symbols on working image - can be re-run from macro menu if there is a problem updating.
macro "ROI Symbol Updater [r]"{

//A_A_Alive
if (CellClass=="AAA"){
pointcolor = "cyan";
pointtype = "Dot";
markersize = "Extra Large";
}

//A_A_Dead
if (CellClass=="AAD"){
pointcolor = "cyan";
pointtype = "Hybrid";
markersize = "Extra Large";
}

//O_O_Alive
if (CellClass=="OOA"){
pointcolor = "cyan";
pointtype = "Circle";
markersize = "Extra Large";
}

//O_O_Dead
if (CellClass=="OOD"){
pointcolor = "cyan";
pointtype = "Cross";
markersize = "Extra Large";
}

//O_A_Alive
if (CellClass=="OAA"){
pointcolor = "cyan";
pointtype = "Dot";
markersize = "Large";
}

//O_A_Dead
if (CellClass=="OAD"){
pointcolor = "cyan";
pointtype = "Hybrid";
markersize = "Large";
}

//A_O_Alive - don't expect these cells to exist
if (CellClass=="AOA"){
pointcolor = "red";
pointtype = "Dot";
markersize = "Extra Large";
}

//A_O_Dead - don't expect these cells to exist
if (CellClass=="AOD"){
pointcolor = "red";
pointtype = "Hybrid";
markersize = "Extra Large";
}

//TransientAg_Alive - don't expect these cells to exist
if (CellClass=="TransA"){
pointcolor = "red";
pointtype = "Dot";
markersize = "Medium";
}

//TransientAg_Dead - don't expect these cells to exist
if (CellClass=="TransD"){
pointcolor = "red";
pointtype = "Hybrid";
markersize = "Large";
}

//Make censored cells yellow
if (censor=="censored"){
pointcolor = "yellow";
if(CellClass == "TransA" || CellClass == "TransD" || CellClass == "AOA" || CellClass == "AOD"){
pointcolor = "orange";
} 
}



run("Properties... ", "stroke="+pointcolor+" point="+pointtype+" size=["+markersize+"]");

}

//Function below used to define unique values in an array/string (used to detect wavelengths present and by Grapher/Analyzer macro)
function present(a, string) {
	for (i=0; i<a.length; i++)
	if (a[i]==string) return "1";
	return "0";
}

//2021 functions for graphing/plotting
function YStepFunction(Ycor){
var Xcor = Array.getSequence(Ycor.length);
var modX = newArray();
var modY = newArray();
var Ydelta = 0;

//Need to produce censor values based on original X and Y values (so they only appear at the top Y value for each timepoint)
//Create storage array for Y positions of censor crosses
var CensorYStorage = Ycor;
var CensorXStorage  = Xcor;

//Calculate new X and Y values based on Y drops (deaths)
for (i = 0; i < Xcor.length; i++) {
Ydelta = 0;
if (i>0) { 
	Ydelta = (Ycor[i-1]) - (Ycor[i]);
//print("Ydelta: "+Ydelta);	
	Xdelta = (Xcor[i]) - (Xcor[i-1]);
//print("Xdelta: "+Xdelta);
}
numX = Xcor[i];
numY = Ycor[i];

if (Ydelta!=0) {

modX = Array.concat(modX, (numX-Xdelta));	
modX = Array.concat(modX, numX);

modY = Array.concat(modY, numY);	
modY = Array.concat(modY, numY);

}else{
modX = Array.concat(modX, numX);
modY = Array.concat(modY, numY);}	
}

return modY;
}

function XStepFunction(Ycor){
var Xcor = Array.getSequence(Ycor.length);
var modX = newArray();
var modY = newArray();
var Ydelta = 0;

//Need to produce censor values based on original X and Y values (so they only appear at the top Y value for each timepoint)
//Create storage array for Y positions of censor crosses
var CensorYStorage = Ycor;
var CensorXStorage  = Xcor;

//Calculate new X and Y values based on Y drops (deaths)
for (i = 0; i < Xcor.length; i++) {
Ydelta = 0;
if (i>0) { 
	Ydelta = (Ycor[i-1]) - (Ycor[i]);
//print("Ydelta: "+Ydelta);
	Xdelta = (Xcor[i]) - (Xcor[i-1]);
//print("Xdelta: "+Xdelta);
}
numX = Xcor[i];
numY = Ycor[i];

if (Ydelta!=0) {

modX = Array.concat(modX, (numX-Xdelta));	
modX = Array.concat(modX, numX);

modY = Array.concat(modY, numY);	
modY = Array.concat(modY, numY);

}else{
modX = Array.concat(modX, numX);
modY = Array.concat(modY, numY);}	
}

return modX;
}


macro "Grapher/Analyzer [g]" {
//Reset variables and arrays for grapher/analyzer plugin
Arawsurvival = newArray( );
AGroups = newArray( );
ALifespan = newArray( );
ACensorLifespan = newArray( );
ALifeStats = newArray( );  
AAggregate = newArray( );
AHistogram = newArray( ); 
ASurvival = newArray( );
Aadvancedgraphing = newArray("Yes", "No");
Acombine = newArray("Yes", "No");

//Set up colors for graphs
Palettes = newArray("IJColors","BrewerPaired","BrewerDark2","RSafe","OkabeIto");
//Some bright colors from ImageJ
IJColors = newArray("black", "blue", "cyan", "darkGray", "gray", "green", "lightGray", "magenta", "orange", "pink", "red");
//Brewer colors from R
BrewerPaired = newArray("#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928");
//BrewerDark2
BrewerDark2 = newArray("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666");
//Cartocolors "Safe" from R
RSafe = newArray("#7F3C8D", "#11A579", "#3969AC", "#F2B701", "#E73F74", "#80BA5A", "#E68310", "#008695", "#CF1C90", "#f97b72", "#4b4b8f", "#A5AA99");
//palette_OkabeIto <- c
OkabeIto = newArray("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999");
//Select default color scheme to IJColors
colorsChoice = newArray("black", "blue", "cyan", "darkGray", "gray", "green", "lightGray", "magenta", "orange", "pink", "red");
//Assign default color set here.
colorsA = Array.copy(colorsChoice);

//Rotates colro palette to alter colors of individual group plots
rot = 0; 
Array.rotate(colorsA, rot);

var n2 = 0
var n = 0
string = "Test";
outputstring = "";
var advancedgraphing = "No"
//grouparray = newArray("Group_A", "Group_t", "t0_A"); // Legacy graphing arrays. 



//Combine classes?

Dialog.create("Select Groups to Compare");  
Dialog.addRadioButtonGroup("Compare Survival:", newArray("Within Wells", "Between Wells", "All Files in Folder", "OR: Compare Cumulative Events Between Wells"), 4, 1, "Within Wells");
Dialog.addRadioButtonGroup("Plot Options:", newArray("Plot new comparison only", "Plot with all prior comparisons in folder"), 1, 2, "Plot new comparison only");
//2021
Dialog.addRadioButtonGroup("Survival plot type:", newArray("Survival", "Risk of Death"), 1, 2, "Survival");

Dialog.show(); 
comparison = Dialog.getRadioButton();
//Set up graphing - either a new comparison, or plot all prior comparisons in designated folder. 
precombine = Dialog.getRadioButton();
if(precombine == "Plot with all prior comparisons in folder"){
combine = "No";
//Name for .png plot if multiple comparisons (otherwise will save over pariwise comparison).
plotgroup = plotgroup+"_Multiplot";
}

if(precombine == "Plot new comparison only"){
combine = "Yes";
}

//2021 added
plottype = Dialog.getRadioButton();
if(plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
var Plotlabel = RiskPlotlabel;
var Ylabel = RiskYlabel;
}


AwellsPresent = newArray("A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12");
if (comparison == "Within Wells"){
	AwellsAnalyze = newArray();
	Dialog.create("Select Wells to Analyze"); 
	Dialog.addMessage("Select wells to include in analysis:"); 
    Dialog.addCheckboxGroup(8, 12, AwellsPresent , newArray(AwellsPresent.length)); 
    Dialog.show(); 
    for (i = 0; i < AwellsPresent.length; i++) {
    	wellcheck = Dialog.getCheckbox();
    	if (wellcheck == true){
    		TempArray = AwellsPresent[i];
    		AwellsAnalyze = Array.concat(AwellsAnalyze,TempArray);
    	}
    }
print("Selected Wells:");
Array.print(AwellsAnalyze); //AwellsAnalyze holds the list of wells to analyze
}

if (comparison == "Between Wells" || comparison == "OR: Compare Cumulative Events Between Wells"){
	G1AwellsAnalyze = newArray();
	G2AwellsAnalyze = newArray();
	Dialog.create("Select Wells to Analyze"); 
	Dialog.addMessage("Select wells to include in GROUP 1:"); 
    Dialog.addCheckboxGroup(8, 12, AwellsPresent , newArray(AwellsPresent.length));
    Dialog.addMessage("Select wells to include in GROUP 2:"); 
    Dialog.addCheckboxGroup(8, 12, AwellsPresent , newArray(AwellsPresent.length));  
    Dialog.show(); 
    for (i = 0; i < AwellsPresent.length; i++) {
    	wellcheck = Dialog.getCheckbox();
    	if (wellcheck == true){
    		TempArray = AwellsPresent[i];
    		G1AwellsAnalyze = Array.concat(G1AwellsAnalyze,TempArray);
    	}
    }

        for (i = 0; i < AwellsPresent.length; i++) {
    	wellcheck = Dialog.getCheckbox();
    	if (wellcheck == true){
    		TempArray = AwellsPresent[i];
    		G2AwellsAnalyze = Array.concat(G2AwellsAnalyze,TempArray);
    	}
    }
print("Group 1 Wells:");
Array.print(G1AwellsAnalyze); //AwellsAnalyze holds the list of wells to analyze
print("Group 2 Wells:");
Array.print(G2AwellsAnalyze); //AwellsAnalyze holds the list of wells to analyze
}

if (comparison == "All Files in Folder"){
	AwellsAnalyze = newArray("AllWells"); 	
print("Selected Wells:");
Array.print(AwellsAnalyze); //AwellsAnalyze holds the list of wells to analyze
}

//Define feature and cutoff for survival groups. Define comparison i.e after cutoff or all other cells or never events
SelectedFeature = "None";
cutoff = 0;
UseAllCells = "No";

if (comparison == "Within Wells" || comparison == "All Files in Folder"){
	Dialog.create("Compare Survival Within Wells");
	Dialog.addMessage("Compare "+comparison+" selected.");
	Dialog.addRadioButtonGroup("Group By:", newArray("PrimaryFeature", "SecondaryFeature"), 1, 2, "PrimaryFeature");
	    
}
if (comparison == "Between Wells"){
	Dialog.create("Compare Survival Between Wells");
	Dialog.addMessage("Compare "+comparison+" Selected.");
	Dialog.addRadioButtonGroup("Restrict analysis to cells with:", newArray("PrimaryFeature", "SecondaryFeature"), 1, 2, "PrimaryFeature");  
   //2020 added to increase number of comparisons possible
   Dialog.addRadioButtonGroup("Occuring:", newArray("On or before cutoff", "After cutoff", "Never"), 3, 1, "On or before cutoff");
   Dialog.addNumber("Cutoff timepoint:", cutoff);

}
   

   
   //2020 removed followign line //Dialog.addNumber("On or before timepoint:", cutoff);
   
   if (comparison != "Between Wells"){ 
    Dialog.addNumber("On or before timepoint:", cutoff);
    Dialog.addRadioButtonGroup("Compare to:", newArray("Cells without events at all times", "Cells with events after cutoff", "All other cells"), 3, 1, "All other cells");
   }
   
if (comparison == "Between Wells"){
	Dialog.addRadioButtonGroup("OR use all cells:", newArray("Yes", "No"), 1, 2, "No");  
}

//Define feature for cumulative event analysis
if (comparison == "OR: Compare Cumulative Events Between Wells"){
	Dialog.create("Compare Cumulative Events Between Wells");
	Dialog.addMessage("Compare Cumulative Events Selected.");
	Dialog.addRadioButtonGroup("Compare which events:", newArray("PrimaryFeature", "SecondaryFeature"), 1, 2, "PrimaryFeature");
	   //Below line can be substutited for compare events switch, but Kaplan Meier better for survival analysis
	//Dialog.addRadioButtonGroup("Compare which events:", newArray("Survival", "PrimaryFeature", "SecondaryFeature");    

}
    
    Dialog.show(); 
    SelectedFeature = Dialog.getRadioButton();
    cutoff = Dialog.getNumber();
    // 2020 removed: && comparison != "Between Wells" below to allow more comparisons between wells
    if (comparison != "OR: Compare Cumulative Events Between Wells"){
    CompareTo = Dialog.getRadioButton();
    }
if (comparison == "Between Wells"){
	UseAllCells = Dialog.getRadioButton(); 
}
if(UseAllCells == "No"){
print("Selected Feature: "+SelectedFeature);
}
if(UseAllCells == "Yes"){
print("Use All Cells: "+UseAllCells);
}



print("Cutoff: "+cutoff);

//Create group names for strings

WellString1 = "";
WellString2 = "";

if (comparison == "Between Wells" || comparison == "OR: Compare Cumulative Events Between Wells"){	
//wellstring1 from G1AwellsAnalyze
//List of wells in group 1
for (k=0; k<G1AwellsAnalyze.length; k++){
	WellString1 = WellString1+G1AwellsAnalyze[k]+"-";
}

//List of wells in group 2
for (k=0; k<G2AwellsAnalyze.length; k++){
	WellString2 = WellString2+G2AwellsAnalyze[k]+"-";
}
//Remove feature if compare all cells selected
if(UseAllCells == "Yes"){
	SelectedFeature = "NoFeature";
}

}

if (comparison == "All Files in Folder"){	
    WellString2 = "AllWells";
    WellString1 = "AllWells";
}

if (comparison == "Within Wells"){	
    //List of wells in analysis
for (k=0; k<AwellsAnalyze.length; k++){
	WellString2 = WellString2+AwellsAnalyze[k]+"-";
	WellString1 = WellString2;
}
   
}

//Eventual save as name
//WellString+"_"+SelectedFeature+"_"+Comparator+"_"+cutoff".txt"

G1operator = "_OnOrBefore_";

// reference for below statements: Dialog.addRadioButtonGroup("Compare to:", newArray("Cells with events after cutoff", "All other cells"), 1, 2, "All other cells"); CompareTo 

if(CompareTo == "Cells without events at all times"){
G2operator = "_Never_";}

if(CompareTo == "Cells with events after cutoff"){
G2operator = "_After_";}

if(CompareTo == "All other cells"){
G2operator = "_AllOthers_";}

if (comparison == "Between Wells") {
	if(CompareTo == "On or before cutoff"){
	G1operator = "_OnOrBefore_";
	}

	if(CompareTo == "After cutoff"){
	G1operator = "_After_";
	}

	if(CompareTo == "Never"){
	G1operator = "_Never_";
	}

	//Compare between wells - need groups to have the same intake criteria
	G2operator = G1operator;}

if (comparison == "OR: Compare Cumulative Events Between Wells") {
	G1operator = "_Events_";
    G2operator = "_Events_";
    cutoff = "Cumulative";
	
}


Aplotgroup = newArray(WellString1+"_"+SelectedFeature+G1operator+cutoff, WellString2+"_"+SelectedFeature+G2operator+cutoff);
print("Plotgroups Array");
//Print the array that contains conditions for reading in data (from .txt files of single cells).
Array.print(Aplotgroup);
//Create name for auto-generated .png plots

plotgroup = WellString1+"_"+SelectedFeature+G1operator+cutoff+"_Vs_"+WellString2+"_"+SelectedFeature+G2operator+cutoff;


/*New variables - 
comparison
UseAllCells
SelectedFeature
cutoff

AwellsAnalyze
G1AwellsAnalyze
G2AwellsAnalyze
*/
//

//Combine classes?

//combine = "Yes"; // Commented out 2020 Answer is always yes. 
advancedgraphing = "Yes";



//Run setup macro if not already run to set folders
if (stringpath=="Test"){
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
project = ""+year+"-"+month+1+"-"+dayOfMonth;
Dialog.create("Set project name");  
Dialog.addString("To begin, enter a project name:", project, 15);
//2020 - remove option to specify string locatons - can be restored for testing new single cell .txt file data structure.
//Dialog.addNumber("Group String Location:", GroupStringLocation);
//Dialog.addNumber("Lifespan String Location:", LifespanStringLocation);
//Dialog.addNumber("Aggregate Lifespan String Location:", AggregateStringLocation);
//Dialog.addNumber("Feature 2 Lifespan String Location:", Feature2LifespanStringLocation);
//Dialog.addNumber("Timepoints String Location:", TimepointStringLocation);
//Dialog.addNumber("Censor String Location:", CensorStringLocation);
//Dialog.addString("Override Plot Groups:", plotgroup);
Dialog.show(); 

project = Dialog.getString();
//Need to keep string over 1 due to downstream error in logrank function
if (lengthOf(project) < 2){
	project = project+"x";
}

//GroupStringLocation = Dialog.getNumber();
//LifespanStringLocation = Dialog.getNumber();
//AggregateStringLocation = Dialog.getNumber();
//Feature2LifespanStringLocation = Dialog.getNumber();
//TimepointStringLocation = Dialog.getNumber();
//CensorStringLocation = Dialog.getNumber();
//plotgroup = Dialog.getString();


stringpath = getDirectory("Choose an input directory for single cell .txt data files");
output = getDirectory("Choose an output directory for general use");


stringpath2 = output+project+"_Aggregate_Group_Lifespan\\";
stringpath3 = output+project+"_Aggregate_Group_Lifespan_Statistics\\";
stringpath4 = output+project+"_Aggregate_Group_Histogram\\";
stringpath5 = output+project+"_Raw_Group_Survival\\";
stringpath6 = output+project+"_Probability_Group_Survival\\";
stringpath7 = output+project+"_Aggregate_Group_Censor_Lifespan\\";
stringpath8 = output+project+"_Aggregate_Group_Censor_Histogram\\";
plotpath = output+project+"_Aggregate_Group_Survival_Plots\\";

//Don't need aligned z-stack folder for this, kept to make it clearer how this relates to the setup file. Also don't create the CSV folder here.
//if (File.exists(output2)==0){
//File.makeDirectory(output2);
//}

//Define stringpath manually above, so skip here
//if (File.exists(stringpath)==0){
//File.makeDirectory(stringpath);
//}

if (File.exists(stringpath2)==0){
File.makeDirectory(stringpath2);
}

if (File.exists(stringpath3)==0){
File.makeDirectory(stringpath3);
}

if (File.exists(stringpath4)==0){
File.makeDirectory(stringpath4);
}

if (File.exists(stringpath5)==0){
File.makeDirectory(stringpath5);
}

if (File.exists(stringpath6)==0){
File.makeDirectory(stringpath6);
}

if (File.exists(stringpath7)==0){
File.makeDirectory(stringpath7);
}

if (File.exists(stringpath8)==0){
File.makeDirectory(stringpath8);
}

if (File.exists(plotpath)==0){
File.makeDirectory(plotpath);
}


}

if (advancedgraphing=="Yes"){

if(comparison == "OR: Compare Cumulative Events Between Wells"){
Ylabel = CumYlabel;
Plotlabel = CumPlotlabel;
} else {
Plotlabel = SPlotlabel;
Ylabel = SYlabel;}

if(plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
var Plotlabel = RiskPlotlabel;
var Ylabel = RiskYlabel;
}


Dialog.create("Graphing Setup");  
Dialog.addMessage("Project Designation: "+project);
//Dialog.addString("To begin, enter project/condition name:", project);
//2020 - removed this feature - can restore to test different single cell txt file structures.
//Dialog.addNumber("Group String Location:", GroupStringLocation);
//Dialog.addNumber("Lifespan String Location:", LifespanStringLocation);
//Dialog.addNumber("Aggregate Lifespan String Location:", AggregateStringLocation);
//Dialog.addNumber("Timepoints String Location:", TimepointStringLocation);
//Dialog.addNumber("Censor String Location:", CensorStringLocation);
//Dialog.addString("Override Plot Groups:", plotgroup);
Dialog.addString("Plot Title:", Plotlabel, lengthOf(Plotlabel));
Dialog.addString("X-Axis Label:", Xlabel, lengthOf(Xlabel));
Dialog.addString("Y-Axis Label:", Ylabel, lengthOf(Ylabel));
Dialog.addMessage("-Default plot options can be changed in 'edit'/'options'/'plot options'. \n-Change before plotting if desired.");
if (combine == "No"){
Dialog.addRadioButtonGroup("Plot color palette:", Palettes, 1, 5, "BrewerDark2")

Dialog.addNumber("Shift plot colors by integer:", rot);
}
Dialog.addRadioButtonGroup("Custom Legend?", newArray("Yes", "No"), 1, 2, customlegend);
if (combine == "Yes"){
Dialog.addString("Group 1 Plot Color:", G1Color,lengthOf(G1Color));
Dialog.addString("Group 2 Plot Color:", G2Color, lengthOf(G2Color));
}
Dialog.addNumber("Plot Font:", plotfont);
Dialog.addNumber("Plot Line Thickness:", survline);
Dialog.addNumber("Plot Censor Cross Thickness:", censorline);
//2021 added
Dialog.addRadioButtonGroup("Plot Profile:", newArray("Linear", "Step"), 1, 2, "Linear");

Dialog.show(); 

//project = Dialog.getString();
//GroupStringLocation = Dialog.getNumber();
//LifespanStringLocation = Dialog.getNumber();
//AggregateStringLocation = Dialog.getNumber();
//TimepointStringLocation = Dialog.getNumber();
//CensorStringLocation = Dialog.getNumber();
//plotgroup = Dialog.getString();
Plotlabel = Dialog.getString();
Xlabel = Dialog.getString();
Ylabel = Dialog.getString();
if (combine == "No"){


palette = Dialog.getRadioButton();
if(palette == "IJColors"){
colorsChoice = Array.copy(IJColors);
}
if(palette == "BrewerPaired"){
colorsChoice = Array.copy(BrewerPaired);
}

if(palette == "BrewerDark2"){
colorsChoice = Array.copy(BrewerDark2);
}

if(palette == "RSafe"){
colorsChoice = Array.copy(RSafe);
}

if(palette == "OkabeIto"){
colorsChoice = Array.copy(OkabeIto);
}

rot = Dialog.getNumber();
}
customlegend = Dialog.getRadioButton();
if (combine == "Yes"){
G1Color =  Dialog.getString();
G2Color =  Dialog.getString();
}
plotfont = Dialog.getNumber();
survline = Dialog.getNumber();
censorline = Dialog.getNumber();

}
plotprofile = Dialog.getRadioButton();
/////revised 2020
//Use group index array to make arrays/strings for lifespan of each class in the individual cell info folder - uses lifespan location variable for lookup. Output to stringpath2
//for (i=0; i<AGroups.length; i++){
//Open all file in stringpath and add lifespan and Censor state to group1 or group2 as appropriate. 
list2 = getFileList(stringpath);//List of .txt data files

for (j = 0; j < Aplotgroup.length; j++) {

for (i = 0; i<list2.length; i++){

//Open all files, split into an array containing each data element
prestring = File.openAsString(stringpath+list2[i]);
Astring = split(prestring, ";"); //All info in file split into array
//Remove blank space at end of array
Astring = Array.trim(Astring, Astring.length-1); //2020 added to debug
//Read in variables
stringS = Astring[GroupStringLocation]; //(Not used)Basic group of cell (AAA, AOA, AOD...) unused in this part of macro, is used to classify from t0 and to overlay images
groupS = Astring[GroupStringLocation];//(Not used)Same as above, legacy variable

lifespanS = Astring[LifespanStringLocation];//(USED)Lifespan of cell, if =timepoints, the cell will be censored later (not automatically censored current data gathering)*******
lifespanS = parseInt(lifespanS); // Must be integer

aggregateS= Astring[AggregateStringLocation]; //(Not used)This is aggregate lifespan
aggregateS = parseInt(aggregateS); // Must be integer

F2LifespanS = Astring[Feature2LifespanStringLocation]; //(NotUsed) This is feature 2 lifespan
F2LifespanS = parseInt(F2LifespanS); // Must be integer

TimepointsS = Astring[TimepointStringLocation]; //(USED)This is how many timepoints in the experiment*******

TimepointsS = parseInt(TimepointsS); // Must be integer


if(i==0 && j==0){
Dialog.create("Set Endpoint");
      Dialog.addMessage("Set a final timepoint for analysis.");
      Dialog.addMessage("Autofill number below is max timepoint in the first single cell data file.");
      Dialog.addNumber("Graph and analyze to timepoint:", TimepointsS);
      Dialog.show();
      timepoints = Dialog.getNumber();
      }
      //Reassign max timepoint in each loop
      TimepointsS = timepoints;
////////////////////////////////////////////////////////
CensorS = Astring[CensorStringLocation]; //(USED)This is if the cell is censored*********
AggstartZS = Astring[AggstartZLocation]; //(USED)This is the z frame that the aggregate (feature 1) starts in **********
AggstartZS = parseInt(AggstartZS); // Must be integer

F2LifespanS = Astring[Feature2LifespanLocation]; //(Not used)How long the cell remains in the state of second feature
F2LifespanS = parseInt(F2LifespanS); // Must be integer

F2startZS = Astring[Feature2StartZLocation]; //(USED)Timepoing (Z-plane in stack) where 2nd feature starts********
F2startZS = parseInt(F2startZS); // Must be integer

WellS = Astring[WellLocation]; //(USED)Well in which cell is located*********

//Censor cells that survived to the final timepoint (also if analysis is right-truncated) and truncate lifespan if over timepoints to be plotted/analyzed.
if(lifespanS >= TimepointsS){
	CensorS="censored";
	lifespanS = TimepointsS;
	}
//With loaded variables for each string, assign identity to G1, G2, Gnone
//Aplotgroup defines classes: 
//Aplotgroup = newArray(WellString1+"_"+SelectedFeature+"_OnOrBefore_"+cutoff, WellString2+"_"+SelectedFeature+G2operator+cutoff);
//Group can equal "Group1" or "Group2"
/*
 * Key for Aplotgroup: 0=Wells, 1=Selected feature, 2=text specification of operator (<=, >, none), 3=cutoff applied to selected feature via operator.
 */

//Create Test based off of Aplotgroup//
Aplotgroup_Jth = split(Aplotgroup[j], "_");
cutoff = Aplotgroup_Jth[3];//Timepoint cuttoff for whichever feature is being used to group cells for survival analysis.
//If Output of below is GTest = 1, then the lifespan and censor strings are added to the group string, which is then saved and operated on for statistics and survival plots.
GTest = 0;//Set initial state of GTest to 0. 
//Test for group 1 membership first (defined by on or before <=)
//if(Group=="Group1") {//Commented out 2020
	if(indexOf(Aplotgroup_Jth[0], WellS+"-") != -1 || Aplotgroup_Jth[0] == "AllWells"){    //well of cell is in the group or all wells are selected --> continue
		
		//Setup variables  "PrimaryFeature", "SecondaryFeature"
		if(Aplotgroup_Jth[1] == "PrimaryFeature"){
			Feature = AggstartZS;
		}
		if(Aplotgroup_Jth[1] == "SecondaryFeature"){
			Feature = F2startZS;
		}
		if(Aplotgroup_Jth[1] == "NoFeature"){
			Feature = 9999; //9999 is used as a placeholder for unfilled integer variables. 
			GTest = 1;//No feature only used if comparing all cells between two wells for overall survival - if above conditions are met (well only), then add to group
		}

         //Ensure feature is read as an integer - values below 9 being read incorrectly by comparators below. 2020 debug
		Feature = parseInt(Feature);
		
		//Test feature vs cutoff using operator specific to group. Group is defiend by the 2 element array Aplotgroup.This is split by "_" characters into useful information. 
		
		if(Aplotgroup_Jth[2] == "Never"){
			if(Feature == 9999){
				GTest = 1;
			}
		}
		
		if(Aplotgroup_Jth[2] == "OnOrBefore"){
			if(Feature <= cutoff){
				//print("Debug Feature ="+Feature+" Cutoff="+cutoff); //Lifespans less than 10 are not getting counted here - string vs integer problem
				GTest = 1;
			}
		}
		if(Aplotgroup_Jth[2] == "After"){
			if(Feature > cutoff || Feature != 9999){ //9999 is used as a placeholder for unfilled integer variables. 
				GTest = 1;
			}
		}


	if(Aplotgroup_Jth[2] == "AllOthers"){
			if(Feature > cutoff || Feature == 9999){ //9999 is used as a placeholder for unfilled integer variables. 
				GTest = 1;
			}
		}
	
//2020 debug The "survival" events analysis code below is inactive/never evaluated because Kaplan Meier is to be used for survival. Option to enter is commented out above. 
				if(Aplotgroup_Jth[2] == "Events"){
			//if(Feature > cutoff || Feature != 9999){ //9999 is used as a placeholder for unfilled integer variables. 
				GTest = 1;
				if(SelectedFeature == "Survival" && lifespanS == TimepointsS){
				GTest = 0;
				}
				if(SelectedFeature == "Survival" && lifespanS != TimepointsS && CensorS=="censored"){
				GTest = 0;
				}
		}

		
		}



//Test for group 1 membership first (defined by on or before > or <= depening upon G2 operator)
//if (Group=="Group2") {...
	



//Create lifespan and censor strings. Changed to remove zero lifespans debug later if needed
if (GTest==1 && lifespanS > 0 && comparison != "OR: Compare Cumulative Events Between Wells" ) {
	ALifespan = Array.concat(ALifespan, lifespanS);
	if (CensorS=="censored"){
		ACensorLifespan = Array.concat(ACensorLifespan, lifespanS);
	}
}
//Create strings for cumulate event analysis as above for lifespan, swaping variables and removing cells with 0 or 9999 in varibale and setting all data to uncensored (censor can only occur after event if event is present)
if (GTest==1 && lifespanS > 0 && comparison == "OR: Compare Cumulative Events Between Wells" ) {
	//No censoring for culumative event analysiss (only includes cells with events)
	CensorS= "uncensored";
	Event = 0;
	Cutoff = SelectedFeature;
	if (SelectedFeature == "Survival"){
	Event = lifespanS;
	}
		
		if (SelectedFeature == "PrimaryFeature"){
	Event = AggstartZS;
	}
	
		if (SelectedFeature == "SecondaryFeature"){
	Event = F2startZS;
	}
	
	

	if(Event != 0 && Event != 9999){
	ALifespan = Array.concat(ALifespan, Event);
	}

}


}

for (k=0; k<ALifespan.length; k++){
	outputstring = outputstring+ALifespan[k]+";";
}
//Lifespan output file
File.saveString(outputstring, stringpath2+Aplotgroup[j]+"_"+project+".txt");

for (l=0; l<ACensorLifespan.length; l++){
	outputstring2 = outputstring2+ACensorLifespan[l]+";";
}
//Censor points output file ("Lifespan" of censored objects)
File.saveString(outputstring2, stringpath7+Aplotgroup[j]+"_"+project+"_Censor_Lifespans.txt");

//debug//Array.show("Lifespan_"+AGroups[i], ALifespan);
ALifespan = newArray( );
ACensorLifespan = newArray( ); 
print(Aplotgroup[j]+"lifespans: "+outputstring);
print(Aplotgroup[j]+"censor lifespans: "+outputstring2);
outputstring = "";
outputstring2 = "";
}


//Take aggregate text files and get stats, output to stringpath3 = output+project+"_Aggregate_Group_Lifespan_Statistics"
list = getFileList(stringpath2);
for (i=0; i<list.length; i++){
prestring = File.openAsString(stringpath2+list[i]);
name = list[i];
name = substring(name, 0, lengthOf(name)-4);
Astring = newArray( );
Astring = split(prestring, ";");
//Remove blank space at end of array
Astring = Array.trim(Astring, Astring.length-1); 
Array.getStatistics(Astring, min, max, mean, stdDev);
Array.print(name+"lifespans: ", Astring);
File.saveString(name+"; min_"+min+"; max_"+max+"; mean_"+mean+"; stdDev_"+stdDev+"; n_"+Astring.length, stringpath3+name+"_Stats.txt");
}


//Make censor histogram count files
list = getFileList(stringpath7);

for (i=0; i<list.length; i++){
prestring = File.openAsString(stringpath7+list[i]);
name = list[i];
name = substring(name, 0, lengthOf(name)-4);
Astring = newArray( );
Astring = split(prestring, ";");
//Remove blank space at end of array
Astring = Array.trim(Astring, Astring.length-1); 
//2020 non-image-based calculations added, but unused: function called "deathcounts"
//from macro "Histogram of Results...", makes histogram of censorship data {
      n = Astring.length;
      if (n==0){
      	n=1;
      	Astring = newArray(0,0);
      }
      //n2 is total number of surviving cells
      n2 = n;
     
      if(legacyhistogram != "deathcounts"){
      /////////////Begin histogram///////////////
      nBins = timepoints;
      setBatchMode(true);
      newImage(name+"Histo", "32-bit", n, 1, 1);
      for (j=0; j<n; j++){
           setPixel(j, 0, Astring[j]);
      }
      getHistogram(values, counts, nBins, 0, nBins);
      selectImage(name+"Histo");
      close();
      setBatchMode(false);
      Array.print(name+"Values: ", values);
      Array.print(name+"Counts: ", counts);
           ///////////End Histogram////////////////
      }else { 
     counts = deathcounts(timepoints, Astring);
     }
      //Error of overcounting censored cells on first timepoint - requires verifcation.
      if (counts[0]==1){
      	counts[0] = 0;
      }
       if (counts[0]>1){
      	counts[0] =counts[0]-1;
      }

     
    //Save censor histogram counts as a string (stringpath8)
	outputstring = "";
      	for (o=0; o<counts.length; o++){
	outputstring = outputstring+counts[o]+";";
         }
        File.saveString(outputstring, stringpath8+name+"_Censor_Histogram_Count.txt");
        outputstring = "";
}

//////////////////////////////Make survival count files - uses histogram instead of Array math, change in future for simplicity.
//from macro "Histogram of Results...", makes histogram of raw survival data 

list = getFileList(stringpath2);

for (i=0; i<list.length; i++){
prestring = File.openAsString(stringpath2+list[i]);
name = list[i];
name = substring(name, 0, lengthOf(name)-4);
Astring = newArray( );
Astring = split(prestring, ";");
//Remove blank space at end of array
Astring = Array.trim(Astring, Astring.length-1); 

//from macro "Histogram of Results...", makes histogram of raw survival data {
      n = Astring.length;
       //Fixes error if no cells are censored
       if (n==0){
      	n=1;
      	Astring = newArray(0,0);
      }
      //n2 is total number of surviving cells
      n2 = n;
      
      
      if(legacyhistogram != "deathcounts"){
      /////////////Begin histogram///////////////
      nBins = timepoints;
      setBatchMode(true);
      newImage(name+"Histo", "32-bit", n, 1, 1);
      for (j=0; j<n; j++){
           setPixel(j, 0, Astring[j]);
      }
      getHistogram(values, counts, nBins, 0, nBins);
      selectImage(name+"Histo");
      close();
      setBatchMode(false);
      Array.print(name+"Values :", values);
      Array.print(name+"Counts :", counts);
           ///////////End Histogram////////////////
      }else { 
     counts = deathcounts(timepoints, Astring);
     }
      
      Arawsurvival = newArray(counts.length);
      
      for (k=0; k<counts.length; k++){
      	Arawsurvival[k] = n2-counts[k];
      	n2 = n2-counts[k];
      }
      	
      	
        //Save histogram counts as a string (stringpath4)
	outputstring = "";
      	for (o=0; o<counts.length; o++){
	outputstring = outputstring+counts[o]+";";
         }
        File.saveString(outputstring, stringpath4+name+"_Histogram_Count.txt");
        outputstring = "";
      	
      	//Save Raw survival as a string (Stringpath5)
      	outputstring = "";
      	for (l=0; l<Arawsurvival.length; l++){
	outputstring = outputstring+Arawsurvival[l]+";";
         }
        File.saveString(outputstring, stringpath5+name+"_Raw_Survival.txt");
        outputstring = "";
		
     	//Reset arrays
      	Arawsurvival = newArray();
        
      }

//Calcualte PROBABILITY OF SURVIVAL from raw survival and censor strings, save to stringpath6
//create/clear working array
	        Asurvivalprob = newArray();
	        prestring8 = "";
	        prestring = "";
	      
	       //Get file lists of raw survival(stringpath5) and censor(stringpath8) files  
	        list5 = getFileList(stringpath5);
	        list8 = getFileList(stringpath8);
	       
	        //Open each file as a string, make into array, take name to open censor string and make into array
	        for (i=0; i<list5.length; i++){
	        prestring = File.openAsString(stringpath5+list5[i]);
	        Arawsurvival = newArray();
	        Arawsurvival = split(prestring, ";");
	        Arawsurvival = Array.trim(Arawsurvival, Arawsurvival.length-1);
	        
	        //debugging 
	        Array.print("Arawsurvival"+list5[i], Arawsurvival);
	        
	        //get group name 
	        file5 = list5[i];
            index = indexOf(file5, "_"+project+"_");
            name5 = substring(file5, 0, index);	
            filenumbertest = 0;
            //open censor file for group        
	        for (k=0; k<list8.length; k++){
            file8 = list8[k];
            if (startsWith(file8, name5)==1){
            prestring8 = File.openAsString(stringpath8+list8[k]);
            Acensor = newArray();
        	Acensor = split(prestring8, ";");
        	 if (filenumbertest>0){
            	print("More than one censor file matches the same naming/index criteria - check for duplicate files.");
            	exit;
            }
        	//Remove blank space at end of array
	        Acensor = Array.trim(Acensor, Acensor.length-1);
	        //debugging
	        //Array.print("AcensorPlot2560"+name5, Acensor);
	        filenumbertest = filenumbertest+1;
            }}
                    

            //Calculate probability of survival - S(k)=p[0]*p[1]*p[2]..., p[i]=(total alive[i]-deaths[i])/total alive[i]. (Bewick et al Critical Care 2004 8:389-394)
           Asurvivalprob = newArray(Arawsurvival.length);
           
           //Fix error with censor array of 0 length when no censored data is present
           censortest = Acensor.length;
           if(censortest==0){
           	//Array.print("AcensorPre"+name5, Acensor); // for debugging
           	Acensor = newArray(Arawsurvival.length);
           	Array.fill(Acensor, 0);
           	print("No censor data found for "+name5+", filled with 0s");
           	//Array.print("AcensorPost_2575"+name5, Acensor); // for debugging
           }
           
           //Set first value of p-survival
           //Alternative approach with probability of survival shifted one position backwards
           //Asurvivalprob[0] = (((Arawsurvival[0])-((Arawsurvival[0])-(Arawsurvival[1])+(Acensor[1])))/(Arawsurvival[0]));
           Asurvivalprob[0] = 1;
           //Subsequent values are products of all prior values - calculate probability of survival to time t(i)
           for (j=1; j<Arawsurvival.length; j++){
                     
           Asurvivalprob[j] = ((Asurvivalprob[j-1]) * (((Arawsurvival[j-1]) - ((Arawsurvival[j-1]) - (Arawsurvival[j]) - (Acensor[j]))) / (Arawsurvival[j-1])));
                      
           if ((isNaN(Asurvivalprob[j]))==1){
           	Asurvivalprob[j] = 0;
           }
                    
           }
           
          
         //For cumulative events: events = 1-survival probability
         
          if(indexOf(file5, "_Cumulative_") > 0){
          for (n = 0; n < Asurvivalprob.length; n++) {
          Asurvivalprob[n] = (1 - Asurvivalprob[n]);
          }}
            
           
           //Alternate approach as above. No deaths visible after last timepoint 
           //Asurvivalprob[Asurvivalprob.length-1] = Asurvivalprob[Asurvivalprob.length-2];
           
           //debugging
           Array.print(name5+" Asurvivalprob", Asurvivalprob);
           
           //Save survival probability as string (stringpath6)
	outputstring = "";
      	for (m=0; m<Asurvivalprob.length; m++){
	outputstring = outputstring+Asurvivalprob[m]+";";
         }
        File.saveString(outputstring, stringpath6+name5+"_"+project+"_Survival_Probability.txt");
        outputstring = "";
            
            //Reset arrays and strings
            Arawsurvival = newArray();
            Asurvivalprob = newArray();
            Acensor = newArray();
            
            }
            
            //below "}" used to end the grapher/analyzer macro
            //}

      
//Plot survival curves and output image to plotpath = output+project+"_Aggregate_Group_Survival_Plots"

macro "Create Plot"{
//run("Close All");
if(comparison == "OR: Compare Cumulative Events Between Wells"){
Ylabel = CumYlabel;
Plotlabel = CumPlotlabel;
} else {
Plotlabel = SPlotlabel;
Ylabel = SYlabel;}

if(plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
var Plotlabel = RiskPlotlabel;
var Ylabel = RiskYlabel;
}



if (combine=="No"){
Plot.create(Plotlabel, Xlabel, Ylabel);
Plot.setFontSize(plotfont);
Plot.setLineWidth(survline);
//Plot limits - debug - possible to remove this and make automatic. 
Plot.setLimits(0, timepoints, 0, 1.1);


//Get files from folder to be plotted into array form (stringpath6)
list = getFileList(stringpath6);
for (i=0; i<list.length; i++){
	prestring = File.openAsString(stringpath6+list[i]);
	name = list[i];
	//2020 remove// 
	name = substring(name, 0, lengthOf(name)-25);
	Astring = newArray( );
	Astring = split(prestring, ";");
	//Remove blank space at end of array
	Astring = Array.trim(Astring, Astring.length-1); 
    //Idenfity corresponding censor log
     filenumbertest = 0;
            //open censor file for group        
	        for (k=0; k<list8.length; k++){
            file8 = list8[k];
            if (startsWith(file8, name)==1){
            prestring8 = File.openAsString(stringpath8+list8[k]);
            Acensor = newArray();
        	Acensor = split(prestring8, ";");
        	 if (filenumbertest>0){
            	print("More than one censor file matches the same naming/index criteria - check for duplicate files.");
            	exit;
            }
        	//Remove blank space at end of array
	        Acensor = Array.trim(Acensor, Acensor.length-1);
	        //debugging
	        //Array.print("AcensorPlot_"+name, Acensor);
	        filenumbertest = filenumbertest+1;
            }}
        ///////

        colorsA = colorsChoice;
        rot = i;
        Array.rotate(colorsA, rot);       
        nColor = colorsA[0];
        Plot.setColor(nColor);

/*
 * 2021 adding step plot
 * var plotprofile = "Linear"; // vs "Step"
 //SURVIVAL vs. RISK PLOT transformation of Astring (group survival probability from 0-1)
//var plottype = "Survival"; // vs "Risk of Death"
 */

if (plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
    Astringrisk = newArray(Astring.length);
for (z = 0; z < Astring.length; z++) {
	Astringrisk[z]= (1-Astring[z]);
}
Astring = Astringrisk;
}


    if (plotprofile == "Linear"){
    Plot.add("line", Astring);
    }
        if (plotprofile == "Step"){
    modX = XStepFunction(Astring);
    modY = YStepFunction(Astring);
    Plot.add("line", modX, modY);
    } 
       
        
        //2021 replace this line with above 
        //Plot.add("line", Astring);
        ///////////////////////////
        //Plot.addLegend(name, "Auto");
        if (i==0){ 
        	legend = name;
        }
        if (i>0){
        	legend = legend+"\n"+name;
        }
        //Plot.setLegend(name) 
         
         ////ADD CENSOR LINES HERE
        //CreateCensorCrosses(yValues, censorArray);
        Plot.setLineWidth(censorline);
        CreateCensorCrosses(Astring, Acensor);
        Plot.setLineWidth(survline);
        //suppress legend for censor values
        legend = legend+"\n";
        }
         if (customlegend=="Yes"){
        legend = replace(legend, "\\n", "%");
        print("Legend: "+legend);
        Dialog.create("Customize Graph Legend");  
        Dialog.addMessage("Edit legend string below. leave %% between plots ");
        Dialog.addString("Legend:", legend, lengthOf(legend));
        Dialog.show(); 
        legend = Dialog.getString();
        legend = replace(legend, "%", "\n");        
        }


        Plot.show();
        if(plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
Plot.setLimitsToFit();
}

        Plot.addLegend(legend, "transparent");
        //change above to "Auto" for opaque legend
        Plot.makeHighResolution("Survival_HR",4.0);
        saveAs("png", plotpath+project+"Survival_HiRes_"+plotgroup+".png");
    }
if (combine=="Yes"){
//plot each group from Aplotgroup in data analysis portion - revised version,2020
plotcounter = 0;
Alegend = newArray();
Plot.create("Group Survival", Xlabel, Ylabel);
Plot.setFontSize(plotfont);
Plot.setLineWidth(survline);
//debug want to remove this and make automatic - possibly updated imagej?
Plot.setLimits(0, timepoints, 0, 1.1);

//Get files from folder to be plotted into array form (stringpath6)
//stringpath6 = getDirectory("Choose TEXT file output directory for _Group_Survival_Probability");
list = getFileList(stringpath6);
legend = "";
for (i=0; i<list.length; i++){
	prestring = File.openAsString(stringpath6+list[i]);
	name = list[i];
	name = substring(name, 0, lengthOf(name)-25);
	Astring = newArray( );
	Astring = split(prestring, ";");
	//Remove blank space at end of array
	Astring = Array.trim(Astring, Astring.length-1); 
    //Test if file is in correct group   plotgroup is the array ////////////////
	    //groupgraph = startsWith(name, plotgroup); //Legacy
	    //groupgraph = startsWith(name, Aplotgroup[0]); //Legacy
////Revised Code below Added//////// 2020
	    
	    if(startsWith(name, Aplotgroup[0])==1 || startsWith(name, Aplotgroup[1])==1){
	      groupgraph = 1;
}

//Aplotgroup is a two element array with the names of each just-calculated pairwise comparison 
	//Idenfity corresponding censor log if positive group test result.
            if (groupgraph==1) {
            filenumbertest = 0;
            //open censor file for group        
	        for (k=0; k<list8.length; k++){
            file8 = list8[k];
            if (startsWith(file8, name)==1){
            prestring8 = File.openAsString(stringpath8+list8[k]);
            Acensor = newArray();
        	Acensor = split(prestring8, ";");
        	 if (filenumbertest>0){
            	print("More than one censor file matches the same naming/index criteria - check for duplicate files.");
            	exit;
            }
        	//Remove blank space at end of array
	        Acensor = Array.trim(Acensor, Acensor.length-1);
	        //debugging
	        //Array.print("AcensorPlot:"+name, Acensor);
	        filenumbertest = filenumbertest+1;
            }}}
        ///////
    //Plot for positive test result //Only in case of two groups so only need 2 colors in colorsA here 2020 debug
        if (groupgraph==1) {
        colorsA = newArray(G1Color, G2Color);
        nColor = colorsA[plotcounter];
        Plot.setColor(nColor);

/*
 * debug - 2021 adding step plot
 * var plotprofile = "Linear"; // vs "Step"
 //SURVIVAL vs. RISK PLOT transformation of Astring (group survival probability from 0-1)
//var plottype = "Survival"; // vs "Risk of Death"
 */

if (plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
    Astringrisk = newArray(Astring.length);
for (z = 0; z < Astring.length; z++) {
	Astringrisk[z]= (1-Astring[z]);
}
Astring = Astringrisk;
}


    if (plotprofile == "Linear"){
    Plot.add("line", Astring);
    }
        if (plotprofile == "Step"){
    modX = XStepFunction(Astring);
    modY = YStepFunction(Astring);
    Plot.add("line", modX, modY);
    } 
       

        //add survival line - 2021 remove below line for above with more options
        //Plot.add("line", Astring);
        if (legend!=""){
        	legend = legend+"\n"+name;
        }
        
        if (legend==""){ 
        	legend = name;
        }
        plotcounter = plotcounter+1;
        
        ////ADD CENSOR LINES HERE
        //CreateCensorCrosses(yValues, censorArray);
        Plot.setLineWidth(censorline);
        CreateCensorCrosses(Astring, Acensor);
        Plot.setLineWidth(survline);
        //suppress legend for censor values
        legend = legend+"\n";  
        }
        //2020 DEBUG WORKING HERE
        groupgraph=0; 
        }
        ///NEED TO END THIS PART WITH 2 PLOTS - the two desired from earlier grouping variables. /////////////////////////////////////////////////////////////////////////
        //chi squared test
        //get names of groups involved, test if there are 2. If so, proceed to chi squared from overall survival files. 
        if (plotcounter==2){
            name3 = "";
            list3 = getFileList(stringpath5);//Raw data
            Alegend = split(legend, "\n");
             //open raw survival files corresponding to each of the two groups in legend. 
            //AGroup1
            file2 = Alegend[0];
            index = indexOf(file2, project);
            file2 = substring(file2, 0, index);
            for (k=0; k<list3.length; k++){
            name3 = list3[k];
            
            if (startsWith(name3, file2)==1){
            prestring2 = File.openAsString(stringpath5+list3[k]);
            print("Logrank Opening "+list3[k]+" as AgroupA");
            }	
            }
        	AgroupA = split(prestring2, ";");
	        //Remove blank space at end of array
	        AgroupA = Array.trim(AgroupA, AgroupA.length-1);
	        
	       
	        //Agroup2
	        file2 = Alegend[2];
	        index = indexOf(file2, project);
            file2 = substring(file2, 0, index);
            for (k=0; k<list3.length; k++){
            name3 = list3[k];
            if (startsWith(name3, file2)==1){
            prestring2 = File.openAsString(stringpath5+list3[k]);
            print("Logrank Opening "+list3[k]+" as AgroupB");
            }	
            }
        	AgroupB = split(prestring2, ";");
	        //Remove blank space at end of array
	        AgroupB = Array.trim(AgroupB, AgroupB.length-1);

	        //Open censor counts for each timepoint for each of the two groups
	         //AGroupA (1) Censor
	        AGroupACensor = newArray();
	        list3 = getFileList(stringpath8);
	        file2 = Alegend[0];
            index = indexOf(file2, project);
            file2 = substring(file2, 0, index);
            for (k=0; k<list3.length; k++){
            name3 = list3[k];
            if (startsWith(name3, file2)==1){
            prestring2 = File.openAsString(stringpath8+list3[k]);
            print("Logrank Opening "+list3[k]+" as AgroupACensor");
            }	
            }
        	AgroupACensor = split(prestring2, ";");
	        //Remove blank space at end of array
	        AgroupACensor = Array.trim(AgroupACensor, AgroupACensor.length-1);
  			Array.print("AgroupACensor", AgroupACensor);

	         //AGroupB (2) Censor
	        AGroupBCensor = newArray();
	        list3 = getFileList(stringpath8);
	        file2 = Alegend[2];
            index = indexOf(file2, project);
            file2 = substring(file2, 0, index);
            for (k=0; k<list3.length; k++){
            name3 = list3[k];
            if (startsWith(name3, file2)==1){
            prestring2 = File.openAsString(stringpath8+list3[k]);
            print("Logrank Opening "+list3[k]+" as AgroupBCensor");
            }	
            }
        	AgroupBCensor = split(prestring2, ";");
	        //Remove blank space at end of array
	        AgroupBCensor = Array.trim(AgroupBCensor, AgroupBCensor.length-1);
	        Array.print("AgroupBCensor", AgroupBCensor);
	        
	        //Calculate chi squared and p value. Add text to graph. 
        	significance = logrank(AgroupA, AgroupB, AgroupACensor, AgroupBCensor);
        	print("Significance", significance);
        	//2020 debug
        	Plot.setColor("black");
        	Plot.addText(significance, 0, 0);
        }    
       
       if (customlegend=="Yes"){
        legend = replace(legend, "\\n", "%");
        print("Legend: "+legend);
        Dialog.create("Customize Graph Legend");  
        Dialog.addMessage("Edit legend string below. leave %% between plots ");
        Dialog.addString("Legend:", legend, lengthOf(legend));
        Dialog.show(); 
        legend = Dialog.getString();
        legend = replace(legend, "%", "\n");        
        }
        


        Plot.show();

                if(plottype == "Risk of Death" && comparison != "OR: Compare Cumulative Events Between Wells"){
Plot.setLimitsToFit();
}
        Plot.addLegend(legend, "transparent");
        //change above to "Auto" for opaque legend
        Plot.makeHighResolution("Survival_HR",4.0);
        saveAs("png", plotpath+project+"Survival_HiRes_"+plotgroup+".png");
    }}


//Open macro for action bar buttons
macro "Open Z-Stack [o]"{
	//Designate which image to open
	Arows = newArray("A", "B", "C", "D", "E", "F", "G", "H");
    Acolumns = newArray("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12");
	listz = getFileList(dir2);
	Dialog.create("Open Next Z-Stack");
	Dialog.addMessage("Opening Z-stacks from: "+dir2);
	Dialog.addRadioButtonGroup("Row:", Arows, 1, 8, row);
    Dialog.addRadioButtonGroup("Column:", Acolumns, 1, 12, column);
	Dialog.addNumber("Image Counter (set to zero to move backwards in folder file list):", zp);
	Dialog.show(); 
	row = Dialog.getRadioButton();
    column = Dialog.getRadioButton();
    zp = Dialog.getNumber(); 
    well = row+column;
	//Close images that are already open to limit errant clicks with counter tool
	while (nImages>0) {
          selectImage(nImages);
          close(); 
      } 
	//open designated image
	for (d=zp; d<listz.length; d++){
		namez = listz[d];
		startz = startsWith(namez, well);
		if (startz==1){
		//Detect image position based on separator and position designator location (see initially defined variables)	
		Apos = split(namez, separator);
		position = Apos[separatorpos];
		open(dir2+listz[d]);
		zp = d;
		zp = zp+1;
		exit;
	}
	}
	
}

/////////////////

macro "Change Working Directories"{
	TempArray = newArray(6);
	Dialog.create("Current Working Directories");
	Dialog.addMessage("Check box to change.");
	Dialog.addCheckbox("Unstacked images input directory:  \n"+input, false);
	Dialog.addCheckbox("Main output directory:  \n"+dir, false);
	Dialog.addCheckbox("Aligned Z-Stack directory (Opened by [o]):  "+dir2, false);
	Dialog.addCheckbox("Merged Z-Stack directory (and change [o]):  "+mergeoutput, false);
	Dialog.addCheckbox("Single cell text files directory:  "+stringpath, false);
	Dialog.addCheckbox("Cell State & Location .csv files directory:  "+CSVpath, false);


	
	Dialog.show();
for(i=0; i < TempArray.length; i++){
	TempArray[i] = Dialog.getCheckbox();
}

if(TempArray[0] == true){
input = getDirectory("Choose Unstacked images input directory");
}

if(TempArray[1] == true){
dir = getDirectory("Choose Main output directory");
output = dir;
}

if(TempArray[2] == true){
dir2 = getDirectory("Choose Aligned Z-stack directory");
output2 = dir2;
}

if(TempArray[3] == true){
mergeoutput = getDirectory("Merged Z-Stack directory");
dir2 = mergeoutput;
}

if(TempArray[4] == true){
stringpath = getDirectory("Single cell text files directory");
}

if(TempArray[5] == true){
CSVpath = getDirectory("Cell State & Location .csv files directory");
}

//From setup for refrerence
//output = getDirectory("Choose an output directory for general use");
//dir=output;
//output2 = output+project+"_Aligned_Z_Stacks\\";
	
	 
	
}
/////////////////////////////////////////////////////////////////////// 
macro "Merge Channels"{
listz = getFileList(dir2);

//Wavelength and exposure detection
Awavelengths = newArray();
//var channelpos = 4 //commented out to accept changes for other image types
//var exposurepos = 2 //commented out to accept changes for other image types
setBatchMode(true);
for (i = 0; i < listz.length; i++) {
namez = listz[i];
Afile = split(namez, separator);
channel = Afile[channelpos];

//2020 debug
//Detect exposure if used
if (toString(exposurepos) == "None"){
exposure = "Test";
} else {exposure = Afile[exposurepos];
}

//complex channel for multiple exposures
if(exposure == "Test"){
string = channel;
} else {
string = channel+"-"+exposure;
}
//2020 revisions
//for simpler filenames or string = channel+"-Na";
//string = channel;


	
 
result = present(Awavelengths, string);

if (result==0) {
	Awavelengths = Array.concat(Awavelengths, string);
}
}

Awavelengths2 = Array.concat(Awavelengths, "Unused");
if(Awavelengths2.length == 1){
exit("Wavelengths not detected. Re-run setup and/or change file name structure")
}
columns = Awavelengths2.length;
Ausedwavelengths = newArray();
Dialog.create("Merge Multichannel");  
Dialog.addRadioButtonGroup("Red Channel (c1):", Awavelengths2, 1, columns, "Unused");
Dialog.addRadioButtonGroup("Cyan Channel (c5):", Awavelengths2, 1, columns, "Unused");
Dialog.addRadioButtonGroup("Green Channel (c2):", Awavelengths2, 1, columns, "Unused");
Dialog.addRadioButtonGroup("Magenta Channel (c6):", Awavelengths2, 1, columns, "Unused");
Dialog.addRadioButtonGroup("Blue Channel (c3):", Awavelengths2, 1, columns, "Unused");
Dialog.show(); 
c1 = Dialog.getRadioButton();
c5 = Dialog.getRadioButton();
c2 = Dialog.getRadioButton();
c6 = Dialog.getRadioButton();
c3 = Dialog.getRadioButton();

if (c1 != "Unused"){
	Ausedwavelengths = Array.concat(Ausedwavelengths, c1);
}

if (c5 != "Unused"){
	Ausedwavelengths = Array.concat(Ausedwavelengths, c5);
}

if (c2 != "Unused"){
	Ausedwavelengths = Array.concat(Ausedwavelengths, c2);
}

if (c6!= "Unused"){
	Ausedwavelengths = Array.concat(Ausedwavelengths, c6);
}

if (c3 != "Unused"){
	Ausedwavelengths = Array.concat(Ausedwavelengths, c3);
}
Array.print(Ausedwavelengths);
firstwavelength = Ausedwavelengths[0];
Afirstwavelength = split(firstwavelength, "-");
firstwavelength = Afirstwavelength[0];
filestring = "";
channelstring = "";

for (i = 0; i < listz.length; i++) {
file = listz[i];
filereset = file;
Afile = split(file, separator);
channel = Afile[channelpos];

if (channel == firstwavelength){
	if (c1 != "Unused"){
	//Write filename from array with edits 
	Achan = newArray();
	Achan = split(c1, "-");
	channel1 = Achan[0];
	exposure1 = Achan[1];
	namez = listz[i];
	Afile = split(namez, separator);
	Afile[channelpos] = channel1;
	Afile[exposurepos] = exposure1;
	file3 = Afile[0];
	for (j=1; j < Afile.length; j++){
	file3 = file3+separator+Afile[j];
	}
	//open file with newly written name
	open(dir2+file3);
	//add to merge instructions
	filestring = filestring+"c1="+file3+" ";
	channelstring = channelstring+channel1+"x";
	file3 = filereset;
	 }
	 
if (c2 != "Unused"){
	//Write filename from array with edits 
	Achan = newArray();
	Achan = split(c2, "-");
	channel1 = Achan[0];
	exposure1 = Achan[1];
	namez = listz[i];
	Afile = split(namez, separator);
	Afile[channelpos] = channel1;
	Afile[exposurepos] = exposure1;
	file3 = Afile[0];
	for (j=1; j < Afile.length; j++){
	file3 = file3+separator+Afile[j];
	}
	//open file with newly written name
	open(dir2+file3);
	//add to merge instructions
	filestring = filestring+"c2="+file3+" ";
	channelstring = channelstring+channel1+"x";
	file3 = filereset;
}

if (c3 != "Unused"){
		//Write filename from array with edits 
	Achan = newArray();
	Achan = split(c3, "-");
	channel1 = Achan[0];
	exposure1 = Achan[1];
	namez = listz[i];
	Afile = split(namez, separator);
	Afile[channelpos] = channel1;
	Afile[exposurepos] = exposure1;
	file3 = Afile[0];
	for (j=1; j < Afile.length; j++){
	file3 = file3+separator+Afile[j];
	}
	//open file with newly written name
	open(dir2+file3);
	//add to merge instructions
	filestring = filestring+"c3="+file3+" ";
	channelstring = channelstring+channel1+"x";
	file3 = filereset;
}

if (c5 != "Unused"){
		//Write filename from array with edits 
	Achan = newArray();
	Achan = split(c5, "-");
	channel1 = Achan[0];
	exposure1 = Achan[1];
	namez = listz[i];
	Afile = split(namez, separator);
	Afile[channelpos] = channel1;
	Afile[exposurepos] = exposure1;
	file3 = Afile[0];
	for (j=1; j < Afile.length; j++){
	file3 = file3+separator+Afile[j];
	}
	//open file with newly written name
	open(dir2+file3);
	//add to merge instructions
	filestring = filestring+"c5="+file3+" ";
	channelstring = channelstring+channel1+"x";
	file3 = filereset;
}

if (c6!= "Unused"){
		//Write filename from array with edits 
	Achan = newArray();
	Achan = split(c6, "-");
	channel1 = Achan[0];
	exposure1 = Achan[1];
	namez = listz[i];
	Afile = split(namez, separator);
	Afile[channelpos] = channel1;
	Afile[exposurepos] = exposure1;
	file3 = Afile[0];
	for (j=1; j < Afile.length; j++){
	file3 = file3+separator+Afile[j];
	}
	//open file with newly written name
	open(dir2+file3);
	//add to merge instructions
	filestring = filestring+"c6="+file3+" ";
	channelstring = channelstring+channel1+"x";
	file3 = filereset;
}
print("filestring: "+filestring);
run("Merge Channels...", filestring+"create");
//Can remove to keep channels separate - makes counter tool more difficult to work with however...


//Check that images are Z-stacks. 
//getSliceNumber()=1 if the image is not a stack
sli = nSlices;
if (sli == 1){
run("RGB Color");
} else{ run("Stack to RGB", "slices");}

file3 = replace(file3, separator+firstwavelength+separator, separator+channelstring+separator);
file3 = substring(file3, 0, lengthOf(file)-4);
saveAs("Tiff", mergeoutput+file3+"_Mrg.tif");
run("Close All");
channelstring = "";	
	} 

filestring = "";
}
setBatchMode(false);	

//Removed errant } from here 2020
dir2 = mergeoutput;
print("Merge Channels Complete");
beep;
}


//Chi-squared log rank test function. Input arrays must be of same length and contain total numbers of cells in each group at each time.
//Censored data is not counted as cell deaths (Agroup1Censor... counts subtracted from deaths at each timepoint - still influences the number of cells at risk)
//Currently, gives rounding error sometimes where observed and expected numbers of deaths are unequal in boolean comparator, but are actually equal in reality. Should not influence function output.
//Numerous parentheticals were necessary for function to evaluate array positions and to enforce order of operations.
//This version of chi squared from Bewick et. al Critical care 2004, 8:389-394 (http://ccforum.com/content/8/5/389)
//See also for overview of chi squared with reference to other forms of the calculation http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Survival/BS704_Survival5.html


function logrank(Agroup1, Agroup2, Agroup1Censor, Agroup2Censor){
	chisquaredsum = 0;
    significance = "";
    length1 = Agroup1.length;
    if (Agroup1.length!=Agroup2.length){
		print("Arrays of unequal length!");
		beep;
		exit;
	}
	//Calculate total surviving at each timepoint
	Atotal = newArray(length1);
	for (i=0; i<length1; i++){
		value = (Agroup1[i]) + (Agroup2[i]);
	Atotal[i] = value;
	}
	
	//Calculate deaths for each group at each time period
	///Group 1
	Agroup1death = newArray(length1);
	Agroup1death[0] = 0;
	for (i=1; i<length1; i++){
		value = ((Agroup1[i-1]) - (Agroup1[i]) - (Agroup1Censor[i]));
		Agroup1death[i] = value;
		}
	///Group 2
	Agroup2death = newArray(length1);
	Agroup2death[0] = 0;
	for (i=1; i<length1; i++){
		value = ((Agroup2[i-1]) - (Agroup2[i]) - (Agroup2Censor[i]));
		Agroup2death[i] = value;
	}
	///Total Deaths
	Atotaldeath = newArray(length1);
	Atotaldeath[0] = 0;
	for (i=1; i<length1; i++){
		value = ((Atotal[i-1]) - (Atotal[i]) - (Agroup1Censor[i]) - (Agroup2Censor[i]));
		Atotaldeath[i] = value;
	}

Array.print("Agroup1", Agroup1);
print("Agroup1 length:", Agroup1.length);
Array.print("Agroup2", Agroup2);
print("Agroup2 length:", Agroup2.length);
Array.print("Atotal", Atotal);
Array.print("Agroup1death", Agroup1death);
Array.print("Agroup2death", Agroup2death);
Array.print("Atotaldeath", Atotaldeath);


//Sum total deaths (Ototal)
Ototal = 0;
for (i=0; i<length1; i++){
Ototal = Ototal + Atotaldeath[i];
}

///Calcualte E2
E2 = 0;
for (i=1; i<length1; i++){
E2 = E2 + ((Atotaldeath[i])/(Atotal[i-1]))*(Agroup2[i-1]);
}

//Calculate O2
O2 = 0;
for (i=0; i<length1; i++){
	O2 = O2 + Agroup2death[i];
	}

//Calculate E1
E1 = 0;
for (i=1; i<length1; i++){
E1 = E1 + ((Atotaldeath[i])/(Atotal[i-1]))*(Agroup1[i-1]);
}

//Calculate O1
O1 = 0;
for (i=0; i<length1; i++){
	O1 = O1 + Agroup1death[i];
}

//Check math (O1+O2=Ototal=E1+E2) //2020 debug
if((O1+O2)==Ototal && (E1+E2)==Ototal){
	print("Observed and expected numbers match.");
}

if((O1+O2)!=Ototal || (E1+E2) !=Ototal){
	print("Observed and expected numbers MAY NOT match. Verify numbers below.");
	test = 0;
	test = O1+O2;
	print("Ototal", Ototal);
	print("SUM_O", test);
	test2 = 0;
	test2 = E1+E2;
	print("SUM_E", test2);
	//exit;
	//Gives rounding error in preliminary testing (thus, "exit" above is commented out until this is resolved)
}

//Calculate chi squared - imageJ has trouble evaluating this formula without parentheses
chisquared = ((((O1-E1)*(O1-E1))/E1)+(((O2-E2)*(O2-E2))/E2));

//Sum Chi squared (for later application of more complex chi squared formulas).
chisquaredsum = chisquaredsum + chisquared;
 
print("chisquaredsum="+chisquaredsum);

//Alpha p=0.5 value for 1df chi squared distribution is 3.841, others as below...
if (chisquaredsum>3.841){
	significance = "p<0.05 (df=1)";
}

if (chisquaredsum>6.635){
	significance = "p<0.01 (df=1)";
}

if (chisquaredsum>10.828){
	significance = "p<0.001 (df=1)";
}

if (chisquaredsum>15.14){
	significance = "p<0.0001 (df=1)";
}


if (chisquaredsum<=3.841){
	significance = "n.s. (p>0.05, df=1)";
}
print("Significance: "+significance);
print("E2="+E2);
print("E1="+E1);
print("O2="+O2);
print("O1="+O1);
print("Ototal="+Ototal);
areturn = "ChiSq="+chisquaredsum+",  "+significance;
return areturn;
}


function deathcounts(timepoints, Alifespan){
//Calculate lifespan with array math: uses total number of timepoints and an array containing all the death/censoring timepoints. 
ACalcDeath = newArray(timepoints);
for (i=0; i<Alifespan.length; i++){
lifespan = (Alifespan[i]);
//max index value is lifespan - 1 (i.e. an 85 element array has a maximum index of 84 because it starts with 0);
//Sum deaths at each timepoint. 
ACalcDeath[lifespan-1] = ACalcDeath[lifespan-1] +1;
	} 
return ACalcDeath;}

////Below ends the grapher/analyzer macro 2020
}



function groupconcactcensor(stringpath, LifespanStringLocation, GroupStringLocation, CensorStringLocation, CensorString, GroupArray, GroupName, outpath){
list2 = getFileList(stringpath);
Aoutput = newArray();
outputstring = "";
for (j=0; j<list2.length; j++){
prestring = File.openAsString(stringpath+list2[j]);
Astring = split(prestring, ";");
string = Astring[LifespanStringLocation];
groupid = Astring[GroupStringLocation];
censor = Astring[CensorStringLocation];

//For debugging:
//Array.print("Astring", Astring);
//Array.print("Aoutput", Aoutput);
//print("CensorString "+CensorString);
//print("Lifespan: "+string);
//print("Censor: "+censor);

//Combine all cells indicated by group array
x = present(GroupArray, groupid);
if (x==1 && censor==CensorString) {
	Aoutput = Array.concat(Aoutput, string);
}}

//Generate output string
len = Aoutput.length;
for (k=0; k<len; k++){
	outputstring = outputstring+Aoutput[k]+";";
}
//print summary
print(GroupName+"_#Censored_"+len);

//Save output string
File.saveString(outputstring, outpath+GroupName+"_Censor_Lifespans.txt");
}

    function CreateCensorCrosses(yValues, censorArray){
    	xValues = Array.getSequence(yValues.length+1);
    	censorYvalues = newArray(censorArray.length);
    	for (i=0; i<censorArray.length; i++){
    		if (censorArray[i]>0){
    			censorYvalues[i]=yValues[i];
    		}
    		if (censorArray[i]==0){
    			censorYvalues[i]="";
    		}
    	}
    	
    	Plot.add("crosses", xValues, censorYvalues);
    }

macro "Resample and Reclassify Single Cell Data"{
//[0]CellClass+";[1]"+well+"-"+position+"-"+CellName+";[2]"+lifespan+";[3]"+xorig+";[4]"+yorig+";[5]"+aggregatelifespan+";[6]"+aggstartx+";[7]"+aggstarty+";[8]"+aggstartz+";[9]"+feature2lifespan+";[10]"+f2startx+";[11]"+f2starty+";[12]"+f2startz+";[13]"+well+";[14]"+name+";[15]"+project+";[16]"+initialstate+";[17]"+endstate+";[18]"+endlife+";[19]"+timepoints+";[20]"+censor+";[21]", stringpath+CellClass+"_"+well+"-"+position+"-"+CellName+".txt")
var timechange = "No";
resin = getDirectory("Select Single Cell Data INPUT Directory");
resout = getDirectory("Select New Single Cell Data OUTPUT Directory");
resamplelist = getFileList(resin);
filenum=resamplelist.length;
trunc=0;
timepoint = 9999;

Dialog.create("Resample Data");
Dialog.addMessage("Removes frist n timepoints and re-assigns cell states.");
Dialog.addMessage("Outputs only cells with survival past truncation point.");
Dialog.addMessage(filenum+" Files Detected");
//below becomes lifefix//Removed in favor of truncating during graphing/analysis
//Dialog.addRadioButtonGroup("Remove lifespans > max number?", newArray("Yes", "No"), 1, 1, "No"); 

Dialog.addNumber("Left truncate by how many timepoints?", trunc);
//Right truncation function below removed - can use data analysis to right truncate. 
//Dialog.addMessage("Caution: For correcting errors only, does not resample cell state at last timepoint.");
//Dialog.addRadioButtonGroup("Alter initial max timepoint?", newArray("Yes", "No"), 1, 1, "No"); 
//Dialog.addNumber("New Max Timepoint", timepoint);
Dialog.show(); 

//lifefix = Dialog.getRadioButton();
lifefix = "Yes";
trunc = Dialog.getNumber();
//timechange = Dialog.getRadioButton();
//timepoint = Dialog.getNumber();


for (j=0; j<resamplelist.length; j++){
Aoutput = newArray();
outputstring = "";
prestring = File.openAsString(resin+resamplelist[j]);
Astring = split(prestring, ";");

//Key for single cell files
CellClass = Astring[0];
CellName2 = Astring[1];
lifespan = Astring[2];
xorig = Astring[3];
yorig = Astring[4];
aggregatelifespan = Astring[5];
aggstartx = Astring[6];
aggstarty = Astring[7];
aggstartz = Astring[8];
feature2lifespan = Astring[9];
f2startx = Astring[10];
f2starty = Astring[11];
f2startz = Astring[12];
well = Astring[13];
name = Astring[14];
project = Astring[15];
initialstate = Astring[16];
endstate = Astring[17];
endlife = Astring[18];
timepoints = Astring[19];
censor = Astring[20];

//Alter max timepoint if needed (improper setup in prior steps)
if (timechange == "Yes"){
	timepoints = timepoint;
}


//Need to accomodate transient aggregates before truncating timepoints: calculate aggregate lifespan
if (CellClass == "TransA" || CellClass == "TransD" && aggstartz != 9999){
//initialize variable
aggstartzTrans = 0;
aggstartzTrans = (aggstartz) - (trunc);
if (aggstartzTrans < 0) {
//sbtract the period of aggregate lifespan that is before the left truncate timepoint (add negative number)
aggregatelifespan = (aggregatelifespan) + (aggstartzTrans);
//Can create negative numbers or agstartZ and ag lifespan. Agstart Z taken care of below

if (aggregatelifespan < 0){
	aggregatelifespan = 0;
}


}}else { if (aggstartz != 9999) {
	aggregatelifespan = (aggregatelifespan) - (trunc) + (aggstartz);
if (aggregatelifespan <= 0){
	aggregatelifespan = 0;
	initialstate = "O";
}
}}
//Above else is for all non transient cells cells. 


//left truncate values
lifespan = (lifespan)-(trunc);
if (lifespan < 0){
	lifespan = 0;
}

if (aggstartz != 9999) {
aggstartz = (aggstartz) - (trunc);
if(aggstartz < 0){
	aggstartz = 0;
}}

if (f2startz != 9999) {
f2startz = (f2startz) - (trunc);
if(f2startz < 0){
	f2startz = 0;
}}

timepoints = (timepoints) - (trunc);
if (aggstartz == 0){
	initialstate = "A";
}

//Remove lifespans over max number caused when the number of timepoints is truncated these cells are then ensured to be in the "Alive" state.
if (lifefix == "Yes"){
	if (lifespan > timepoints){
		lifespan = timepoints;
		endstate = "A";
	}
	
}

//Feature 2 lifespan may be inacurate with transient feature 2. 
if (feature2lifespan != 9999){
feature2lifespan = "ResamplingNotSupportedF2Lifespan";
}

CellClass = "ERROR";

//Cell Class Calculator Macro
//need to have previously defiend global variables initialstate, endstate, endlife, aggregatelifespan, lifespan
//Calculates a cell class based on the primary phenotype "Aggregate" 
//Reports cell class as "initial state"+"endstate"+"endlife". In positions 1 & 2: A=aggregate, O=no aggregate, In position 3: A=alive, D=dead (at last timepoint counted, including censored cells)
run("Cell Class Calculator");

//A_A_Dead//Fix this lifespan counter
if (initialstate=="A" && endstate=="A" && endlife=="D" && aggregatelifespan==lifespan) {
	
	CellClass="AAD";
	}
//Save output string. Only save cells with lifespans >0 - those that do not die during the left truncation period
//File.saveString(outputstring, out+GroupName+"Trunc_"+trunc".txt);
if (lifespan > 0){
File.saveString(CellClass+";"+CellName2+";"+lifespan+";"+xorig+";"+yorig+";"+aggregatelifespan+";"+aggstartx+";"+aggstarty+";"+aggstartz+";"+feature2lifespan+";"+f2startx+";"+f2starty+";"+f2startz+";"+well+";"+name+";"+project+";"+initialstate+";"+endstate+";"+endlife+";"+timepoints+";"+censor+";", resout+CellClass+"_"+CellName2+"_File_"+j+"_Truncated-"+trunc+".txt");
}
}
print("Resample Macro Complete");
beep;
}

macro "Extract and Montage Cells"{

//Establish global variables for calling image saving macro - this resets the intial variables called at the beginning of the macro.
var CellName ="Empty";
var outExtract = "Undefined";
var dirZstack = "Undefined";
var PriorName="None";
var Agz = 0;
var lifespan = 0;
var censor = "Undefined";
var Agcount = 0;
var Agprior = 0;
var CellClass = "";
var CellClassPrior = "";
var secondary = 0;
var Secondarycount = 0;
var Feature2prior = 0;
var choice = "";

///Initial Dialog.
Dialog.create("Extract and Montage Cells");
Dialog.addMessage("This macro has two sequential parts:");
Dialog.addMessage("1. Extract tracked cells centered in Z-stack.");
Dialog.addMessage("(Requires Results .csv file from tracking)");
Dialog.addMessage("2. Montage extracted Z-stacks into a single image, sorted by designated features.");
Dialog.addRadioButtonGroup("Select macro:", newArray("Extract cells","Montage Z-stacks"), 1, 2, "");
Dialog.show(); 

choice = Dialog.getRadioButton();


if(choice== "Extract cells"){
//Start of macro
macro "Extract cells" {

//Use batch mode if desired
batch = getBoolean("Use batch mode?");
setBatchMode(batch);

//Set height and width of cropped image window - specified XY cell coordinates will be at the center of this window
width = 70;
height = 70;

Dialog.create("Window Size");
Dialog.addMessage("Set height and width of cropped image window.\nSpecified XY cell coordinates will be at the center of this window.")
Dialog.addNumber("Width:", width);
Dialog.addNumber("Height:", height);
Dialog.show();

width = Dialog.getNumber();
height = Dialog.getNumber();

run("Close All");

dirZstack = getDirectory("Choose an input Directory for Z-stacks");
outExtract = getDirectory("Choose an output Directory");

if (CSVpath == "Test"){
CSVpath = getDirectory("Choose Directory containing ONLY .csv location files");}


CSVList = getFileList(CSVpath);
if(CSVList.length==0){
exit("Error: No files in CSV directory. Alternate dir can be selected in 'Change Working Dir'.")
}

//Changed to allow entire folder of CSV files to be used.
//filepath=File.openDialog("Select .csv Results file with location data"); 
for (k = 0; k < CSVList.length; k++) {
filepath = CSVpath+CSVList[k];


//Open XYZ location file
open(filepath);

//Some versions of Imagej load .csv as "Results" and others as the .csv filename. Renaming to "Results" allows the getResult command to be used below
IJ.renameResults("Results");

//Set up prior image checker variables
PriorImage = "None";
ImageName = "Empty";
CellName = "Empty";
PriorName = "Empty";
length = nResults();
Feature2prior = 0;

//Load blank image for saving macro to close on the first iteration - this image will not be saved
//Can change image format from RGB to other if desired. Need to search "RGB black" below and replace with desired format i.e. "tiff"
newImage("Working Image", "RGB black", width, height, 1);

//Iterate macro across loaded results table
for (j=1; j < length; j++){

//Get results at row J, load into variables. J starts at 1 because the results table does not include a "0" row even though all array elements in Imagej do...
x = getResult("X", j);
y = getResult("Y", j);
z = getResult("Z", j);
ImageName = getResultString("ImageName", j);
Life = getResult("Life", j);
Aggregate = getResult("Feature1", j);
Feature2 = getResult("Feature2", j);
CellName = getResultString("CellName", j);
//Cannot capitalize the "stack" variable - "Stack" is already in use by Imagej
stack = getResultString("Stack", j);
WellName = getResultString("WellName", j);
CellName = getResultString("CellName", j);
CellClass = getResultString("CellClass", j);
Censor = getResultString("Censor", j);
Delete = getResultString("Delete", j);
Lifespan = getResultString("Lifespan", j);

//Detect new images and open them
if (ImageName != PriorImage && Delete != "Delete"){
	run("Save and close working image");
	run("Close All");
	print("Opening: "+dirZstack+ImageName);
	open(dirZstack+ImageName);
	//Save prior image name so as not to re-open same image again
	PriorImage = ImageName;
	newImage("Working Image", "RGB black", width, height, 1);
}

//Create new blank images if new cell name
if (CellName != PriorName && Delete != "Delete"){	
	//Save and close previous image
	run("Save and close working image");
	//Make new image
	newImage("Working Image", "RGB black", width, height, 1);
}

if (Delete != "Delete"){
//Go through opened image and extract ROIS at specified XYZ coordinates	
	selectWindow(ImageName);
	setSlice(z+1);
	//makeRectangle(x+(width/2), y+(height/2), width, height);
	//top left corner of window is specified
	run("Specify...", "width="+width+" height="+height+" x="+(x-(width/2))+" y="+(y-(height/2))+" slice="+z+"");
	run("Copy");
	selectWindow("Working Image");
	run("Add Slice");
    run("Paste");
    
    //Save cell name for save and close macro and detection of new cells
    PriorName = CellName;
    
    //Detect start of aggregate
    Agcount = Aggregate - Agprior;
    if (Agcount == 1){
    Agz = z;
    }
    
    //Detect start of Feature2
    Secondarycount = Feature2 - Feature2prior;
    if (Secondarycount == 1){
    	secondary = z;
    }
    
    //Calculate lifespan
    lifespan = lifespan + Life;

    //Save aggregate state, Feature2 state, censor state and name for saving macro
    Agprior = Aggregate;
    Feature2prior = Feature2;
    censor = Censor;
    CellClassPrior = CellClass;
}

}}
print("Extraction Macro Complete!");
beep();
}
}
//end of extract cells If statement entering macro.




    
if(choice == "Montage Z-stacks"){
 macro "Montage Z-stacks" {

imagecheck = nImages();
if (imagecheck > 0){
run("Close All");
}
	
batch = getBoolean("Use batch mode?");
setBatchMode(batch);
dirExtracts = getDirectory("Choose an input Directory for Z-stacks");
outMontage = getDirectory("Select an output Directory for Montage");
listm = getFileList(dirExtracts);
n = listm.length;
length = listm.length;

//Open first file in folder and get image type, size, slice number
setBatchMode(true);
open(dirExtracts+listm[0]);
selectWindow(listm[0]);
slices = nSlices();
origionalslices = slices;
width = getWidth();
height = getHeight();
title = getTitle();
//Returns the bit depth of the active image: 8, 16, 24 (RGB) or 32 (float).
bits = bitDepth();
//use above to populate this command: newImage(title, type, width, height, depth)

//type = "NaN";
type = ""+bits+"-bit";
if (type == "24-bit"){
	type = "RGB";
	}
	//set default to black background
	type = type+" black";
close();

setBatchMode(batch);

//Set default size of montage
var col = 10;
var row = 10;
//Set default grid thickness
var thickness = 2;
// Set default montage name
montagename = "Montage_";

Dialog.create("Montage Z-stacks");
Dialog.addMessage("Input directory: "+dirExtracts);
Dialog.addMessage("Output directory: "+outMontage);
Dialog.addMessage(n+" files detected in input directory. Width="+width+", Height="+height);
Dialog.addString("Montage Name:", montagename, lengthOf(montagename)); 
Dialog.addNumber("Montage columns: ", col);
Dialog.addNumber("Montage rows: ", row);
Dialog.addNumber("Montage slices: ", slices);
Dialog.addMessage("Required features:");
Dialog.addCheckboxGroup(1, 4, newArray("Primary Feature", "Secondary Feature", "Cell Death"), newArray(false, false, false));
Dialog.addMessage("Excluded features:");
Dialog.addCheckboxGroup(1, 4, newArray("Primary Feature", "Secondary Feature", "Cell Death", "Censored Cells"), newArray(false, false, false, false));
Dialog.addRadioButtonGroup("Sort stacks by:", newArray("Primary Feature", "Secondary Feature", "Cell Death"), 1, 4, "Null");
Dialog.addRadioButtonGroup("Disable subsetting and sorting:", newArray("Yes", "No"), 1, 2, "No");
Dialog.addRadioButtonGroup("Add Grid:", newArray("Black", "White", "None"), 1, 3, "Black");
Dialog.addNumber("Grid thickness (pixels): ", thickness);
Dialog.show(); 

montagename = Dialog.getString();

//Get required conditions
ag = Dialog.getCheckbox();
sec = Dialog.getCheckbox();
death = Dialog.getCheckbox();
//Get excluded conditions
agex = Dialog.getCheckbox();
secex = Dialog.getCheckbox();
deathex = Dialog.getCheckbox();
censorex = Dialog.getCheckbox();

//Get sorting conditions
sort = Dialog.getRadioButton();
disablesort = Dialog.getRadioButton();
grid = Dialog.getRadioButton();

//Get montage size
col = Dialog.getNumber(); 
row = Dialog.getNumber(); 
slices = Dialog.getNumber();

//Get grid thickness
thickness = Dialog.getNumber(); 

//Calculate total number of images to use, test against the number in folder
nimg = col*row;

if (disablesort == "No"){
n=nimg;}

//Prevent creation of partial rows when sorting is disabled. (This is allowed if sorting is used).
if (disablesort == "Yes"){
if(nimg > n){
exit("Montage size exceeds number of files in folder.\nReduce row and column numbers.")	
}else n=nimg;
}


//Calculate total size of montage image
totalwidth = col*width;
totalheight = row*height;

//Calculate column positions
Acolpos = newArray(col);
for (k=0; k < col; k++){
	Acolpos[k] = k*width;
}

//Calculate row positions
Arowpos = newArray(row);
for (k=0; k < row; k++){
	Arowpos[k] = k*height;
}

//Calculate y positions for pasting images
Aypos = newArray();
for (k=0; k < col; k++){
//Create array containing all x positions for n images in order
Aypos = Array.concat(Aypos, Acolpos);
}

//Calculate x positions for pasting images
Axpos = newArray();
for (k=0; k < row; k++){
value = Arowpos[k];
Array1 = newArray(col);
Array.fill(Array1, value);

//Create array containing all y positions for n images in order
Axpos = Array.concat(Axpos, Array1);	
}

//new image command for blank image to paste in montages - image type is detected in input folder and matched
newImage(title+montagename, type, totalwidth, totalheight, slices);

// iterate opening images from specified folder and pasting into blank montage WITH SORTING
if (disablesort == "No"){

//Create index array for montage
Aindex = newArray();

//Specify location of sorting condition in image name string
if (sort == "Null"){
	exit("ERROR: Sorting variable required. Check disable sorting if desired.");
}
if (sort == "Primary Feature"){
	sortpos = 3;
}
if (sort == "Secondary Feature"){
	sortpos = 7;
}
if (sort == "Cell Death"){
	sortpos = 5;
}

//Create new array, indexed to file list, to hold variables for sorting
Asortvariable = newArray(length);

//Create numeric variable sortvariable
sortvariable = 0;
for (j=0; j < length; j++){
//get filename for sorting
filename = listm[j];
//example filename = "OAD_C6-2-2_Agz_10_Lf_35_SecZ_0_uncensored_" 2020 changed Agz to F1z ////////
Afilename = split(filename, "_");
//load sorting variable
sortvariable = Afilename[sortpos];
//Change number string into integer
sortvariable = parseInt(sortvariable); 
Asortvariable[j] = sortvariable;
}

//Replace "0" values in sort variable with NaN
for (j=0; j < Asortvariable.length; j++){
	if (Asortvariable[j] == 0){
		Asortvariable[j] = NaN;
	}
}



//Array.print("Asortvariable"Asortvariable);
print("Asortvariable:");
Array.print(Asortvariable);

// Generate array of ranks for sort variable
Aranksortvariable = Array.rankPositions(Asortvariable);
print("Aranksortvariable:");
Array.print(Aranksortvariable);

//Build Aindex vector of length n along increasingn rank order of ranked variable. (n=number of images in montage)
for (j=0; j < length; j++){
indexlength = Aindex.length;

if (indexlength < n) {

position = Aranksortvariable[j];

//get filename for checking against required phenotypes
filename = listm[position];

//filename = "OAD_C6-2-2_Agz_10_Lf_35_SecZ_0_uncensored_"
Afilename = split(filename, "_");
CellClass = Afilename[0];
CellName = Afilename[1];
Agz = Afilename[3];
Lf = Afilename[5];
SecZ = Afilename[7];
Censor = Afilename[8];

//Default continue with image, stop if image does not meet defined criteria
var proceed = true;
//debuging
//debuging
print("F1: "+Agz);
print("sec: "+SecZ);
print("death: "+Lf);


//Gate by required conditions
if (ag == 1){
	if (Agz == 0){
	proceed = false;
}}

if (sec == 1){
	if (SecZ == 0){
	proceed = false;
}}

if (death == 1){
if (Lf == 0 || Lf == origionalslices || Censor == "censored"){
	proceed = false;
}}


//Gate by exclusinary conditions
if (agex == 1){
	if (Agz != 0){
	proceed = false;
}}

if (secex == 1){
	if (SecZ != 0){
	proceed = false;
}}

if (deathex == 1){
if (Lf != origionalslices){
	proceed = false;
}}

if (censorex == 1){
if (Censor == "censored"){
	proceed = false;
}}


// Continue with specified cells
if (proceed == true){

Aindex = Array.concat(Aindex, position);
print("Aindex");
Array.print(Aindex);	
}
}

}
//Error message if no cells meet specified criteris
if (indexlength == 0){
exit("ERROR: No cells meet selection criteria.");
}
}

// Use listm (filelist) position to select images - no sorting - for images with different file names
if (disablesort == "Yes"){
Aindex = Array.getSequence(n);
}

//Set parameters for bounding boxes of montaged images
if (grid == "Black"){
setColor(0, 0, 0);
setLineWidth(thickness);
}

if (grid == "White"){
setColor(255, 255, 255);
setLineWidth(thickness);
}


//Shorten N if there are not enough cells to fulfill all criteria and fill the grid
indexlength = Aindex.length;
print("indexlength "+indexlength);
if (indexlength < n){
	n = indexlength;
}
print("N: "+n);

//Use listm[j], Aindex, Axpos, and Aypos, to paste images into z-stack montage.   
for (i=0; i < n; i++){
x = Aypos[i];
y = Axpos[i];
image = Aindex[i];
filename = listm[image];
open(dirExtracts+filename);

for (j=0; j < slices; j++){
//copy image
selectWindow(filename);
slices1 = nSlices();
if (j+1 <= slices1){
setSlice(j+1);
run("Select All");
run("Copy");
}

//paste into blank montage at specified xyz coordinates
selectWindow(title+montagename);
slices2 = nSlices();
if (j+1 <= slices2){
setSlice(j+1);
makeRectangle(x, y, width, height);
run("Paste");
if (grid == "Black" || grid =="White"){
setLineWidth(thickness);
drawRect(x, y, width, height);
}
}
}

}

//Save montage and end macro
selectWindow(title+montagename);
rename(montagename+title);
save(outMontage+montagename+title);
setBatchMode("show");

beep();
print("Montage Macro Complete!");

//Ends montage macro
}
} 
//End of If statement entering macro


}

macro "Save and close working image" {
	selectWindow("Working Image");
	if (CellName != "Empty" && PriorName != "Empty"){
	//Delete blank slice used to create working images
	//First, check if image is a z stack, then delet blank slice at beginning
	stack = getSliceNumber();
	if (stack > 1){
	setSlice(1);
    run("Delete Slice");
	
    //Save image with cell metadata in filename
	saveAs("tiff", outExtract+CellClassPrior+"_"+PriorName+"_F1z_"+Agz+"_Lf_"+lifespan+"_SecZ_"+secondary+"_"+censor+"_.tif");
	}}
	close();
	//reset aggregate detector
	Agcount = 0;
	Agz = 0;
    
    //Reset Feature2 detector
    Feature2prior = 0;
    secondary = 0;
    
    //Reset lifespan counter
    lifespan = 0;

    }


macro "Symbol Key [k]"{

//Reports cell class as "initial state"+"endstate"+"endlife". In positions 1 & 2: A=Primary Feature, O=No Primary Feature, In position 3: A=Alive, D=Dead (at last timepoint counted)
//Cell Class: "initial state"+"end state"+"end life". Positions 1 & 2: A=Primary Feature, O=No Primary Feature. Position 3: A=Alive, D=Dead at final timepoint. 
/*
Position1 (t0) & Position2 (endpoint): 
 A=Primary Feature, O=No Primary Feature. 
 "Trans" = transient primary feature.
Position 3 (final timepoint): 
 A=Alive, D=Dead.

prior kheight = 380
need to add 5 lines of text at 15 pixels/line (75 to 90 pixels total)
*/

Aallgroups = newArray("AAA","AAD","OAA","OAD", "AOA", "AOD","TransA", "TransD","OOA","OOD");
Symbol = "";
Kwidth = 215;
Kheight = 475;
Kcensor="censored"
AKcensor = newArray("uncensored", "censored");
newImage("Symbol Key", "RGB", Kwidth, Kheight, 1);
//Create Grey image so crossharis show if they default to white
run("Subtract...", "value=25");
Kx = 60;
Ky = 35;

//Set Font for text
setFont("SansSerif", 12, "bold");

roiManager("reset");
makeText("Symbol Key:", 5, 0);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

makeText("Uncensored", 5, 15);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");
 
makeText("Censored", 75+15, 15);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

//Text at end of image
makeText("Position 1 (t0) & Position 2 (endpoint):", 5, 380);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

makeText(" A = Primary Feature.", 5, 380+15);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

makeText(" O = No Primary Feature. ", 5, 380+30);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

makeText( " 'Trans' = Transient Primary Feature.", 5, 380+45);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

makeText("Position 3 (endpoint): ", 5, 380+60+3);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");

makeText(" A = Alive, D = Dead.", 5, 380+75+3);
roiManager("Add", "black");
roiManager("select", roiManager("count")-1);
roiManager("rename", "");


for (j = 0; j < AKcensor.length ; j++) {
	Kcensor = AKcensor[j];


for (i = 0; i < Aallgroups.length ; i++) {
	Symbol= Aallgroups[i];


//A_A_Alive
if (Symbol=="AAA"){
pointcolor = "cyan";
pointtype = "Dot";
markersize = "Extra Large";
}

//A_A_Dead
if (Symbol=="AAD"){
pointcolor = "cyan";
pointtype = "Hybrid";
markersize = "Extra Large";
}

//O_O_Alive
if (Symbol=="OOA"){
pointcolor = "cyan";
pointtype = "Circle";
markersize = "Extra Large";
}

//O_O_Dead
if (Symbol=="OOD"){
pointcolor = "cyan";
pointtype = "Cross";
markersize = "Extra Large";
}

//O_A_Alive
if (Symbol=="OAA"){
pointcolor = "cyan";
pointtype = "Dot";
markersize = "Large";
}

//O_A_Dead
if (Symbol=="OAD"){
pointcolor = "cyan";
pointtype = "Hybrid";
markersize = "Large";
}

//A_O_Alive - don't expect these cells to exist
if (Symbol=="AOA"){
pointcolor = "red";
pointtype = "Dot";
markersize = "Extra Large";
}

//A_O_Dead - don't expect these cells to exist
if (Symbol=="AOD"){
pointcolor = "red";
pointtype = "Hybrid";
markersize = "Extra Large";
}

//TransientAg_Alive - don't expect these cells to exist
if (Symbol=="TransA"){
pointcolor = "red";
pointtype = "Dot";
markersize = "Medium";
}

//TransientAg_Dead - don't expect these cells to exist
if (Symbol=="TransD"){
pointcolor = "red";
pointtype = "Hybrid";
markersize = "Large";
}

//Make censored cells yellow
if (Kcensor=="censored"){
pointcolor = "yellow";
if(Symbol == "TransA" || Symbol == "TransD" || Symbol == "AOA" || Symbol == "AOD"){
pointcolor = "orange";
} 
}

makePoint(Kx*j*1.2+35, Ky*i+40, markersize+" "+pointcolor+" "+pointtype);


run("Point Tool...", "type="+pointtype+" color="+pointcolor+" size=["+markersize+"]");
roiManager("add");
roiManager("select", roiManager("count")-1);
roiManager("rename", Symbol);
//setFont("SansSerif", 12);
roiManager("show all with labels");
}}
selectWindow("Symbol Key");
run("Flatten");
roiManager("reset");

Dialog.create("Symbol Key");
Dialog.addMessage("Symbol Key created");
Dialog.addMessage("If labels not present, select 'more'/'labels'/'use names as labels' in ROI manager.");
Dialog.show();
}
 
macro "Combine Replicates/Rename Wells"{

//This macro can be used to combine single cell files from multiple replicates.
//Replicate designation is apended to the start of filenames to prevent overwirting files with the same names.
//Well designations can be changed to account for different plate layouts between replicates.
//Changes take place only in metadata: original file names remain the same. 
//Maximum timepoint can also be manually input if it is not auto-detected during cell tracking.
repliate = "";
WellChange = "";

Dialog.create("Combine Replicates/Rename Wells");
Dialog.addMessage("This macro can be used to combine single cell files from multiple replicates into the same folder for analysis.");
Dialog.addMessage("Replicate designation is apended to the beginning of filenames to prevent overwirting files with the same names.");
Dialog.addMessage("Well designations can be changed to account for different plate layouts between replicates.");
Dialog.addMessage("Well name changes take place only in metadata: original file names remain the same.");
//Dialog.addMessage("Maximum timepoint can also be manually input if it is not auto-detected during cell tracking.");
Dialog.addString("Replicate Designation to add to filename:", "N1");
Dialog.addRadioButtonGroup("Rename wells?", newArray("Yes", "No"), 1, 2, "No");
//Dialog.addString("Force maximum timepoint at:", 85);
Dialog.show(); 

repliate = Dialog.getString();
WellChange = Dialog.getRadioButton();
//timepoint = Dialog.getNumber();

//[0]CellClass+";[1]"+well+"-"+position+"-"+CellName+";[2]"+lifespan+";[3]"+xorig+";[4]"+yorig+";[5]"+aggregatelifespan+";[6]"+aggstartx+";[7]"+aggstarty+";[8]"+aggstartz+";[9]"+feature2lifespan+";[10]"+f2startx+";[11]"+f2starty+";[12]"+f2startz+";[13]"+well+";[14]"+name+";[15]"+project+";[16]"+initialstate+";[17]"+endstate+";[18]"+endlife+";[19]"+timepoints+";[20]"+censor+";[21]", stringpath+CellClass+"_"+well+"-"+position+"-"+CellName+".txt")
in5 = getDirectory("Select Single Cell Data INPUT Directory");
out5 = getDirectory("Select New Combined Single Cell Data OUTPUT Directory");
replicatelist2 = getFileList(in5);
filenum=replicatelist2.length;
//trunc=0;
//timepoint = 9999;

if(WellChange == "No"){
//Just rename files
Dialog.create("Rename and move files");
Dialog.addMessage(filenum+" Files Detected");
Dialog.addMessage(repliate+" to be added to filenames.");
Dialog.addMessage("Input Folder: "+in5);
Dialog.addMessage("Output Folder: "+out5);
Dialog.addMessage("Continue?");
Dialog.show();

for (i = 0; i < replicatelist2.length; i++){
	prename = replicatelist2[i];
	name = repliate"-"+prename;
	File.rename(in5+prename, out5+name);
}
beep();
waitForUser("Renaming Complete!");

}

if(WellChange == "Yes"){

AwellsPresent = newArray("A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12");
AwellsToRename = newArray();
AwellsNewName = newArray();
	Dialog.create("Select Wells to Rename"); 
    Dialog.addCheckboxGroup(8, 12, AwellsPresent , newArray(AwellsPresent.length));
    Dialog.addRadioButtonGroup("Or rename all wells to a single identity:", newArray("Yes", "No"), 1, 2, "No");
    Dialog.show(); 
    for (i = 0; i < AwellsPresent.length; i++) {
    	wellcheck = Dialog.getCheckbox();
    	if (wellcheck == true){
    		TempArray = AwellsPresent[i];
    		AwellsToRename = Array.concat(AwellsToRename,TempArray);
    	}
    }
RenameAll = Dialog.getRadioButton();
if (RenameAll == "Yes"){
	AwellsToRename =newArray("AllWells");
}

//Get New Names.
    for (j = 0; j < AwellsToRename.length; j++) {
    	CurrentWell = AwellsToRename[j];
    	Dialog.create("Select New Name for Well: "+CurrentWell ); 
    	Dialog.addMessage("Rename "+CurrentWell+" as:");
    Dialog.addCheckboxGroup(8, 12, AwellsPresent , newArray(AwellsPresent.length)); 
    Dialog.show(); 
    for (i = 0; i < AwellsPresent.length; i++) {
    	wellcheck = Dialog.getCheckbox();
    	if (wellcheck == true){
    		TempArray = AwellsPresent[i];
    		AwellsNewName = Array.concat(AwellsNewName,TempArray);
    	}
    }
    }
 //To rename and new names saved as AwellsToRename and AwellsNewName respectively.AwellsToRename =newArray("AllWells") if condensing all wells to one.

//Generate Well name string
WellsTBnamed = AwellsToRename[0];
WellsNewNames = AwellsNewName[0];
for (i = 1; i < AwellsToRename.length; i++) {
	WellsTBnamed = WellsTBnamed+", "+AwellsToRename[i];
	//WellsTBnamed = AwellsToRename[i]+", "+WellsTBnamed;
}

for (i = 1; i < AwellsNewName.length; i++) {
	WellsNewNames = WellsNewNames+", "+AwellsNewName[i];
	//WellsNewNames = AwellsNewName[i]+", "+WellsNewNames;
}

Dialog.create("Rename and move files");
Dialog.addMessage(filenum+" Files Detected");
Dialog.addMessage(repliate+" to be added to filenames.");
Dialog.addMessage("Well names to be changed: "+WellsTBnamed);
Dialog.addMessage("New well names: "+WellsNewNames);
Dialog.addMessage("Input Folder: "+in5);
Dialog.addMessage("Output Folder: "+out5);
Dialog.addMessage("Continue?");
Dialog.show();
//Move all files, then overwrite with those that have changed wells
for (i = 0; i < replicatelist2.length; i++){
	prename = replicatelist2[i];
	name = repliate+"-"+prename;
	File.copy(in5+prename, out5+name);
}

 	//Overwrite wells to be changed
for (k = 0; k < AwellsToRename.length; k++) {
ToRename = AwellsToRename[k];
NewName =  AwellsNewName[k];
	
for (j=0; j<replicatelist2.length; j++){
//Amax = newArray();
prestring = File.openAsString(in5+replicatelist2[j]);
Astring = split(prestring, ";");
Astring = Array.trim(Astring, Astring.length-1);
well = Astring[WellLocation];
//Amax = Array.concat(Amax, pretimepoint);

if(well == ToRename || ToRename == "AllWells"){
poststring = "";
//Reassign name
	Astring[WellLocation] = NewName;
	//Re-create string
	//string=string+other+";"
	for(l=0; l<Astring.length; l++){
		poststring = poststring+Astring[l]+";";
	}
	prename = replicatelist2[j];
	name = repliate+"-"+prename;
File.saveString(poststring, out5+name);
}}}

beep();
waitForUser("Renaming Complete With Well Changed.");
}

}


///Add action bar toolbar. REQUIRES ACTION BAR PLUGIN
macro "Toolbar [t]" {
run("Action Bar", "/macros/toolsets/"+macroname);
}

//Action bar plugin avaliable here:http://imagejdocu.tudor.lu/doku.php?id=plugin:utilities:action_bar:start
//The following text is the action bar config file (KEEP MACRO FILE IN MACRO FOLDER LOCATION so the "Run Action Bar" command above refers to the correct location)
/*
Colors used:
RSafe = newArray("#7F3C8D", "#11A579", "#3969AC", "#F2B701", "#E73F74", "#80BA5A", "#E68310", "#008695", "#CF1C90", "#f97b72", "#4b4b8f", "#A5AA99");
//palette_OkabeIto from R
OkabeIto = newArray("#E69F00", "#56B4E9"**, "#009E73", "#F0E442"****, "#0072B2", "#D55E00", "#CC79A7", "#999999");
BrewerPaired = newArray("#A6CEE3"**, "#1F78B4", "#B2DF8A"*****, "#33A02C", "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928");


<text><html><center><b>Single Cell Phenotyping and Survival</b></center></html>
<line>
<button>
label=Instructions 
icon=noicon
bgcolor=#F0E442
arg=<macro>
run("Instructions");
</macro>

</line>
<text> 1. Prepare Images:
<line>


<button>
label=Setup 
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Setup");
</macro>

<button>
label=Change Working Dir
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Change Working Directories");
</macro>

</line>
<line>

<button>
label=Z-Stack Align 
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Stack Handler");
</macro>

<button>
label=Merge Channels
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Merge Channels");
</macro>

</line>

<text> 2. Data Aqcuisition:
<line>

<button>
label=Open Z-Stack [o] 
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Open Z-Stack [o]");
</macro>


<button>
label=Manual Set Well [m]
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Manual Set Well [m]");
</macro>

</line>
<line>

<button>
label=Cycloid Grid [c]
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Cycloid Grid [c]");
</macro>



<button>
label=Symbol Key [k]
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Symbol Key [k]");
</macro>

</line>
<line>

<button>
label=--- Cell State [a] ---
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Cell State [a]");
</macro>



</line>

<text> 3. Data Analysis:

<line>


<button>
label=Resample First Timepoint
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Resample and Reclassify Single Cell Data");
</macro>

</line>
<line>

<button> 
label=Combine Replicates or Rename Wells
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Combine Replicates/Rename Wells");
</macro>

</line>
<line>

<button>
label=Extract and Montage Cells
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Extract and Montage Cells");
</macro>

</line>
<line>

<button>
label=Survival & Event Analysis [g]
icon=noicon
bgcolor=#A6CEE3
arg=<macro>
run("Grapher/Analyzer [g]");
</macro>

</line>
<text><html><center>Toolbar called with [t]</center>

<codeLibrary>

</codeLibrary>

<startupAction>

</startupAction>

// end of file
*/
//bgcolor=#E7B800
//bgcolor=#2E9FDF
/*
<button>
label=ROI Updater [r]
icon=noicon
bgcolor=#F0E442
arg=<macro>
run("ROI Symbol Updater [r]");
</macro>
*/







///////////////////////////////////////////////////////////////////////////
//Autorun on macro set on install
macro "AutoRun"{
wait(500);
run("Instructions");
run("Toolbar [t]");
}
/////////////////////////////////////////////////////////////////////////

