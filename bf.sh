#!/bin/bash

echo "=============Memory Management Scheme - Best Fit============="
echo -n "Enter the number of blocks: "
read nb

echo -n "Enter the number of processes: "
read np

echo "Enter the size of the blocks:--"

for((i=1;i<=nb;i++))
do
 echo -n "  Block no $i: "
 read b[$i]
done

echo "Enter the size of the processes :--"
for((i=1;i<=np;i++))
do
 echo -n "  Process no $i: "
 read p[$i]
done
lowest=9999

for((i=1;i<=np;i++))
do
 for((j=1;j<=nb;j++))
 do

 if((barray[j]!=1))
 then

 temp=$((b[j]-p[i]))
 
  if((temp>=0))
  then
    if((lowest>temp))
    then

((parray[i]=j))
((lowest=temp))

   fi
  fi
 fi
done
((fragment[i]=lowest))
((barray[parray[i]]=1))
lowest=10000;
done

echo " "
echo "Process_no   Process_size   Block_no   Block_size   Fragment"
echo "----------   ------------   --------   ----------   --------"
for((i=1;i<=np && parray[i]!=0;i++))
do

((tif = tif + ${fragment[i]}))

echo "    $i             ${p[i]}            ${parray[i]}            ${b[${parray[i]}]}          ${fragment[i]}"

done
echo "------------------------------------------------------------"
echo "Total Internal Fragmentation is: $tif"
echo " "


