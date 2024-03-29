# FlashAir-SlibI2C

Lua library for I2C for FlashAir.

## Tested equipment

Tested on FlashAir W-04 v4.00.03.

## Install

SlibI2C.lua -- Copy to somewhere in Lua's search path.

## Usage

command | description
--- | ---
res = I2C:setup( frq )|**I2C interfase setup**<br>**frq:** Clock frequency(kHz). 45 or 100 or 189 or 400
res = I2C:print( sadr, str )| **I2C print data**<br>**sadr:** target address (7bit)<br>**str:** strings for write<br>**res:** Same as return value of fa.i2c()
res = I2C:write( sadr, d1, d2, ... )| **I2C write data**<br>**sadr:** target address (7bit)<br>**d1, d2, ... :** data for write<br>**res:** Same as return value of fa.i2c()
res, str = I2C:scan( sadr, len )|**I2C read string**<br>**sadr:** target address (7bit)<br>**len:** length<br>**res:** Same as return value of fa.i2c()<br>**str:** strings
res, d1, d2, ... = I2C:read( sadr, len )|**I2C read data**<br>**sadr:** target address (7bit)<br>**len:** length<br>**res:** Same as return value of fa.i2c()<br>**d1, d2, ... :** numbers
ret, tbl = I2C:readt( sadr, len )|**I2C read table**<br>**sadr:** target address (7bit)<br>**len:** length<br>**res:** Same as return value of fa.i2c()<br>**tbl:** table of numbers
res, str = I2C:wscan( sadr, adr, len )|**I2C read string after write address**<br>**sadr:** target address (7bit)<br>**adr:** address<br>**len:** length<br>**res:** Same as return value of fa.i2c()<br>**str:** strings
res, d1, d2, ... = I2C:wread( sadr, adr, len )|**I2C read data after write adr**<br>**sadr:** target address (7bit)<br>**adr:** address<br>**len:** length<br>**res:** Same as return value of fa.i2c()<br>**d1, d2, ... :** numbers
ret, tbl = I2C:wreadt( sadr, adr, len )|**I2C read table after write address**<br>**sadr:** target address (7bit)<br>**adr:** address<br>**len:** length<br>**res:** Same as return value of fa.i2c()<br>**tbl:** table of numbers
res = I2C:setpio( dat )|**I2C set pio**<br>**dat:** write data<br>**res:** Same as return value of fa.i2c()
res, data, ctrl = I2C:getpio()|**I2C get pio**<br>**res, data, ctrl:** Same as return value of fa.i2c()
res, sadr = I2C:sascan( adrTbl, idAdr, id )<br><br>or<br><br>res, sadr = I2C:sascan( adrTbl, idAdr, id, tryCount, waitTime )|**I2C target address scan**<br>**adrTbl:** target address table<br>**idAdr:** ID address<br>**id:** ID data<br>**tryCount:** Try count (nil for 5)<br>**waitTime:**　wait time[ms] (nil for 1)<br><br>**res:** Same as return value of fa.i2c()<br>**sadr:** target address or 0xFF at I2C error
## Licence

[MIT](https://github.com/AoiSaya/FlashAir-libBMP/blob/master/LICENSE)

## Author

[GitHub/AoiSaya](https://github.com/AoiSaya)  
[Twitter ID @La_zlo](https://twitter.com/La_zlo)
