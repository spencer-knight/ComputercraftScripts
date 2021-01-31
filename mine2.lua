sX = nil
sY = nil
sZ = nil
sXDir = nil
sYDir = nil
detour = false
 
funtion mine() 
  
   if detour then
   else 
      --do mining stuff    
   end  
end
function mineColUp( height)
   for i=1, height - 1, 1 do
      turtle.digUp()
      turtle.up()
   end
end
 
function mineColDown( height)
   for i=1, height - 1, 1 do
      turtle.digDown()
      turtle.down()
   end
end
 
function gpsMineCol( low, high)
   --assumes that turtle is in this range
   x, y, z = gps.locate()
   lower = math.abs(y - low) < math.abs(y - high) 
   if lower then
      mineColDown(math.abs(y - low + 1))
      mineColUp(high - low + 1)
   else
     mineColUp( high - y + 1)
     mineColDown( high - low + 1)
   end 
end
 
posX = 1
posZ = 0
--assume starts facing positive x
function turnLeft()
   turtle.turnLeft()
   if posX == 1 or posX == -1 then
      if posX == 1 then
         posZ = -1
      else
         posZ = 1
      end
      posX = 0
   else
      if posZ == 1 then
         posX  = 1
      else 
         posX  = -1
      end    
      posZ = 0
   end
end
 
function turnRight()
   turtle.turnRight()
   if posX == 1 or posX == -1 then
      if posX == 1 then
         posZ = 1
      else
         posZ = -1
      end
      posX = 0
   else
      if posZ == 1 then
         posX  = -1
      else 
         posX  = 1
      end    
      posZ = 0
   end
end
 
endZ = nil
endX = nil
endY = nil
startX = nil
startY = nil
startZ = nil
 
function start() 
   endX = arg[1]
   endY = arg[2]
   endZ = arg[3]
   
   startX, startY, startZ = gps.locate()
   startX += 1
   print("Mining to: " .. endX .. ", " .. endY .. ", " .. endZ)
   
end
