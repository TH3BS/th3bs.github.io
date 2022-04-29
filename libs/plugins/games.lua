--[[
الالعاب ل سورس الزعيم
--]]
local function games(msg,MsgText)
if msg.type ~= "pv" then
if MsgText[1] == "تفعيل الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
if not msg.Admin then return "📪¦ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not redis:get(boss..'lock_geams'..msg.chat_id) then 
return sendMsg(msg.chat_id,msg.id,"🔓¦ تم بالتأكيد تفعيل الالعاب    \n📮¦ بواسطه 「 "..Hyper_Link_Name(LuaTele.getUser(msg.sender_id.user_id)).." 」") 
else 
redis:del(boss..'lock_geams'..msg.chat_id) 
return sendMsg(msg.chat_id,msg.id,"🔓¦ تم تفعيل الالعاب بنجاح   \n📮¦ بواسطه 「 "..Hyper_Link_Name(LuaTele.getUser(msg.sender_id.user_id)).." 」") 
end 
end

if MsgText[1] == "تعطيل الالعاب" or MsgText[1] == "تعطيل اللعبه" or MsgText[1] == "تعطيل اللعبة" then
if not msg.Admin then return "📪¦ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(boss..'lock_geams'..msg.chat_id) then 
return sendMsg(msg.chat_id,msg.id,"🔒¦ تم بالتأكيد تعطيل الالعاب    \n📮¦ بواسطه 「 "..Hyper_Link_Name(LuaTele.getUser(msg.sender_id.user_id)).." 」") 
else
redis:set(boss..'lock_geams'..msg.chat_id,true)  
return sendMsg(msg.chat_id,msg.id,"🔒¦ تم تعطيل الالعاب بنجاح   \n📮¦ بواسطه 「 "..Hyper_Link_Name(LuaTele.getUser(msg.sender_id.user_id)).." 」") 
end  
end

if MsgText[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "📪¦ هذا الامر يخص {المطور,المنشئ} فقط  \n" end 
local ID_USER = MsgText[2]
redis:set(boss..'SET:ID:USER'..msg.chat_id,ID_USER)  
redis:setex(boss.."SETEX:MSG"..msg.chat_id..""..msg.sender_id.user_id,500,true)  
sendMsg(msg.chat_id,msg.id,'*📊¦ ارسل لي عدد الرسائل الذي تريده*')
end

if MsgText[1] == "اضف نقاط" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "📪¦ هذا الامر يخص {المطور,المنشئ} فقط  \n" end 
local ID_USER = MsgText[2]
redis:set(boss..'SET:ID:USER:NUM'..msg.chat_id,ID_USER)  
redis:setex(boss.."SETEX:NUM"..msg.chat_id..""..msg.sender_id.user_id,500,true)  
sendMsg(msg.chat_id,msg.id,'*📊¦ ارسل لي عدد النقاط الذي تريده*')
end

if not redis:get(boss..'lock_geams'..msg.chat_id) and msg.GroupActive then
if MsgText[1] == 'اسئله' or MsgText[1] == 'ختيارات' or MsgText[1] == 'بدء الاسئله' then   
redis:set(boss.."GAME:S"..msg.chat_id,true) 
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو


📮¦ ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه?
1- 15
2- 13
3- 14 

📮¦ ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون?

1- الفم 
2- الاذن
3- الثلاجه


📮¦ ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب?

1- 7
2- 15
3- 11


📮¦ ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم?

1- 60
2- 70
3- 30 


📮¦ ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم??

1- ترامب
2- اوباما
3- بوتين  


📮¦ ارسل الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- مارك زوكيربرج


📮¦ ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا?

1- باريس 
2- لوين 
3- موسكو 


📮¦ ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

📮¦ ارسل  الجواب الصحيح فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه ?
1-الفيل
2- النمل  
3- الثور


📮¦ ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  


📮¦ ارسل  الجواب الصحيح فقطز
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر


📮¦ ارسل الجواب الصحيح فقط
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 


📮¦ ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر


📮¦ ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الحذاء


📮¦ ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب


📮¦ ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
1- حرف الباء
2- حرف الام 
3- حرف الراء


📮¦ ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي?
1- العزائم 
2- المكارم
3- المبائب


📮¦ ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمه انسه ?
1- سيدات
2- انسات 
3- قوانص


📮¦ ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب?
1- الصاروخ
2- المسدس
3- المنجنيق 


📮¦ ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره?
1- افريقيا 
2- اسيا  
3- امركيا الشماليه


📮¦ ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه?
1-الفيل
2- الاسد 
3- النمر


📮¦ ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفرا للمليون ?
1- 4 
2- 3
3-6

📮¦ ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان?
1- مهر  
2- جرو
3- عجل


📮¦ ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه?

1- القرش
2- الدلفين 
3- الثعلب


📮¦ ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز?

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 


📮¦ ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق  


📮¦ ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا?
1- لندن  
2- لفرسول
3- تركيا


📮¦ ارسل  الجواب الصحيح فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 


📮¦ ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ?
1- بانكول
2- نيو دلهي
3- طوكيو 


📮¦ ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ?

1- حفضه
2- زينب 
3- خديجه 


📮¦ ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'النيل') 
elseif SENDTEXT:find('14') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'14') 
elseif SENDTEXT:find('الفم') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الفم') 
elseif SENDTEXT:find('11') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'11') 
elseif SENDTEXT:find('30') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'30') 
elseif SENDTEXT:find('بوتين') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'باريس') 
elseif SENDTEXT:find('10') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'10') 
elseif SENDTEXT:find('النمل') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'سحاب') 
elseif SENDTEXT:find('الاسم') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الاسم') 
elseif SENDTEXT:find('ذهب') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'العزائم') 
elseif SENDTEXT:find('انسات') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'اسيا') 
elseif SENDTEXT:find('الاسد') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الاسد') 
elseif SENDTEXT:find('6') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'6') 
elseif SENDTEXT:find('مهر') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مهر') 
elseif SENDTEXT:find('الدلفين') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الزئبق') 
elseif SENDTEXT:find('لندن') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'لندن') 
elseif SENDTEXT:find('الانسان') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'خديجه') 
end
sendMsg(msg.chat_id,msg.id,SENDTEXT)
return false  
end

if MsgText[1] == 'المختلف' then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
redis:set(boss..':Set_alii:'..msg.chat_id,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂','🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙍‍♂🙎‍♂🙎‍♂🙎‍♂')
name = string.gsub(name,'🧖‍♂','🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♂🧖‍♀🧖‍♀🧖‍♀🧖‍♀')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
return '  اول واحد يطلع المختلف » {* '..name..' * } ' 
end

if MsgText[1] == 'امثله' then
katu = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = katu[math.random(#katu)]
redis:set(boss..':Set_Amthlh:'..msg.chat_id,name)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
return 'اكمل المثل التالي {* '..name..' *}'
end

if MsgText[1] == 'حزوره' then
katu = {'امي','انا','المخده','الهواء','الهواء','القمر','الباب المفتوح','النهر','الكف','الغيم','اسمك','حرف الام','الابجديه','الدائره','الساعه','تموز','الصمت','السلحفات','كم الساعه','شجره العائله','ضفدع','خليه النحل','الصوت','الجوع','الكتاب','البيض','الاسفنجه','البرتقال','الكفن','الساعه','ارجل المنضده','البصل','الوقت','النار','الثلج','العمر','المسمار','الحفره','المشط','التلفون','الجرص','المراه','الغداء','الفيل','الصدئ','الهواء','عقرب الساعه'};
name = katu[math.random(#katu)]
redis:set(boss..':Set_Hzorh:'..msg.chat_id,name)
name = string.gsub(name,'امي','اخت خالك ومو خالتك منو')
name = string.gsub(name,'انا','بنت امك وابنت ابوك ومش اختك ولاخوك منو')
name = string.gsub(name,'المخده','اني خفيفه واني لطيفه اكوم من حضن الوزير اكعد بحضن الخليفه أزيح الهموم  واخلي لحبيب نايم منو انني')
name = string.gsub(name,'الهواء','ماهو الشيء الذي يسير امامك ولا تراه')
name = string.gsub(name,'القمر','ماهو الشيء الذي يحيا اول الشهر ويموت في اخره')
name = string.gsub(name,'الباب المفتوح','ماهو الباب الذي لا يمكن فتحه')
name = string.gsub(name,'النهر','ماهو الشي الذي يجري ولا يمشي')
name = string.gsub(name,'الكف','ماهو الشي الذي لو خمس اصابع دون لحم او عضم')
name = string.gsub(name,'الغيم','ماهو الشي الذي يمشي بلا رجلين ويبكي بلا عينين')
name = string.gsub(name,'اسمك','ماهو الشيء الذي لك ويستخدمه الناس من دون اذنك')
name = string.gsub(name,'حرف الام','ماهو الشيء الذي تراه في الليل ثلاث مرات والنهار مره واحده')
name = string.gsub(name,'الابجديه','كلمه تتكون من 8 احرف لكنها تجمع كل الحروف')
name = string.gsub(name,'الدائره','ماهو الشيء الذي ليس له بدايه وليس له نهايه')
name = string.gsub(name,'الساعه','ماهو الشيء الذي لا يتكلم واذا اكل صدق واذا جاع كذب')
name = string.gsub(name,'تموز','ماهو اسم الشهر الميلادي الذي اذا حذفت اوله تحول الى فاكهه')
name = string.gsub(name,'الصمت','ماهي الكلمه الذي يبطل معناها اذا نطقت بها ')
name = string.gsub(name,'السلحفات','ماهو الذي لحمهه من الداخل وعضمهه من الخارج ')
name = string.gsub(name,'كم الساعه','ماهوه السوال الذي تختلف اجابته دائماً')
name = string.gsub(name,'شجره العائله','ما اسم الشجره التي ليس لها ضل ولا لها ثمار ')
name = string.gsub(name,'الضفدع','ماهو الحيوان الذي لسانه طويل وجسمه صغير')
name = string.gsub(name,'خليه النحل','ماهو الشيء الذي يتسع مئاات الالوف ولا يتسع طير منتوف')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا ب الاذنين؟؟')
name = string.gsub(name,'الجوع','ماهو الشيء الذي يقرصك ولا تراه')
name = string.gsub(name,'الكتاب','له اوراق وماهو بنبات . له جلد وماهو بحيوان . وعلم وماهو ب انسان من هو')
name = string.gsub(name,'البيض','ماهو الشي الذي اسمه علئ لونه')
name = string.gsub(name,'الاسفنجه','كلي ثقوب ومع ذالك احفظ الماء فمن انا ')
name = string.gsub(name,'البرتقال','ماهو الشيء نرميه بعد العصر')
name = string.gsub(name,'الكفن','ماهو الشيء لاتحب ان تلبسة وان لبستة لاترة')
name = string.gsub(name,'الساعه','ماهو الشيء الذي يمشي ويقف وليس له ارجل')
name = string.gsub(name,'ارجل المنضده','اننا اربعة اخوه ولنا راس واحد فمن نحن')
name = string.gsub(name,'البصل','شيء تذبحه وتبكي عليه؟')
name = string.gsub(name,'الوقت','يذهب ولا يرجع')
name = string.gsub(name,'النار','شيء ياكل ولايشبع وان شرب الماء مات')
name = string.gsub(name,'الثلج','شيء مصنوع من الماء. وان عاش في الماء يموت')
name = string.gsub(name,'العمر','ماهو الشيء الذي كلما زاد نقص')
name = string.gsub(name,'المسمار','ماهو الشيء الذي لا يمشي الا ب الضرب')
name = string.gsub(name,'الحفره','ماهو الشيء الذي كلما اخذنا منهه زاد وكبر')
name = string.gsub(name,'المشط','له اسنان ولا يعض ماهو ')
name = string.gsub(name,'التلفون','يسمع بلا اذن ويحكي بلا لسان فما هو')
name = string.gsub(name,'الجرص','ماهو الشيء الذي اذا لمستهه صاح')
name = string.gsub(name,'المراه','ارى كل شيء من دون عيون فمن اكون')
name = string.gsub(name,'الغداء','ماهو الشيء الذي لايؤكل في الليل ')
name = string.gsub(name,'الفيل','من هوه الحيوان الذي يحك اذنه في انفه')
name = string.gsub(name,'الصدئ','ماهو الشيء الذي يتكلم جميع اللغات ')
name = string.gsub(name,'الهواء','شيء بيني وبينك لا تراه عينك ولا عيني فما هوه')
name = string.gsub(name,'عقرب الساعه','هناك عقرب لا يلدغ ولا يخاف منه الاطفال فما هوه')
return '  اول واحد يحلها » {* '..name..' *} ' 
end


if MsgText[1] == 'محيبس' or MsgText[1] == 'بات' then   
Num = math.random(1,6)
redis:set(boss.."GAMES"..msg.chat_id,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊


📮¦ اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
🎁¦ الفائز يحصل على { 3 } من النقاط *
]]
sendMsg(msg.chat_id,msg.id,TEST)   
redis:setex(boss.."SET:GAME" .. msg.chat_id .. "" .. msg.sender_id.user_id, 100, true)  
return false  
end
if MsgText[1] == 'خمن' or MsgText[1] == 'تخمين' then   
Num = math.random(1,20)
redis:set(boss.."GAMES:NUM"..msg.chat_id,Num) 
TEST = '*\n📮¦ اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'⚠¦ ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'🔖¦ سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ \n💥*'
sendMsg(msg.chat_id,msg.id,TEST)
redis:setex(boss.."GAME:TKMEN" .. msg.chat_id .. "" .. msg.sender_id.user_id, 100, true)  
return false  
end
if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local NUM = math.random(10,1000)
redis:set(boss..':NUM_SET:'..msg.chat_id,(NUM * 3))
local Smiles = {'🍏','🍎','🍐',NUM,NUM,NUM,NUM,NUM,'🍊','🍋','🍌','🍉',NUM,NUM,NUM,NUM,NUM,'🍇','🍓','🍈','🍒',NUM,NUM,NUM,NUM,NUM,'🍑','🍍','🥥','🥝','🍅',NUM,NUM,NUM,NUM,NUM,'🍆','🥑','🥦','🥒',NUM,NUM,NUM,NUM,NUM,'🌶','🌽','🥕','🥔','🍠','🥐','🍞',NUM,NUM,NUM,NUM,NUM,'🥖','🥨','🧀','🥚','🍳','🥞','🥓',NUM,NUM,NUM,NUM,NUM,'🥩','🍗','🍖','🌭','🍔','🍟',NUM,NUM,NUM,NUM,NUM,'🍕','🥪','🥙','🍼','☕️','🍵',NUM,NUM,NUM,NUM,NUM,'🥤','🍶','🍺','🍻',NUM,NUM,NUM,NUM,NUM,'🏀','⚽️','🏈','⚾️','🎾','🏐',NUM,NUM,NUM,NUM,NUM,'🏉','🎱','🏓','🏸','🥅','🎰','🎮',NUM,NUM,NUM,NUM,NUM,'🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹',NUM,NUM,NUM,NUM,NUM,'🎼','🎧','🎤','🎬','🎨','🎭',NUM,NUM,NUM,NUM,NUM,'🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌',NUM,NUM,NUM,NUM,NUM,'🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌',NUM,NUM,NUM,NUM,NUM,'📍','📓','📗','📂','📅','📪','📫','📬',NUM,NUM,NUM,NUM,NUM,'📭','⏰','📺','🎚','☎️',NUM,NUM,NUM,NUM,NUM,'📡'}
Emoji = Smiles[math.random(#Smiles)]
redis:set(boss..':Set_Smile:'..msg.chat_id,Emoji)
if tonumber(redis:get(boss..':Set_Smile:'..msg.chat_id)) == tonumber(redis:get(boss..':NUM_SET:'..msg.chat_id)) then
return '◀️┇اول من يكتب هذه العدد يفوز ؛  ››`'..(redis:get(boss..':Set_Smile:'..msg.chat_id))..'`'
else
return '️┇اول من يكتب هذه السمايل يفوز ››    `'..(redis:get(boss..':Set_Smile:'..msg.chat_id))..'`'
end
end

if MsgText[1] == 'ترتيب' then
if not Arry_Word or not redis:get(boss..":GetInfoNow:") then
local Trteb_Word , res = https.request('https://api.th3boss.com/Words.json')
if res ~= 200 then return "! لا يوجد اتصال بالسيرفر للاسف راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن !" end
success, Arry_Word = pcall(JSON.decode,Trteb_Word)
if not success then return "! هناك مشكله في الجيسون للاسف راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن !" end
redis:setex(boss..":GetInfoNow:",7200,true)
end
local Text , UnText = next(Arry_Word.AllWords[math.random(#Arry_Word.AllWords)])
redis:set(boss..':Set_Arg:'..msg.chat_id,Text)
return 'اســرع واحد يرتب » {* '..UnText..' *} «' 
end

if MsgText[1] == 'معاني' then
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديج','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set(boss..':Set_Name_Meant:'..msg.chat_id,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
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
return '◀️¦ اول من يكتب معنى السمايل يفوز { '..name..' }'
end
if MsgText[1] == 'عكس' or MsgText[1] == 'العكس' or MsgText[1] == 'العكسس' then   
redis:set(boss.."GAME:S"..msg.chat_id,true) 
H1 = [[
✖️¦عكس كلمه » {مافهمت} ⚜️
]]
H2 = [[
✖️¦عكس كلمه » {جبان} ⚜️
]]
H3 =[[
✖️¦عكس كلمه » {ميت} ⚜️
]]
H4 =[[
✖️¦عكس كلمه » {كسول} ⚜️
]]
H5 =[[
✖️¦عكس كلمه » {زين} ⚜️
]]
H6 =[[
✖️¦عكس كلمه » {عطشان} ⚜️
]]

H7 =[[
✖️¦عكس كلمه » {بارده} ⚜️
]]
H8 =[[
✖️¦عكس كلمه » {خايف} ⚜️
]]
H9 =[[
✖️¦عكس كلمه » {امام} ⚜️
]]
H11 =[[
✖️¦عكس كلمه » {خاين} ⚜️
]]
H12 =[[
✖️¦عكس كلمه » {طويل} ⚜️
]]
H13 =[[
✖️¦عكس كلمه » {صلب} ⚜️
]]
H14 =[[
✖️¦عكس كلمه » {ناعم} ⚜️
]]
H15 =[[
✖️¦عكس كلمه » {مجنون} ⚜️
]]
H16 =[[
✖️¦عكس كلمه » {غبي} ⚜️
]]
H17 =[[
✖️¦عكس كلمه » {ظلمه} ⚜️
]]
H18 =[[
✖️¦عكس كلمه » {مسموح} ⚜️
]]
H19 =[[
✖️¦عكس كلمه » {ماسمعك} ⚜️
]]

H20 =[[
✖️¦عكس كلمه » {تعال} ⚜️
]]
HUSSEIN = {H16,H17,H18,H19,H20,H1,H2,H3,H4,H5,H6,H7,H8,H9,H11,H12,H13,H14,H15}
local SENDTEXT = HUSSEIN[math.random(#HUSSEIN)]
if SENDTEXT:find('فهمت') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'فهمت') 
elseif SENDTEXT:find('مو جبان') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مو جبان') 
elseif SENDTEXT:find('عدل') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'عدل') 
elseif SENDTEXT:find('نشط') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'نشط') 
elseif SENDTEXT:find('مو زين') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مو زين') 
elseif SENDTEXT:find('مو عطشان') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مو عطشان') 
elseif SENDTEXT:find('حاره') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'حاره') 
elseif SENDTEXT:find('مو خايف') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مو خايف') 
elseif SENDTEXT:find('خلف') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'خلف') 
elseif SENDTEXT:find('وفي') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'وفي') 
elseif SENDTEXT:find('قزم') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'قزم') 
elseif SENDTEXT:find('لين') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'لين') 
elseif SENDTEXT:find('خشن') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'خشن') 
elseif SENDTEXT:find('عاقل') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'عاقل') 
elseif SENDTEXT:find('ذكي') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'ذكي') 
elseif SENDTEXT:find('مو ظلمه') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مو ظلمه') 
elseif SENDTEXT:find('مو مسموح') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'مو مسموح') 
elseif SENDTEXT:find('اسمعك') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'اسمعك') 
elseif SENDTEXT:find('روح') then
redis:set(boss.."GAME:CHER"..msg.chat_id,'روح') 
end
sendMsg(msg.chat_id,msg.id,SENDTEXT)     
return false  
end
if MsgText[1] == 'نقاطي' then 
local points = redis:get(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id)
if points and points ~= "0" then
return '*📮¦ عدد النقاط التي ربحتها هي » { '..points..' }\n📬¦ تسطيع بيع نقاطك ولحصول على (100) رساله مقابل كل نقطه من النقاط *\n'
else
return ' *💬¦ ليس لديك نقاط ،\n📬¦ للحصول ؏ النقاط ،\n📮¦ ارسل الالعاب وابدأ اللعب ! *'
end
end
if MsgText[1] == 'بيع نقاطي' then
if MsgText[2] == "0" then
return '📛¦ هناك خطأ عزيزي  \n🔖¦ يجب ان يكون البيع ع الاقل 1 من النقاط . 'end
local points = redis:get(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id)
if tonumber(MsgText[2]) > tonumber(points) then
return '📛| عذرا ليس لديك النقاط بهذا العدد لبيعهن' 
end
if points == "0" then
return '📛 ¦ للاسف ليس لديك النقاط \n🔖 ¦ للحصول على النقاط العب احد الالعاب الموجوده في `قائمه الالعاب`'
else
local Total_Point = MsgText[2] * 100
redis:decrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,MsgText[2])  
redis:incrby(boss..'msgs:'..msg.sender_id.user_id..':'..msg.chat_id,Total_Point)  
return "💰¦ تم خصم {* "..MsgText[2].." *} من نقاطك\n📮| تم زياده {* "..Total_Point.."* } من الرسائل \n📑| اصبحت رسائلك { *"..redis:get(boss..'msgs:'..msg.sender_id.user_id..':'..msg.chat_id).."* } رساله\n🔖"
end
end
if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
return [[ 
🔐┇قائمه الالعاب 
🔓┇للتفعيل = تفعيل الالعاب
🔒┇للتعطيل = تعطيل الالعاب
><><><><><><><
📪┇لعبة البات = بات
📪┇لعبة التخمين = خمن
📪┇لعبه الاسرع = الاسرع
📪┇لعبة السمايلات = سمايلات
📪┇لعبة المختلف = المختلف
📪┇لعبة الامثله = امثله
📪┇لعبة العكس = العكس 
📪┇لعبة الحزوره = حزوره
📪┇لعبة المعاني = معاني
📪┇لعبه الترتيب = ترتيب
📪┇اسئله عامه = اسئله

><><><><><><><
🔰┇نقاطي » لعرض عدد الارباح
🔰┇بيع نقاطي + العدد » لستبدال كل مجوهره ب 100 رساله
]]
end
if MsgText[1] == 'روليت' then
redis:del(boss..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
redis:del(boss..':List_Rolet:'..msg.chat_id)  
redis:setex(boss..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id,3600,true)  
return '*🎪¦* حسننا لنلعب , ارسل عدد اللاعبين للروليت .'
end
if MsgText[1] == 'نعم' and redis:get(boss..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id) then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id) 
if #list == 1 then 
return "📛| لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "📛| عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(boss..':User_Points:'..msg.chat_id..data.id_,5)
end,nil)
redis:del(boss..':List_Rolet:'..msg.chat_id) 
redis:del(boss..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id)
return '📑¦ تم اختيار الشخص الاتي\n🌟¦ صاحب الحظ {['..UserName..']}\n💰¦ ربحت معنا 5 نقاط' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id) 
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
sendMsg(msg.chat_id,msg.id,[[
🤡¦•⊱ الالعاب لبوت []]..redis:get(boss..':NameBot:')..[[]  ، ! 🎖
⚙️¦•⊱ لتفعيل الالعاب او تعطيلها ارسل،  ! 
🎖¦•⊱ تفعـيل ⊰• تعطيل •⊱ الالعاب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
🤹🏻‍♂️¦•⊱ † الاسرع † اسـرع واحد 
🎰¦•⊱ † معاني † معاني السمايلات
🎨¦•⊱† ترتيب †  ترتيب الكلمات 
🎭¦•⊱ † روليت † لعبة الروليت الشهيره 
🎙¦•⊱ † الاسئله † اسئله عامه 
💠¦•⊱† امثله † لعبه امثله قديمه 
🧮¦•⊱ † حزوره † لعبة الحزازير 
🛎¦•⊱ † المختلف † تشابه واختلاف 
🦠¦•⊱ † محيبس † لعبة المحيبس الشهيره
🌋¦•⊱ † تخمين † لعبة تخمين الكلمات  
♻️¦•⊱ †  العكس † لعبة عكس الكلمات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
💬 ¦•⊱ للمزيد من المعلومات ، ء ! 
🎭┊مـعـرف الـمـطـور  : ]]..SUDO_USER..[[
]])
end
end
end
end
local function procces(msg)
if msg.text and not redis:get(boss..'lock_geams'..msg.chat_id) then
if msg.text == redis:get(boss..':Set_alii:'..msg.chat_id) then -- // المختلف
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_alii:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎁  احسنت اجابتك صحيحه   \n*   \n')
end

if msg.text == redis:get(boss..':Set_Amthlh:'..msg.chat_id) then -- // امثله
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_Amthlh:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎁  احسنت اجابتك صحيحه   \n*   \n')
end

if msg.text == redis:get(boss..':Set_Hzorh:'..msg.chat_id) then -- // حزوره
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_Hzorh:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎁  احسنت اجابتك صحيحه   \n*   \n')
end


if msg.text == redis:get(boss..':Set_Smile:'..msg.chat_id) then --//  الاسرع
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_Smile:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎊   احسنت اجابتك صحيحه \n*   \n')
end 
if msg.text == redis:get(boss..':Set_alii:'..msg.chat_id) then -- // المختلف
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_alii:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎁  احسنت اجابتك صحيحه   \n*   \n')
end 
if msg.text == redis:get(boss..':Set_Hzorh:'..msg.chat_id) then -- // حزوره
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_Hzorh:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎁  احسنت اجابتك صحيحه   \n*   \n')
end 
if msg.text == redis:get(boss..':Set_Arg:'..msg.chat_id) then -- // الترتيب
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_Arg:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*  🎁  احسنت اجابتك صحيحه   \n*   \n')
end 
if msg.text == redis:get(boss..':Set_Name_Meant:'..msg.chat_id) then --// المعاني
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss..':Set_Name_Meant:'..msg.chat_id)
return sendMsg(msg.chat_id,msg.id,'*   🎉     احسنت اجابتك صحيحه \n*   \n')
end 
if msg.text:match("^(%d+)$") and redis:get(boss..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*📮¦* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(boss..":Number_Add:"..msg.chat_id..msg.sender_id.user_id,msg.text)  
Text = '💬¦ تم بدء تسجيل اللسته \n💱¦ يرجى ارسال المعرفات \n🎊¦ الفائز يحصل على (5) مجوهره\n🎯¦ عدد الاعبين المطلوبه { *'..msg.text..'* } لاعب \n 🏹'
end
redis:del(boss..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id)  
return sendMsg(msg.chat_id,msg.id,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and redis:get(boss..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) then    --// استقبال الاسماء
if redis:sismember(boss..':List_Rolet:'..msg.chat_id,msg.text) then
return sendMsg(msg.chat_id,msg.id,'*📮¦* المعرف {['..msg.text..']} موجود اساسا' )
end
redis:sadd(boss..':List_Rolet:'..msg.chat_id,msg.text)
local CountAdd = redis:get(boss..":Number_Add:"..msg.chat_id..msg.sender_id.user_id)
local CountAll = redis:scard(boss..':List_Rolet:'..msg.chat_id)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(boss..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
redis:setex(boss..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id,1400,true)  
return sendMsg(msg.chat_id,msg.id,"*📮¦* تم ادخال المعرف { ["..msg.text.."] } \n🔖*¦* وتم اكتمال العدد الكلي \n📛¦ هل انت مستعد ؟ اجب بـ {* نعم *}")
end 
return sendMsg(msg.chat_id,msg.id,"*📮¦* تم ادخال المعرف { ["..msg.text.."] } \n🔖| تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n📑| ارسل المعرف التالي ")
end

if redis:get(boss.."SETEX:MSG"..msg.chat_id..""..msg.sender_id.user_id) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 50000 then
sendMsg(msg.chat_id,msg.id,"*📬¦ لا تستطيع اضافة اكثر من 50000 رساله\n*")   
redis:del(boss.."SETEX:MSG"..msg.chat_id..""..msg.sender_id.user_id)  
return false  end 
local GET_IDUSER = redis:get(boss..'SET:ID:USER'..msg.chat_id)  
sendMsg(msg.chat_id,msg.id,"\n📬*¦ روح خالي 😉 تم اضافة له { "..msg.text.." }* رساله")
redis:incrby(boss..'msgs:'..GET_IDUSER..':'..msg.chat_id,msg.text)  
end
redis:del(boss.."SETEX:MSG"..msg.chat_id..""..msg.sender_id.user_id)  
end
if redis:get(boss.."SETEX:NUM"..msg.chat_id..""..msg.sender_id.user_id) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 1000 then
sendMsg(msg.chat_id,msg.id,"*📬¦ لا تستطيع اضافة اكثر من 1000 نقطه\n*")   
redis:del(boss.."SETEX:NUM"..msg.chat_id..""..msg.sender_id.user_id)  
return false  end 
local GET_IDUSER = redis:get(boss..'SET:ID:USER:NUM'..msg.chat_id)  
sendMsg(msg.chat_id,msg.id,"\n📬*¦ طكو طكو عمي 😻 تم اضافة له { "..msg.text.." }* نقطه")
redis:incrby(boss..':User_Points:'..msg.chat_id..GET_IDUSER,msg.text)  
end
redis:del(boss.."SETEX:NUM"..msg.chat_id..""..msg.sender_id.user_id)  
end
if redis:get(boss.."SET:GAME" .. msg.chat_id .. "" .. msg.sender_id.user_id) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 6 then
sendMsg(msg.chat_id,msg.id,"*📬¦ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*\n")   
return false  end 
local GETNUM = redis:get(boss.."GAMES"..msg.chat_id)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(boss.."SET:GAME" .. msg.chat_id .. "" .. msg.sender_id.user_id)   
sendMsg(msg.chat_id,msg.id,'*📮¦ مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n🎊¦ لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل *')   
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del(boss.."SET:GAME" .. msg.chat_id .. "" .. msg.sender_id.user_id)   
sendMsg(msg.chat_id,msg.id,'\n*📮¦ للاسف لقد خسرت \n📬¦ المحيبس بل ايد رقم { '..GETNUM..' }\n💥¦ حاول مره اخرى للعثور على المحيبس *')   
end
end
end
if (msg.text == redis:get(boss.."GAME:CHER"..msg.chat_id)) and redis:get(boss.."GAME:S"..msg.chat_id) then  
sendMsg(msg.chat_id,msg.id,'📮¦ اجابتك صحيحه ذكي وربي 😙')     
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss.."GAME:S"..msg.chat_id)
redis:del(boss.."GAME:CHER"..msg.chat_id)
elseif msg.text == 'الفيل' or msg.text == 'الثور' or msg.text == 'الحصان' or msg.text == '7' or msg.text == '9' or msg.text == '8' or msg.text == 'لوين' or msg.text == 'موسكو' or msg.text == 'مانكو' or msg.text == '20' or msg.text == '30' or msg.text == '28' or msg.text == 'ترامب' or msg.text == 'اوباما' or msg.text == 'كيم جونغ' or msg.text == '50' or msg.text == '70' or msg.text == '40' or msg.text == '7' or msg.text == '3' or msg.text == '10' or msg.text == '4' or msg.text == 'الاذن' or msg.text == 'الثلاجه' or msg.text == 'الغرفه' or msg.text == '15' or msg.text == '17' or msg.text == '25' or msg.text == 'الفرات' or msg.text == 'نهر الكونغو' or msg.text == 'المسيبي' or msg.text == 'بيا بايج' or msg.text == 'لاري بيج' or msg.text == 'بيا مارك زوكيربرج' or msg.text == 'الفيل' or msg.text == 'النمر' or msg.text == 'الفهد' or msg.text == 'بانكول' or msg.text == 'نيو دلهي' or msg.text == 'بيكن' or msg.text == 'الهاتف' or msg.text == 'التلفاز' or msg.text == 'المذياع' or msg.text == 'لفرسول' or msg.text == 'تركيا' or msg.text == 'بغداد' or msg.text == 'النحاس' or msg.text == 'الحديد' or msg.text == 'الفضه' or msg.text == 'امريكا الشماليه' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'القرش' or msg.text == 'الثعلب' or msg.text == 'الكلب' or msg.text == 'للجرو' or msg.text == 'العجل' or msg.text == 'الحمار' or msg.text == '3' or msg.text == '5' or msg.text == '6' or msg.text == 'اوربا' or msg.text == 'افريقيا' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'امريكا الشماليه' or msg.text == 'اوربا' or msg.text == 'الصاروخ' or msg.text == 'المسدس' or msg.text == 'الطائرات' or msg.text == 'سيدات' or msg.text == 'قوانص' or msg.text == 'عوانس' or msg.text == 'المكارم' or msg.text == 'المبائم' or msg.text == 'المعازم' or msg.text == 'حرف الغاء' or msg.text == 'حرف الواو' or msg.text == 'حرف النون' or msg.text == 'نحاس' or msg.text == 'الماس' or msg.text == 'حديد' or msg.text == 'العمر' or msg.text == 'ساعه' or msg.text == 'الحذاء' or msg.text == 'بئر' or msg.text == 'نهر' or msg.text == 'شلال' or msg.text == 'ادم' or msg.text == 'نوح' or msg.text == 'عيسئ' or msg.text == 'الاضافر' or msg.text == 'الاسنان' or msg.text == 'الدموع' or msg.text == 'الاخلاق' or msg.text == 'الضل' or msg.text == 'حرف النون'  then
if redis:get(boss.."GAME:S"..msg.chat_id) then  
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id,msg.id,'📮¦ اجابتك غلطططط ')     
redis:del(boss.."GAME:S"..msg.chat_id)
redis:del(boss.."GAME:CHER"..msg.chat_id)
return false  
end
end
end
end
if (msg.text == redis:get(boss.."GAME:CHER"..msg.chat_id)) and redis:get(boss.."GAME:S"..msg.chat_id) then  
sendMsg(msg.chat_id,msg.id,'📮¦ اجابتك صحيحه ذكي وربي 😙')     
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss.."GAME:S"..msg.chat_id)
redis:del(boss.."GAME:CHER"..msg.chat_id)
elseif msg.text == 'فهمت' or msg.text == 'مو جبان' or msg.text == 'عدل' or msg.text == 'نشط' or msg.text == 'مو زين' or msg.text == 'مو عطشان' or msg.text == 'حاره' or msg.text == 'مو خايف' or msg.text == 'خلف' or msg.text == 'وفي' or msg.text == 'القزم' or msg.text == 'لين' or msg.text == 'خشن' or msg.text == 'عاقل' or msg.text == 'ذكي' or msg.text == 'مو ظلمه' or msg.text == 'مو مسموح' or msg.text == 'اسمعك' or msg.text == 'روح' then
if redis:get(boss.."GAME:S"..msg.chat_id) then  
local list = {'فهمت' , 'مو جبان' , ' مو عطشان' , 'عدل' , 'نشط' , 'مو زين' , ' خاره ' , 'خلف' , 'مو خايف' , 'لين' , 'القزم' , 'وفي' , 'عاقل' , 'خشن' , 'ذكي' , 'اسمعك' , 'مو مسموح' , 'مو ظلمه'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id,msg.id,'📮¦ اجابتك صحيحه ذكي وربي 😙')     
redis:incrby(boss..':User_Points:'..msg.chat_id..msg.sender_id.user_id,1)  
redis:del(boss.."GAME:S"..msg.chat_id)
redis:del(boss.."GAME:CHER"..msg.chat_id)
return false  
end
end
end
end
if redis:get(boss.."GAME:TKMEN" .. msg.chat_id .. "" .. msg.sender_id.user_id) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 20 then
sendMsg(msg.chat_id,msg.id,"*📬¦ عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *\n")
return false  end 
local GETNUM = redis:get(boss.."GAMES:NUM"..msg.chat_id)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(boss..'SADD:NUM'..msg.chat_id..msg.sender_id.user_id)
redis:del(boss.."GAME:TKMEN" .. msg.chat_id .. "" .. msg.sender_id.user_id)   
redis:incrby(boss..':User_Points:'..msg.chat_id..data.id_,5)
sendMsg(msg.chat_id,msg.id,'*🔖¦ مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸¦ تم اضافة { 5 } من النقاط *\n')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:incrby(boss..'SADD:NUM'..msg.chat_id..msg.sender_id.user_id,1)
if tonumber(redis:get(boss..'SADD:NUM'..msg.chat_id..msg.sender_id.user_id)) >= 3 then
redis:del(boss..'SADD:NUM'..msg.chat_id..msg.sender_id.user_id)
redis:del(boss.."GAME:TKMEN" .. msg.chat_id .. "" .. msg.sender_id.user_id)   
sendMsg(msg.chat_id,msg.id,'\n*📮¦ اوبس لقد خسرت في اللعبه \n📬¦ حظآ اوفر في المره القادمه \n🔰¦ كان الرقم الذي تم تخمينه { '..GETNUM..' }\n*')
else
sendMsg(msg.chat_id,msg.id,'\n*📛¦ اوبس تخمينك غلط \n📌¦ ارسل رقم تخمنه مره اخره \n*')
end
end
end
end
end



end
return {
Boss = {
"^(حزوره)$", 
"^(المختلف)$",
"^(امثله)$",
"^(نعم)$",
"^(الاعبين)$",
"^(بدء الاسئله)$",
"^(ختيارات)$",
"^(اسئله)$",
"^(الالعاب)$",
"^(محيبس)$",
"^(تخمين)$",
"^(خمن)$",
"^(بات)$",
'^(تعطيل الالعاب)$',
'^(تعطيل اللعبه)$',
'^(تعطيل اللعبة)$',
'^(تفعيل الالعاب)$',
'^(تفعيل اللعبه)$',
'^(تفعيل اللعبة)$',
"^(اسرع)$",
"^(الاسرع)$",
"^(نقاطي)$",
"^(ترتيب)$",
"^(معاني)$",
"^(عكس)$",
"^(العكس)$", 
"^(العكسس)$", 
"^(بيع نقاطي) (%d+)$",
"^(اضف رسائل) (%d+)$",
"^(اضف نقاط) (%d+)$",
"^(روليت)$",
"^(اسئله)$",
"^(قائمه الالعاب)$",
},
iBoss = games,
dBoss = procces,
}
