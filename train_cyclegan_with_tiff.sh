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


i="$SLURM_ARRAY_TASK_ID"
echo "i = ""$i"

echo which python
which python
echo

echo python --version
python --version
echo

if [ "$i" -eq 0 ]; then

  echo "i is 0"

  python train.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2
  python test.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

elif [ "$i" -eq 1 ]; then

  echo "i is 1"

  python train.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2
  python test.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

elif [ "$i" -eq 2 ]; then

  echo "i is 2"

  python train.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

elif [ "$i" -eq 3 ]; then

  echo "i is 3"

  python train.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test --eval --num_test 1000000
  python test.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --id_output_image_format 2 --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

else
  echo "Unknown i: i = ""$i"". Exiting."
  exit
fi
