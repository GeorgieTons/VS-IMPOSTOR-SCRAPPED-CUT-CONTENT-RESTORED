IntroTextSize = 24
Cover = true

Song = 'Infikiller'
Author = 'Anonymous'
CoverAuthor = 'VanDaniel'

function onCreate()
    makeLuaSprite('SongBox', nil, -300, 100)
    makeGraphic('SongBox', 300, 100, 'FFFFFF')
    setProperty('SongBox.alpha', 0.4)
    setObjectCamera('SongBox', 'other')
    addLuaSprite('SongBox', true)
	
    makeLuaText('SongText', Song, 300, -300, 105)
    setTextAlignment('SongText', 'left')
    setObjectCamera('SongText', 'other')
    setTextSize('SongText', IntroTextSize)
    addLuaText('SongText', true)

    makeLuaText('Composer', 'Composer: '..Author, 300, -300, 150)
    setTextAlignment('Composer', 'left')
    setObjectCamera('Composer', 'other')
    setTextSize('Composer', IntroTextSize)
    addLuaText('Composer', true)
	
    makeLuaText('Cover', 'Cover By: '..CoverAuthor, 300, -300, 165)
    setTextAlignment('Cover', 'left')
    setObjectCamera('Cover', 'other')
    setTextSize('Cover', IntroTextSize)
    setCoverSongInfo('Boing', 'Taehan', 'Rareblin')
end

function onUpdate(elapsed)
    if Cover then
      setProperty('Composer.y', 135)
      addLuaText('Cover', true)
    end
end

function onSongStart()
	doTweenX('MoveInOne', 'SongBoxTag', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'SongBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'SongBoxText', 10, 1, 'CircInOut')
	doTweenX('MoveInFour', 'SongText', 10, 1, 'CircInOut')
	doTweenX('MoveInFive', 'Composer', 10, 1, 'CircInOut')
	doTweenX('MoveInSeven', 'Cover', 10, 1, 'CircInOut')
	
	runTimer('SongBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'SongBoxWait' then
		doTweenX('MoveOutOne', 'SongBoxTag', -520, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'SongBox', -520, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'SongBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'SongText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'Composer', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutSix', 'ComposerName', -450, 1.5, 'CircInOut')
		doTweenX('MoveInSeven', 'Cover', -450, 1.5, 'CircInOut')
		doTweenX('MoveInEight', 'CoverName', -450, 1.5, 'CircInOut')
	end
end