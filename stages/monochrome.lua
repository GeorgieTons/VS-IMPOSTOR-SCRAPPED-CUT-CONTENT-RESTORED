local xx = 500
local yy = 400
local xx2 = 1000
local path = 'impostor/'

function onCreate() 
end

function onUpdate(elapsed)
    setProperty('gf.alpha', 0);
    setProperty('camZooming', false)

    ManualPos = {getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]'), getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]')}
    setProperty('camFollowPos.x', ManualPos[1])
    setProperty('camFollowPos.y', ManualPos[2])
end