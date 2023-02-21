local xx = 1270;
local yy = 850;
local xx2 = 1270;
local yy2 = 850;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local path = 'impostor/'

function onCreate()
   addCharacterToList('bf-defeat-normal', 'boyfriend')
   addCharacterToList('bf-defeat-normal-left', 'boyfriend')
   addCharacterToList('bf-defeat-scared', 'boyfriend')
   addCharacterToList('bf-defeat-scared-left', 'boyfriend')
   addCharacterToList('bf-tt', 'boyfriend')
   addCharacterToList('bf-tt-left', 'boyfriend')

   addCharacterToList('black-tt', 'dad')
   addCharacterToList('black-tt-left', 'dad')
   addCharacterToList('black-tt-finale', 'dad')
   addCharacterToList('ghost', 'dad')
   addCharacterToList('maroonexe', 'dad')
   addCharacterToList('pinkexe', 'dad')

   makeLuaSprite('bg', path.. 'tripletrouble/ttv4', 0, 0) 
   setScrollFactor('bg', 0.9, 0.9) 
   addLuaSprite('bg') 

   makeLuaSprite('fg', path.. 'tripletrouble/ttv4fg', 300, 300) 
   setScrollFactor('fg', 1, 1) 
   addLuaSprite('fg') 

   makeLuaSprite('dead', path.. 'defeat/deadbg', 100, 1000) 
   scaleObject('dead', 0.35, 0.35)
   setScrollFactor('dead', 1, 1) 
   addLuaSprite('dead', true) 

   makeLuaSprite('deadfg', path.. 'defeat/deadfg', -200, 1100) 
   scaleObject('deadfg', 0.35, 0.35)
   setScrollFactor('deadfg', 1, 1) 
   addLuaSprite('deadfg', true) 

   setProperty('dead.visible', false)
   setProperty('deadfg.visible', false)
end

local shadname = "stridentCrisisWavy"

function onCreatePost()
   initLuaShader("stridentCrisisWavy")
   setSpriteShader('bg', shadname)
end

function onUpdate(elapsed)
   setShaderFloat('bg', 'uTime', os.clock())
   setShaderFloat('bg', 'uWaveAmplitude', 0.05)
   setShaderFloat('bg', 'uFrequency', 3)
   setShaderFloat('bg', 'uSpeed', 0.75)
end

function onUpdatePost()
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

