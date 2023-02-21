local path = 'impostor/'

function onCreate() 
  makeLuaSprite('sky', path.. 'banana/sky', -221.85, -167.85) 
  setScrollFactor('sky', 0.5, 0.5) 
  addLuaSprite('sky')

  makeLuaSprite('hills', path.. 'banana/mountains', -358, 438.4)
  setScrollFactor('hills', 0.8, 0.8) 
  addLuaSprite('hills')

  ---makeLuaSprite('ground', path.. 'banana/ground', 331.95, 608.9)
  makeLuaSprite('ground', path.. 'banana/ground', -330, 608.9)
  setScrollFactor('ground', 1, 1) 
  addLuaSprite('ground')

  makeAnimatedLuaSprite('sneakySnitch', path.. 'banana/tone', 106.65, 458.45)
  addAnimationByPrefix('sneakySnitch', 'hide', 'sneaky', 24,true) 
  setScrollFactor('sneakySnitch', 1, 1) 
  addLuaSprite('sneakySnitch')

  makeAnimatedLuaSprite('bananaCrowd', path.. 'banana/bananabgboppers', 1473, 430.1)
  addAnimationByPrefix('bananaCrowd', 'bop', 'amongbabies instance 1', 24, true)
  setScrollFactor('bananaCrowd', 1, 1) 
  addLuaSprite('bananaCrowd')

  ---makeAnimatedLuaSprite('bananaChef', path.. 'banana/chef_banana', 804.85, 538.55)
  makeAnimatedLuaSprite('bananaChef', path.. 'banana/chef_banana', 804.85, 300)
  addAnimationByPrefix('bananaChef', 'event', 'chef instance 1', 24, false) 
  setScrollFactor('bananaChef', 1, 1) 
  addLuaSprite('bananaChef')

  ---makeAnimatedLuaSprite('tomato', path.. 'banana/tomato', 804.85, 538.55)
  makeAnimatedLuaSprite('tomato', path.. 'banana/tomato', 330, 700)
  addAnimationByPrefix('tomato', 'smush', 'tom', 24, true) 
  setScrollFactor('tomato', 1, 1)
  addLuaSprite('tomato', true)

  ---makeLuaSprite('bananas', path.. 'banana/bananas', 117.7, 928.4) 
  makeLuaSprite('bananas', path.. 'banana/bananas', 117.7, 928.4)
  setScrollFactor('bananas', 1.1, 1.1) 
  addLuaSprite('bananas', true)

  ---makeLuaSprite('bunches', path.. 'banana/bananabunches', -284, -168) 
  makeLuaSprite('bunches', path.. 'banana/bananabunches', -260, -168) 
  setScrollFactor('bunches', 1.3, 1.3) 
  addLuaSprite('bunches', true)

  ---makeLuaSprite('leaves', path.. 'banana/leaves', -78.2, -293.9) 
  makeLuaSprite('leaves', path.. 'banana/leaves', -70, -250) 
  setScrollFactor('leaves', 1.5, 1.5) 
  addLuaSprite('leaves', true)
end