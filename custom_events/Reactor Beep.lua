function onEvent(name, val1, val2)
  val1 = tonumber(value1)
  val2 = tonumber(value1)
  if name == 'Reactor Beep' then
  cameraFlash('camGame', 'B30000', 0.4, true)
  triggerEvent('Add Camera Zoom', '0.015', '0.03')
    end
end