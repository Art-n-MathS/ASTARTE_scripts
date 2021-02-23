# commands for executed 


cd /home/milto/Documents/ASTARTE/Scripts/WP6

satellite="ERS-2"
ascORdesc="."



polarization="."

MS=4
ME=2
YS=1995
YE=2011
IDS=14



# 201
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201.csv" -zones 201 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 202
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"202.csv" -zones 202 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 201,202
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201-202.csv" -zones 201,202 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 302
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"302.csv" -zones 302 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 301
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"301.csv" -zones 301 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 302,301
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"301-302.csv" -zones 301,302 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 401
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"401.csv" -zones 401 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"402.csv" -zones 402 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 401,402 
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"401-402.csv" -zones 401,402 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 201,301,401
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201-301-401.csv" -zones 201,301,401 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 202,302,402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"202-302-402.csv" -zones 202,302,402 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

# 201,202,301,302,401,402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201-202-301-302-401-402.csv" -zones 201,202,301,302,401,402 -MS $MS -ME $ME -YS $YS -YE $YE -IDS $IDS

bodydir="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/$satellite/$ascORdesc/$polarization/"

# remove previously created folders
rm -r $bodydir"singles" # 201 , 202 , 301 , 302 , 401 , 402 , 201,202,301,302,401,402
rm -r $bodydir"heights" # 201,202 , 301,302 , 401,402 , 201,202,301,302,401,402
rm -r $bodydir"light"   # 201,301,401 ,   202,302,402 , 201,202,301,302,401,402
# create dirs
mkdir $bodydir"singles" # 201 , 202 , 301 , 302 , 401 , 402 , 201,202,301,302,401,402
mkdir $bodydir"heights" # 201,202 , 301,302 , 401,402 , 201,202,301,302,401,402
mkdir $bodydir"light"   # 201,301,401 , 202,302,402 , 201,202,301,302,401,402
# copy relevant .csvs to corresponding folder
#singles
cp $bodydir"$satellite"$polarization"201.csv" $bodydir"singles/$satellite"$polarization"201.csv" 
cp $bodydir"$satellite"$polarization"202.csv" $bodydir"singles/$satellite"$polarization"202.csv" 
cp $bodydir"$satellite"$polarization"301.csv" $bodydir"singles/$satellite"$polarization"301.csv" 
cp $bodydir"$satellite"$polarization"302.csv" $bodydir"singles/$satellite"$polarization"302.csv" 
cp $bodydir"$satellite"$polarization"401.csv" $bodydir"singles/$satellite"$polarization"401.csv" 
cp $bodydir"$satellite"$polarization"402.csv" $bodydir"singles/$satellite"$polarization"402.csv" 
cp $bodydir"$satellite"$polarization"201-202-301-302-401-402.csv" $bodydir"singles/$satellite"$polarization"201-202-301-302-401-402.csv" 
#heights
cp $bodydir"$satellite"$polarization"201-202.csv" $bodydir"heights/$satellite"$polarization"201-202.csv" 
cp $bodydir"$satellite"$polarization"301-302.csv" $bodydir"heights/$satellite"$polarization"301-302.csv" 
cp $bodydir"$satellite"$polarization"401-402.csv" $bodydir"heights/$satellite"$polarization"401-402.csv" 
cp $bodydir"$satellite"$polarization"201-202-301-302-401-402.csv" $bodydir"heights/$satellite"$polarization"201-202-301-302-401-402.csv" 
#light
cp $bodydir"$satellite"$polarization"201-301-401.csv" $bodydir"light/$satellite"$polarization"201-301-401.csv" 
cp $bodydir"$satellite"$polarization"202-302-402.csv" $bodydir"light/$satellite"$polarization"202-302-402.csv" 
cp $bodydir"$satellite"$polarization"201-202-301-302-401-402.csv" $bodydir"light/$satellite"$polarization"201-202-301-302-401-402.csv" 
# merge relevant files
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"singles"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"heights"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"light"

## Not cleaned according to Meteo data, in case I want to do manual interpolation

# remove previously created folders
rm -r $bodydir"singles_notCleaned" # 201 , 202 , 301 , 302 , 401 , 402 , 201,202,301,302,401,402
rm -r $bodydir"heights_notCleaned" # 201,202 , 301,302 , 401,402 , 201,202,301,302,401,402
rm -r $bodydir"light_notCleaned"   # 201,301,401 ,   202,302,402 , 201,202,301,302,401,402
# create dirs
mkdir $bodydir"singles_notCleaned" # 201 , 202 , 301 , 302 , 401 , 402 , 201,202,301,302,401,402
mkdir $bodydir"heights_notCleaned" # 201,202 , 301,302 , 401,402 , 201,202,301,302,401,402
mkdir $bodydir"light_notCleaned"   # 201,301,401 , 202,302,402 , 201,202,301,302,401,402
# copy relevant .csvs to corresponding folder
#singles
cp $bodydir"$satellite"$polarization"201.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"201.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"202.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"202.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"301.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"301.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"302.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"302.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"401.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"401.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"402.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"402.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"201-202-301-302-401-402.csv_notCleaned.csv" $bodydir"singles_notCleaned/$satellite"$polarization"201-202-301-302-401-402.csv_notCleaned.csv" 
#heights
cp $bodydir"$satellite"$polarization"201-202.csv_notCleaned.csv" $bodydir"heights_notCleaned/$satellite"$polarization"201-202.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"301-302.csv_notCleaned.csv" $bodydir"heights_notCleaned/$satellite"$polarization"301-302.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"401-402.csv_notCleaned.csv" $bodydir"heights_notCleaned/$satellite"$polarization"401-402.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"201-202-301-302-401-402_notCleaned.csv.csv" $bodydir"heights_notCleaned/$satellite"$polarization"201-202-301-302-401-402.csv_notCleaned.csv" 
#light
cp $bodydir"$satellite"$polarization"201-301-401.csv_notCleaned.csv" $bodydir"light_notCleaned/$satellite"$polarization"201-301-401.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"202-302-402.csv_notCleaned.csv" $bodydir"light_notCleaned/$satellite"$polarization"202-302-402.csv_notCleaned.csv" 
cp $bodydir"$satellite"$polarization"201-202-301-302-401-402.csv_notCleaned.csv" $bodydir"light_notCleaned/$satellite"$polarization"201-202-301-302-401-402.csv_notCleaned.csv" 
# merge relevant files
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"singles_notCleaned"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"heights_notCleaned"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"light_notCleaned"













