
############## PARAMETERS DEFINITION ##########################

# direcory with csv files to be interpreted
baseDir="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/"

# name of input file to be interpreted
input=$baseDir"all.csv"
# name of output file without extension used for all following cases
output=$baseDir"Sentinel1_Asc_VH_all_heigh_DB"
# name of directory to be created for storing .csv files (one for each year to be created)

scriptsDir="/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/"


############## SCRIPTS ##########################

# 1. ConvertToDB
python $scriptsDir"ConvertToDB.py" -in $input -out $output".csv"

# 2. ApplyFilter
python $scriptsDir"ApplyFilter.py" -in $output".csv" -out $output"filtered.csv" -filter 1,2,5,2,1 

# 3.a. Create Directory for storing the .csv files one for each year
newDir=$baseDir"heightyears"
mkdir $newDir

# 3.b. Splits input .csv file into multiple
python $scriptsDir"SplitAccordingToYear.py" -in $output"filtered.csv" -outDir $newDir



############## FOR LATEX FILE ##########################

# 1. RoundToSpecificDecimal
python $scriptsDir"RoundToSpecificDecimal.py" -in $output"filtered.csv" -out $output"filtered_2decimal.csv" -noOfDecimal 2


# 2. Add & between items and \\ at the end
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertForLaTeX.py" -in $output"filtered.csv" 
