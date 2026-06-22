package src

import rl "vendor:raylib"

GameState :: struct {
    current_camera: rl.Camera2D,
    grid: Grid,
}
game_state: GameState
game_init :: proc() {
    rl.InitWindow(800, 450, "Odin + Raylib Hello World")
    rl.SetExitKey(.Q)
    rl.SetTargetFPS(60)

    texture = rl.LoadTexture(ASSETS_FILE)
}

game_start :: proc() {
    game_state.current_camera = { 0, 0, 0, 3 }
    game_state.grid = create_grid(2, 3, { 0, 0 })
    game_state.grid.cells[4].type = .none

}

game_simulate :: proc() {
}

game_draw :: proc() {

    rl.BeginDrawing()
    rl.BeginMode2D(game_state.current_camera)

    rl.ClearBackground(rl.SKYBLUE)
    draw_gird(game_state.grid)

    rl.EndMode2D()
    rl.EndDrawing()

}

game_exit :: proc() {
    rl.CloseWindow()

}