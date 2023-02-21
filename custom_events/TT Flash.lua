function onCreate()
  precacheImage('Phase3Static')
  makeAnimatedLuaSprite('Flash', 'Phase3Static')
  addAnimationByPrefix('Flash', 'transition', 'Phase3Static instance 1', 24, false)
  setObjectCamera('Flash', 'camOTHER')
  scaleObject('Flash', 3.3, 3.3)
  screenCenter('Flash')
  setProperty('Flash.alpha', 0.4)
end

function onUpdate()
  if getProperty('Flash.animation.curAnim.finished') == true then
   removeLuaSprite('Flash', false)
     end
end

function onEvent(name, val1, val2)
  if name == 'TT Flash' then
      addLuaSprite('Flash', true)
        objectPlayAnimation('Flash', 'transition', true)
    end
end