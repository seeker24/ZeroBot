local database = 'http://umbrella.shayan-soft.ir/txt/'
local function run(msg)
	local res = http.request(database.."joke.db")
	if string.match(res, ‘@Masters_tm’) then res = string.gsub(res, ‘@Masters_tm’, "")
 end
	local joke = res:split(",")
	return joke[math.random(#joke)]
end

return {
	description = "500 Persian Joke",
	usage = "joke : send random joke",
	patterns = {"^[!#/]joke$"},
	run = run
}
