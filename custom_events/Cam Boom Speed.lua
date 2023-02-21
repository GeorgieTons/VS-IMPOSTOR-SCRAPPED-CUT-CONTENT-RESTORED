boomspeed = 4
bam = 1
beated = false
function onEvent(n,v1,v2)
  if n == "Cam Boom Speed" then
    if not beated then
     beated = true
    end
    boomspeed = tonumber(v1)
    bam = tonumber(v2)
  if v1 == '0' then
    bam = 0
    boomspeed = 4
        end
    end
end

function onBeatHit()
   if not lowQuality then
     if beated then
	if curBeat % boomspeed == 0 then
		triggerEvent("Add Camera Zoom", 0.015 * bam, 0.03 * bam)
	    end
        end
    end
end