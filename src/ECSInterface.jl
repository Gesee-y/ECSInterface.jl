#######################################################################################################################
###################################################### ECS PLUGIN #####################################################
#######################################################################################################################

module ECSInterface

"""
Abstract base type for Entity Component System implementations.

All ECS implementations should subtype this abstract type to ensure
compatibility with the ECS interface.
"""
abstract type AbstractECS end

"""
Abstract base type for entities in an Entity Component System.

Entities are unique identifiers that serve as containers for components.
All entity implementations should subtype this abstract type.
"""
abstract type AbstractEntity end

"""
Abstract base type for Queries in an Entity Component System.

Queries are iterators of entites matching a certain request.
All queries implementation should subtype this abstract type.
"""
abstract type AbstractQuery end

# Export abstract types
export AbstractECS, AbstractEntity, AbstractSystem

# Export component functions
export add_component!, remove_component!, has_component, get_component, set_component!
export get_components

# Export entity functions
export new_entity!, new_entities!, remove_entity!, remove_entities!
export is_alive, is_zero, get_entities, entity_count

# Export resource functions
export has_resource, get_resource, add_resource!, set_resource!, remove_resource!

# Export query functions
export query

# Export system functions
export reset!, register_system!, unregister_system!, run_systems!, get_systems

# Export batch operations
export add_components!, remove_components!, exchange_components!

# Export event/hook functions
export on_entity_created!, on_entity_destroyed!, on_component_added!, on_component_removed!

################################################## COMPONENT FUNCTIONS #################################################

"""
    add_component!(ecs::AbstractECS, e::AbstractEntity, data...)

Add one or more components to an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to add components to
- `data...`: Component data to add (implementation-specific)

# Returns
Nothing by default. Implementations may return relevant data.
"""
add_component!(ecs::AbstractECS, e::AbstractEntity, data...) = nothing

"""
    has_component(ecs::AbstractECS, e::AbstractEntity, comp)

Check if an entity has a specific component.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to check
- `comp`: The component type or identifier to check for

# Returns
`true` if the entity has the component, `false` otherwise.
"""
has_component(ecs::AbstractECS, e::AbstractEntity, comp) = false

"""
    remove_component!(ecs::AbstractECS, e::AbstractEntity, data...)

Remove one or more components from an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to remove components from
- `data...`: Component identifiers to remove (implementation-specific)

# Returns
Nothing by default. Implementations may return relevant data.
"""
remove_component!(ecs::AbstractECS, e::AbstractEntity, data...) = nothing

"""
    get_component(ecs::AbstractECS, e::AbstractEntity, comp)

Retrieve a specific component from an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to query
- `comp`: The component type or identifier to retrieve

# Returns
The component data if it exists, or nothing/error (implementation-specific).
"""
get_component(ecs::AbstractECS, e::AbstractEntity, comp) = nothing

"""
    set_component!(ecs::AbstractECS, e::AbstractEntity, comp)

Set or update a component on an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to modify
- `comp`: The component data to set

# Returns
Nothing by default. Implementations may return relevant data.
"""
set_component!(ecs::AbstractECS, e::AbstractEntity, comp) = nothing

"""
    get_components(ecs::AbstractECS, e::AbstractEntity)

Get all components attached to an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to query

# Returns
Collection of all components on the entity (implementation-specific).
"""
get_components(ecs::AbstractECS, e::AbstractEntity) = nothing

################################################## ENTITY FUNCTIONS ####################################################

"""
    new_entity!(ecs::AbstractECS, data...)

Create a new entity in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `data...`: Optional initial component data for the entity

# Returns
The newly created entity (implementation-specific).
"""
new_entity!(ecs::AbstractECS, data...) = nothing

"""
    new_entities!(ecs::AbstractECS, n, data...)

Create multiple new entities in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `n`: Number of entities to create
- `data...`: Optional initial component data for the entities

# Returns
Collection of newly created entities (implementation-specific).
"""
new_entities!(ecs::AbstractECS, n, data...) = nothing

"""
    remove_entity!(ecs::AbstractECS, e::AbstractEntity)

Remove an entity and all its components from the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to remove

# Returns
Nothing by default. Implementations may return relevant data.
"""
remove_entity!(ecs::AbstractECS, e::AbstractEntity) = nothing

"""
    remove_entities!(ecs::AbstractECS, entities)

Remove multiple entities and all their components from the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `entities`: Collection of entities to remove

# Returns
Nothing by default. Implementations may return relevant data.
"""
remove_entities!(ecs::AbstractECS, entities) = nothing

"""
    get_entities(ecs::AbstractECS)

Get all active entities in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance

# Returns
Collection of all active entities (implementation-specific).
"""
get_entities(ecs::AbstractECS) = nothing

"""
    entity_count(ecs::AbstractECS)

Get the number of active entities in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance

# Returns
The number of active entities.
"""
entity_count(ecs::AbstractECS) = 0

"""
    is_alive(ecs::AbstractECS, e::AbstractEntity)

Check if an entity is still valid/alive in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to check

# Returns
`true` if the entity exists and is valid, `false` otherwise.
"""
is_alive(ecs::AbstractECS, e::AbstractEntity) = true

"""
    is_zero(ecs::AbstractECS, e::AbstractEntity)

Check if an entity represents a null/zero entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e::AbstractEntity`: The entity to check

# Returns
`true` if the entity is a null/zero entity, `false` otherwise.
"""
is_zero(ecs::AbstractECS, e::AbstractEntity) = true

################################################## RESOURCE FUNCTIONS ##################################################

"""
    has_resource(ecs::AbstractECS, r)

Check if a resource exists in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `r`: The resource type or identifier to check

# Returns
`true` if the resource exists, `false` otherwise (implementation-specific).
"""
has_resource(ecs::AbstractECS, r) = nothing

"""
    get_resource(ecs::AbstractECS, r)

Retrieve a resource from the ECS.

Resources are global data accessible throughout the ECS system.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `r`: The resource type or identifier to retrieve

# Returns
The resource data if it exists (implementation-specific).
"""
get_resource(ecs::AbstractECS, r) = nothing

"""
    add_resource!(ecs::AbstractECS, r)

Add a new resource to the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `r`: The resource data to add

# Returns
Nothing by default. Implementations may return relevant data.
"""
add_resource!(ecs::AbstractECS, r) = nothing

"""
    set_resource!(ecs::AbstractECS, r)

Set or update a resource in the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `r`: The resource data to set

# Returns
Nothing by default. Implementations may return relevant data.
"""
set_resource!(ecs::AbstractECS, r) = nothing

"""
    remove_resource!(ecs::AbstractECS, r)

Remove a resource from the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `r`: The resource type or identifier to remove

# Returns
Nothing by default. Implementations may return relevant data.
"""
remove_resource!(ecs::AbstractECS, r) = nothing

################################################## QUERY FUNCTIONS #####################################################

"""
    query(ecs::AbstractECS, comps...; with=(), without=(), exclusive=false)

Query entities that match specific component criteria.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `comps...`: Required components (positional arguments)
- `with`: Additional required components (keyword argument)
- `without`: Components that must not be present (keyword argument)
- `exclusive`: If true, only entities with exactly these components (keyword argument)

# Returns
Iterator or collection of matching entities (implementation-specific).

# Examples
```julia
# Find entities with Position and Velocity components
query(ecs, Position, Velocity)

# Find entities with Health but without Dead component
query(ecs, Health; without=(Dead,))
```
"""
query(ecs::AbstractECS, comps...; with=(), without=(), exclusive=false) = nothing

################################################## BATCH OPERATIONS ####################################################

"""
    add_components!(ecs::AbstractECS, entities, comp)

Add the same component to multiple entities.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `entities`: Collection of entities to modify
- `comp`: The component data to add to all entities

# Returns
Nothing by default. Implementations may return relevant data.
"""
add_components!(ecs::AbstractECS, entities, comp) = nothing

"""
    remove_components!(ecs::AbstractECS, entities, comp)

Remove the same component from multiple entities.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `entities`: Collection of entities to modify
- `comp`: The component type or identifier to remove from all entities

# Returns
Nothing by default. Implementations may return relevant data.
"""
remove_components!(ecs::AbstractECS, entities, comp) = nothing

"""
    exchange_components!(ecs::AbstractECS, e::AbstractEntity; add=(), remove=())

Add and remove the same component from an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `e`: The entity to modify
- `add`: The components to add
- `remove`: The components to remove

# Returns
Nothing by default. Implementations may return relevant data.
"""
exchange_components!(ecs::AbstractECS, e::AbstractEntity; add=(), remove=())

################################################## SYSTEM FUNCTIONS ####################################################

"""
    reset!(ecs::AbstractECS)

Reset the ECS to its initial state, removing all entities and resources.

# Arguments
- `ecs::AbstractECS`: The ECS instance to reset

# Returns
Nothing by default. Implementations may return relevant data.
"""
reset!(ecs::AbstractECS) = nothing

"""
    register_system!(ecs::AbstractECS, system)

Register a system to be executed by the ECS.

Systems contain logic that operates on entities matching specific component queries.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `system`: The system to register

# Returns
Nothing by default. Implementations may return relevant data.
"""
register_system!(ecs::AbstractECS, system) = nothing

"""
    unregister_system!(ecs::AbstractECS, system)

Unregister a system from the ECS.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `system`: The system to unregister

# Returns
Nothing by default. Implementations may return relevant data.
"""
unregister_system!(ecs::AbstractECS, system) = nothing

"""
    run_systems!(ecs::AbstractECS)

Execute all registered systems in order.

# Arguments
- `ecs::AbstractECS`: The ECS instance

# Returns
Nothing by default. Implementations may return relevant data.
"""
run_systems!(ecs::AbstractECS) = nothing

"""
    get_systems(ecs::AbstractECS)

Get all registered systems.

# Arguments
- `ecs::AbstractECS`: The ECS instance

# Returns
Collection of all registered systems (implementation-specific).
"""
get_systems(ecs::AbstractECS) = nothing

################################################## EVENT/HOOK FUNCTIONS ################################################

"""
    on_entity_created!(callback::Function, ecs::AbstractECS)

Register a callback to be called when an entity is created.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `callback::Function`: Function to call with signature `callback(ecs, entity)`

# Returns
Nothing by default. Implementations may return relevant data.
"""
on_entity_created!(callback::Function, ecs::AbstractECS) = nothing

"""
    on_entity_destroyed!(callback::Function, ecs::AbstractECS)

Register a callback to be called when an entity is destroyed.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `callback::Function`: Function to call with signature `callback(ecs, entity)`

# Returns
Nothing by default. Implementations may return relevant data.
"""
on_entity_destroyed!(callback::Function, ecs::AbstractECS) = nothing

"""
    on_component_added!(callback::Function, ecs::AbstractECS)

Register a callback to be called when a component is added to an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `callback::Function`: Function to call with signature `callback(ecs, entity, component)`

# Returns
Nothing by default. Implementations may return relevant data.
"""
on_component_added!(callback::Function, ecs::AbstractECS) = nothing

"""
    on_component_removed!(callback::Function, ecs::AbstractECS)

Register a callback to be called when a component is removed from an entity.

# Arguments
- `ecs::AbstractECS`: The ECS instance
- `callback::Function`: Function to call with signature `callback(ecs, entity, component_type)`

# Returns
Nothing by default. Implementations may return relevant data.
"""
on_component_removed!(callback::Function, ecs::AbstractECS) = nothing

end # module