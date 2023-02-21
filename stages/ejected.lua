local Speed = -10000
local lastStep = 0
local WaitBuildB = true
local path = 'impostor/'

function onCreate() 
  SpawnBuilds = true
    precacheImage(path..'ejected/scrollingClouds')
    precacheImage(path..'ejected/buildingSheet')
    precacheImage(path..'ejected/speedLines')
    makeLuaSprite('Sky', path..'ejected/sky', -2800, -3900)
    addLuaSprite('Sky', false)

    makeLuaSprite('CloudsBF', path..'ejected/fgClouds', -3000, -200)
    addLuaSprite('CloudsBF', false)

    BuildsCreate = 0
    Int = {A=1, B=1, Lines=1}
end

function onCountdownTick(swagCounter)
    setObjectCamera('countdownGo','other')
    setObjectCamera('countdownSet','other')
    setObjectCamera('countdownReady','other')
end

function onUpdate(elapsed)
    --Camera Move
    setProperty('camHUD.y',math.sin((180 / math.pi) * ((getSongPosition() / 1000) / 16))*10)
    setProperty('camHUD.angle',(math.sin(((getSongPosition() / 1000) * math.pi)) * 2.5))

    if SpawnBuilds then
        if not luaSpriteExists('BuidingA'..Int['A']) then
        makeAnimatedLuaSprite('BuidingA'..Int['A'], path..'ejected/buildingSheet', -274, 1700)
        addAnimationByPrefix('BuidingA'..Int['A'], 'idle', 'BuildingA'..getRandomInt(1, 3), 0, true)
        setProperty('BuidingA'..Int['A']..'.velocity.y', Speed)
        addLuaSprite('BuidingA'..Int['A'])
        elseif getProperty('BuidingA'..Int['A']..'.y')< -6700 and luaSpriteExists('BuidingA'..Int['A']) then
            removeLuaSprite('BuidingA'..Int['A']-1)
            Int['A']=Int['A']+1
            WaitBuildB=true
        end
        if not luaSpriteExists('BuidingB'..Int['B']) then
            makeAnimatedLuaSprite('BuidingB'..Int['B'], path..'ejected/buildingSheet', 974, getProperty('BuidingA'..Int['A']..'.y') + 6000)
            addAnimationByPrefix('BuidingB'..Int['B'], 'idle', 'BuildingB'..getRandomInt(1, 2), 0, true)
            setProperty('BuidingB'..Int['B']..'.velocity.y', Speed)
            addLuaSprite('BuidingB'..Int['B'])
            setObjectOrder('BuidingB'..Int['B'], getObjectOrder('BuidingA'..Int['A']) + getRandomInt(-1, 1, '0'))
            makeAnimatedLuaSprite('BuidingB1'..Int['B'], path..'ejected/buildingSheet', -1220, getProperty('BuidingA'..Int['A']..'.y') + 6000)
            addAnimationByPrefix('BuidingB1'..Int['B'], 'idle', 'BuildingB'..getRandomInt(1, 2), 0, true)
            setProperty('BuidingB1'..Int['B']..'.velocity.y', Speed)
            addLuaSprite('BuidingB1'..Int['B'])
            setObjectOrder('BuidingB1'..Int['B'],getObjectOrder('BuidingA'..Int['A']) + getRandomInt(-1, 1, '0'))
            WaitBuildB = false
        elseif getProperty('BuidingA'..Int['A']..'.y')<-2000 then
            if WaitBuildB then
                removeLuaSprite('BuidingB1'..Int['B']-1)
                removeLuaSprite('BuidingB'..Int['B']-1)
            Int['B']= Int['B'] + 1
            end
        end
    end
    if LinesCloudSpawn then
        if not luaSpriteExists('Lines'..Int['Lines']) then
        makeLuaSprite('Lines'..Int['Lines'], path..'ejected/speedLines', - 475 + getRandomInt(-100, 100), -550 +2170 )
        setProperty('Lines'..Int['Lines']..'.velocity.y', Speed)
        setProperty('Lines'..Int['Lines']..'.alpha', 0.5)
        addLuaSprite('Lines'..Int['Lines'],true)
        elseif getProperty('Lines'..Int['Lines']..'.y')< -550 and luaSpriteExists('Lines'..Int['Lines']) then
            removeLuaSprite('Lines'..Int['Lines']-1)
            Int['Lines'] = Int['Lines'] + 1
        end
        if curStep ~= lastStep and curStep %2 == 0 then
            removeLuaSprite('Clouds'..curStep - 6, true)
            makeAnimatedLuaSprite('Clouds'..curStep, path..'ejected/scrollingClouds',- 250 +( getRandomInt(-1, 1) * 800), 1050)
            addAnimationByPrefix('Clouds'..curStep,'idle','Cloud' ..getRandomInt(0, 3), 0, true)
            setProperty('Clouds'..curStep..'.velocity.y', Speed)
            addLuaSprite('Clouds'..curStep, true)
            lastStep = curStep
        end
    end
end

function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end