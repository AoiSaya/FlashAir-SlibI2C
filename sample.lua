-----------------------------------------------
-- Sample of SlibI2C.lua for W4.00.03
-- Copyright (c) 2018, Saya
-- All rights reserved.
-- 2018/09/25 rev.0.01
-----------------------------------------------

local script_path = function()
	local  str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

-- main
local myDir  = script_path()
local libDir = myDir.."lib/"
local i2c = require(libDir .. "SlibI2C")

local res = fa.i2c{ mode="init", freq=400 }
local res, sadr = i2c:sascan( {0x76,0x77}, 0xD0, 0x60 )
print(string.format("%s : 0x%02x", res, sadr))
