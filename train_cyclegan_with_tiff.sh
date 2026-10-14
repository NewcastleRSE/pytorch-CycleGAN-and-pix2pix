#!/bin/bash

#SBATCH --account=comet_rse_cna

#SBATCH --job-name=CycleGAN

#####SBATCH --partition=default_free
######SBATCH --time=01:00:00

#SBATCH --partition=gpu-s_free
####SBATCH --partition=gpu-s_paid
#SBATCH --gres=gpu:L40:1
#SBATCH --time=14-00:00:00

#SBATCH --cpus-per-task=16
###SBATCH --nodes=1
###SBATCH --ntasks=1

#SBATCH --mem=32G

#SBATCH --array=0-3:1%4


known_is=(-1 0 1 2 3)

echo

if [ -v "SLURM_ARRAY_TASK_ID" ]; then
  i="$SLURM_ARRAY_TASK_ID"
elif [ -v "1" ]; then
  i="$1"
else
#  i=all
  echo "Both varibles \"SLURM_ARRAY_TASK_ID\" and \"1\" are not set"
  exit
fi

is_i_known=false
for known_i in "${known_is[@]}"; do
#  echo "$known_i"
  if [ "$i" = "$known_i" ]; then
    is_i_known=true
    break
  fi
done

if "$is_i_known"; then
  echo "i is known: i = ""$i""."
else
  echo "i is unknown: i = ""$i"". Exiting."
  exit
fi
echo

dashes="----------------------------------------------------------------------------------"

echo which python
which python
echo

echo python --version
python --version
echo

if [ "$i" -eq 0 ] || [ "$i" -eq -1 ]; then

  echo "$dashes"; echo

  echo "i is 0"
  echo "Training 2D CycleGAN on images with masked boutons..."

  python train.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
  python test.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

  echo
fi

if [ "$i" -eq 1 ] || [ "$i" -eq -1 ]; then

  echo "$dashes"; echo

  echo "i is 1"
  echo "Training 2D CycleGAN on images with masked vesicles..."

  python train.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
  python test.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

  echo
fi

if [ "$i" -eq 2 ] || [ "$i" -eq -1 ]; then

  echo "$dashes"; echo

  echo "i is 2"
  echo "Training 2.5D CycleGAN on images with masked boutons..."

  python train.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

  echo
fi

if [ "$i" -eq 3 ] || [ "$i" -eq -1 ]; then

  echo "$dashes"; echo

  echo "i is 3"
  echo "Training 2.5D CycleGAN on images with masked vesicles..."

  python train.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

  echo
fi
