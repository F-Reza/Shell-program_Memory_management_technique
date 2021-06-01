#!/bin/bash
echo -n "Enter the total memory available (in Bytes): "
read ms

temp=$ms
n=0
for ((i=0; ch=='y'; i++,n++))
do
 echo -n "Enter memory required for process $((i+1)) (in Bytes): "
 read mp[$i]
if ((mp[i] <= temp))
then
 echo "Memory is allocated for $((i+1)) Process: "
 temp=$((temp-${mp[i]}))
 echo -n "Do you want to continue(y/n)-->"
 read ch
else
 echo " "
 echo "Memory is Full!"
 break;

fi
done

echo " "
echo "Total Memory Available: $ms"
echo "----------------------------- "
echo "PROCESS   MEMORY ALLOCATED"
echo "-------   ----------------"
for((i=0; i<n; i++))
do
 echo "    $((i+1))            ${mp[i]}"
done

sum=$((ms-temp))
echo "-------------------------------------"
echo "Total Memory Allocated is : $sum"
echo "Total External Fragmentation is: $temp"




