//
//  Component.swift
//  Pega da Cuca
//
//  Created by Theo Necyk Agner Caldas on 14/09/21.
//

import SpriteKit

/// Base class for all components in the game. Adds behavior/logic to entities, when subclassed.
class Component: SKScene{
    
    //MARK: - Properties
    /// Single entity attached to this component.
    var _entity: Entity?
    
    override var isPaused: Bool{
        get{
            if let gameScene = _entity?.getGameScene(){
                return gameScene.isPaused
            }
            return true
        }
        set{}
    }
        
    //MARK: - Public Methods
    /// Called when added to an entity.
    public func onAdded(){
        //Implement by subclassing.
    }
    
    /// Called when removed from its entity.
    public func onRemoved(){
        //Implement by subclassing.
    }
    
    //MARK: - Methods Override
    override func copy(with zone: NSZone? = nil) -> Any {
        return Component()
    }
    
    //MARK: - Helper Methods
    /// Gets view of the scene of the entity attached to this component.
    /// - Returns: View.
    public func getView() -> SKView? {
        return _entity?.scene?.view
    }
    
    /// Gets the system of the game scene of the entity of this component.
    /// - Returns: System, if possible
    public func getSystem() -> System?{
        return _entity?.getGameScene()?.system
    }
}
