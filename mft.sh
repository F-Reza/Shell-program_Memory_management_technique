#!/bin/bash
echo -n "Enter the total memory available (in Bytes): "
read ms

echo -n "Enter the block size (in Bytes): "
read bs

nob=$((ms / bs))
ef=$((ms-nob * bs))

echo -n "Enter the number of processes: "
read n

for((i=0; i<n; i++))
do
 echo -n "Enter memory required for process (in Bytes) $((i+1)): "
 read mp[$i]
done

echo " "
echo -n "No. of Blocks available in memory: $nob"
echo " "
echo " "

echo "PROCESS  MEMORY REQUIRED  ALLOCATED  INTERNAL FRAGMENTATION"
echo "-------  ---------------  ---------  ----------------------"

for((i=0; i<n && p<nob; i++))
do
 #echo "   $((i+1))           ${mp[i]}"
if ((mp[i] > bs))
then
 echo "   $((i+1))           ${mp[i]}           NO           ------"   
else
 sum=$((bs-${mp[i]}))
 echo "   $((i+1))           ${mp[i]}           YES            $sum"
 ((tif = tif + $sum))
 ((p++))
fi
done

if ((i < n))
then
 echo "Memory is Full, Remaining Processes cannot be accomodated"
fi


echo "-----------------------------------------------------------"
echo "Total Internal Fragmentation is: $tif"
echo "Total External Fragmentation is: $ef"




