
set "source_root=claudia_pc_u:/home/ncc222/projs/repos/pytorch-CycleGAN-and-pix2pix/results"
set "dest=results"

scp -rp %source_root%/vesicles_with_masked_terminals_cyclegan_2d.zip %dest%

pause
scp -rp %source_root%/vesicles_with_masked_vesicles_cyclegan_2d.zip %dest%

pause
scp -rp %source_root%/vesicles_with_masked_terminals_cyclegan_2.5d.zip %dest%

pause
scp -rp %source_root%/vesicles_with_masked_vesicles_cyclegan_2.5d.zip %dest%


rem scp -rp %source_root%/vesicles_with_masked_*s_cyclegan_2*d.zip %dest%


pause

