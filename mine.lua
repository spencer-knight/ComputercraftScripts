--todo add gps, dump chest, charcoal, chunk loading

inventorySize = 16
 
function invSort()
   for i=1, inventorySize do
      currentItem = turtle.getItemDetail(1)
      if currentItem ~= nil then
         turtle.select(i)
            for j=1,inventorySize do
               if turtle.compareTo(j) then
                  turtle.select(j);turtle.transferTo(i);turtle.select(i);
               end
            end
      end
      end
end
function inArr( item, arr)
   for i=1, table.getn(arr), 1 do
      if item == arr[i] then
         return true
      end
   end
   return false
end
function invEmpty() 
   for i=1,inventorySize,1 do
      if turtle.getItemCount(i) ~= 0 then
         return false
      end
   end
   return true
end
function invFull()
   for i=1,inventorySize,1 do
      if turtle.getItemCount(i) == 0 then
         return false
      end
   end
   return true
end
 
function dropUseless()
   useless = {
      "minecraft:cobblestone",
      "minecraft:dirt",
      "minecraft:andesite",
      "minecraft:gravel",
      "minecraft:granite",
      "minecraft:diorite"
   }
 
   for i=1,inventorySize,1 do
      slot = turtle.getItemDetail(i)
      if slot ~= nil then
         name = slot["name"]
         if inArr(name, useless) then
            turtle.select(i)
            turtle.drop()
         end
      end
   end
   turtle.select(1)
end
 
function main() 
   tool = "right"
   for j=1, arg[1] - 1,1 do
      for i=1, arg[1] - 1,1 do
         turtle.dig()
         turtle.digUp()
         turtle.forward()
         dropUseless()
      end
      turtle.digUp()
      dropUseless()
      if j % 2 == 0 then
         turtle.turnLeft()
         turtle.dig()
         turtle.forward()
         turtle.digUp()
         turtle.turnLeft()
      else
         turtle.turnRight()
         turtle.dig()
         turtle.forward()
         turtle.digUp()
         turtle.turnRight() 
      end 
      dropUseless()
   end 
   for i=1,arg[1]-1,1 do
      turtle.dig()
      turtle.forward()
      turtle.digUp()  
      dropUseless()
   end
   turtle.digUp()
   dropUseless()
end
 
main()
