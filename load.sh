#!/bin/bash

for (( loop=1;loop>0;loop++));do
sleep 20 

load_dc(){


   load=$(ssh root@192.168.200.2 cat /proc/loadavg | awk '{ print $1}');
   l=${load}
   estavel=2.00

    if [ $l '>' $estavel ];
    then
        echo -e "DC => ${vetor[$i]} \033[0;31m  $l  \033[0m "
    elif [ $l '<' $estavel ]
    then
        echo -e "DC => ${vetor[$i]}  \033[0;32m $l  \033[0m"
    else [ $estavel '==' $l ]
        echo -e "DC => ${vetor[$i]} \033[0;37m $l \033[0m"

fi


}

load_jboss(){
   load=$(ssh -p10222 root@192.168.200.45 cat /proc/loadavg | awk '{ print $1}');
   l=${load}
   estavel=1.00

if [ $l '>' $estavel ]
then
  echo -e "Jboos => \033[0;31m  $l  \033[0m "
elif [ $l '<' $estavel ]
then
   echo -e "Jboos => \033[0;32m $l  \033[0m"
elif [ $estavel '==' $l ]
then
   echo -e "Jboos => \033[0;37m $l \033[0m"       
fi
} 

load_dc
load_jboss

# Lojas 
vetor[0]="1"
vetor[1]="2"
vetor[2]="3"
vetor[3]="5"
vetor[4]="8"
vetor[5]="110"
vetor[6]="11"
vetor[7]="13"
vetor[8]="14"
vetor[9]="16"
vetor[10]="17"
vetor[11]="18"
vetor[12]="19"
vetor[13]="20"
vetor[14]="21"
vetor[15]="22"
vetor[16]="24"
vetor[17]="25"

tam_vetor=${#vetor[@]}

for ((i=0; i<${tam_vetor}; i++))
do

load=$(ssh root@192.168.${vetor[$i]}.102 cat /proc/loadavg | awk '{ print $1}');
   l=${load}


   estavel=1.00

  if [[ $l == ", av" ]]; then
     echo -e "{vetor[$i]}" =>  users, average:
else
    #echo  numerico
    if [ $l '>' $estavel ]
    then
        echo -e "${vetor[$i]} => \033[0;31m  $l  \033[0m "
    elif [ $l '<' $estavel ]
    then
        echo -e "${vetor[$i]} => \033[0;32m $l \033[0m"
    elif [ $estavel '==' $l ]
    then
        echo -e "${vetor[$i]} => \033[0;37m $l \033[0m"
    fi

  fi

done
done
