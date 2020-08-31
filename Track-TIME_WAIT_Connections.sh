# /bin/bash


echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
echo "		$(date)"  >> TrackTW.txt
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt 
echo "		TRACK TIME_WAIT AND ESTABLISHED CONNECTIONS"  >> TrackTW.txt
echo "------------------------------------------------------------------------------" >> TrackTW.txt 
echo "Proto Recv-Q Send-Q Local Address           Foreign Address         State "     >> TrackTW.txt
echo "------------------------------------------------------------------------------" >> TrackTW.txt

#get records into the text file
netstat >> Track_TW.txt

#count Time_Wait and Established connections.
countTWconn=$(cat Track_TW.txt | grep "TIME_WAIT" | wc -l)
countEstablishedconn=$(cat Track_TW.txt | grep "ESTABLISHED" | wc -l)


#set Config_threshold 
Config_threshold=2

#check TimeWait connections with config. threshold
if [ "$countTWconn" -ge "$Config_threshold" ] 
then
 echo "$(cat Track_TW.txt | grep "TIME_WAIT" )"  >> TrackTW.txt 
 echo "------------------------------------------------------------------------------" >> TrackTW.txt
 echo "$(cat Track_TW.txt | grep "ESTABLISHED" )" >> TrackTW.txt
 echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
 #get total count of TIME_WAIT and ESTABLISHED Connections. 
 echo "Total no of TIME_WAIT Connection: $countTWconn" >> TrackTW.txt
 echo "Total no of ESTABLISHED Connection: $countEstablishedconn" >> TrackTW.txt
 echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
 
else 
 #if there is no TIME_WAIT connections. 
 echo "There is no TIME_WAIT connections  "   >> TrackTW.txt
 echo "All the connections are ESTABLISHED Successfully  ._. "   >> TrackTW.txt
 echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
fi
 echo "Done"     
