package src

import "core:fmt"
import rl "vendor:raylib"
import "core:c"

GridObject :: struct {
    id: int,
    components: bit_set[Object_Component],
    position: [2]f32,

    stats: StatsComponent,
}

Object_Component :: enum {
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

selected_object: GridObject
EMPTY_GRID_OBJECT :: GridObject{}


add_component :: proc(object: ^GridObject, component: Componnent) {
    switch comp in component {
    case StatsComponent:
        object.components += { .Stats }
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