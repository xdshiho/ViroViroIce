
--[[

 __      ____      _______ ______            
 \ \    / /\ \    / /_   _|  ____|           
  \ \  / /  \ \  / /  | | | |__              
   \ \/ /    \ \/ /   | | |  __|             
    \  /      \  /   _| |_| |____            
     \/___ _   \/ __|_____|______|    _      
    / ____| |    / __ \|  _ \   /\   | |     
   | |  __| |   | |  | | |_) | /  \  | |     
   | | |_ | |   | |  | |  _ < / /\ \ | |     
   | |__| | |___| |__| | |_) / ____ \| |____ 
    \_____|______\____/|____/_/    \_\______|
                                             
    Mily_0                                         



  here you can uhmmmm well, change stuff that happens on the songs, not exactly on the menus or anything but... you get it.

]]

-- ===================================================
-- CONFIGURATION (CHANGE THIS TO YOUR LIKING!!)
-- ===================================================

local ScoreTxtOverIcons = true
-- Shiho finge q tem mais coisa pfv





--btw, if you don't know what you're doing, don't change anything below this. Only use the configuration up there.

-- ===================================================
-- CALLBACKS OR SMTH
-- ===================================================


function onCreatePost()
    pixelRender_createPost()
    miku_createPost()
    hud_createPost()
end

function onUpdate()
    miku_onUpdate()
    hud_onUpdate()
end

function onUpdatePost()
    hud_UpdatePost() -- acabei nem usando lol
end

function onGoodNoteHit(id, direction, noteType, isSustainNote)
    hud_BFNoteHit() -- supostamente para usar num bump de score na hud, porém eu sou muito ruim em tudo shiho me ajuda e faz isso por mim, acho q quebrei meu próprio codigo pq ironicamente foi mais facil fazer em haxe essa prr
end

function onSongStart()
    hud_SongStart()
end

-- ===================================================
-- WEEK 6 EFFECT (YOU CAN ADD YOUR OWN SONGS HERE!!)
-- ===================================================

function pixelRender_createPost()
    if pixelRender and stageUI == 'pixel' then
        setProperty("camGame.pixelPerfectRender", true)
    end
end

-- ===================================================
-- MIKU EASTER EGG
-- ===================================================

local mikutrue = false
local oldAssFreak = nil
local penis = nil
local mikudsidea = false

function miku_createPost()
    mikudsidea = allowMiku and stageUI == 'pixel'

    addCharacterToList('bf-miku', 'bf')
    makeLuaSprite('mikuon', 'game/playablemiku', 840, 0)
    setObjectCamera('mikuon', 'hud')
    addLuaSprite('mikuon', true)

    makeLuaSprite('mimimi','game/playablemiku BG', 0, 0)
	setGraphicSize('mimimi',1280,720)
	setObjectCamera('mimimi','camHud')
	updateHitbox('mimimi')
	addLuaSprite('mimimi', false);
	setProperty('mimimi.alpha', 0)

end

function miku_onUpdate(elapsed)

    if mikudsidea then
        return
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M') and stageUI ~= 'pixel' then
        
        if not mikutrue then
            oldAssFreak = getProperty('boyfriend.curCharacter')
            penis = getPropertyFromClass('openfl.Lib', 'application.window.title')
            triggerEvent('Change Character', 'bf', 'bf-miku')
            triggerEvent('Hey!', '', '')
            triggerEvent('Add Camera Zoom', '0.05', '0.1')
            setPropertyFromClass('openfl.Lib', 'application.window.title', 'Friday Night Funkin\': MikuMikuIce')
            doTweenAngle('jequitiousla', 'iconP1', 360, 1, 'elasticOut') -- 🔥
            mikutrue = true
            mikuLegal()
            playMikuRandom()
            roxo()
        else
            triggerEvent('Change Character', 'bf', oldAssFreak or 'bf')
            setPropertyFromClass('openfl.Lib', 'application.window.title', penis or 'Friday Night Funkin\': ViroViroIce')
            doTweenAngle('thumbs1up', 'iconP1', 0, 1, 'elasticOut') -- 🔥
            playSound('ouch', 1.3)
            mikutrue = false
        end
    end

end

local mikus = 0

function mikuLegal()
    mikus = mikus + 1
    local tag = 'oi' .. mikus

    makeLuaSprite(tag, 'game/playablemiku', 840, 0)
    setObjectCamera(tag, 'hud')
    addLuaSprite(tag, true)

    setProperty(tag .. '.alpha', 1)
    
    doTweenX(tag .. 'Tween', tag, -40, 0.7, 'circOut')
    doTweenAlpha(tag .. 'Alpha', tag, 0, 1.2, 'quadIn')
end

function roxo()
    setProperty('mimimi.alpha', 1)
    doTweenAlpha('mimimiAlpha', 'mimimi', 0, 1.2, 'quadIn')
end

function onTweenCompleted(tag)
    if string.find(tag, 'oi') and string.find(tag, 'Alpha') then
        local spr = string.gsub(tag, 'Alpha', '')
        removeLuaSprite(spr, true)
    end
end

function playMikuRandom()
    local random = getRandomInt(1, 5)
    playSound('miku_' .. random, 1)
end

-- ===================================================
-- HUD THING
-- ===================================================

function hud_createPost()
    setProperty('scoreTxt.visible', false)

    makeLuaText('aHud', '', 1280, 0, 0)
    setTextAlignment('aHud', 'center')
    screenCenter('aHud', 'x')
    setTextSize('aHud', 13)
    setTextFont('aHud', 'better-vcr.ttf')
    setObjectCamera('aHud', 'hud')
    setTextBorder('aHud', 1, '000000')
    addLuaText('aHud', true)
    updateHitbox('aHud')
    setProperty('aHud.antialiasing', true)

    if downscroll then setProperty('aHud.y', 100) else setProperty('aHud.y', 680) end
    if not ScoreTxtOverIcons then setObjectOrder('aHud', 0) end -- esqueci

    setProperty('timeTxt.visible', false)

    makeLuaText('aTempo', '', 1280, 0, 0)
    setTextAlignment('aTempo', 'center')
    screenCenter('aTempo', 'x')
    setTextSize('aTempo', 14)
    setTextFont('aTempo', 'better-vcr.ttf')
    setObjectCamera('aTempo', 'hud')
    setTextBorder('aTempo', 1, '000000')
    addLuaText('aTempo', true)
    updateHitbox('aTempo')
    setProperty('aTempo.alpha', 0)

    if downscroll then setProperty('aTempo.y', 685) else setProperty('aTempo.y', 28) end
end

function hud_SongStart()
    doTweenAlpha('aTempoAlpha', 'aTempo', 1, 1, 'quadOut') -- porra, fazer isso manualmente é foda
end

function remixesPorra(name)
    local remix = {
        ' erect',
        '-erect',
        '(erect)',
        ' nightmare',
        '-nightmare',
        '(nightmare)',
        '-twist'
    }

    local lowered = string.lower(name)

    for _, suffix in ipairs(remix) do
        if string.sub(lowered, -#suffix) == suffix then
            return string.sub(name, 1, #name - #suffix) -- brigada algum doc de lua q eu li por ai no google de 16 anos atrás, eu te amo
        end
    end

    return name
end

function hud_onUpdate()
    local score = getProperty('songScore')
    local misses = getProperty('songMisses')
    local acc = getProperty('ratingPercent') * 100
    local ratingFC = getProperty('ratingFC')

    local accText = string.format("%.2f%%", acc)

    runHaxeCode([[
        var txt = game.getLuaObject("aHud");
        
        var score = ]]..score..[[;
        var misses = ]]..misses..[[;
        var acc = "]]..accText..[[";
        var fc = "]]..ratingFC..[[";

        var tudo = "SCORE: " + score + " | MISSES: " + misses + " | ACC: " + acc + " (" + fc + ")";
        txt.text = tudo; //eu côdo muito slk https://images7.memedroid.com/images/UPLOADED993/6206ba9f1e4b9.jpeg

        txt.clearFormats();

        var bucetaazul = tudo.indexOf(acc);
        if (bucetaazul != -1)
            txt.addFormat(new flixel.text.FlxTextFormat(0xFF57FFFF), bucetaazul, bucetaazul + acc.length); // ISSO FUNCIONA???? //correção, sim

        var bucetadourada = tudo.indexOf(fc);
        if (bucetadourada != -1)
        {
            var color = 0xFFFFFFFF;
            if (fc == "SFC" || fc == "GFC" || fc == "NFC")
                color = 0xFFFFBA0D;

            txt.addFormat(new flixel.text.FlxTextFormat(color), bucetadourada, bucetadourada + fc.length);
        }
    ]]) -- oi eu roubei umas coisa de um hud de kade engine mt irado

    local nem = getPropertyFromClass('backend.ClientPrefs', 'data.timeBarType')

    if nem == 'Disabled' then
        setProperty('aTempo.visible', false)
    else
        setProperty('aTempo.visible', true)

        if nem == 'Time Elapsed' then
            local posisao = getSongPosition() / 1000
            local longuissao = getProperty('songLength') / 1000

            local function formatTime(t) -- eu sei q tem maneira melhor btw, eu só sou ainda nn habituada com o jeito q vcs jovens de hj em dia fazem, hmph https://i.pinimg.com/originals/c9/c9/ff/c9c9ff2eed3dff5c3b9f7c0c033704da.gif
                local min = math.floor(t / 60)
                local sec = math.floor(t % 60)
                return string.format("%d:%02d", min, sec)
            end

            local cur = formatTime(posisao)
            local max = formatTime(longuissao)

            setTextString('aTempo', cur .. ' / ' .. max)

        elseif nem == 'Song Name' then
            setTextString('aTempo', remixesPorra(songName))
        end
    end

end

-- ===================================================
-- HUD THING
-- ===================================================

