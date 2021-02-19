# commands for executed 

# change to hard drive "5EE425FDE425D7D3" directory
cd /home/milto/Documents/ASTARTE/Scripts/WP6


# 201
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_201.csv" -zones 201 -type db

# 202
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_202.csv" -zones 202

# 201,202
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_201-202.csv" -zones 201,202

# 302
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_302.csv" -zones 302

# 301
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_301.csv" -zones 301

# 302,301
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_301-302.csv" -zones 301,302

# 401
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_401.csv" -zones 401

# 402
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_402.csv" -zones 402

# 401,402 
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_401-402.csv" -zones 401,402

# 201,301,401
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_201-301-401.csv" -zones 201,301,401

# 202,302,402
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_202-302-402.csv" -zones 202,302,402

# 201,202,301,302,401,402
python TimeseriesInOneCsvPerSattelite/mainERS1Interpolate.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1_201-202-301-302-401-402.csv" -zones 201,202,301,302,401,402


bodydir="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/"
polarization=""
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
cp $bodydir"ERS-1"$polarization"_201.csv" $bodydir"singles/ERS-1"$polarization"_201.csv" 
cp $bodydir"ERS-1"$polarization"_202.csv" $bodydir"singles/ERS-1"$polarization"_202.csv" 
cp $bodydir"ERS-1"$polarization"_301.csv" $bodydir"singles/ERS-1"$polarization"_301.csv" 
cp $bodydir"ERS-1"$polarization"_302.csv" $bodydir"singles/ERS-1"$polarization"_302.csv" 
cp $bodydir"ERS-1"$polarization"_401.csv" $bodydir"singles/ERS-1"$polarization"_401.csv" 
cp $bodydir"ERS-1"$polarization"_402.csv" $bodydir"singles/ERS-1"$polarization"_402.csv" 
cp $bodydir"ERS-1"$polarization"_201-202-301-302-401-402.csv" $bodydir"singles/ERS-1"$polarization"_201-202-301-302-401-402.csv" 
#heights
cp $bodydir"ERS-1"$polarization"_201-202.csv" $bodydir"heights/ERS-1"$polarization"_201-202.csv" 
cp $bodydir"ERS-1"$polarization"_301-302.csv" $bodydir"heights/ERS-1"$polarization"_301-302.csv" 
cp $bodydir"ERS-1"$polarization"_401-402.csv" $bodydir"heights/ERS-1"$polarization"_401-402.csv" 
cp $bodydir"ERS-1"$polarization"_201-202-301-302-401-402.csv" $bodydir"heights/ERS-1"$polarization"_201-202-301-302-401-402.csv" 
#light
cp $bodydir"ERS-1"$polarization"_201-301-401.csv" $bodydir"light/ERS-1"$polarization"_201-301-401.csv" 
cp $bodydir"ERS-1"$polarization"_202-302-402.csv" $bodydir"light/ERS-1"$polarization"_202-302-402.csv" 
cp $bodydir"ERS-1"$polarization"_201-202-301-302-401-402.csv" $bodydir"light/ERS-1"$polarization"_201-202-301-302-401-402.csv" 
# merge relevant files
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"singles"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"heights"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"light"

# 






"$polarization"_201-202-301-302-401-402.csv" 
#heights
cp $bodydir"ERS-1"$polarization"_201-202.csv" $bodydir"heights/ERS-1"$polarization"_201-202.csv" 
cp $bodydir"ERS-1"$polarization"_301-302.csv" $bodydir"heights/ERS-1"$polarization"_301-302.csv" 
cp $bodydir"ERS-1"$polarization"_401-402.csv" $bodydir"heights/ERS-1"$polarization"_401-402.csv" 
cp $bodydir"ERS-1"$polarization"_201-202-301-302-401-402.csv" $bodydir"heights/ERS-1"$polarization"_201-202-301-302-401-402.csv" 
#light
cp $bodydir"ERS-1"$polarization"_201-301-401.csv" $bodydir"light/ERS-1"$polarization"_201-301-401.csv" 
cp $bodydir"ERS-1"$polarization"_202-302-402.csv" $bodydir"light/ERS-1"$polarization"_202-302-402.csv" 
cp $bodydir"ERS-1"$polarization"_201-202-301-302-401-402.csv" $bodydir"light/ERS-1"$polarization"_201-202-301-302-401-402.csv" 
# merge relevant files
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"singles"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"heights"
wine "/home/milto/Documents/Small Projects/CSVtools/CSVMerge/release/CSVMerge.exe" $bodydir"light"

# 







