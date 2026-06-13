package main

import rl "vendor:raylib"

main :: proc() {
    // Initialize the window with dimensions and a title
    rl.InitWindow(800, 450, "Odin + Raylib Hello World")
    defer rl.CloseWindow() // Ensures the window closes safely when main exits

    // Set the target frames-per-second
    rl.SetTargetFPS(60)

    // Main game loop running until the user closes the window (e.g., ESC key or 'X' button)
    for !rl.WindowShouldClose() {
        // Prepare to draw on the screen
        rl.BeginDrawing()
        defer rl.EndDrawing()

        // Clear the background color to white
        rl.ClearBackground(rl.RAYWHITE)

        // Draw the text string on the screen: text, x, y, font size, color
        rl.DrawText("Hello, World!", 190, 200, 20, rl.LIGHTGRAY)
    }
}