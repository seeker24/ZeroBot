do

function run(msg, matches)
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(1064453600)]['settings']['set_link']
       if not group_link then
      return 'برای اولین بار ابتدا باید newlink/ را تایپ کنید'
       end
         local text = "لینک گروه پشتیبانی t:\n\n"..group_link..""
            return text
end

return {
  patterns = {
    "^[!/]([Ll]inksp)$"
  },
  run = run
}

end
