package src

import rl "vendor:raylib"

Settings :: struct {
    select_ket: rl.MouseButton,
}

settings : Settings = {
    select_ket = .LEFT,
}

