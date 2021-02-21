# commands for executed 


cd /home/milto/Documents/ASTARTE/Scripts/WP6

satellite="Sentinel-1"
ascORdesc="DESCENDING"



polarization="VH"
polarizationB="VV"


# 201
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201.csv" -zones 201 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 202
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"202.csv" -zones 202 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 201,202
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201-202.csv" -zones 201,202 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 302
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"302.csv" -zones 302 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 301
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"301.csv" -zones 301 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 302,301
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"301-302.csv" -zones 301,302 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 401
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"401.csv" -zones 401 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"402.csv" -zones 402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 401,402 
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"401-402.csv" -zones 401,402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 201,301,401
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201-301-401.csv" -zones 201,301,401 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 202,302,402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"202-302-402.csv" -zones 202,302,402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 201,202,301,302,401,402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarization/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarization"/"$satellite$polarization"201-202-301-302-401-402.csv" -zones 201,202,301,302,401,402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

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







# 201
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"201.csv" -zones 201 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 202
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"202.csv" -zones 202 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 201,202
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"201-202.csv" -zones 201,202 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 302
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"302.csv" -zones 302 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 301
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"301.csv" -zones 301 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 302,301
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"301-302.csv" -zones 301,302 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 401
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"401.csv" -zones 401 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"402.csv" -zones 402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 401,402 
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"401-402.csv" -zones 401,402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17


# 201,301,401
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"201-301-401.csv" -zones 201,301,401 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 202,302,402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"202-302-402.csv" -zones 202,302,402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17

# 201,202,301,302,401,402
python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/$satellite/$ascORdesc/$polarizationB/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/"$satellite"/"$ascORdesc"/"$polarizationB"/"$satellite$polarizationB"201-202-301-302-401-402.csv" -zones 201,202,301,302,401,402 -MS 9 -ME 1 -YS 2014 -YE 2021 -IDS 17




bodydir="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/$satellite/$ascORdesc/$polarizationB/"

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
cp $bodydir"$satellite"$polarizationB"201.csv" $bodydir"singles/$satellite"$polarizationB"201.csv" 
cp $bodydir"$satellite"$polarizationB"202.csv" $bodydir"singles/$satellite"$polarizationB"202.csv" 
cp $bodydir"$satellite"$polarizationB"301.csv" $bodydir"singles/$satellite"$polarizationB"301.csv" 
cp $bodydir"$satellite"$polarizationB"302.csv" $bodydir"singles/$satellite"$polarizationB"302.csv" 
cp $bodydir"$satellite"$polarizationB"401.csv" $bodydir"singles/$satellite"$polarizationB"401.csv" 
cp $bodydir"$satellite"$polarizationB"402.csv" $bodydir"singles/$satellite"$polarizationB"402.csv" 
cp $bodydir"$satellite"$polarizationB"201-202-301-302-401-402.csv" $bodydir"singles/$satellite"$polarizationB"201-202-301-302-401-402.csv" 
#heights
cp $bodydir"$satellite"$polarizationB"201-202.csv" $bodydir"heights/$satellite"$polarizationB"201-202.csv" 
cp $bodydir"$satellite"$polarizationB"301-302.csv" $bodydir"heights/$satellite"$polarizationB"301-302.csv" 
cp $bodydir"$satellite"$polarizationB"401-402.csv" $bodydir"heights/$satellite"$polarizationB"401-402.csv" 
cp $bodydir"$satellite"$polarizationB"201-202-301-302-401-402.csv" $bodydir"heights/$satellite"$polarizationB"201-202-301-302-401-402.csv" 
#light
cp $bodydir"$satellite"$polarizationB"201-301-401.csv" $bodydir"light/$satellite"$polarizationB"201-301-401.csv" 
cp $bodydir"$satellite"$polarizationB"202-302-402.csv" $bodydir"light/$satellite"$polarizationB"202-302-402.csv" 
cp $bodydir"$satellite"$polarizationB"201-202-301-302-401-402.csv" $bodydir"light/$satellite"$polarizationB"201-202-301-302-401-402.csv" 
# merge relevant files
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"singles"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"heights"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"light"



# 







