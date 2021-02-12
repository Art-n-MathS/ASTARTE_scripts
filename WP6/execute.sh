# commands for executed 

# change to hard drive "5EE425FDE425D7D3" directory
cd /home/milto/Documents/ASTARTE/Scripts/WP6


#  run python script, to create a csv file with the average backscattered coefficient per zone per image
#  Sentinel images has been saperated to one image for VV and one image for VH, ascending images has also been mosaic so it should work for all images
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

# ERS-1
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-1" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"


# for each sattelite given the zones of interest, return the average time series bascattered coeffient into a single .csv file. 
# An extra .csv file is generated with the area of each sattelite used for testing
python TimeseriesInOneCsvPerSattelite/main.py -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level3/ENVISAT" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ENVISAT.csv" -zones 201,202

# testing only two Sentinel images that study area is covered entirely by them for fast testing 
# python  scripts/main.py -in Pre-processing/Level2/test -o Pre-processing/Level3 -masks /run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif

python TimeseriesInOneCsvPerSattelite/mainSentinel1Desc.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/DESCENDING/VH/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/DESCENDING/VH/Sentinel1_VH.csv" -zones 201,202,302,301,401,402

python TimeseriesInOneCsvPerSattelite/mainSentinel1Desc.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/DESCENDING/VV/" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/DESCENDING/VV/Sentinel1_VVallzones.csv" -zones 201,202,302,301,401,402



# ERS-1
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-1" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

python TimeseriesInOneCsvPerSattelite/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-1" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-1/ERS-1.csv" -zones 201,202


# ERS-2
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/ERS-2" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-2" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

python TimeseriesInOneCsvPerSattelite/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/ERS-2" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/ERS-2/ERS-2.csv" -zones 201,202


# Sentinel ASCENDING
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/Sentinel-1/ASCENDING" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1/ASCENDING" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/ascedingaspects_SW_W_NW_median_zones.tif"





