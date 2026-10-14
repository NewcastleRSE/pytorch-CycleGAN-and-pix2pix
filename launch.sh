


is=(1 3)


for i in "${is[@]}"
do

  #echo "$i"

  bash train_cyclegan_with_tiff.sh "$i"

done
