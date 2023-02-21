function onEvent(eventName, value1, value2)
    if eventName == 'U.F.O' then
        MinHealth = tonumber(value1)
        direction = - 1
        if getRandomBool(50) then direction = - direction end
        makeAnimatedLuaSprite('UFO', 'U.F.O_Assets', getProperty('dad.x') + (screenWidth / 2) * getProperty('defaultCamZoom') * direction, getProperty('dad.y'))
        addAnimationByPrefix('UFO', 'spawn', 'U.F.O Spawn Full', 24, false)
        addAnimationByIndices('UFO', 'recede', 'U.F.O Spawn Full','14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0',24)
        addAnimationByPrefix('UFO', 'idle', 'U.F.O Idle', 24, false)
        playAnim('UFO', 'spawn')
        addLuaSprite('UFO', false)

        runTimer('SpawnNotes', stepCrochet * 4 / 1000)
        runTimer('UFORecebe', stepCrochet * 16 / 1000)
        setProperty('HealthReducter.visible', true)
        doTweenY('SetMin','HealthControler', MinHealth, stepCrochet * 12 / 1000, 'linear')
    end
end

function onCreatePost()
    precacheImage('U.F.O_Assets')
    precacheImage('Note_asset')
    OriginalWidth = getProperty('healthBar.width')
    MinHealth = 0
    NotesStuff = {}
    makeLuaSprite('HealthControler', nil, OriginalWidth, MinHealth)
    makeLuaSprite('HealthReducter', nil, getProperty('healthBar.x'), getProperty('healthBar.y'))
    makeGraphic('HealthReducter', 1, getProperty('healthBar.height'), 'FF0000')
    setObjectCamera('HealthReducter', 'hud')
    addLuaSprite('HealthReducter', false)
    setProperty('HealthReducter.alpha', healthBarAlpha)
    
    setProperty('HealthReducter.visible', false)
    setObjectOrder('iconP1',getObjectOrder('iconP1') + 2)
    setObjectOrder('iconP2',getObjectOrder('iconP2') + 2)
    setObjectOrder('HealthReducter', getObjectOrder('iconP1') - 1)
end

function eventEarlyTrigger(event)
    if event == 'U.F.O' then
        return -4
    end
end

function onUpdate(elapsed)
    setProperty('HealthReducter.x', getProperty('healthBar.x') + OriginalWidth * ((2 - getProperty('HealthControler.y')) / 2) + 1)
    setGraphicSize('HealthReducter', OriginalWidth * (getProperty('HealthControler.y') / 2), getProperty('healthBar.height'))
    if getProperty('UFO.animation.curAnim.finished') and getProperty('UFO.animation.curAnim.name') == 'recede' then
        removeLuaSprite('UFO', false)
    end
    if getProperty('HealthControler.y') >= getHealth() then
        setHealth(-0.5)
    end    
    for i = 1, noteCountUFO + 1 do
        UFOUpdated(i, elapsed)
    end
end

function UFOUpdated(i, elapsed)
    NotesStuff[i][1] = NotesStuff[i][1] + 4 * (elapsed / (1 / 60))
    NotesStuff[i][4] = NotesStuff[i][4] + 4 * (elapsed / (1 / 60))
    setProperty('Note'..tostring(i-1)..'.x', NotesStuff[i][2] + math.cos((NotesStuff[i][1] * (math.pi / 180)) / 1.5) * NotesStuff[i][4])
    setProperty('Note'..tostring(i-1)..'.y', NotesStuff[i][3] + math.sin((NotesStuff[i][1] * (math.pi / 180)) / 1.5) * NotesStuff[i][4])
end
function onTweenCompleted(tag)
    if stringStartsWith(tag, 'Note') then
        removeLuaSprite(tag, false)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'SpawnNotes' then
        noteCountUFO = 3
        for i = 0, noteCountUFO do
            makeAnimatedLuaSprite('Note'..i, 'Note_asset', getProperty('UFO.x') + getProperty('UFO.width') / 2, getProperty('UFO.y'))
            addAnimationByPrefix('Note'..i, 'spawn', 'Note Full', 24, false)
            playAnim('Note'..i, 'spawn')
            scaleObject('Note'..i, 1.5, 1.5)
            addLuaSprite('Note'..i, false)
            runTimer('Delay'..i,stepCrochet * 8 / 1000)
            NotesStuff[i+1] = {getRandomFloat(0,360), getProperty('Note'..i..'.x'), getProperty('Note'..i..'.y'),0}
            
        end
    end
    if stringStartsWith(tag,'Delay') then
        doTweenAlpha('Note'..stringSplit(tag,'Delay')[2],'Note'..stringSplit(tag,'Delay')[2],0,stepCrochet * 8 / 1000,'linear')
    end
    if tag == 'UFORecebe' then
        playAnim('UFO', 'recede', true)
    end
end