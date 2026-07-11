package src

import rl "vendor:raylib"

GameState :: struct {
    current_camera: rl.Camera2D,
    grid: Grid,
    object: GridObject,
}
gs: GameState
game_init :: proc() {
    rl.InitWindow(800, 450, "Odin + Raylib Hello World")
    rl.SetExitKey(.Q)
    rl.SetTargetFPS(60)

    texture = rl.LoadTexture(ASSETS_FILE)
}

game_start :: proc() {
    gs.current_camera = { 0, 0, 0, 3 }
    gs.grid = create_grid(2, 3, { 0, 0 })
    gs.grid.cells[4].tile.type = .None

    add_component(&gs.object, StatsComponent{})

}

game_simulate :: proc() {
}

game_draw :: proc() {

    rl.BeginDrawing()
    rl.BeginMode2D(gs.current_camera)

    rl.ClearBackground(rl.BLACK)
    draw_gird(gs.grid)
    draw_object(gs.object)
    rl.EndMode2D()
    rl.EndDrawing()

}

game_exit :: proc() {
    rl.CloseWindow()

}