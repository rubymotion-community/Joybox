class DemoBase < CCLayer 
  def onEnter
    super

    @sprite1 = CCSprite.spriteWithFile "grossinis_sister1.png"
    @sprite2 = CCSprite.spriteWithFile "grossini.png"
    @sprite3 = CCSprite.spriteWithFile "grossinis_sister2.png"

    self.addChild @sprite1, z:3
    self.addChild @sprite2, z:2
    self.addChild @sprite3, z:1

    size = CCDirector.sharedDirector.winSize

    @sprite1.position =  [size.width/4*1, size.height/2]
    @sprite2.position =  [size.width/4*2, size.height/2]
    @sprite3.position =  [size.width/4*3, size.height/2]

    label = CCLabelTTF.labelWithString self.title, fontName:"Arial", fontSize:32
    self.addChild label 
    label.position =  [size.width/2, size.height-50];

    label = CCLabelTTF.labelWithString self.subtitle, fontName:"Thonburi", fontSize:16
    self.addChild label, z:1
    label.position = [size.width/2, size.height-80];

    item1 = CCMenuItemImage.itemWithNormalImage "b1.png", selectedImage:"b2.png", target:self,  selector: 'backCallback:'
    item2 = CCMenuItemImage.itemWithNormalImage "r1.png", selectedImage:"r2.png", target:self,  selector: 'restartCallback:'
    item4 = CCMenuItemImage.itemWithNormalImage "f1.png", selectedImage:"f2.png", target:self,  selector: 'nextCallback:'
    item3 = CCMenuItemFont.itemWithString('Menu', target:self, selector: 'test:') 


    menu = CCMenu.menuWithArray [item1, item2, item3]
    menu.position = [0,0];
    item1.position = [ size.width/2 - item2.contentSize.width*2, item2.contentSize.height/2 ]
    item2.position = [ size.width/2, item2.contentSize.height/2 ]
    item3.position = [ size.width/2 + item2.contentSize.width*2, item2.contentSize.height/2 ]
    self.addChild menu, z:1
  end

   def test(sender)

    puts 'lol'
   end

  def backCallback( sender )
    scene = CCScene.node
    $scene_index  = $scene_index - 1
    if $scene_index < 0
      $scene_index = $tests.length - 1
    end
    layer = $tests[ $scene_index ].node
    scene.addChild layer

    CCDirector.sharedDirector.replaceScene scene
  end

  def restartCallback( sender )
    scene = CCScene.node
    layer = $tests[ $scene_index ].node
    scene.addChild layer

    CCDirector.sharedDirector.replaceScene scene
  end

  def nextCallback( sender )
    scene = CCScene.node
    $scene_index  = $scene_index + 1
    if $scene_index > $tests.length - 1
      $scene_index = 0
    end
    layer = $tests[ $scene_index ].node
    scene.addChild layer

    CCDirector.sharedDirector.replaceScene scene
  end

  def title
    "Title"
  end

  def subtitle
    "subtitle"
  end
end

class Test1 < DemoBase

  def onEnter
    super

    actionRotate = CCRotateBy.actionWithDuration 2, angle:360
    rotateReverse = actionRotate.reverse
    seq1 = CCSequence.actionsWithArray [actionRotate, rotateReverse]

    actionScale = CCScaleBy.actionWithDuration 2, scale: 4
    scaleReverse = actionScale.reverse
    seq2 = CCSequence.actionsWithArray [actionScale, scaleReverse]

    actionMove = CCMoveBy.actionWithDuration 2, position: [-200,0]
    moveReverse = actionMove.reverse
    seq3 = CCSequence.actionsWithArray [actionMove, moveReverse]

    #@sprite1.runAction CCRepeatForever.actionWithAction seq1 
    @sprite2.runAction CCRepeatForever.actionWithAction seq2 
    @sprite3.runAction CCRepeatForever.actionWithAction seq3


    #@sprite1.when_finished_callback { 
    #    test
    #}


    #checar con Nor Actionate no existe como palabra
    #Revisar lo del caller por que si esta cabron
    #@sprite1.actionate do
    
    
    #  sequence repeat_forever: true
      
      #rotate_by duration:2,
      #          angle:360,
      #          repeat_forever: true

      #skew_by   duration:2,
      #          angle: { x: 45, y: 45 },
      #          repeat_forever: true

    #  move_by  duration:2,
    #           position: { x:200, y: 0},
     #          repeat_forever: true

      #  test
    #end 

  end

  def test

    puts "me la mame"

  end

  def title
    "Basic actions"
  end

  def subtitle
    "Rotate, Scale and Translate actions"
  end
end

class Test2 < DemoBase

  def onEnter
    super

    actionSkew1 = CCSkewBy.actionWithDuration 2, skewX:37, skewY:-37
    seq1 = CCSequence.actionsWithArray [actionSkew1, actionSkew1.reverse]

    actionSkew2 = CCSkewBy.actionWithDuration 2, skewX:0, skewY:-90
    seq2 = CCSequence.actionsWithArray [actionSkew2, actionSkew2.reverse]

    actionSkew3 = CCSkewBy.actionWithDuration 2, skewX:45, skewY:45
    seq3 = CCSequence.actionsWithArray [actionSkew3, actionSkew3.reverse]

    @sprite1.runAction CCRepeatForever.actionWithAction seq1 
    @sprite2.runAction CCRepeatForever.actionWithAction seq2
    @sprite3.runAction CCRepeatForever.actionWithAction seq3
  end

  def title
    "Skew actions"
  end

  def subtitle
    "Testing skew actions"
  end
end

$scene_index = 0
$tests = [ Test1, Test2 ]

def first_scene
  scene = CCScene.node
  layer = $tests[ $scene_index ].node
  scene.addChild layer

  scene
end

