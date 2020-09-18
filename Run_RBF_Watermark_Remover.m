% call image_inpainting function to remove watermark from image
% replace corrupted_image.tif with image name of file you would like
% to correct
[im,im_inpainted]=RBF_image_inpainting('corrupted_image.tif',3,2);