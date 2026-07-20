package src

import "core:c"
import "core:fmt"
import rl "vendor:raylib"

grid_objets: [dynamic; 1000]^GridObject

GridObject :: struct {
    id: int,
    behaviours: bit_set[Object_Behaviour],
    position: [2]f32,
    collider: rl.Rectangle,

    stats: StatsComponent,
}

Object_Behaviour :: enum {
    Stats,
    Move,
    Hitable,
    Selectable,
    Pickable,
}

Componnent :: union {
    StatsComponent,
}

//region Stat Component
StatsComponent :: struct {
    health: Stat,
    damage: Stat,
    range: Stat,
    movement: Stat,
}

Stat :: struct {
    current: i32,
    base: i32,
    modifiers: [dynamic]StatModifier,
}

StatModifier :: struct {
    type: Modifier,
    amount: i32,
}

Modifier :: enum {
    Add,
    Multiply,
    Set,
}

create_grid_object :: proc(behaviours: bit_set[Object_Behaviour], position: [2]f32) -> ^GridObject {
    obj : ^GridObject = new(GridObject)

    obj.position = position
    obj.behaviours = behaviours
    obj.collider = { position.x, position.y, ASSETS_SIZE, ASSETS_SIZE }


    append(&grid_objets, obj)

    return obj
}

add_modifier :: proc() {

}

remove_modifier :: proc() {

}

add_stat :: proc() {

}

multiply_stat :: proc() {

}
//endregion

//region Move Component
MovementComponent :: struct {
    current: int,
    move_to: int,
}
//endregion

EMPTY_GRID_OBJECT :: GridObject{}


add_component :: proc(object: ^GridObject, component: Componnent) {
    switch comp in component {
    case StatsComponent:
        object.behaviours += { .Stats }
        object.stats = comp
    case:
    // Optional: Catch-all fallback if an unhandled variant is passed
        fmt.println("Warning: Unhandled component type")
    }

}

move_object :: proc() {

}

select_object :: proc() {

}

unselect_object :: proc() {

}

draw_object :: proc(unit: GridObject) {
   rl.DrawCircle(c.int(unit.position.x + ASSETS_SIZE / 2), c.int(unit.position.y + ASSETS_SIZE / 2), ASSETS_SIZE / 2, rl.BLUE)
}