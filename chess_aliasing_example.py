import cv2
import numpy as np
from matplotlib import pyplot as plt

chess_512 = cv2.imread('chess_512_512.png')    #512x512 image having 8x8 squares => size of a single square is greater than the size of pixel

# =================== creating 256x256 chess pattern

chess_256 = np.zeros((256,256),np.uint8)       #256 squares

sz = 256
x = 0
while x<sz:
    y = 0
    while y<sz:
        if (x+y)%2==0:
            chess_256[x,y] = 255
        y+=1
    x+=1


cv2.namedWindow('256x256',cv2.WINDOW_NORMAL)
cv2.imshow('256x256',chess_256)

cv2.namedWindow('512x512',cv2.WINDOW_NORMAL)
cv2.imshow('512x512',chess_512)

# ================ SAMPLING =================== Resizing =====================

resize_256_to_96 = cv2.resize(chess_256,(96,96))    # we want 256 squares to be fitted in 96 pixels, => equivalent size of one square of
                                                    # a pattern is less than the size of a pixel in 96x96 system
resize_512_to_96 = cv2.resize(chess_512,(96,96))  

cv2.namedWindow('256---96',cv2.WINDOW_NORMAL)
cv2.imshow('256---96',resize_256_to_96)

cv2.namedWindow('512---96',cv2.WINDOW_NORMAL)
cv2.imshow('512---96',resize_512_to_96)

# ================== RECONSTRUCTION =============================

img1 = cv2.resize(resize_256_to_96,(256,256))
cv2.namedWindow('img1',cv2.WINDOW_NORMAL)
cv2.imshow('img1',img1)

img2 = cv2.resize(resize_512_to_96,(512,512))
cv2.namedWindow('img2',cv2.WINDOW_NORMAL)
cv2.imshow('img2',img2)

cv2.waitKey(0)
cv2.destroyAllWindows()

