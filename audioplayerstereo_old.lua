local speakerlib = require("speakerlib")
--song url
local args = {...}
local volume = tonumber(args[1])
if not volume then
	volume = 1
end
if not fs.exists("/disk") then
	error("Insert the disk silly!")
end
while true do
	speakerlib.playDfpwmStereo("disk/left.dfpwm", "disk/right.dfpwm",{"left"},{"right"}, volume)
end
