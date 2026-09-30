#!/bin/bash


echo which python
which python
echo

echo python --version
python --version
echo


python train.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
python test.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
python test.py --dataroot ./datasets/vesicles_2d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000


python train.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
python test.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
python test.py --dataroot ./datasets/vesicles_2d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2d_tiff --model cycle_gan --input_nc 1 --output_nc 1 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000


python train.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
python test.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
python test.py --dataroot ./datasets/vesicles_2.5d_tiff/convexhull_combined --name vesicles_with_masked_terminals_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000


python train.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs
python test.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test --eval --num_test 1000000
python test.py --dataroot ./datasets/vesicles_2.5d_tiff/vesicle_combined --name vesicles_with_masked_vesicles_cyclegan_2.5d_tiff --model cycle_gan --input_nc 3 --output_nc 3 --num_threads 24 --batch_size 6 --load_size 256 --crop_size 256 --preprocess none --no_flip --save_tiffs --no_dropout --phase test_all_xy_slices --eval --num_test 1000000

