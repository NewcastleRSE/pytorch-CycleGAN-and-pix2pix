
source_root=claudia_pc_u:/home/ncc222/projs/repos/pytorch-CycleGAN-and-pix2pix/results
dest=results

scp -rp "$source_root"/{vesicles_with_masked_terminals_cyclegan_2d.zip,vesicles_with_masked_vesicles_cyclegan_2d.zip,vesicles_with_masked_terminals_cyclegan_2.5d.zip,vesicles_with_masked_vesicles_cyclegan_2.5d.zip} "$dest"

pause 

