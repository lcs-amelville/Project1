//
//  GameScene.swift
//  DiveIntoSpriteKit
//
//  Created by Paul Hudson on 16/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import SpriteKit



@objcMembers
class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "player-submarine.png")
    var touchingPlayer = false
    var gameTimer = Timer?
    
    override func didMove(to view: SKView) {
        // this method is called when your game scene is ready to run
        let background = SKSpriteNode(imageNamed: "water.jpg")
        background.zPosition = -1
        addChild(background)
        
        if let particles = SKEmitterNode(fileNamed: "Bubbles") {
            particles.position.x = 512
            particles.advanceSimulationTime(10)
            addChild(particles)
        }
        player.position.x = -400
        player.zPosition = 1
        addChild(player)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user touches the screen
        //1.
        guard let touch = touches.first else { return }
        //2.
        let location = touch.location (in: self)
        //3.
        let tappedNodes = nodes(at: location)
        //4.
        if tappedNodes.contains(player){
            touchingPlayer = true
        }
    }
    // TouchesMoved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touchingPlayer else { return }
        
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        player.position = location
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user stops touching the screen
        touchingPlayer = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        // this method is called before each frame is rendered
    }
}

func createEnemy () {
    //Code Goes Here
    let sprite = SKSpriteNode (imageNamed: "fish")
    sprite.position = CGPoint (x: 1200, y:Int.random(in: -350...350))
    sprite.name = "enemy"
    sprite.zPosition = 1
    addChild(sprite)
}
