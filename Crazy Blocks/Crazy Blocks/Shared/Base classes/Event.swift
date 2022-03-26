//
//  Event.swift
//  Pega da Cuca
//
//  Created by Theo Necyk Agner Caldas on 28/10/21.
//

import SpriteKit

/// Notifies changes to event.
protocol EventDelegate: AnyObject {
    func didStartEvent(named: String?, eventType: Event.Type)
    func didEndEvent(named: String?)
}

/// Base class for all events in the game. Temporarily modifies system components and entities, when subclassed.
class Event{
    public var eventName: String?
    private weak var eventDelegate: EventDelegate?
    private weak var scene: GameScene?
    public var isRunning = false
    
    /// Start event in a game scene. Overrides must call super.
    public func start(gameScene: GameScene? = nil, entity: Entity? = nil) {
        self.scene = gameScene
        if let scene = gameScene as? EventDelegate{
            eventDelegate = scene
        }
        eventDelegate?.didStartEvent(named: eventName, eventType: type(of: self))
        isRunning = true
    }
    
    /// End event in the game scene. Notifies delegate.
    public func end(){
        eventDelegate?.didEndEvent(named: eventName)
        isRunning = false
    }
    
    /// Outside classes should call this method, rather than calling *start()*. Certifies event runs once at a time.
    public func trigger(gameScene: GameScene? = nil, entity: Entity? = nil){
        guard !isRunning else { return }
        start(gameScene: gameScene, entity: entity)
    }
    
    /// Adds additional logic to game scene collision handler. Is only called if *isRunning*.
    public func didBeginCollision(_ contact: SKPhysicsContact) {
        //Implement by subclassing
    }
}
