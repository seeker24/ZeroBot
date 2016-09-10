local function run(msg, matches)
  if matches[1]:lower() == "github>" then
    local dat = https.request("https://api.github.com/repos/"..matches[2])
    local jdat = JSON.decode(dat)
    if jdat.message then
      return "آدرس وارد شده صحیح نیست به این صورت وارد کنید:\ngithub username/project\ngithub mohamadkhoshnava/idbot"
      end
    local base = "curl 'https://codeload.github.com/"..matches[2].."/zip/master'"
    local data = io.popen(base):read('*all')
    f = io.open("file/github.zip", "w+")
    f:write(data)
    f:close()
    return send_document("channel#id"..msg.to.id, "file/github.zip", ok_cb, false)
  else
    local dat = https.request("https://api.github.com/repos/"..matches[2])
    local jdat = JSON.decode(dat)
    if jdat.message then
      return "آدرس وارد شده صحیح نیست به این صورت وارد کنید:\ngithub username/project\ngithub mohamad.khoshnava/idbot"
      end
    local res = https.request(jdat.owner.url)
    local jres = JSON.decode(res)
    send_photo_from_url("channel#id"..msg.to.id, jdat.owner.avatar_url)
    return "Account Description:\n"
      .."Account Name: "..(jres.name or "-----").."\n"
      .."Username: "..jdat.owner.login.."\n"
      .."Company Name: "..(jres.company or "-----").."\n"
      .."Website: "..(jres.blog or "-----").."\n"
      .."Email: "..(jres.email or "-----").."\n"
      .."Locaion: "..(jres.location or "-----").."\n"
      .."Projects Count: "..jres.public_repos.."\n"
      .."Fallowers: "..jres.followers.."\n"
      .."Fallowing: "..jres.following.."\n"
      .."Created in "..jres.created_at.."\n"
      .."Bio: "..(jres.bio or "-----").."\n\n"
      .."Project Detail:\n"
      .."Project Name: "..jdat.name.."\n"
      .."Git Page: "..jdat.html_url.."\n"
      .."Source Pak: "..jdat.clone_url.."\n"
      .."Project Blog: "..(jdat.homepage or "-----").."\n"
      .."Created at "..jdat.created_at.."\n"
      .."Last Update in "..(jdat.updated_at or "-----").."\n"
      .."ProgramLang: "..(jdat.language or "-----").."\n"
      .."Script Size: "..jdat.size.."\n"
      .."Stars: "..jdat.stargazers_count.."\n"
      .."Wached: "..jdat.watchers_count.."\n"
      .."Forks: "..jdat.forks_count.."\n"
      .."Subscribers: "..jdat.subscribers_count.."\n"
      .."About Project:\n"..(jdat.description or "-----").."\n"
  end
end

return {
  description = "Github Informations",
  usagehtm = '<tr><td align="center">github پروژه/اکانت</td><td align="right">آدرس گیتهاب را به صورت پروژه/اکانت وارد کنید<br>مثال: github shayansoft/umbrella</td></tr>'
  ..'<tr><td align="center">github> پروژه/اکانت</td><td align="right">با استفاده از این دستور، میتوانید سورس پروژه ی مورد نظر را دانلود کنید. آدرس پروژه را مثل دستور بالا وارد کنید</td></tr>',
  usage = {
    "github (account/proje) : Project And Detail",
    "github> (account/proje) : Download Source",
    },
  patterns = {
    "^([Gg]ithub>) (.*)",
    "^([Gg]ithub) (.*)",
    },
  run = run
}
