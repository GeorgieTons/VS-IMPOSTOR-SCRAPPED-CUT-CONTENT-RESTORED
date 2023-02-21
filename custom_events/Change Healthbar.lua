--[script made by Dawoon_
--[slightly modified by me :]
finaleHealthBar = false

function onEvent(name, value1, value2)
  if name == 'Change Healthbar' then
   if value1 == '0' then
     setProperty('HealthBarAlt.visible', true)
   elseif value1 == '1' then
    setProperty('HealthBarAlt.visible', false)
          end
     end
end

function onCreate()
  precacheImage('healthBar/healthBarFinaleBlue')
  precacheImage('healthBar/healthBarFinaleRed')
  precacheImage('icons/blackFinale')
    if downscroll then
        makeLuaSprite('HealthBarAlt', 'healthBar/healthBarFinaleBlue', 0, -47)
        setProperty('HealthBarAlt.flipY', true)
    else
        makeLuaSprite('HealthBarAlt', 'healthBar/healthBarFinaleBlue', 0, 530)
    end

    setObjectCamera('HealthBarAlt', 'hud')
    scaleObject('HealthBarAlt', 0.6, 0.6)
    screenCenter('HealthBarAlt', 'X')
    setProperty('HealthBarAlt.visible', false)
    addLuaSprite('HealthBarAlt')

    makeLuaSprite('HealthBarRed', nil, 0, getProperty('HealthBarAlt.y'))
    screenCenter('HealthBarRed', 'x')
    setObjectCamera('HealthBarRed', 'hud')
    scaleObject('HealthBarRed', 0.6, 0.6)
    screenCenter('HealthBarRed', 'x')
    setProperty('HealthBarRed.visible', false)
    addLuaSprite('HealthBarRed')
    setProperty('HealthBarRed.flipY', getProperty('HealthBarAlt.flipY'))

    if downscroll then
        makeAnimatedLuaSprite('iconP3','icons/blackFinale', getProperty('HealthBarAlt.x') - 200, getProperty('HealthBarAlt.y') - 100)
    else
        makeAnimatedLuaSprite('iconP3','icons/blackFinale', getProperty('HealthBarAlt.x') - 200, getProperty('HealthBarAlt.y') - 150)
    end

    addAnimationByPrefix('iconP3', '1', 'black icon mad', 24, true)
    addAnimationByPrefix('iconP3', '0', 'black icon calm', 24, true)
    addOffset('iconP3', '1', 0, 0)
    addOffset('iconP3', '0', 0, -20)
    setObjectCamera('iconP3', 'hud')
    setProperty('iconP3.visible', false)
    addLuaSprite('iconP3')
end

function onUpdatePost()
    if getProperty('HealthBarAlt.visible') then
        setProperty('iconP1.x', getProperty('HealthBarAlt.x') + 637)
        playAnim('iconP3', getProperty('iconP2.animation.curAnim.curFrame'))
        setProperty('iconP3.visible', getProperty('HealthBarAlt.visible'))

        loadGraphic('HealthBarRed', 'healthBar/healthBarFinaleRed', 1407 * ( 1 - (getHealth() / 2)), 437)
        setProperty('HealthBarRed.x', getProperty('HealthBarAlt.x'))
        setProperty('HealthBarRed.y', getProperty('HealthBarAlt.y'))
        setProperty('HealthBarRed.offset.x', 280)
        setProperty('HealthBarRed.offset.y', 87)
        setProperty('HealthBarRed.origin.x', getProperty('HealthBarAlt.origin.x'))
        setProperty('HealthBarRed.origin.y', getProperty('HealthBarAlt.origin.y'))

        setProperty('healthBar.alpha', 0)
        setProperty('healthBarBG.alpha', 0)
        setProperty('iconP2.visible', false)

        if downscroll then
           setProperty('iconP1.y', getProperty('HealthBarAlt.y') + 65)
        else
           setProperty('iconP1.y', getProperty('HealthBarAlt.y') + 35)
        end
       
        if getHealth() >= 2 then
            setProperty('HealthBarRed.visible', false)
        else
            setProperty('HealthBarRed.visible', true)
        end
    else
       setProperty('HealthBarRed.visible', false)
       setProperty('iconP3.visible', false)
        setProperty('healthBar.alpha', 1)
        setProperty('healthBarBG.alpha', 1)
        setProperty('iconP2.visible', true)
    end
end

function setFinaleHealthBar(Toggle)
    finaleHealthBar = Toggle
end