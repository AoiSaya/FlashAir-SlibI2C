-----------------------------------------------
-- SoraMame libraly of I2C for W4.00.03
-- Copyright (C) 2018, Sora.
-- All rights reserved.
-- 2018/09/24 rev.0.06
-----------------------------------------------
local I2C = {}

-- setup
function I2C:setup( frq ) -- frq: Clock frequency(kHz). 45 or 100 or 189 or 400
	local res = fa.i2c{ mode="init", freq=frq }

	return res
end

-- I2C write string
function I2C:print( sadr, str )
	local res = fa.i2c{ mode="start", address=sadr, direction="write" }
	local res = fa.i2c{ mode="write", data=str }
	local res = fa.i2c{ mode="stop" }

	return res
end

-- I2C write data
function I2C:write( sadr, ... )
	return self:print(sadr, string.char(...) )
end

-- I2C read string
function I2C:scan( sadr, len )
	local res = fa.i2c{ mode="start", address=sadr, direction="read" }
	local res, str = fa.i2c{ mode="read", bytes=len, type="string" }
	local res = fa.i2c{ mode="stop" }

	return res, str
end

-- I2C read data
function I2C:read( sadr, len )
	local res, str = self:scan( sadr, len )

	if res=="OK" then
		return res, str:byte(1, #str)
	else
		return res
	end
end

-- I2C read table
function I2C:readt( sadr, len )
	local res, str = self:scan( sadr, len )

   	if res=="OK" then
		return res, {str:byte(1, #str)}
	else
		return res
	end
end

-- I2C read string after write adr
function I2C:wscan( sadr, adr, len )
	local res = fa.i2c{ mode="start",	address=sadr, direction="write" }
	local res = fa.i2c{ mode="write",	data=adr }
	local res = fa.i2c{ mode="restart", address=sadr, direction="read" }
	local res, str = fa.i2c{ mode="read", bytes=len, type="string" }
	local res = fa.i2c{ mode="stop" }

	return res, str
end

-- I2C read data after write adr
function I2C:wread( sadr, adr, len )
	local res, str = self:wscan( sadr, adr, len )

	if res=="OK" then
		return res, str:byte(1, #str)
	else
		return res
	end
end

-- I2C read table after write adr
function I2C:wreadt( sadr, adr, len )
	local res, str = self:wscan( sadr, adr, len )

   	if res=="OK" then
		return res, {str:byte(1, #str)}
	else
		return res
	end
end

-- I2C set pio
function I2C:setpio( dat )
	return fa.i2c {mode ="setpio", data=dat, ctrl=1}
end

-- I2C get pio
function I2C:getpio()
	fa.i2c {mode ="setpio", data=0, ctrl=0}
	return fa.i2c {mode="getpio"}
end

-- I2C slave address scan
function I2C:sascan( adrTbl, idAdr, id, tryCount, waitTime )
	local	res, dat
	tryCount = tryCount or 5
	waitTime = waitTime or 1

	for i=1,tryCount do
		for j,sadr in ipairs(adrTbl) do
			res, dat = self:wreadt( sadr, idAdr, 1 )
			if type(dat)=="table" and dat[1]==id then
				return res, sadr
			end
			sleep(waitTime)
		end
	end

	return res, 0xFF
end

return I2C
