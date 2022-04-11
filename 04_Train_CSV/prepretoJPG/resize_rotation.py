# import the library opencv
import cv2
# globbing utility.
import glob
import numpy as np
# import pyheif
# select the path




# path = "data\demo\*.*"
path = "demo-2\*.*" #set path file data jpg

for bb,file in enumerate (glob.glob(path)):
    image_read = cv2.imread(file)
    # conversion numpy array into rgb image to show
    # c = cv2.cvtColor(image_read, cv2.COLOR_BGR2RGB)

    scale_percent = 100 # for flip_lr jpg file set original 
    # scale_percent = 40 # percent of original size
    width = int(image_read.shape[1] * scale_percent / 100)
    height = int(image_read.shape[0] * scale_percent / 100)
    dim = (width, height)

    new_array=cv2.resize(image_read,dim)

    # img = np.fliplr(new_array) # for flip_lr jpg file

    img = np.rot90(new_array) # fist rotate 
    img = np.rot90(img)  # second rotate


    

    # cv2.imshow('Color image', img)
    # writing the images in a folder output_images
    # cv2.imwrite('data\demo-2\image_{:>05}.jpg'.format(bb), img)
    cv2.imwrite('demo-3\image_{:>04}.jpg'.format(bb), img)
    # wait for 1 second
    k = cv2.waitKey(1000)
    # destroy the window
    cv2.destroyAllWindows()




