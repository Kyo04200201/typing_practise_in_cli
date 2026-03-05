# typing practice on cli
# wordlist from internet

#!/bin/bash
correct=0
for line in $(shuf -n 1 wordlist.txt);
do
  line_len=${#line}
  echo "$line"
  start=$(date +"%s.%3N")

  read -p "Type:" -n $line_len ans
  if [ "$ans" == "$line" ]; then
    echo -e "\nCorrect!"
    ((correct++))
  else
    echo -e "\nIncorrect!"
  fi
  end=$(date +"%s.%3N")
  dura=$(echo "$end - $start" | bc)
  echo -e "Time taken: $dura"
done
percentage=$(echo "scale=2; $correct/10 * 100" | bc)
echo -e "Finish\nAccuracy %: $percentage"