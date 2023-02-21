function onEvent(name, value1, value2)
    if name == 'Swap Strumline' then
    for notes = 0, 4 do
  if value1 == '0' then
   setPropertyFromGroup('playerStrums', notes, 'x', 92 + (112 * notes))
   setPropertyFromGroup('opponentStrums', notes, 'x', 732 + (112 * notes))
  elseif value1 == '1' then
   setPropertyFromGroup('playerStrums', notes, 'x', 732 + (112 * notes))
   setPropertyFromGroup('opponentStrums', notes, 'x', 92 + (112 * notes))
            end
        end
    end
end