function onCreatePost()
    BFAlpha = 0.35
    DADAlpha = 0.35

    checkCharacter()
    checkSong()

    if showBF then
        bfimage = getProperty('boyfriend.imageFile')
        bfframe = getProperty('boyfriend.animation.frameName')
        bfx = getProperty('boyfriend.x')
        bfoffsetX = getProperty('boyfriend.offset.x')
        bfoffsetY = getProperty('boyfriend.offset.y')
        bfflipX = getProperty('boyfriend.flipX')

        -- bfPhantom2 - furthest back
        makeAnimatedLuaSprite('bfPhantom2', bfimage, bfx-5, 0)
        addLuaSprite('bfPhantom2', true)
        setObjectOrder('bfPhantom2', getObjectOrder('boyfriendGroup') - 2)
        setProperty('bfPhantom2.offset.x', bfoffsetX)
        setProperty('bfPhantom2.offset.y', bfoffsetY - 25)
        setProperty('bfPhantom2.scale.x', getProperty('boyfriend.scale.x'))
        setProperty('bfPhantom2.scale.y', getProperty('boyfriend.scale.y'))
        setProperty('bfPhantom2.alpha', 1)
        setProperty('bfPhantom2.flipX', bfflipX)
        setProperty('bfPhantom2.y', (getProperty('boyfriend.y') - 722.5) + getProperty('boyfriend.frameHeight') * getProperty('boyfriend.scale.y') * 2 - bfoffsetY * 2 + BFYFix)
        setBlendMode('bfPhantom2', 'lighten')

        -- bfPhantom - right behind BF
        makeAnimatedLuaSprite('bfPhantom', bfimage, bfx - 12.5, 0)
        addLuaSprite('bfPhantom', true)
        setObjectOrder('bfPhantom', getObjectOrder('boyfriendGroup') - 1)
        setProperty('bfPhantom.offset.x', bfoffsetX)
        setProperty('bfPhantom.offset.y', bfoffsetY - 25)
        setProperty('bfPhantom.scale.x', getProperty('boyfriend.scale.x'))
        setProperty('bfPhantom.scale.y', getProperty('boyfriend.scale.y'))
        setProperty('bfPhantom.alpha', 1)
        setProperty('bfPhantom.flipX', bfflipX)
        setProperty('bfPhantom.y', (getProperty('boyfriend.y') - 737.5) + getProperty('boyfriend.frameHeight') * getProperty('boyfriend.scale.y') * 2 - bfoffsetY * 2 + BFYFix)
        setBlendMode('bfPhantom', 'add')

        runHaxeCode([[
            FlxTween.tween(game.getLuaObject('bfPhantom').colorTransform, { redOffset: 17, greenOffset: 34, blueOffset: 115, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, 0.1);
            FlxTween.tween(game.getLuaObject('bfPhantom2').colorTransform, { redOffset: 75, greenOffset: 35, blueOffset: 35, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, 0.1);
        ]])

        bfphantomx = getProperty('bfPhantom.x')
        bfphantomy = getProperty('bfPhantom.y')
    end

    if showDAD then
        dadimage = getProperty('dad.imageFile')
        dadframe = getProperty('dad.animation.frameName')
        dadx = getProperty('dad.x')
        dadscaleX = getProperty('dad.scale.x')
        dadscaleY = getProperty('dad.scale.y')
        dadoffsetX = getProperty('dad.offset.x')
        dadoffsetY = getProperty('dad.offset.y')
        dadflipX = getProperty('dad.flipX')

        -- dadPhantom2 - furthest back
        makeAnimatedLuaSprite('dadPhantom2', dadimage, dadx - 22.5, 0)
        addLuaSprite('dadPhantom2', true)
        setObjectOrder('dadPhantom2', getObjectOrder('dadGroup') - 2)
        setProperty('dadPhantom2.offset.x', dadoffsetX)
        setProperty('dadPhantom2.offset.y', dadoffsetY)
        setProperty('dadPhantom2.scale.x', dadscaleX)
        setProperty('dadPhantom2.scale.y', dadscaleY)
        setProperty('dadPhantom2.alpha', 1)
        setProperty('dadPhantom2.flipX', dadflipX)
        setProperty('dadPhantom2.y', (getProperty('dad.y') - 712.5) + getProperty('dad.frameHeight') * dadscaleY * 2 - dadoffsetY * 2 + DADYFix)
        setBlendMode('dadPhantom2', 'lighten')

        -- dadPhantom - right behind Dad
        makeAnimatedLuaSprite('dadPhantom', dadimage, dadx - 25, 0)
        addLuaSprite('dadPhantom', true)
        setObjectOrder('dadPhantom', getObjectOrder('dadGroup') - 1)
        setProperty('dadPhantom.offset.x', dadoffsetX)
        setProperty('dadPhantom.offset.y', dadoffsetY)
        setProperty('dadPhantom.scale.x', dadscaleX)
        setProperty('dadPhantom.scale.y', dadscaleY)
        setProperty('dadPhantom.alpha', 1)
        setProperty('dadPhantom.flipX', dadflipX)
        setProperty('dadPhantom.y', (getProperty('dad.y') - 722.5) + getProperty('dad.frameHeight') * dadscaleY * 2 - dadoffsetY * 2 + DADYFix)
        setBlendMode('dadPhantom', 'add')

        runHaxeCode([[
            FlxTween.tween(game.getLuaObject('dadPhantom').colorTransform, { redOffset: 17, greenOffset: 34, blueOffset: 115, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, 0.1);
            FlxTween.tween(game.getLuaObject('dadPhantom2').colorTransform, { redOffset: 75, greenOffset: 35, blueOffset: 35, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, 0.1);
        ]])

        dadphantomx = getProperty('dadPhantom.x')
        dadphantomy = getProperty('dadPhantom.y')
    end
end



function onUpdate()


    bfframe = getProperty('boyfriend.animation.frameName')
    addAnimationByPrefix('bfPhantom','b',bfframe,1,true)
    objectPlayAnimation("bfPhantom","b",true)
    bfoffsetX = getProperty('boyfriend.offset.x')
    bfoffsetY = getProperty('boyfriend.offset.y')
    setProperty('bfPhantom.offset.x',bfoffsetX)
    setProperty('bfPhantom.offset.y',bfoffsetY-12.5)

    bfframe = getProperty('boyfriend.animation.frameName')
    addAnimationByPrefix('bfPhantom2','b2',bfframe,1,true)
    objectPlayAnimation("bfPhantom2","b2",true)
    bfoffsetX = getProperty('boyfriend.offset.x')
    bfoffsetY = getProperty('boyfriend.offset.y')
    setProperty('bfPhantom2.offset.x',bfoffsetX)
    setProperty('bfPhantom2.offset.y',bfoffsetY-32.5)

-----------------------------boyfriend playanim---------------

    dadframe = getProperty('dad.animation.frameName')
    addAnimationByPrefix('dadPhantom','d',dadframe,1,true)
    objectPlayAnimation("dadPhantom","d",true)
    dadoffsetX = getProperty('dad.offset.x')
    dadoffsetY = getProperty('dad.offset.y')
    setProperty('dadPhantom.offset.x',dadoffsetX)
    setProperty('dadPhantom.offset.y',dadoffsetY-12.5)

    dadframe = getProperty('dad.animation.frameName')
    addAnimationByPrefix('dadPhantom2','d2',dadframe,1,true)
    objectPlayAnimation("dadPhantom2","d2",true)
    dadoffsetX = getProperty('dad2.offset.x')
    dadoffsetY = getProperty('dad2.offset.y')
    setProperty('dadPhantom2.offset.x',dadoffsetX)
    setProperty('dadPhantom2.offset.y',dadoffsetY-12.5)

-----------------------------dad playanim---------------

end

function checkCharacter()
        BFYFix = 0    
      DADYFix = 0    
        GFYFix = 0    
    end

function checkSong()
        showBF = true
        showDAD = true  
    end

    function onUpdatePost()
        songPos = getSongPosition()
    doTweenY('phantomymove','bfPhantom',bfphantomy+6.25*math.sin((songPos/1500) * (bpm/15) *0.75),0.01)
    doTweenX('phantomxmove','bfPhantom',bfphantomx+12.5*math.sin((songPos/1500) * (bpm/30) *0.75),0.01)

    doTweenY('phantomymove2','bfPhantom2',bfphantomy-6.25*math.sin((songPos/1500) * (bpm/30) *0.75),0.01)
    doTweenX('phantomxmove2','bfPhantom2',bfphantomx-12.5*math.sin((songPos/1500) * (bpm/15) *0.75),0.01)

    doTweenY('dphantomymove','dadPhantom',dadphantomy+6.25*math.sin((songPos/1500) * (bpm/15) *0.75),0.01)
    doTweenX('dphantomxmove','dadPhantom',dadphantomx+12.5*math.sin((songPos/1500) * (bpm/30) *0.75),0.01)

    doTweenY('dphantomymove2','dadPhantom2',dadphantomy-6.25*math.sin((songPos/1500) * (bpm/30) *0.75),0.01)
    doTweenX('dphantomxmove2','dadPhantom2',dadphantomx-12.5*math.sin((songPos/1500) * (bpm/15) *0.75),0.01)
    end