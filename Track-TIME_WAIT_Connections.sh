# /bin/bash




echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
echo "		$(date)"  >> TrackTW.txt
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt 
echo "			TRACK TIME_WAIT AND ESTABLISHED CONNECTIONS"  >> TrackTW.txt
echo "------------------------------------------------------------------------------" >> TrackTW.txt 
echo "Proto Recv-Q Send-Q Local Address           Foreign Address         State "     >> TrackTW.txt
echo "------------------------------------------------------------------------------" >> TrackTW.txt


#netstat >> Track_TW.txt
countTWconn=$(cat Track_TW.txt | grep "TIME_WAIT" | wc -l)
countEstablishedconn=$(cat Track_TW.txt | grep "ESTABLISHED" | wc -l)
#echo "$countTWconn"
TWconnctions=2
if [ "$countTWconn" -ge "$TWconnctions" ] 
then
 echo "$(cat Track_TW.txt | grep "TIME_WAIT" )"  >> TrackTW.txt
# echo "" >>TrackTW.txt
 echo "------------------------------------------------------------------------------" >> TrackTW.txt
 echo "$(cat Track_TW.txt | grep "ESTABLISHED" )"  >> TrackTW.txt
 echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
 echo "Total no of TIME_WAIT Connection: $countTWconn" >> TrackTW.txt
 echo "Total no of ESTABLISHED Connection: $countEstablishedconn" >> TrackTW.txt
 echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt

else 
 echo "There is no TIME_WAIT connections  "   >> TrackTW.txt
 echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> TrackTW.txt
fi
      
