package src

import "core:fmt"
import rl "vendor:raylib"

Selector :: struct {
    previous_objects: []GridObject,
    current: GridObject,
}

select_input :: proc() {
    if rl.IsMouseButtonDown(settings.select_ket) {
        for obj in grid_objets {
            if .Selectable in obj.behaviours {
                if rl.CheckCollisionPointRec(rl.GetScreenToWorld2D(rl.GetMousePosition(), gs.current_camera), obj.collider) {
                    fmt.println("Selected")
                }

            }
        }
    }
}

select_objet :: proc() {

}