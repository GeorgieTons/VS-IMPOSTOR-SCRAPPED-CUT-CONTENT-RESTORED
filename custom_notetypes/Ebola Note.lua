local healthDrop = 0;
local healthA = 0;
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ebola Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'EbolaNotes');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'EbolaSplashes');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.095');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function onUpdate()
    setProperty('health', getProperty('health') - healthDrop); 
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'Ebola Note' then
	healthDrop = healthDrop + 0.001;
	  if healthDrop == 0.001 then
	    runTimer('healthB', 0.001, 9000000);
           else 
	    healthA = 0;
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'healthB' then
		healthA = healthA + 1;
		if healthA >= 9000000 then
			healthDrop = 0;
		end
	end
end