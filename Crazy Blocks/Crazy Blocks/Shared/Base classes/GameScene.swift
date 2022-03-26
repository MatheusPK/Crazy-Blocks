//
//  GameScene.swift
//  Pega da Cuca
//
//  Created by Theo Necyk Agner Caldas on 14/09/21.
//

import SpriteKit

/// Base class for all game scenes in the game. Have a system, and call its components methods.
class GameScene: SKScene, SKPhysicsContactDelegate{
    //MARK: - Properties
    /// The system attached to this game scene.
    public var system: System?
    
    //MARK: - Methods Override
    override func sceneDidLoad() {
        // GameScene subclasses can implement didBegin(_ contact: SKPhysicsContact) method.
        physicsWorld.contactDelegate = self
        // Default collider around the scene boundaries. 
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard let system = self.system else { return }
        for component in system.getAllComponentsFromAllEntities(){
            component.update(currentTime)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let system = self.system else { return }
        for component in system.getAllComponentsFromAllEntities(){
            component.touchesBegan(touches, with: event)
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        guard let system = self.system else { return }
        for event in system.getRunningEvents(){
            event.didBeginCollision(contact)
        }
    }
}
