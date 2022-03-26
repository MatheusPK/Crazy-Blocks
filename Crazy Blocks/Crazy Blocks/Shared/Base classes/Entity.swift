//
//  Entity.swift
//  Pega da Cuca
//
//  Created by Theo Necyk Agner Caldas on 14/09/21.
//

import SpriteKit

/// Base class for all entities in the game. Manages components.
class Entity: SKSpriteNode{
    
    //MARK: - Properties
    //TO DO: Transform to hash table.
    /// All components attached to this entity.
    private var components = [Component]()
        
    //MARK: - Initializers
    init(size: CGSize, initialPosition: CGPoint, layer: GameLayer){
        super.init(texture: nil, color: .clear, size: size)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        zPosition = layer.rawValue
        position = initialPosition
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Methods
    /// Adds component to this entity, if it has a proper type (jf it is not of Component class, but rather some of its subclasses)
    /// and if the entity has no component of the same type already.
    /// - Parameter newComponent: Some component to be added to this entity.
    public func addComponent(_ newComponent: Component){
        let newComponentType = type(of: newComponent)
        if newComponentType == Component.self{
            //newComponent is just a Component (not a subclass)
            return
        }
        for component in components{
            let componentType = type(of: component)
            if componentType == newComponentType{
                //entity has already a component of newComponent type.
                return
            }
        }
        newComponent._entity = self
        newComponent.onAdded()
        components.append(newComponent)
    }
    
    /// Gets component of a specified subclass.
    /// - Parameter wantedType: The Component subclass.
    /// - Returns: The unique object of the specified Component subclass, attached to this entity (if it has so). Returns nil otherwise.
    public func getComponent<T: Component>(of wantedType: T.Type) -> T?{
        for component in components{
            let componentType = type(of: component)
            if componentType == wantedType{
                return component as? T
            }
        }
        return nil
    }
    
    /// Gets all components attached to this entity.
    /// - Returns: Components.
    public func getAllComponents() -> [Component]{
        return components
    }
    
    /// Removes component of specified subclass from this entity.
    /// - Parameter wantedType: The Component subclass.
    public func removeComponent<T: Component>(of wantedType: T.Type){
        let component = getComponent(of: wantedType)
        component?._entity = nil
        component?.onRemoved()
        components = components.filter(){type(of: $0) != wantedType}
    }
    
    /// Removes all components from this entity.
    public func removeAllComponents(){
        for component in components{
            component._entity = nil
            component.onRemoved()
        }
        components = []
    }
    
    //MARK: - Helper Methods
    /// Gets scene as a GameScene.
    /// - Returns: GameScene, if possible.
    public func getGameScene() -> GameScene?{
        return scene as? GameScene
    }
}

//MARK: - Extension: Physics Body Default Methods
extension Entity{
    func setPhysicsBody(){
        if physicsBody == nil{
            let radius = max(size.width, size.height) * 0.6
            physicsBody = SKPhysicsBody(circleOfRadius: radius)
        }
    }
    
    func setSquarePhysicsBody() {
        if physicsBody == nil{
            physicsBody = SKPhysicsBody(rectangleOf: size)
        }
    }
    
}
