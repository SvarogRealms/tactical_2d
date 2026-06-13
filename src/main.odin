package main

import rl "vendor:raylib"

main :: proc() {
    
    game_init()
    game_start()

    
    for !rl.WindowShouldClose() {
        
        game_simulate()
        game_draw()
    }

    game_exit()
}