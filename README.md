# ECSInterfacePlugin.jl

An interface for any ECS implementation should overload to make it easier to use with Cruise.jl

## API

### Types

```
AbstractECS, AbstractEntity, AbstractQuery
```

### component functions
```
export add_component!, remove_component!, has_component, get_component, set_component!
export get_components
```

### entity functions
```
export new_entity!, new_entities!, remove_entity!, remove_entities!
export is_alive, is_zero, get_entities, entity_count
```

### resource functions
```
export has_resource, get_resource, add_resource!, set_resource!, remove_resource!
```

### query functions
```
export query
```

### system functions
```
export reset!, register_system!, unregister_system!, run_systems!, get_systems
```

### batch operations
```
export add_components!, remove_components!, exchange_components!
```

### event/hook functions
```
export on_entity_created!, on_entity_destroyed!, on_component_added!, on_component_removed!
```