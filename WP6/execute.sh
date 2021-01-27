# commands for executed 

# change to hard drive "5EE425FDE425D7D3" directory
cd /home/milto/Documents/ASTARTE/Scripts/WP6


#  run python script, it will fail for Sentinel but the following script is dedicated to Sentinel so all good
python  CsvCreation/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"

# for Sentinel images only since it crashes
python  CsvCreation/ForSentinel-1/main.py -in "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level2/Sentinel-1" -o "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/Level3/Sentinel-1" -masks "/run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif"



# testing only two Sentinel images that study area is covered entirely by them for fast testing 
python  scripts/main.py -in Pre-processing/Level2/test -o Pre-processing/Level3 -masks /run/media/milto/Seagate Expansion Drive/ASTARTE_data/ASTARTE-masks/AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif
