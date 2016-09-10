
local function run(msg, matches)
    if matches[1] == "delplug" and is_sudo(msg) then
text = io.popen("cd plugins && rm "..matches[2]..".lua")
reply_msg(msg['id'], "Plugin ["..matches[2].."]Successfully Deleted ", ok_cb, false)
return text
end 
end

return { 
patterns = {
 
'^[!/](delplug) (.*)$' 
},
run = run,
}