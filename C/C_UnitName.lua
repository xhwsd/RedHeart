-- converts a unit to a name w/o returning the realm
function C_UnitName(unit)
         local name, server = UnitName(unit)
         return name
end