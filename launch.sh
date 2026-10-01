


is=(1 2)


for i in "${is[@]}"
do

  #echo "$i"

  bash train_cyclegan_with_tiff_test.sh "$i"

done
