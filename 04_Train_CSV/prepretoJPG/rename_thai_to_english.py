import os

path = "02_lunges/up/"

# path_1 ='02-photo_model/02_arm_circles/up/'


for count, filename in enumerate(os.listdir(path)):
    dist = "NewFile-" + str(count) + ".jpg"
    os.rename(path + filename, path + dist)



# reference  https://khonkaen.dev/python-rename-many-files/