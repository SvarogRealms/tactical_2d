package main 

import rl "vendor:raylib"

GameState :: struct {

}

game_init :: proc() {
	rl.InitWindow(800, 450, "Odin + Raylib Hello World")
	rl.SetExitKey(.Q)
	rl.SetTargetFPS(60)
}

game_start :: proc() {
	
}

game_simulate :: proc() {
	
}

game_draw :: proc() {

	rl.BeginDrawing()
	
        rl.ClearBackground(rl.RAYWHITE)
        rl.DrawText("Hello, World!", 190, 200, 20, rl.LIGHTGRAY)

     rl.EndDrawing()
	
}

game_exit :: proc() {
    rl.CloseWindow()

}