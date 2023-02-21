local xx = 950  ;
local yy = 700;
local xx2 = 950;
local yy2 = 700;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
path = 'impostor/'
Pos = {-1000, -575} --{900, -600}
Scale = 2
linesSpeed = 1

plagueBGBLUE = {'bgblue', 'bgblue2', 'bgblue3'}
plagueBGRED = {'bgred', 'bgred2', 'bgred3'}
plagueBGPURPLE = {'bgpurple', 'bgpurple2', 'bgpurple3'}
plagueBGGREEN = {'bggreen', 'bggreen2'}

function onCreate()
    addCharacterToList('monotone', 'dad')
    addCharacterToList('impostor', 'dad')
    addCharacterToList('impostorv2', 'dad')
    addCharacterToList('black', 'dad')
    addCharacterToList('blackdk', 'dad')
    addCharacterToList('parasite', 'dad')
    addCharacterToList('bfscary', 'dad')
    addCharacterToList('oldpostor', 'dad')

    addCharacterToList('bf', 'boyfriend')
    addCharacterToList('bf-fall', 'boyfriend')
    addCharacterToList('bf-defeat-normal', 'boyfriend')
    precacheImage('impostor/ejected/speedLines')

   makeLuaSprite('back', path..'monotone/SkeldBack', Pos[1], Pos[2])
   scaleObject('back', Scale, Scale)
   addLuaSprite('back')

   makeAnimatedLuaSprite('defeatthing', path..'defeat/defeat', Pos[1] - Scale * 100, Pos[2])
   addAnimationByPrefix('defeatthing', 'bop', 'defeat', 24, false)
   objectPlayAnimation('defeatthing', 'bop')
   setProperty('defeatthing.visible', false)
   scaleObject('defeatthing', Scale, Scale)

   makeLuaSprite('bgblue', path..'monotone/BackThings', Pos[1], Pos[2])
   scaleObject('bgblue', Scale, Scale)

   makeLuaSprite('bgred', path..'monotone/backthingsred', Pos[1], Pos[2])
   setProperty('bgred.visible', false)
   scaleObject('bgred', Scale, Scale)

   makeLuaSprite('bgpurple', path..'monotone/backthingspurple', Pos[1], Pos[2])
   setProperty('bgpurple.visible', false)
   scaleObject('bgpurple', Scale, Scale)

   makeLuaSprite('floor', path..'monotone/Floor', Pos[1], Pos[2])
   scaleObject('floor', Scale, Scale)

   makeLuaSprite('bgblue2', path..'monotone/Reactor', Pos[1], Pos[2])
   scaleObject('bgblue2', Scale, Scale)

   makeLuaSprite('bgred2', path..'monotone/ReactorRed', Pos[1], Pos[2])
   setProperty('bgred2.visible', false)
   scaleObject('bgred2', Scale, Scale)

   makeLuaSprite('bgpurple2', path..'monotone/ReactorBlue', Pos[1], Pos[2])
   setProperty('bgpurple2.visible', false)
   scaleObject('bgpurple2', Scale, Scale)

   makeLuaSprite('bgblue3', path..'monotone/Reactorlight', Pos[1], Pos[2])
   scaleObject('bgblue3', Scale, Scale)

   makeLuaSprite('bgred3', path..'monotone/ReactorLightRed', Pos[1], Pos[2])
   setProperty('bgred3.visible', false)
   scaleObject('bgred3', Scale, Scale)

   makeLuaSprite('bgpurple3', path..'monotone/ReactorLightPurple', Pos[1], Pos[2])
   setProperty('bgpurple3.visible', false)
   scaleObject('bgpurple3', Scale, Scale)

   makeLuaSprite('wires', path..'monotone/wires1', Pos[1], Pos[2])
   scaleObject('wires', Scale, Scale)

   makeLuaSprite('bggreen', path..'monotone/evilejected', Pos[1], Pos[2] - Scale * 600)
   setProperty('bggreen.visible', false)
   scaleObject('bggreen', Scale, Scale)

   makeLuaSprite('bggreen2', path..'monotone/brombom', Pos[1], Pos[2] - Scale * 600)
   setProperty('bggreen2.visible', false)
   scaleObject('bggreen2', Scale, Scale)

  if luaSpriteExists('bggreen') then
   makeLuaSprite('Lines'..linesSpeed, path..'ejected/speedLines', -475 + getRandomInt(-100, 100), 2170)
   setProperty('Lines'..linesSpeed..'.velocity.y', - 100000)
   setProperty('Lines'..linesSpeed..'.alpha', 0.5)
   setProperty('Lines'..linesSpeed..'.visible', false)
   setObjectOrder('Lines'..linesSpeed, getObjectOrder('Bars') - 1)
  end
 
   makeLuaSprite('blackBG', nil)
   makeGraphic('blackBG', screenWidth, screenHeight, 'FFFFFF')
   setObjectOrder('blackBG', 'camOTHER')
   setProperty('blackBG.visible', false)

   makeAnimatedLuaSprite('plauge', path..'monotone/dialogue')
   addAnimationByPrefix('plauge', 'line', 'dialogue', 21, false)
   screenCenter('plauge')
   setObjectCamera('plauge', 'camOTHER')
   setProperty('plauge.visible', false)

   addLuaSprite('defeatthing')
   addLuaSprite('back')
   addLuaSprite('floor')

   addLuaSprite('bgred')
   addLuaSprite('bgred2')
   addLuaSprite('bgred3')

   addLuaSprite('bgpurple')
   addLuaSprite('bgpurple2')
   addLuaSprite('bgpurple3')

   addLuaSprite('bgblue')
   addLuaSprite('bgblue2')
   addLuaSprite('bgblue3')

   addLuaSprite('bggreen')
   addLuaSprite('bggreen2')
   if luaSpriteExists('bggreen') then
   addLuaSprite('Lines'..linesSpeed, true)
   end

   addLuaSprite('wires')
   addLuaSprite('blackBG')
   addLuaSprite('plauge')
end

function onBeatHit()
  if curBeat % 2 == 0 then
       objectPlayAnimation('defeatthing', 'bop')
    end
end

function onEvent(name, value1, value2)
  if name == 'Identity Crisis Events' then
    if value1 == '0' then
       setProperty('back.visible', true)
       setProperty('floor.visible', true)
       setProperty('wires.visible', true)

       setProperty('bgblue.visible', true)
       setProperty('bgblue2.visible', true)
       setProperty('bgblue3.visible', true)

       setProperty('bgred.visible', false)
       setProperty('bgred2.visible', false)
       setProperty('bgred3.visible', false)

       setProperty('bgpurple.visible', false)
       setProperty('bgpurple2.visible', false)
       setProperty('bgpurple3.visible', false)

       setProperty('bggreen.visible', false)
       setProperty('bggreen2.visible', false)
       setProperty('Lines'..tostring(1)..'.visible', false)
       setProperty('Lines'..tostring(0)..'.visible', false)

       setProperty('defeatthing.visible', false)

    elseif value1 == '1' then
       setProperty('back.visible', true)
       setProperty('floor.visible', true)
       setProperty('wires.visible', true)

       setProperty('bgblue.visible', false)
       setProperty('bgblue2.visible', false)
       setProperty('bgblue3.visible', false)

       setProperty('bgred.visible', true)
       setProperty('bgred2.visible', true)
       setProperty('bgred3.visible', true)

       setProperty('bgpurple.visible', false)
       setProperty('bgpurple2.visible', false)
       setProperty('bgpurple3.visible', false)

       setProperty('bggreen.visible', false)
       setProperty('bggreen2.visible', false)
       setProperty('Lines'..tostring(1)..'.visible', false)
       setProperty('Lines'..tostring(0)..'.visible', false)

       setProperty('defeatthing.visible', false)

    elseif value1 == '2' then
       setProperty('back.visible', true)
       setProperty('floor.visible', true)
       setProperty('wires.visible', true)

       setProperty('bgblue.visible', false)
       setProperty('bgblue2.visible', false)
       setProperty('bgblue3.visible', false)

       setProperty('bgred.visible', false)
       setProperty('bgred2.visible', false)
       setProperty('bgred3.visible', false)

       setProperty('bgpurple.visible', true)
       setProperty('bgpurple2.visible', true)
       setProperty('bgpurple3.visible', true)

       setProperty('bggreen.visible', false)
       setProperty('bggreen2.visible', false)
       setProperty('Lines'..tostring(1)..'.visible', false)
       setProperty('Lines'..tostring(0)..'.visible', false)

       setProperty('defeatthing.visible', false)

    elseif value1 == '3' then
       setProperty('back.visible', false)
       setProperty('floor.visible', false)
       setProperty('wires.visible', false)

       setProperty('bgblue.visible', false)
       setProperty('bgblue2.visible', false)
       setProperty('bgblue3.visible', false)

       setProperty('bgred.visible', false)
       setProperty('bgred2.visible', false)
       setProperty('bgred3.visible', false)

       setProperty('bgpurple.visible', false)
       setProperty('bgpurple2.visible', false)
       setProperty('bgpurple3.visible', false)

       setProperty('bggreen.visible', true)
       setProperty('bggreen2.visible', true)
       setProperty('Lines'..tostring(1)..'.visible', true)
       setProperty('Lines'..tostring(0)..'.visible', true)

       setProperty('defeatthing.visible', false)

    elseif value1 == '4' then
       setProperty('back.visible', false)
       setProperty('floor.visible', false)
       setProperty('wires.visible', false)

       setProperty('bgblue.visible', false)
       setProperty('bgblue2.visible', false)
       setProperty('bgblue3.visible', false)

       setProperty('bgred.visible', false)
       setProperty('bgred2.visible', false)
       setProperty('bgred3.visible', false)

       setProperty('bgpurple.visible', false)
       setProperty('bgpurple2.visible', false)
       setProperty('bgpurple3.visible', false)

       setProperty('bggreen.visible', false)
       setProperty('bggreen2.visible', false)
       setProperty('Lines'..tostring(1)..'.visible', false)
       setProperty('Lines'..tostring(0)..'.visible', false)

       setProperty('defeatthing.visible', true)
        end
    end

  if name == 'Identity Crisis Line' then
       setProperty('blackBG.visible', true)
       setProperty('plauge.visible', true)
       objectPlayAnimation('plauge', 'line')
   end
end

function onUpdate()
  if getProperty('plauge.animation.curAnim.finished') == true and luaSpriteExists('plauge') then
       setProperty('blackBG.visible', false)
       setProperty('plauge.visible', false)
  end
     if getProperty('Lines'..linesSpeed..'.y')< -2170 then
       if linesSpeed == 0 then
         setProperty('Lines'..linesSpeed..'.velocity.y', 0)
         setProperty('Lines'..linesSpeed..'.x', -475 + getRandomInt(-100, 100))
         linesSpeed = linesSpeed + 1
         setProperty('Lines'..linesSpeed..'.y', 2170)
         setProperty('Lines'..linesSpeed..'.velocity.y', -100000)
       elseif linesSpeed == 1 then
         setProperty('Lines'..linesSpeed..'.velocity.y', 0)
         setProperty('Lines'..linesSpeed..'.x', -475 + getRandomInt(-100, 100))
         linesSpeed = linesSpeed - 1
         setProperty('Lines'..linesSpeed..'.y', 2170)
         setProperty('Lines'..linesSpeed..'.velocity.y', -100000)
          end
   end

    setProperty('gf.alpha', 0);
    
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
           
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
    if curBeat == 32 then
        setProperty('defaultCamZoom',0.5)
		followchars = true
        xx = 950
        yy = 700
        xx2 = 950
        yy2 = 700
    end
    if curBeat == 64 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 850
        yy = 750
        xx2 = 1050
        yy2 = 750
    end
    if curBeat == 112 then
        setProperty('defaultCamZoom',0.5)
		followchars = true
        xx = 950
        yy = 700
        xx2 = 950
        yy2 = 700
    end
    if curBeat == 128 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 850
        yy = 750
        xx2 = 1050
        yy2 = 750
    end
    
    
end

