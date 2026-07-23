package src

import rl "vendor:raylib"

GameState :: struct {
    current_camera: rl.Camera2D,
    camera_speed: f32,
    grid: Grid,
    object: ^GridObject,


    is_debug_mod: bool,

    dt: f32,
}
gs: GameState
game_init :: proc() {
    rl.InitWindow(800, 450, "Odin + Raylib Hello World")
    rl.SetExitKey(.Q)
    rl.SetTargetFPS(60)
}

game_start :: proc() {
    gs.current_camera = { 0, 0, 0, 3 }
    gs.camera_speed = 100
    gs.grid = create_grid(16, 16, { 0, 0 })

    gs.object = create_grid_object({.Selectable }, { 0, 0 })
    set_object_in_cell(gs.grid, create_grid_object({ .Selectable }, { 0, 0 }), {1, 0})
    set_object_in_cell(gs.grid, create_grid_object({ .Selectable }, { 0, 0 }), { 2, 0 })
    add_component(gs.object, StatsComponent{})
    set_object_in_cell(gs.grid, gs.object, {1, 1})

}

game_simulate :: proc() {
    gs.dt = rl.GetFrameTime()

    if rl.IsKeyPressed(.F11) {
        gs.is_debug_mod = !gs.is_debug_mod
    }

    if gs.is_debug_mod {
        if rl.IsKeyDown(.A) { gs.current_camera.target += {-1 * gs.camera_speed * gs.dt, 0} }
        if rl.IsKeyDown(.D) { gs.current_camera.target += {1 * gs.camera_speed * gs.dt, 0} }
        if rl.IsKeyDown(.W) { gs.current_camera.target += {0, -1 * gs.camera_speed * gs.dt,} }
        if rl.IsKeyDown(.S) { gs.current_camera.target += {0, 1 * gs.camera_speed * gs.dt,} }
    }


    select_input()
}

game_draw :: proc() {

    rl.BeginDrawing()
    rl.BeginMode2D(gs.current_camera)

    rl.ClearBackground(rl.BLACK)

    draw_gird(gs.grid)

    for obj in grid_objets {
        draw_object(obj^)
    }

    draw_select()




    if gs.is_debug_mod {
       screen :=  rl.GetScreenToWorld2D({0, 0}, gs.current_camera)
        rl.DrawText("Debug", i32(screen.x), i32(screen.y), 16, rl.GREEN)
    }
    rl.EndMode2D()
    rl.EndDrawing()

}

game_exit :: proc() {
    rl.CloseWindow()

}