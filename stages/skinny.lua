local xx = 600;
local xx = 700
local yy = 500
local xx2 = 800

function onUpdate()
	setProperty('gf.alpha', 0);
	if mustHitSection == false then
		triggerEvent('Camera Follow Pos', xx, yy)
	else
		triggerEvent('Camera Follow Pos', xx2, yy)
	end
end