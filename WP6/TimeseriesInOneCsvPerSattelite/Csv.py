
## @package Csv
#  This class contains Csv file with statistics about a SAR image
#  @author Dr Milto Miltiadou
#  @date Oct 2020
#  @version 1.0

import os

class Csv:

   ## the constructor
   # @param[in] i_classes the classes defined on the imported mask
   # @param[in] i_pixelX the size of pixel in the X dimension
   # @param[in] i_pixelY the size of pixel in the Y dimension
   def __init__(self,i_classes,i_pixelX,i_pixelY):
      self.noOfMasks = len(i_classes)
      self.classes   = i_classes
      self.pixelsNo  = [0  ]*self.noOfMasks
      self.areas     = [0.0]*self.noOfMasks
      self.backcoes  = [0.0]*self.noOfMasks
      self.pixelX    = i_pixelX
      self.pixelY    = i_pixelY
   
   ## method that checks if a class exist
   #  @param[in] i_class class to check if it already exists
   #  @return returns true if it exist and false if it doesnt 
   def doesClassExist(self,i_class):
      for c in self.classes:
         if (c==i_class):
            return 1
      return 0
      
   ## method that adds a new class in the csv file
   #  returns true if the class was added and false if it already existed
   def addClass(self,i_class):
      if not self.doesClassExist(i_class):
         self.classes += [i_class]
         self.pixelsNo+= [0      ]
         self.areas   += [0.0    ]
         self.backcoes+= [0.0    ]
         self.noOfMasks+=1
         return 1 
      return 0    
      
   
   ## method that adds a pixel value to a given class
   #  @param[in] i_class the class that the pixel belongs to
   #  @param[in] i_backcoe the backscattered coefficient of that pixel value
   def addPixel(self,i_class,i_backcoe):
      i = -1
      for c in self.classes:
         i+=1
         if c==i_class:
            break
      if  self.addClass(i_class):
         i+=1
      self.pixelsNo[i]+=1
      self.areas[i]+=(self.pixelX*self.pixelY)
      self.backcoes[i]+=i_backcoe
      
   
      
   ## method that exports the information of this class into a csv file
   # @param[in] i_outFileName name of file to be exported
   def export(self,i_outFileName):
      f=open(i_outFileName,"w+")
      f.write("classes,pixelsNo,areas,backcoes,pixelX,pixelY\n")
      for i in range (self.noOfMasks):
         f.write("%i,%i,%.2f,%.2f,%.2f,%.2f\n" %(self.classes[i], self.pixelsNo[i], self.areas[i], self.backcoes[i]/self.pixelsNo[i], self.pixelX, self.pixelY))
      f.close()
      cdir=os.getcwd()
      print ("File saved into:",cdir+"/"+i_outFileName, "  .")
      

