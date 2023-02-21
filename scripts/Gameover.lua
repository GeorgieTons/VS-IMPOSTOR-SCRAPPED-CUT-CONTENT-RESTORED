BlackGameover = {'Defeat', 'Ominous', 'Ominous Old', 'Triple Kill'}
FallGameover = {'Ejected', 'Double Trouble', 'Double Trouble Old', 'Double Ejection'}
BalledGameOver = false

function onCreate()
  if checkList(FallGameover, songName) == true then
   setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fall')
   setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ejected_death')
   setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_v4_LOOP')
   setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover_v4_End')
 end

  if checkList(BlackGameover, songName) == true then
    if getRandomBool(1) then
        BalledGameOver = true
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-defeat-dead-balls')
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'defeat_kill_ballz_sfx')
    else
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-defeat-dead')
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'defeat_kill_sfx')
    end
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_v4_LOOP')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover_v4_End')
   end
end

function checkList(list, value)--checkList by Asbel sen
    for i = 0, table.maxn(list) do
       if list[i] == value then return true end
    end
end