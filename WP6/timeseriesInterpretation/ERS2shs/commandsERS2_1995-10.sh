cd /home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation

############## PARAMETERS DEFINITION ##########################

# direcory with csv files to be interpreted
baseDir="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level5/ERS-2/ERS2_1995-10/"
startYear=1995
endYear=2010
sattelite=ESRS-2
width=900
height=400

# name of input file to be interpreted
input=$baseDir"ERS-2_allHeight.csv"
# name of output file without extension used for all following cases
output=$input
# name of directory to be created for storing .csv files (one for each year to be created)

scriptsDir="/home/milto/Documents/ASTARTE/Scripts/WP6/"


############## SCRIPTS ##########################

# 1. ConvertToDB # already in DB
# python $scriptsDir"ConvertToDB.py" -in $input -out $output".csv"

# 2. ApplyFilter
python $scriptsDir"timeseriesInterpretation/ApplyFilter.py" -in $output -out $output"filtered.csv" -filter 1,2,6,2,1 

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

Rscript $scriptsDir"RGraphs/RERSargs.r" $output  $output".png" "Average Seasonal Backscattered Coefficient Values Between "$startYear" and "$endYear" using "$sattelite" data" "Months" "Average Backscattered Coefficient (DB)" $width $height

Rscript $scriptsDir"RGraphs/RERSargs.r" $output"filtered_2decimal.csv"  $output"filtered_2decimal.csv.png" "Average Seasonal Backscattered Coefficient Values Between "$startYear" and "$endYear" using "$sattelite" data" "Months" "Average Backscattered Coefficient (DB)" $width $height


################### GET VECTOR OF METRICS/FEATURES ########################

# 1a. calculate metrics ######## filtered ######## 
python $scriptsDir"timeseriesInterpretation/GetMetrics.py" -in $output"filtered.csv" -out $output"filtered_metrics.csv"

# 2b. convert to 2 decimal places
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"filtered_metrics.csv" -out $output"filtered_metrics_2decimal.csv" -noOfDecimal 2

# 3b. Add & between items and \\ at the end for latex
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"filtered_metrics_2decimal.csv"

# ----------

# 1b. calculate metrics ######## non filtered ######## 
python $scriptsDir"timeseriesInterpretation/GetMetrics.py" -in $output -out $output"_metrics.csv"

# 2b. convert to 2 decimal places
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"_metrics.csv" -out $output"metrics_2decimal.csv" -noOfDecimal 2

# 3b. Add & between items and \\ at the end for latex
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"metrics_2decimal.csv"



