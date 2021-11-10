cd /home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation

############## PARAMETERS DEFINITION ##########################

# direcory with csv files to be interpreted

year=2018    # TO BE CHANGED as well as input name
baseDir="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/perYear/"$year"/"
sattelite="Sentinel-1 Ascending VH"
width=900
height=400
minWidth=3.0


# name of input file to be interpreted
input=$baseDir"Sentinel-1_Asc_VH_heights_all_2018.csv" # TO BE CHANGED 
# name of output file without extension used for all following cases
output=$input"DB.csv"
# name of directory to be created for storing .csv files (one for each year to be created)

scriptsDir="/home/milto/Documents/ASTARTE/Scripts/WP6/"


############## SCRIPTS ##########################

# 1. ConvertToDB # already in DB
python $scriptsDir"timeseriesInterpretation/ConvertToDB.py" -in $input -out $output

# 2. ApplyFilter
python $scriptsDir"timeseriesInterpretation/ApplyFilter.py" -in $output -out $output"filtered.csv" -filter 1,2,6,2,1 

# 2. ApplyFilter
python $scriptsDir"timeseriesInterpretation/ApplyFilter.py" -in $input -out $input"filtered.csv" -filter 1,2,6,2,1 

# 3.a. Create Directory for storing the .csv files one for each year
#newDir=$baseDir"heightyears"
#mkdir $newDir

# 3.b. Splits input .csv file into multiple
# python $scriptsDir"timeseriesInterpretation/SplitAccordingToYear.py" -in $output"filtered.csv" -outDir $newDir



############## FOR LATEX FILE ##########################

# 1. RoundToSpecificDecimal
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"filtered.csv" -out $output"filtered_2decimal.csv" -noOfDecimal 2


# 2. Add & between items and \\ at the end
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"filtered_2decimal.csv"

# 1. RoundToSpecificDecimal
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output -out $output"_2decimal.csv" -noOfDecimal 2


# 2. Add & between items and \\ at the end
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"_2decimal.csv"


################### CREATE GRAPHS ########################

strTitle="Average Seasonal Backscattered Coefficient Values in "$year" using "$sattelite" data (DB)"
Rscript $scriptsDir"RGraphs/RERSargs.r" $output $strTitle $output".png"  "Months" '"Average Backscattered Coefficient (DB)"' $width $height

Rscript $scriptsDir"RGraphs/RERSargs.r" $output"filtered_2decimal.csv"  $output"filtered_2decimal.csv.png" $strTitle "Months" '"Average Backscattered Coefficient (DB)"' $width $height


################### GET VECTOR OF METRICS/FEATURES ########################

# 1a. calculate metrics ######## filtered ######## 
python $scriptsDir"timeseriesInterpretation/GetMetrics.py" -in $output"filtered.csv" -out $output"filtered_metrics.csv" -minWidth $minWidth

# 2b. convert to 2 decimal places
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"filtered_metrics.csv" -out $output"filtered_metrics_2decimal.csv" -noOfDecimal 2

# 3b. Add & between items and \\ at the end for latex
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"filtered_metrics_2decimal.csv"

# ----------

# 1b. calculate metrics ######## non filtered ######## 
python $scriptsDir"timeseriesInterpretation/GetMetrics.py" -in $output -out $output"_metrics.csv" -minWidth $minWidth

# 2b. convert to 2 decimal places
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"_metrics.csv" -out $output"metrics_2decimal.csv" -noOfDecimal 2

# 3b. Add & between items and \\ at the end for latex
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"metrics_2decimal.csv"



