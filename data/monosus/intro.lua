function onCreate()
  setProperty('dad.visible', false)
  setProperty('camHUD.alpha', 0)
  setProperty('skipCountdown', true)
end

function onSongStart()
   setProperty('dad.visible', true)
   triggerEvent('Play Animation', 'intro', 'Dad')
end

function onUpdate(elapsed)
  setProperty('camZooming', false)
    for i = 0 , 3 do
      setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
    end
end