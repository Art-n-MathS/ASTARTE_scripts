# convert VH to dB 
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB.csv"

# convert VV to dB
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB.csv"

# normalise VH 
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/Normalise.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N.csv" -testData 49

# normalise VV 
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/Normalise.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N.csv" -testData 49

# smooth VH using 151 filter 
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ApplyFilter.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_151.csv" -filter 1,5,1 

# smooth VV using 151 filter
python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ApplyFilter.py" -in "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N.csv" -out "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N_151.csv" -filter 1,5,1 

# Find peaks for VH
Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/findPeaks.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_151.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_151_peaks.csv"

# Find peaks for VV
Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/findPeaks.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N_151.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N_151_peaks.csv"

# Takes as input a time-series and peaks and adds the sum and duration column - AVE
Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/calculateSums.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1201-202-301-302-401-402_DB_N_final_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1-201-202-301-302-401-402-ave.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1201-202-301-302-401-402_DB_N_final_peaks_withSums.csv" 

# Takes as input a time-series and peaks and adds the sum and duration column - VV
Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/calculateSums.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N_final_peaks_withSums.csv" 

# Takes as input a time-series and peaks and adds the sum and duration column - VH
Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/calculateSums.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_final_peaks_withSums.csv" 


