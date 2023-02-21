isPixel = false

ratingPos = {200, 300}
ratingImage = {'sick', 'good', 'bad', 'shit', 'miss'}
ratingPrefix = ''
ratingSuffix = ''
ratingSize = {0.6, 0.6}

combPos = {0, 50}
combPrefix = ''
combSuffix = ''
combSize = {0.6, 0.6}

missPrefix = ''
missSuffix = ''

numPos = {0, 0}
numPrefix = ''
numSuffix = ''
numScale = {0.4, 0.4}

velocityY = 0
velocityX = 0

flingSpeed = 0.5
flingHeight = 35

ComboUsesSpriteSheet = false

local thing = {
	[1] = {0, 'sicks'},
	[2] = {0, 'goods'},
	[3] = {0, 'bads'},
	[4] = {0, 'shits'},
}

local ratefunc = {
	[1] = function()--sick
		spawnRating('sick')
		ratingPop()
		comboCount()
		combPop()
		end,

	[2] = function()--good
		spawnRating('good')
		ratingPop()
		comboCount()
		combPop()
		end,

	[3] = function()--bad
		spawnRating('bad')
		ratingPop()
		comboCount()
		combPop()
		end,

	[4] = function()--shit
		spawnRating('shit')
		ratingPop()
		comboCount()
		combPop()
		end,
}
	
local hits = 0
local defaultY = -20
local strCombo = '0'

function onCreatePost()
  setRating()
  if getPropertyFromClass('PlayState', 'isPixelStage') then
    isPixel = true
  end

  if isPixel then
   ratingPrefix = 'pixelUI/'
   ratingSuffix = '-pixel'
   ratingAntialiasing = false
   ratingSize = {4, 4}

   numPrefix = 'pixelUI/'
   numSuffix = '-pixel'
   numAntialiasing = false
   numScale = {5, 5}
end

function goodNoteHit(id, dir, note, sus)
	if not sus then
		hits = hits + 1
	end
	for i = 1, 4 do
		if thing[i][1] ~= getProperty( thing[i][2] ) then
			thing[i][1] = getProperty( thing[i][2] )
			if ratefunc[i] then
				ratefunc[i]()
			end
		end
	end
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'hideHud', false)
end

function noteMiss(id, dir, note, sus)
	hits = hits + 1
	spawnRating(missPrefix..'miss'..missSuffix)
	objectPlayAnimation('rating'..hits, 'miss', true)
	ratingPop()
	comboCount()
end

function noteMissPress(dir)
	hits = hits + 1
	spawnRating('miss')
	objectPlayAnimation('rating'..hits, 'miss', true)
	ratingPop()
	comboCount()
end

function onTweenCompleted(tag)
    for i = 0, hits do
	if tag == 'rateIN'..i then
	    doTweenY('rateOUT'..i, 'rating'..i, defaultY + (flingHeight * 1.5), flingSpeed, 'circIn')
	    doTweenAlpha('rateFADE'..i, 'rating'..i, 0, flingSpeed, 'linear') 
          end
     end
	
    for d = 0, hits do
	if tag == 'rateFADE'..d then
	   removeLuaSprite('rating'..d)
	  end
     end
end

function onUpdate(elapsed)
        setPropertyFromClass('ClientPrefs', 'hideHud', true)

    if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') or 
        getPropertyFromClass('flixel.FlxG', 'keys.justPressed.EIGHT')) then
        setPropertyFromClass('ClientPrefs', 'hideHud', false)
    end
end

--custom funcs
function ratingPop()
  if curStage == 'ejected' then
	setProperty('rating'..hits..'.alpha', 1)
	doTweenY('rateIN'..hits, 'rating'..hits, defaultY - flingHeight + velocityY, flingSpeed, 'circOut')
	doTweenAlpha('rateFADE'..hits, 'rating'..hits, 0, flingSpeed, 'linear')	
  else
	setProperty('rating'..hits..'.alpha', 1)
	doTweenY('rateIN'..hits, 'rating'..hits, defaultY - flingHeight + velocityY, flingSpeed, 'circOut')
    end
end

function combPop()

      setProperty('comb'..hits..'.alpha', 1)
      doTweenY('combIN'..hits, 'comb'..hits, defaultY - flingHeight + velocityY, flingSpeed, 'circOut')
end

function comboCount()
     defaultY = getProperty('gf.y') + ratingPos[2]
	makeLuaSprite('comb'..hits, combPrefix..'combo'..combSuffix, getProperty('gf.x') + ratingPos[1] + combPos[1], defaultY + combPos[2])
	scaleObject('comb'..hits, combSize[1], combSize[2])
	setProperty('comb'..hits..'.alpha', 0)
	setProperty('comb'..hits..'.antialiasing', combAntialiasing)
	addLuaSprite('comb', true)
     setProperty('comb'..hits..'.velocity.x', math.random(0, 10));
     setProperty('comb'..hits..'.velocity.y', -180);
     setProperty('comb'..hits..'.acceleration.y', 550);
end

function spawnRating(var)
     defaultY = getProperty('gf.y') + ratingPos[2]
	makeLuaSprite('rating'..hits, ratingPrefix..var..ratingSuffix, getProperty('gf.x') + ratingPos[1], defaultY)
	scaleObject('rating'..hits, ratingSize[1], ratingSize[2])
	setProperty('rating'..hits..'.alpha', 0)
	setProperty('rating'..hits..'.antialiasing', ratingAntialiasing)
	addLuaSprite('rating'..hits, true)
     setProperty('rating'..hits..'.velocity.x', math.random(0, 10));
     setProperty('rating'..hits..'.velocity.y', -180);
     setProperty('rating'..hits..'.acceleration.y', 550);
end

function comboCount()
    if getProperty('combo') > 0 then 
        strCombo = tostring(getProperty('combo')) 
           if string.len(strCombo) < 3 then
	       strCombo = '0'..strCombo
	   end
		 
     local chars = {
	[1] = getStringChar(strCombo, 1),
	[2] = getStringChar(strCombo, 2),
	[3] = getStringChar(strCombo, 3),
     }

     for c = 1, 3 do
	if chars[c] == '' then
		chars[c] = '0'
	 end
     end

    local dev = 10
	
    cancelTween('charOneFADE')
    cancelTween('charTwoFADE')
    cancelTween('charThreeFADE')
    cancelTween('charOneIN')
    cancelTween('charTwoIN')
    cancelTween('charThreeIN')

    makeLuaSprite('charOne', numPrefix..'num'..chars[1]..numSuffix, getProperty('gf.x') + ratingPos[1], defaultY + 100)
    scaleObject('charOne', numScale[1], numScale[2])
    setProperty('charOne.antialiasing', numAntialiasing)
    addLuaSprite('charOne', true)
	
    makeLuaSprite('charTwo', numPrefix..'num'..chars[2]..numSuffix, getProperty('gf.x') + ratingPos[1] + 30, defaultY + 100)
    scaleObject('charTwo', numScale[1], numScale[2])
    setProperty('charTwo.antialiasing', numAntialiasing)
    addLuaSprite('charTwo', true)

    makeLuaSprite('charThree', numPrefix..'num'..chars[3]..numSuffix, getProperty('gf.x') + ratingPos[1] + 60, defaultY + 100)
    scaleObject('charThree', numScale[1], numScale[2])
    setProperty('charThree.antialiasing', numAntialiasing)
    addLuaSprite('charThree', true)

    setProperty('charOne.alpha', 1)
    setProperty('charTwo.alpha', 1)
    setProperty('charThree.alpha', 1)

    objectPlayAnimation('charOne', chars[1], true)
    objectPlayAnimation('charTwo', chars[2], true)
    objectPlayAnimation('charThree', chars[3], true)

    setProperty('charOne.y', defaultY + 100)
    setProperty('charTwo.y', defaultY + 100)
    setProperty('charThree.y', defaultY + 100)

    doTweenAlpha('charOneFADE', 'charOne', 0, 0.5, 'linear')
    doTweenAlpha('charTwoFADE', 'charTwo', 0, 0.5, 'linear')
    doTweenAlpha('charThreeFADE', 'charThree', 0, 0.5, 'linear')

    setProperty('charOne.velocity.x', math.random(-5, 5))
    setProperty('charOne.velocity.y', math.random(-140, -160))
    setProperty('charOne.acceleration.y', math.random(200, 400))

    setProperty('charTwo.velocity.x', math.random(-5, 5))
    setProperty('charTwo.velocity.y', math.random(-140, -160))
    setProperty('charTwo.acceleration.y', math.random(200, 400))

    setProperty('charThree.velocity.x', math.random(-5, 5))
    setProperty('charThree.velocity.y', math.random(-140, -160))
    setProperty('charThree.acceleration.y', math.random(200, 400))

    doTweenY('charOneIN', 'charOne', (defaultY + 75) + math.random(dev * -1, dev) + velocityY, 0.5, 'circOut')
    doTweenY('charTwoIN', 'charTwo', (defaultY + 75) + math.random(dev * - 1, dev) + velocityY, 0.5, 'circOut')
    doTweenY('charThreeIN', 'charThree', (defaultY + 75) + math.random(dev * 1, dev) + velocityY, 0.5, 'circOut')
          end
     end
end

function misscomboCount()
    if getProperty('misses') > -1 then 
        strMiss = tostring(getProperty('misses')) 
           if string.len(strMiss) < -3 then
	       strMiss = '0'..strMiss
	   end
		 
     local chars = {
	[1] = getStringChar(strMiss, 1),
	[2] = getStringChar(strMiss, 2),
	[3] = getStringChar(strMiss, 3),
     }

     for c = 1, 3 do
	if chars[c] == '' then
		chars[c] = '0'
	 end
     end

    local dev = 10
	
    cancelTween('misscharOneFADE')
    cancelTween('misscharTwoFADE')
    cancelTween('misscharThreeFADE')
    cancelTween('misscharOneIN')
    cancelTween('misscharTwoIN')
    cancelTween('misscharThreeIN')

    makeLuaSprite('misscharOne', numPrefix..'num'..chars[1]..numSuffix, getProperty('gf.x') + ratingPos[1], defaultY + 100)
    scaleObject('misscharOne', numScale[1], numScale[2])
    setProperty('misscharOne.antialiasing', numAntialiasing)
    addLuaSprite('misscharOne', true)
	
    makeLuaSprite('misscharTwo', numPrefix..'num'..chars[2]..numSuffix, getProperty('gf.x') + ratingPos[1] + 30, defaultY + 100)
    scaleObject('misscharTwo', numScale[1], numScale[2])
    setProperty('misscharTwo.antialiasing', numAntialiasing)
    addLuaSprite('misscharTwo', true)

    makeLuaSprite('misscharThree', numPrefix..'num'..chars[3]..numSuffix, getProperty('gf.x') + ratingPos[1] + 60, defaultY + 100)
    scaleObject('misscharThree', numScale[1], numScale[2])
    setProperty('misscharThree.antialiasing', numAntialiasing)
    addLuaSprite('misscharThree', true)

    setProperty('misscharOne.alpha', 1)
    setProperty('misscharTwo.alpha', 1)
    setProperty('misscharThree.alpha', 1)

    objectPlayAnimation('misscharOne', chars[1], true)
    objectPlayAnimation('misscharTwo', chars[2], true)
    objectPlayAnimation('misscharThree', chars[3], true)

    setProperty('misscharOne.y', defaultY + 100)
    setProperty('misscharTwo.y', defaultY + 100)
    setProperty('misscharThree.y', defaultY + 100)

    doTweenAlpha('misscharOneFADE', 'misscharOne', 0, 0.5, 'linear')
    doTweenAlpha('misscharTwoFADE', 'misscharTwo', 0, 0.5, 'linear')
    doTweenAlpha('misscharThreeFADE', 'misscharThree', 0, 0.5, 'linear')

    setProperty('misscharOne.velocity.x', math.random(-5, 5))
    setProperty('misscharOne.velocity.y', math.random(-140, -160))
    setProperty('misscharOne.acceleration.y', math.random(200, 400))

    setProperty('misscharTwo.velocity.x', math.random(-5, 5))
    setProperty('misscharTwo.velocity.y', math.random(-140, -160))
    setProperty('misscharTwo.acceleration.y', math.random(200, 400))

    setProperty('misscharThree.velocity.x', math.random(-5, 5))
    setProperty('misscharThree.velocity.y', math.random(-140, -160))
    setProperty('misscharThree.acceleration.y', math.random(200, 400))

    doTweenY('misscharOneIN', 'misscharOne', (defaultY + 75) + math.random(dev * -1, dev) + velocityY, 0.5, 'circOut')
    doTweenY('misscharTwoIN', 'misscharTwo', (defaultY + 75) + math.random(dev * - 1, dev) + velocityY, 0.5, 'circOut')
    doTweenY('misscharThreeIN', 'misscharThree', (defaultY + 75) + math.random(dev * 1, dev) + velocityY, 0.5, 'circOut')

     end
end

function setRating(uiType)
 isPixel = getPropertyFromClass('PlayState', 'isPixelStage') == true
  if uiType == 'alpha' then
    ratingPrefix = 'alphaUI/'
    ratingSuffix = '-alpha'
    ratingSize = {0.6, 0.6}

    numPrefix = 'alphaUI/'
    numSuffix = '-alpha'
    numScale = {0.4, 0.4}

  elseif uiType == 'nuzzus' and isPixel then
    ratingPrefix = 'nuzzusUI/'
    ratingSuffix = '-nuzzus'
    ratingSize = {4, 4}

    numPrefix = 'nuzzusUI/'
    numSuffix = '-nuzzus'
    numScale = {5, 5}

  elseif uiType == 'pixel' and isPixel then
   ratingPrefix = 'pixelUI/'
   ratingSuffix = '-pixel'
   ratingAntialiasing = false
   ratingSize = {4, 4}

   numPrefix = 'pixelUI/'
   numSuffix = '-pixel'
   numAntialiasing = false
   numScale = {5, 5}

  elseif uiType == 'default' or uiType == 'normal' or uiType == nil then
   ratingPrefix = ''
   ratingSuffix = ''
   ratingAntialiasing = true
   ratingSize = {0.6, 0.6}

   numPrefix = ''
   numSuffix = ''
   numAntialiasing = true
   numScale = {0.4, 0.4}
     end
end

function getStringChar(var, num)
	--this is useless but it helps my peanut sized brain
	local result = string.sub(var, num, num)
	return result;
end
