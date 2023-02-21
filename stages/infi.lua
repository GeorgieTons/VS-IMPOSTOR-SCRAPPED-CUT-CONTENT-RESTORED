local path = 'impostor/'

function onCreate() 
   makeLuaSprite('whitebg', path.. 'infi/whitebg', -246, -181) 
   addLuaSprite('whitebg') 

   makeLuaSprite('mountains', path.. 'infi/mountains', -120, -86) 
   setScrollFactor('mountains', 0.5, 0.5) 
   addLuaSprite('mountains') 

   makeAnimatedLuaSprite('housesmoke', path..'infi/house', 382, -225) 
   addAnimationByPrefix('housesmoke', 'house', 'house', 24, true) 
   setScrollFactor('housesmoke', 0.9, 0.9) 
   addLuaSprite('housesmoke') 

   makeLuaSprite('ground', path.. 'infi/base', -220, 475) 
   addLuaSprite('ground') 
end