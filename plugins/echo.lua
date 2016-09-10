
local function run(msg, matches)
  local text = matches[1]
  return '🗣Echo massage from @'..msg.from.username..'\n\nYour Text : '..text..''
end

return {
  description = "/echo /kickme",
  usage = {
   "_|_",
   },
  patterns = {
	"^[/!#]echo (.*)$",
	  }, 
  run = run 
}
