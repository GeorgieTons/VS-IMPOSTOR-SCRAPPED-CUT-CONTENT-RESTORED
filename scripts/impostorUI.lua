function onCreate()
        precacheImage('impostorTimeBar')
	makeLuaSprite('newTimeBarBG', 'impostorTimeBar', 100, 0)
	setObjectCamera('newTimeBarBG', 'hud')
	setProperty('newTimeBarBG.alpha', 0)
	addLuaSprite('newTimeBarBG', true)

	makeLuaSprite('newTimeBar', null, 0, 0)
	makeGraphic('newTimeBar', 392, 11, '44d844')
	setObjectCamera('newTimeBar', 'hud')
	setProperty('newTimeBar.scale.x', 0)
	setProperty('newTimeBar.origin.x', 0)
	addLuaSprite('newTimeBar', true)

	makeLuaText('newTimeTxt', 'null', 0, 0, 0)
	setObjectCamera('newTimeTxt', 'hud')
	setTextBorder('newTimeTxt', 1, '000000')
	setProperty('newTimeTxt.alpha', 0)
	setTextSize('newTimeTxt', 14)
	addLuaText('newTimeTxt', true)
	
	setObjectOrder('newTimeBarBG', 1)
	setObjectOrder('newTimeBarFG', 2)
	setObjectOrder('newTimeBar', 3)
	setObjectOrder('newTimeTxt', 4)
end

function onUpdate(elapsed)
	setProperty('timeBar.alpha', 0)
	setProperty('timeTxt.alpha', 0)

	setProperty('newTimeBarBG.y', getProperty('timeBarBG.y'))

	setProperty('newTimeBar.y', getProperty('timeBar.y'))
	setProperty('newTimeBar.x', getProperty('newTimeBarBG.x') + 4)

	setProperty('newTimeTxt.y', getProperty('timeBar.y') - 3)
	setProperty('newTimeTxt.x', getProperty('newTimeBarBG.x') + 10)

	setTextString('newTimeTxt', string.upper(songName)..' | '..getProperty('timeTxt.text'))

	setProperty('scoreTxt.color', getIconColor('dad'))
	setProperty('botplayTxt.color', getIconColor('dad'))

	setTextString('scoreTxt', 'Score: '..score.. ' | Combo Breaks: '..misses.. ' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%')
end

function onSongStart()
	songTime = getProperty('songLength') / 1000

	doTweenX('timeBarFill', 'newTimeBar.scale', 1, songTime, 'linear')
	doTweenAlpha('hello1', 'newTimeBarBG', 1, 0.25, 'linear')
	doTweenAlpha('hello2', 'newTimeTxt', 1, 0.25, 'linear')
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onEndSong()
	setProperty('newTimeBarBG.alpha', 0)
	setProperty('newTimeBarFG.alpha', 0)
	setProperty('newTimeBar.alpha', 0)
	setProperty('newTimeTxt.alpha', 0)
end

function onUpdatePost(e)
	setProperty('iconP2.origin.x',80)
	setProperty('iconP1.origin.y',0)
	setProperty('iconP1.origin.x',20)
	setProperty('iconP2.origin.y',0)
	setProperty('iconP2.scale.x', mathLerp(getProperty('iconP2.scale.x'), 1, 0.25))
	setProperty('iconP1.scale.x', mathLerp(getProperty('iconP1.scale.x'), 1, 0.25))
end

function getSongLeft()
	return formatTime(songLength - (getSongPosition() - noteOffset));
end

function mathlerp(from,to,i)
	return from+(to-from)*i
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
	n = math.pow(10, n or 0)
	x = x * n
	if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
	return x / n
  end