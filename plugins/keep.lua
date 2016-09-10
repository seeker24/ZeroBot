local function run(msg, matches)
---------------------------------------
         local bgcolor = {
'0000ff',
'e11bca',
'7366BD',
'ff0000',
'B4674D',
'FF7F49',
'B0B7C6',
'FFFF99',
'00ff00',
'000000',
'ff00ff',
'00ffff',
'ffff00'
}
--------------------------------------
        local textcolor = {
'ffffff'
}
--------------------------------------
        local text = {
'ffffff'
}
---------------------------------------
local bgcolor = bgcolor[math.random(#bgcolor)]
---------------------------------------
local textcolor = textcolor[math.random(#textcolor)]
---------------------------------------
local text = text[math.random(#text)]
---------------------------------------
local size = '300'
---------------------------------------
local url = "http://www.keepcalmstudio.com/-/p.php?t=%EE%BB%AA%0D%0AKEEP%0D%0ACALM%0D%0A%0D%0A"..URL.escape(matches[1]).."&bc="..bgcolor.."&tc="..textcolor.."&cc="..text.."&w="..size.."&uc=true&ts=true&ff=PNG&ps=sq"
---------------------------------------
local file = download_to_file(url,'clever.webp')
if msg.to.type == 'channel' then
send_document('channel#id'..msg.to.id,file,ok_cb,false)
else
send_document('chat#id'..msg.to.id,file,ok_cb,false)
end
end
return {
   patterns = {
	    "^[/!#][Kk][Ee][Ee][Pp] [Cc][Aa][Ll][Mm] (.*)$",
       },
   run = run
}