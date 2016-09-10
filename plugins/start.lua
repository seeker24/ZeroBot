do

 function run(msg, matches)
if matches[1]:lower() == 'start' then
			if msg.to.type == 'user' then
			return 'Dear,'..(msg.from.first_name or '—-')..'\nWelcome to Neo Api Bot\nYou Can Make safe Group With Neo Api bot\n\n> <b> Your Name </b>: '..(msg.from.first_name or '—-')..'\n> <b> Your Last Name </b>: '..(msg.from.last_name or '—-')..'\n> <b> Your ID </b>: <code> '..msg.from.id..' </code>\n> <b> Your UserName </b>: @'..(msg.from.username or '—-')..''
			end
end
end
end
return {
patterns = {
"^[/]([Ss][Tt][Aa][Rr][Tt])"
},
run = run
}