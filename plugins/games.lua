--[[
الالعاب ل سورس الزعيم
--]]
local function games(msg,MsgText)
if msg.type ~= "pv" then

if MsgText[1] == "تفعيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss..'lock_geams'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* الالعاب بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(boss..'lock_geams'..msg.chat_id_) 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* تم تفعيل الالعاب \n✓" 
end 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'lock_geams'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* الالعاب بالتأكيد معطله\n✓" 
else
redis:set(boss..'lock_geams'..msg.chat_id_,true)  
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* تم تعطيل الالعاب\n✓" 
end   
end

if not redis:get(boss..'lock_geams'..msg.chat_id_) and msg.GroupActive then

if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local Smiles = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌','📍','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
Emoji = Smiles[math.random(#Smiles)]
redis:set(boss..':Set_Smile:'..msg.chat_id_,Emoji)
return 'اسرع شخص يدز » { `'..Emoji..'` } «'
end

if MsgText[1] == 'ترتيب' then
if not Arry_Word or not redis:get(boss..":GetInfoNow:") then
local Trteb_Word , res = https.request('https://th3boss.com/Words.json')
if res ~= 200 then return "! لا يوجد اتصال بالسيرفر للاسف راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن !" end
success, Arry_Word = pcall(JSON.decode,Trteb_Word)
if not success then return "! هناك مشكله في الجيسون للاسف راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن !" end
redis:setex(boss..":GetInfoNow:",7200,true)
end
local Text , UnText = next(Arry_Word.AllWords[math.random(#Arry_Word.AllWords)])
redis:set(boss..':Set_Arg:'..msg.chat_id_,Text)
return 'اســرع واحد يرتب » {* '..UnText..' *} «' 
end

if MsgText[1] == 'معاني' then
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديج','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set(boss..':Set_Name_Meant:'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديج','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
return 'اسرع واحد يدز معنى السمايل يفوز » { '..name..' }'
end

if MsgText[1] == 'نقاط' or MsgText[1] == 'نقاطي' or MsgText[1] == 'النقاط' then 
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
return '📬¦ عدد نقاطك من اللعبه هي { *'..points..'* }\n🔖| اي ما يعادل { *'..(points * 10 )..'* } رساله اذا قمت ببيعه 💰'
else
return '📛 ¦ للاسف ليس لديك نقاط \n🔖 ¦ للحصول على النقاط العب احد الالعاب الموجوده في `قائمه الالعاب`'
end
end

if MsgText[1] == 'بيع نقاطي' or MsgText[1] == 'بيع النقاط' then
if MsgText[2] == "0" then
return '📛¦ هناك خطأ عزيزي  \n🔖¦ يجب ان يكون البيع ع الاقل 1 نقطه . '
end
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if tonumber(MsgText[2]) > tonumber(points) then
return '📛| عذرا ليس لديك نقاط بهذا العدد لبيعهن' 
end
if points == "0" then
return '📛 ¦ للاسف ليس لديك نقاط \n🔖 ¦ للحصول على النقاط العب احد الالعاب الموجوده في `قائمه الالعاب`'
else
local Total_Point = points * 10
redis:decrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,MsgText[2])  
redis:incrby(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_,Total_Point)  
return "💰¦ تم بيع {* "..MsgText[2].." *} نقطه\n📮| تم زياده {* "..Total_Point.."* } من الرسائل \n📑| اصبحت رسائلك { *"..redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_).."* } رساله\n🔖| علما لكل نقطه تساوي زياده {* 10 *} رسائل ."
end
end

if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
return [[ 👤¦ اهلا بك عزيزي 
🚸¦ اليك قائمه الالعاب
📬¦ الاسرع » لعبه تطابق السمايلات
📛¦ معاني » لعبه معاني السمايلات
🎭¦ ترتيب » لعبه ترتيب الكلمات
🔭¦ روليت » لعبه روليت الشهيره ]]
end

if MsgText[1] == 'روليت' then
redis:del(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(boss..':List_Rolet:'..msg.chat_id_)  
redis:setex(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*🎪¦* حسننا لنلعب , ارسل عدد اللاعبين للروليت .'
end

if MsgText[1] == 'نعم' and redis:get(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "📛| لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "📛| عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(boss..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(boss..':List_Rolet:'..msg.chat_id_) 
redis:del(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '📑¦ تم اختيار الشخص الاتي\n🌟¦ صاحب الحظ {['..UserName..']}\n💰¦ ربحت معنا 5 نقاط' 
end

if MsgText[1] == 'الاعبين' then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return '*📮¦* لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."•  » [" ..v.."] »\n"  
end 
return Text
end

if MsgText[1] == 'قائمه الالعاب' then
sendMsg(msg.chat_id_,msg.id_,[[
👤¦ اهلا بك عزيزي 
🚸¦ اليك قائمه الالعاب
📬¦ اسرع » لعبه تطابق السمايلات
📛¦ معاني » لعبه معاني السمايلات
🎭¦ ترتيب » لعبه ترتيب الكلمات
🔭¦ روليت » لعبه روليت الشهيره
]])
end


end


end
end

local function procces(msg)
if msg.text and not redis:get(boss..'lock_geams'..msg.chat_id_) then

if msg.text == redis:get(boss..':Set_Smile:'..msg.chat_id_) then --// الاسرع
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'🎉¦ مبروك لقد ربحت نقطه\n🔖¦ اصبح لديك { *'..redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)..'* } نقطه 🍃')
end 

if msg.text == redis:get(boss..':Set_Arg:'..msg.chat_id_) then -- // الترتيب
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Arg:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'🎉¦ مبروك لقد ربحت نقطه\n🔖¦ اصبح لديك { *'..redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)..'* } نقطه 🍃')
end 

if msg.text == redis:get(boss..':Set_Name_Meant:'..msg.chat_id_) then --// المعاني
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Name_Meant:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'🎉¦ مبروك لقد ربحت نقطه\n🔖¦ اصبح لديك { *'..redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)..'* } نقطه 🍃')
end 

if msg.text:match("^(%d+)$") and redis:get(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*📮¦* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '💬¦ تم بدء تسجيل اللسته \n💱¦ يرجى ارسال المعرفات \n🎊¦ الفائز يحصل على (5) نقاط\n🎯¦ عدد الاعبين المطلوبه { *'..msg.text..'* } لاعب \n 🏹'
end
redis:del(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_)  
return sendMsg(msg.chat_id_,msg.id_,Text)    
end

if msg.text:match('^(@[%a%d_]+)$') and redis:get(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if redis:sismember(boss..':List_Rolet:'..msg.chat_id_,msg.text) then
return sendMsg(msg.chat_id_,msg.id_,'*📮¦* المعرف {['..msg.text..']} موجود اساسا' )
end
redis:sadd(boss..':List_Rolet:'..msg.chat_id_,msg.text)
local CountAdd = redis:get(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = redis:scard(boss..':List_Rolet:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:setex(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
return sendMsg(msg.chat_id_,msg.id_,"*📮¦* تم ادخال المعرف { ["..msg.text.."] } \n🔖*¦* وتم اكتمال العدد الكلي \n📛¦ هل انت مستعد ؟ اجب بـ {* نعم *}")
end 
return sendMsg(msg.chat_id_,msg.id_,"*📮¦* تم ادخال المعرف { ["..msg.text.."] } \n🔖| تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n📑| ارسل المعرف التالي ")
end


end 



end
return {
Boss = {
"^(نعم)$", 
"^(الاعبين)$", 
"^(الالعاب)$", 
'^(تعطيل) (.+)$',
'^(تفعيل) (.+)$',
"^(الاسرع)$",
"^(اسرع)$",
"^(النقاط)$", 
"^(نقاط)$", 
"^(نقاطي)$", 
"^(ترتيب)$", 
"^(معاني)$", 
"^(بيع نقاطي) (%d+)$",
"^(بيع النقاط) (%d+)$",
"^(روليت)$", 
"^(قائمه الالعاب)$", 
 },
 iBoss = games,
 dBoss = procces,
 }
