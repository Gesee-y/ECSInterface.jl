#######################################################################################################################
###################################################### RECS PLUGIN ####################################################
#######################################################################################################################

module ECSInterface

"""

"""
abstract type AbstractECS end
abstract type AbstractEntity end

################################################## OTHER FUNCTIONS #####################################################

add_component!(ecs::AbstractECS, e::AbstractEntity, data...) = nothing
remove_component!(ecs::AbstractECS, e::AbstractEntity, data...) = nothing
new_entity!(ecs::AbstractECS, data...) = nothing
new_entities!(ecs::AbstractECS, n, data...) = nothing
remove_entity!(ecs::AbstractECS, e::AbstractEntity) = nothing
is_alive(ecs::AbstractECS, e::AbstractEntity) = true
is_zero(ecs::AbstractECS, e::AbstractEntity) = true
reset!(ecs::AbstractECS) = nothing
has_resource(ecs::AbstractECS) = nothing
get_resource(ecs::AbstractECS, r) = nothing
add_resource!(ecs::AbstractECS, r) = nothing
set_resource!(ecs::AbstractECS, r) = nothing
remove_resource!(ecs::AbstractECS, r) = nothing
query(ecs::AbstractECS, comps...; with=(), without=(), exclusive=false) = nothing
get_component(ecs::AbstractECS, e::AbstractEntity, comp) = nothing
set_component!(ecs::AbstractECS, e::AbstractEntity, comp) = nothing
