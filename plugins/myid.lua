-- @plustm
function mrnitro(msg, matches) 
if matches[1] == 'myid' then 
  local text1 = msg.from.id
  local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..text1 
  local file = download_to_file(url,'love.webp') 
send_document(get_receiver(msg), file, rmtmp_cb, cb_extra) 
end 
end 

return { 
  patterns = { 
   "^[/!]([Mm][Yy][Ii][Dd])$",
   "^([Mm][Yy][Ii][Dd])$"
  }, 
  run = mrnitro
}
-- create by mr.nitro