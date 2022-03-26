//
//  System.swift
//  Pega da Cuca
//
//  Created by Theo Necyk Agner Caldas on 14/09/21.
//

import SpriteKit

/// Base class for all systems in the game. Manages entities (with their respective components).
class System{
    //MARK: - Properties
    /// All entities attached to this system.
    private var entities = Set<Entity>()
    //TO DO: Transform to hash table.
    /// All events attached to this system.
    private var events = [Event]()
    /// This system's scene.
    weak var scene: GameScene?
    
    //MARK: - Initializers
    init(scene: GameScene) {
        self.scene = scene
        setupEntities()
        setupEvents()
    }
    
    //MARK: - Public Methods
    /// Adds a non-identified (not named) entity to this system.
    /// - Parameter entity: Entity object. Shouldn't be with its components already set. 
    public func addEntity(_ entity: Entity) {
        entities.insert(entity)
        scene?.addChild(entity)
    }
    
    /// Adds an identified (named) entity to this system.
    /// Acess this entity with getEntity(named name: String) method.
    /// - Parameter entity: Entity object. Shouldn't be with its components already set.
    /// - Parameter name: Entity name (must not be the same as any other in the system).
    public func addEntity(_ entity: Entity, as name: String) {
        entity.name = name
        addEntity(entity)
    }
    
    /// Gets entity with specified name.
    /// - Parameter name: Name of the entity.
    /// - Returns: Entity, if system has so.
    public func getEntity(named name: String) -> Entity? {
        return scene?.childNode(withName: name) as? Entity
    }
    
    /// Returns if this system has a specified entity.
    public func hasEntity(_ entity: Entity) -> Bool{
        return entities.contains(entity)
    }
    
    /// Removes an entity from ths system.
    /// - Parameter entity: Entity object.
    public func removeEntity(_ entity: Entity) {
        entity.removeFromParent()
        entity.removeAllComponents()
        entities.remove(entity)
    }
    
    /// Removes the entity specified by a name from this system.
    /// - Parameter name: Entity name.
    public func removeEntity(named name: String){
        if let entity = getEntity(named: name){
            removeEntity(entity)
        }
    }
    
    /// Removes all entities from this system.
    public func removeAllEntities(){
        for entity in entities{
            removeEntity(entity)
        }
    }
    
    /// Gets all components from all entities.
    /// - Returns: All components in this system.
    public func getAllComponentsFromAllEntities() -> [Component]{
        var allComponents = [Component]()
        for entity in entities{
            allComponents += entity.getAllComponents()
        }
        return allComponents
    }
    
    /// Get all components of specified type.
    public func getAllComponentsOfType<T: Component>(_ wantedType: T.Type) -> [T]{
        var components = [T]()
        for entity in entities{
            if let component = entity.getComponent(of: T.self){
                components.append(component)
            }
        }
        return components
    }
    
    /// This method should be implemented, adding every entity with every component. Called on system init.
    public func setupEntities(){
        //Implement by subclassing.
    }
    
    //MARK: - Extension: Event Manager
    /// This method should be implemented, adding every event. Called on system init.
    public func setupEvents(){
        //Implement by subclassing.
    }
    
    /// Adds an event to this system, if it has a proper type (jf it is not of Event class, but rather some of its subclasses)
    /// and if the system has no event of the same type already.
    /// - Parameter event: Event object.
    public func addEvent(_ newEvent: Event) {
        let newEventType = type(of: newEvent)
        guard newEventType != Event.self else { return }
        for event in events{
            let eventType = type(of: event)
            if eventType == newEventType{
                return
            }
        }
        events.append(newEvent)
    }
    
    /// Gets event of a specified subclass.
    /// - Parameter wantedType: The Event subclass.
    /// - Returns: The unique object of the specified Event subclass, attached to this system (if it has so). Returns nil otherwise.
    public func getEvent<T: Event>(of wantedType: T.Type) -> T?{
        for event in events{
            let eventType = type(of: event)
            if eventType == wantedType{
                return event as? T
            }
        }
        return nil
    }
    
    public func getRandomEvent() -> Event?{
        return events.randomElement()
    }
    
    public func containsEvent<T: Event>(of wantedType: T.Type) -> Bool{
        for event in events{
            let eventType = type(of: event)
            if eventType == wantedType{
                return true
            }
        }
        return false
    }
    
    /// Gets events that are currently running.
    public func getRunningEvents() -> [Event]{
        return events.filter({$0.isRunning})
    }
}
