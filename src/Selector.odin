package src

import rl "vendor:raylib"

Selector :: struct {
    current: ^GridObject,
}

selector: Selector

select_input :: proc() {
    if rl.IsMouseButtonDown(settings.select_ket) {
        selector.current = nil
        for obj in grid_objets {
            if rl.CheckCollisionPointRec(rl.GetScreenToWorld2D(rl.GetMousePosition(), gs.current_camera), obj.collider) {
                if .Selectable in obj.behaviours {
                    selector.current = obj

                }
            }
        }
    }
}

draw_select :: proc() {
    if selector.current != nil {
        rl.DrawRectangleLinesEx(selector.current.collider, 0.3, rl.GREEN)
    }
}