local xx =  1600;
local yy =  1300;
local xx2 = 1800;
local yy2 = 1300;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;
path = 'impostor/polus2/'
Pos = {400, 300}

function onCreate()
  makeLuaSprite('sky', path..'newsky', Pos[1], Pos[2])
  scaleObject('sky', 0.75, 0.75)
  addLuaSprite('sky')

  makeLuaSprite('cloud', path..'newcloud', Pos[1], Pos[2])
  scaleObject('cloud', 0.75, 0.75)
  setProperty('cloud.alpha', 0.59)
  addLuaSprite('cloud')

  makeLuaSprite('backwall', path..'backwall', Pos[1], Pos[2])
  scaleObject('backwall', 0.75, 0.75)
  addLuaSprite('backwall')

  makeLuaSprite('stage', path..'newstage', Pos[1], Pos[2])
  scaleObject('stage', 0.75, 0.75)
  addLuaSprite('stage')

  makeAnimatedLuaSprite('snow2', path..'snowback', 800, 600)
  addAnimationByPrefix('snow2', 'cum', 'Snow group instance 1', 24, true)
  setProperty('snow2.alpha', 0.53)
  scaleObject('snow2', 2, 2)

  makeAnimatedLuaSprite('snow', path..'snowfront', 600, 600)
  addAnimationByPrefix('snow', 'cum', 'snow fall front instance 1', 24, true)
  setProperty('snow.alpha', 0.37)
  scaleObject('snow', 2, 2)

  makeLuaSprite('mainoverlay', path..'newoverlay')
  scaleObject('mainoverlay', 0.75, 0.75)
  setProperty('mainoverlay.alpha', 0.44)
  setBlendMode('mainoverlay', 'ADD')
  addLuaSprite('mainoverlay', true)

  makeLuaSprite('lightoverlay', path..'newoverlay')
  scaleObject('lightoverlay', 0.75, 0.75)
  setProperty('lightoverlay.alpha', 0.21)
  setBlendMode('lightoverlay', 'ADD')
  addLuaSprite('lightoverlay', true)
  addLuaSprite('snow2', true)
  addLuaSprite('snow', true)
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.7)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',0.7)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

