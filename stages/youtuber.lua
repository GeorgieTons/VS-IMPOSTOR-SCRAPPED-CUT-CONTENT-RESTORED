local xx = 640;
local yy = 360;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local path = 'impostor/'

function onCreate()
  makeLuaSprite('bfbubblebg', path.. 'youtube/stage', 934.35, 26.9) 
  setScrollFactor('bfbubblebg', 1, 1) 

  makeLuaSprite('messiroom', path.. 'youtube/bg', -20.45, -48,3) 
  setScrollFactor('messiroom', 1, 1) 

  makeLuaSprite('ytlayout', path..'youtube/ui')
  setObjectCamera('ytlayout', 'camOTHER')
  screenCenter('ytlayout')
  setProperty('ytlayout.alpha', 0)

  makeLuaSprite('ytoverlay', path..'youtube/overlay', 0, 675)
  setObjectCamera('ytoverlay', 'camOTHER')
  scaleObject('ytoverlay', 0.97, 0.008)
  screenCenter('ytoverlay', 'X')
  setProperty('ytoverlay.alpha', 0)

  makeLuaSprite('ytprogress', path..'youtube/overlay', 0, 675)
  setObjectCamera('ytprogress', 'camOTHER')
  setProperty('ytprogress.color', getColorFromHex('FF0000'))
  screenCenter('ytprogress', 'X')
  setProperty('ytprogress.x', getProperty('ytprogress.x') + 19)
  setProperty('ytprogress.alpha', 1)

  addLuaSprite('bfbubblebg')
  addLuaSprite('messiroom', true)
  addLuaSprite('ytoverlay') 
  addLuaSprite('ytlayout') 
  addLuaSprite('ytprogress')

  setObjectOrder('dadGroup', getObjectOrder('messiroom') + 1)
end

function onSongStart()

  doTweenAlpha('YtUi1', 'ytlayout', 1, 0.5, 'circOut')
  doTweenAlpha('YtUi2', 'ytoverlay', 1, 0.5, 'circOut')
end

function onUpdate()
  scaleObject('ytprogress', 0.97 * getProperty('songPercent'),  0.008)
	setProperty('gf.alpha', 0);
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        setProperty('defaultCamZoom',1.0)
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
        triggerEvent('Camera Follow Pos','','')
    end
    
end