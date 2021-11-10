# commands for executed 

# change to hard drive "5EE425FDE425D7D3" directory
cd /home/milto/Documents/ASTARTE/Scripts/WP6

mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/#6_Final_LAI_csv/AOI"
mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/#6_Final_LAI_csv/Desc"
mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/#6_Final_LAI_csv/Asc"

#  
# Sentinel-2
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/6_BandSelectGDAL" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/Desc" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/6_BandSelectGDAL" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/Asc" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/6_BandSelectGDAL" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/AOI" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect.tif"


python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/Asc/all" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/AscSentinel2.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 0

python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/Desc/all" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/DescSentinel2.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 0

python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/AOI/all" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI_MASKS/8_Final_LAI_csv/AOISentinel2.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 0









mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv"
mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Desc"
mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Asc"
mkdir "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/AOI"

# Landsat 8
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Desc" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Asc" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/AOI" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect.tif"



python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Asc/ALL" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/AscLandsat-8.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 17

python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Desc/ALL" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/Descc.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 17

python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/AOI/ALL" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-8_csv/AOILandsat-8.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 17


# Landsat 5
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/Desc" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/Asc" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5" -o "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/AOI" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect.tif"



python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/Asc/ALL" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/AscLandsat-5.csv" -zones 201,202,302,301,401,402 -MS 8 -ME 10 -YS 1992 -YE 2011 -IDS 17

python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/Desc/ALL" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/DescLandsat-5.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 17

python TimeseriesInOneCsvPerSattelite/mainAllInOne.py -in "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/AOI/ALL" -out "/run/media/milto/Seagate Expansion Drive/Leaf Area Index/LAI/Landsat-5_csv/AOILandsat-5.csv" -zones 201,202,302,301,401,402 -MS 5 -ME 4 -YS 2014 -YE 2018 -IDS 17









# testing only two Sentinel images that study area is covered entirely by them for fast testing 
# python  scripts/main.py -in Pre-processing/Level2/test -o Pre-processing/Level3 -masks /run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif

python TimeseriesInOneCsvPerSattelite/mainSentinel1Desc.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/DESCENDING/VH/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/DESCENDING/VH/Sentinel1_VH.csv" -zones 201,202,302,301,401,402

python TimeseriesInOneCsvPerSattelite/mainSentinel1Desc.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/DESCENDING/VV/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/DESCENDING/VV/Sentinel1_VVallzones.csv" -zones 201,202,302,301,401,402

# **** CSV CREATION FOR ALL DATA ***
# ERS-1 nonNan
python  CsvCreation/mainNoNan.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-2/" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-2" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

python  CsvCreation/mainNoNan.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-1/" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

# Sentinel ASCENDING (all since they have been copied)
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/Sentinel-1/ASCENDING" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/ASCENDING" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"


# Sentinel ENVISAT from SSD  
python  CsvCreation/main.py -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level2/ENVISAT" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ENVISAT/reprocessed" -masks "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"


# Sentinel ASCENDING 2020 from SSD  
python  CsvCreation/main.py -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level2/Sentinel-1/ASCENDING/2020/VH" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/ASCENDING/VH" -masks "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level2/Sentinel-1/ASCENDING/2020/VV" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/ASCENDING/VV" -masks "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

# Sentinel DESCENDING from SSD 
python  CsvCreation/main.py -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level2/Sentinel-1/DESCENDING" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/DESCENDING" -masks "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"





# ERS-1
#python  CsvCreation/mainNoNan.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-1" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

#python TimeseriesInOneCsvPerSattelite/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1.csv" -zones 201,202


# ERS-2
#python  CsvCreation/mainNoNan.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-2" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-2" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

#python TimeseriesInOneCsvPerSattelite/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-2" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-2/ERS-2.csv" -zones 201,202



# Sentinel ASCENDING discarded data # we did the mosaic by the end
# python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2-discarded_data/Sentinel-1/ASCENDING/Before Mosaic VH" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3-discarded_data/Sentinel-1/ASCENDING/Before Mosaic VH" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

# python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2-discarded_data/Sentinel-1/ASCENDING/Before Mosaic VV" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3-discarded_data/Sentinel-1/ASCENDING/Before Mosaic VV" -masks "/run/media/milto/seagate expansion drive/astarte_data/astarte-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"


# all Sentinel1 ascending and descending 
./executeSentinel1PerZoneNAllInterpolate.sh 
./executeSentinel1_ASc_PerZoneNAllInterpolate.sh
./executeENVISATPerZoneNAllInterpolate.sh


# create csv 2020
python  CsvCreation/main.py -in "/run/media/milto/My Passport/ASTARTE_Data/Level2/Sentinel-1/ASCENDING/2020/VH" -o "/run/media/milto/My Passport/ASTARTE_Data/Level3/Sentinel-1/ASCENDING/2020/VH" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/run/media/milto/My Passport/ASTARTE_Data/Level2/Sentinel-1/ASCENDING/2020/VV" -o "/run/media/milto/My Passport/ASTARTE_Data/Level3/Sentinel-1/ASCENDING/2020/VV" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/run/media/milto/My Passport/ASTARTE_Data/Level2/Sentinel-1/DESCENDING/2020/VH" -o "/run/media/milto/My Passport/ASTARTE_Data/Level3/Sentinel-1/DESCENDING/2020/VH" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"

python  CsvCreation/main.py -in "/run/media/milto/My Passport/ASTARTE_Data/Level2/Sentinel-1/DESCENDING/2020/VV" -o "/run/media/milto/My Passport/ASTARTE_Data/Level3/Sentinel-1/DESCENDING/2020/VV" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"






