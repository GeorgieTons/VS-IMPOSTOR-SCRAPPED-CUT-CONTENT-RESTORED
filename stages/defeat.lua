local xx = 750;
local yy = 500;
local xx2 = 750;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local path = 'impostor/'

MinMisses = 5
MissSelecter = false
PracticeMode = false
BalledGameOver = false

function onCreate()
   precacheImage(path..'defeat/defeat')
   precacheImage(path..'defeat/deadBG')
   precacheImage(path..'defeat/deadFG')
   precacheImage(path..'defeat/iluminao omaga')
   addCharacterToList('bf-defeat-normal', 'boyfriend')
   addCharacterToList('bf-defeat-scared', 'boyfriend')
   addCharacterToList('bf', 'boyfriend')

   makeAnimatedLuaSprite('defeatthing', path..'defeat/defeat', -800, -300)
   addAnimationByPrefix('defeatthing', 'bop', 'defeat', 24, false)
   objectPlayAnimation('defeatthing', 'bop')
   scaleObject('defeatthing', 1.2, 1.2)
   addLuaSprite('defeatthing')

   makeLuaSprite('bodies2', path..'defeat/lol thing', -900, 0)
   scaleObject('bodies2', 1.3, 1.3)
   setScrollFactor('bodies2', 0.8, 0.8)
   addLuaSprite('bodies2')

   makeLuaSprite('bodies', path..'defeat/deadBG', -680, 400)
   scaleObject('bodies', 0.4, 0.4)
   setScrollFactor('bodies', 0.9, 0.9)
   addLuaSprite('bodies')

   makeLuaSprite('bodiesfront', path..'defeat/deadFG', -730, 700)
   scaleObject('bodiesfront', 0.4, 0.4)
   setScrollFactor('bodiesfront', 0.5, 1)
   addLuaSprite('bodiesfront', true)

   makeLuaSprite('lightoverlay', path..'defeat/iluminao omaga', -550, -100)
   setBlendMode('lightoverlay', 'ADD')
   addLuaSprite('lightoverlay', true)

   setProperty('bodies2.alpha', 0)
   setProperty('bodies.alpha', 0)
   setProperty('bodiesfront.alpha', 0)
end

function onCreatePost()
    setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup') + 1)
    setProperty('healthBar.alpha', 0)
end

function onEvent(name, value1, value2)
  if name == 'Defeat Bodies' then
   doTweenAlpha('B', 'bodies', value1, value2, 'quadInOut') 
   doTweenAlpha('B2', 'bodies2', value1, value2, 'quadInOut')
   doTweenAlpha('B3', 'bodiesfront', value1, value2, 'quadInOut')
  if value2 == '0' then
    value2 = 0.0001
        end
    end
end

function onBeatHit()
 if (curBeat % 4 == 0) then
   objectPlayAnimation('defeatthing', 'bop')
   end
end

function onCountdownStarted()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'x', -200)
        setPropertyFromGroup('playerStrums', i, 'x', -278 + (160 * 0.7) * i + 50 + (screenWidth / 2))
    end
end

function onStartCountdown()
    if not MissSelecter then
        SelecterCreater()
        return Function_Stop
    else
        return Function_Continue
    end
end

function onPause()
    if not MissSelecter then
        SelecterCreater()
        return Function_Stop
    else
        return Function_Continue
    end
end

function SelecterCreater()
    Y = 450
    makeLuaSprite('BackS', nil, 0, 0)
    makeGraphic('BackS', screenWidth, screenHeight, '000000')
    setObjectCamera('BackS', 'other')
    addLuaSprite('BackS')

    makeLuaText('ComboBreak', '5/5 COMBO BREAKS', 0, 0, 150)
    setTextSize('ComboBreak', 100)
    setTextColor('ComboBreak', 'E80000')
    setTextAlignment('ComboBreak', 'center')
    screenCenter('ComboBreak', 'x')
    setObjectCamera('ComboBreak', 'other')
    addLuaText('ComboBreak')

    makeLuaText('Credittxt', 'Script By Dawoon_ i just modified some assets', 0, 0, 0)
    setTextSize('Credittxt', 15)
    setTextAlignment('Credittxt', 'center')
    screenCenter('Credittxt', 'x')
    setObjectCamera('Credittxt', 'other')
    addLuaText('Credittxt')

    makeLuaText('PRACTICEtxt', 'PRACTICE MODE', 0, 0, 600)
    setTextSize('PRACTICEtxt', 75)
    setTextAlignment('PRACTICEtxt', 'center')
    screenCenter('PRACTICEtxt', 'x')
    setObjectCamera('PRACTICEtxt', 'other')
    addLuaText('PRACTICEtxt')
    for i = 1, 6 do
        if i == 3 then
            Y = Y + 43
        elseif i == 5 then
            Y = Y + 27
        end
        makeLuaSprite('Amongusdummy'..i, 'defeat/dummypostor'..i, 162 * i, Y)
        setObjectCamera('Amongusdummy'..i, 'other')
        addLuaSprite('Amongusdummy'..i)
    end
    makeLuaSprite('Selector', 'defeat/missAmountArrow', getProperty('Amongusdummy1.x'), 400)
    setObjectCamera('Selector','other')
    addLuaSprite('Selector')
end

SelecterHorizont = 1
SelectVertical = 1
SelectMin = {5, 4, 3, 2, 1, 0}

function UpdatedSelecter()
    if keyJustPressed('left') and SelecterHorizont > 1 and SelectVertical == 1 then
        SelecterHorizont = SelecterHorizont - 1
        setTextString('ComboBreak', SelectMin[SelecterHorizont]..'/5 COMBO BREAKS')
        setProperty('Selector.x', getProperty('Amongusdummy'..SelecterHorizont..'.x'))
    end

    if keyJustPressed('right') and SelecterHorizont <6 and SelectVertical == 1 then
        SelecterHorizont = SelecterHorizont + 1
        setTextString('ComboBreak', SelectMin[SelecterHorizont]..'/5 COMBO BREAKS')
        setProperty('Selector.x', getProperty('Amongusdummy'..SelecterHorizont..'.x'))
    end

    if keyJustPressed('up') and SelectVertical >1 then
        SelectVertical = SelectVertical - 1
        setTextColor('PRACTICEtxt', 'FFFFFF')
        setTextString('ComboBreak', SelectMin[SelecterHorizont]..'/5 COMBO BREAKS')
    end

    if keyJustPressed('down') and SelectVertical <2 then
        SelectVertical = SelectVertical + 1
        setTextColor('PRACTICEtxt', 'B6B6B6')
        setTextString('ComboBreak', 'PRACTICE MODE')
    end

    if keyJustPressed('accept') then
        if (not botPlay or not practice) or (SelectVertical == 2) then
            MinMisses = SelectMin[SelecterHorizont]
            if SelectVertical == 2 then
                PracticeMode = true
                MinMisses = math.huge
            end
            MissSelecter = true
            removeLuaSprite('Selector')
            removeLuaText('ComboBreak')
            removeLuaText('PRACTICEtxt')
            removeLuaText('Credittxt')
            for i = 1, 6 do
                removeLuaSprite('Amongusdummy'..i)
            end
            playSound('amongkill')
            cameraFlash('camGame', 'FF0000', 0.3)
            runTimer('transDelay', 1)
        else
            
            makeLuaText('BotTracker',"Don't use Botplay or Practice", 0, 0, 0)
            setTextSize('BotTracker', 50)
            setTextColor('BotTracker', 'FFFFFF')
            screenCenter('BotTracker', 'xy')
            setObjectCamera('BotTracker', 'other')
            addLuaText('BotTracker')
            setProperty('BotTracker.alpha', 1)
            doTweenAlpha('BotTracker', 'BotTracker', 0,1, 'linear')
        end

    end
    if keyJustPressed('back') then
        exitSong()
    end
end

function SetScoreTxt(version)
    local FC = ''
    if version == 'Old' then
      if ratingFC ~= '' then
          FC = ' | ('..ratingFC..')'
      end
    setTextString('scoreTxt','Score: '..score..' | Combo breaks: '..misses..' | Accuracy: '..tostring(toInt(rating * 10000) / 100)..'%'..FC)
    else
    setTextString('scoreTxt','Score: '..score..' | Misses: '..misses..' / '..MinMisses..' | Rating: '..GetRating())
    end
end

function GetRating()
    if ratingFC ~= '' then
        return '('..tostring(toInt(rating * 10000) / 100)..'%) - '..ratingFC
    else
        return '?'
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'transDelay' then
        setProperty('BackS.alpha', 0)
        startCountdown()
    end
    if tag == 'Reset' then
        restartSong()
    end
end

function onTweenCompleted(tag)
    if tag == 'IfPractice' then
        runTimer('Reset', 1.5)
    end
end

function Lerp(Min, Max, Ratio)
    return Min + Ratio * (Max - Min);
end

function onUpdate()
        SetScoreTxt()
    if not MissSelecter then
        UpdatedSelecter()
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
  for i = 0, getProperty('eventNotes.length')-1 do
    if getPropertyFromGroup('eventNotes', i, 'event') == 'Set Cam Zoom' then
       value1 = getPropertyFromGroup('eventNotes', i, 'value1')
       value2 = getPropertyFromGroup('eventNotes', i, 'value2')
        setProperty('defaultCamZoom', value1)
        followchars = true
      if not value2 == '' then
        doTweenZoom('zommy', 'camGame', value1, value2, 'circInOut')
     end

    if curBeat == 16 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 32 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.7)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 48 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.8)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 68 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.5)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 100 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.6)
		followchars = true
        xx = 500
        yy = 500
        xx2 = 900
        yy2 = 500
    end
    if curBeat == 164 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.5)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 194 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 196 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 212 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.7)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 228 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.8)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 244 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.85)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 260 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 292 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.75)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 360 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.6)
		followchars = true
        xx = 500
        yy = 500
        xx2 = 900
        yy2 = 500
    end
    if curBeat == 424 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.7)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 456 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.8)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 472 and songName == 'defeat' then
        setProperty('defaultCamZoom', 0.9)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 488 and songName == 'defeat' then
        setProperty('defaultCamZoom', 50)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
            end
        end
    end
end

function onUpdatePost(elapsed)
    Set('iconP1', getProperty('scoreTxt.x') + 900,getProperty('scoreTxt.y') - 60)
    Set('iconP2', getProperty('scoreTxt.x') + 225,getProperty('scoreTxt.y') - 80)
    if misses > MinMisses then
        setHealth(-1)
    elseif misses >= MinMisses -2 then
        setProperty('iconP1.animation.curAnim.curFrame', 1)
    else
        setProperty('iconP1.animation.curAnim.curFrame', 0)
    end
    setProperty('iconP2.animation.curAnim.curFrame', 0)
    if misses <= MinMisses then
        setHealth(1)
    end
end

function toInt(float) 
    if float <= math.floor(float) + 0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
end

function Set(tag, X, Y)
    if X ~= nil then
        setProperty(tag..'.x', X)
    end
    if Y ~= nil then
        setProperty(tag..'.y', Y)
    end
end