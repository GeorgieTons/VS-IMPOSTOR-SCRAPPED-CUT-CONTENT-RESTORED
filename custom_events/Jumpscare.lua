function onCreate()
  precacheImage('deadpostor jumpscare')
  makeLuaSprite('Jump', 'deadpostor jumpscare')
  setObjectCamera('Jump', 'camOTHER')
  setProperty('Jump.alpha', 0) 
  addLuaSprite('Jump')
end

function onEvent(name, val1, val2)
  if name == 'Jumpscare' then
  cameraShake('other', val1, val2)
  setProperty('Jump.alpha', 1)
  runTimer('jumpTime', val2)
    end
end

function onTimerCompleted(tag)
  if tag == 'jumpTime' then
  setProperty('Jump.alpha', 0)
    end
end