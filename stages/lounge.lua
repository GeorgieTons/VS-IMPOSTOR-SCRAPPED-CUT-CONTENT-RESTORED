local xx = 1270;
local xx = 700
local yy = 700
local xx2 = 1000
local path = 'impostor/'

function onCreate() 
   makeLuaSprite('loungebg', path.. 'lounge/lounge', -264.6, -66.25)
   addLuaSprite('loungebg')
end

function onUpdate()
	setProperty('gf.alpha', 0);
	if mustHitSection == false then
		triggerEvent('Camera Follow Pos',xx,yy)
	else
		triggerEvent('Camera Follow Pos',xx2,yy)
	end

	if songName 'O2' and curBeat >= 120 then
		xx = 840
		xx2 = 1500
	end
end