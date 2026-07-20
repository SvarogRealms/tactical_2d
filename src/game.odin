package src

import rl "vendor:raylib"
import "core:fmt"

GameState :: struct {
    current_camera: rl.Camera2D,
    grid: Grid,
    object: ^GridObject,
}
gs: GameState
game_init :: proc() {
    rl.InitWindow(800, 450, "Odin + Raylib Hello World")
    rl.SetExitKey(.Q)
    rl.SetTargetFPS(60)
}

game_start :: proc() {
    gs.current_camera = { 0, 0, 0, 3 }
    gs.grid = create_grid(2, 3, { 10, 10 })
    gs.grid.cells[4].tile.type = .None

    gs.object = create_grid_object({ .Selectable }, { 0, 0 })
    add_component(gs.object, StatsComponent{})
    set_object_in_cell(gs.grid, gs.object, {1, 1})

}

game_simulate :: proc() {
    select_input()
}

game_draw :: proc() {

    rl.BeginDrawing()
    rl.BeginMode2D(gs.current_camera)

    rl.ClearBackground(rl.BLACK)
    draw_gird(gs.grid)
    draw_object(gs.object^)
    rl.EndMode2D()
    rl.EndDrawing()

}

game_exit :: proc() {
    rl.CloseWindow()

}