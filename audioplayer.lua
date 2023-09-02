local speakerlib = require("speakerlib")
local args = {...}
if speakerlib.isMdiskPresent() then
	local volume = tonumber(args[1])
	if not volume then
		volume = 1
	end
	local meta = speakerlib.getSongMetadata()
	print(meta.song)
	print(meta.artist.." - "..meta.album.." ("..meta.year..")")
	if speakerlib.isMdiskStereo() then
		speakerlib.playDfpwmStereo("disk/left.dfpwm", "disk/right.dfpwm", {}, {}, volume)
	else
		speakerlib.playDfpwmMono("disk/left.dfpwm", volume)
	end
else
	local url
	local volume = tonumber(args[2])
	if not volume then
		volume = 1
	end
	speakerlib.playDfpwmMono(url,volume)
end
