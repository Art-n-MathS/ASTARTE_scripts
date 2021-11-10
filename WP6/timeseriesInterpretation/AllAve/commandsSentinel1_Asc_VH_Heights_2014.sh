cd /home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation

############## PARAMETERS DEFINITION ##########################

# direcory with csv files to be interpreted

year=Average    # TO BE CHANGED as well as input name
c="/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/"
sattelite="Average"
width=900
height=400
minWidth=3.0


# name of input file to be interpreted
input=$baseDir"Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m.csv" # TO BE CHANGED 
# name of output file without extension used for all following cases
output=$input #"DB.csv"
# name of directory to be created for storing .csv files (one for each year to be created)

scriptsDir="/home/milto/Documents/ASTARTE/Scripts/WP6/"


############## SCRIPTS ##########################

# 1. ConvertToDB # already in DB VV VH
# python /home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in $input -out $output

# 2. ApplyFilter
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ApplyFilter.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m_filtered.csv" -filter 1,2,6,2,1 

# 3.a. Create Directory for storing the .csv files one for each year
#newDir=$baseDir"heightyears"
#mkdir $newDir

# 3.b. Splits input .csv file into multiple
# python $scriptsDir"timeseriesInterpretation/SplitAccordingToYear.py" -in $output"filtered.csv" -outDir $newDir



############## FOR LATEX FILE ##########################

# 1. RoundToSpecificDecimal

python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/RoundToSpecificDecimal.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m_filtered.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m_filtered_2decimal.csv" -noOfDecimal 2




# 2. Add & between items and \\ at the end
# python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"filtered_2decimal.csv"

# 1. RoundToSpecificDecimal
# python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output -out $output"_2decimal.csv" -noOfDecimal 2


# 2. Add & between items and \\ at the end
# python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"_2decimal.csv"


################### CREATE GRAPHS ########################

# strTitle="Average Seasonal Backscattered Coefficient Values in "$year" using "$sattelite" data (DB)"
# Rscript $scriptsDir"RGraphs/RERSargs.r" $output $strTitle $output".png"  "Months" '"Average Backscattered Coefficient (DB)"' $width $height

# Rscript $scriptsDir"RGraphs/RERSargs.r" $output"filtered_2decimal.csv"  $output"filtered_2decimal.csv.png" $strTitle "Months" '"Average Backscattered Coefficient (DB)"' $width $height


################### GET VECTOR OF METRICS/FEATURES ########################

# 1a. calculate metrics ######## filtered ######## 
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/GetMetrics.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m_filtered.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m_filtered_metrics.csv" -minWidth 3

# 2b. convert to 2 decimal places
# python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"filtered_metrics.csv" -out $output"filtered_metrics_2decimal.csv" -noOfDecimal 2

# 3b. Add & between items and \\ at the end for latex
# python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"filtered_metrics_2decimal.csv"

# ----------

# 1b. calculate metrics ######## non filtered ######## 
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/GetMetrics.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/Sentinel-1_Desc_Vh_heights_all_2016.csvDB24m_metrics.csv" -minWidth 3


# 2b. convert to 2 decimal places
python $scriptsDir"timeseriesInterpretation/RoundToSpecificDecimal.py" -in $output"_metrics.csv" -out $output"metrics_2decimal.csv" -noOfDecimal 2

# 3b. Add & between items and \\ at the end for latex
python $scriptsDir"timeseriesInterpretation/ConvertForLaTeX.py" -in $output"metrics_2decimal.csv"




##################################################


# 1. ConvertToDB # already in DB VV VH
python /home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/DescendingAllStudyArea.csv" -out home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/DescendingAllStudyArea_DB.csv"



python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/GetMetrics.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/DescendingAllStudyArea_DB.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/AllAve/DescendingStudyArea_DB_metrics.csv" -minWidth 3





