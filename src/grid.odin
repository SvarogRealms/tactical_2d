package src

import rl "vendor:raylib"

import "core:fmt"

Grid :: struct {
    hight : int,
    width: int,
    start_point: [2]int,
    cell_amount: int,
    cells: []Cell,

}

Cell :: struct {
    tile: Tile,
    grid_object: GridObject,
}

Tile :: struct {
    type: Tile_Type,
    is_walkable: bool,
    move_amount: int,
}


Tile_Type :: enum {
    None,
    Defult,
}

create_grid :: proc(hight: int, width: int, start_point: [2]int) -> Grid {

    grid_n : Grid = Grid {
        hight = hight,
        width = width,
        start_point = start_point,
        cell_amount = hight * width,
    }

    grid_n.cells = make([]Cell, grid_n.cell_amount)

    for &cell in grid_n.cells {
        cell.tile.type = .Defult
        cell.grid_object.id = -1
    }

    return grid_n
}

delete_grid :: proc(grid: Grid) {
}

draw_gird :: proc(grid: Grid) {

    for cell, i in grid.cells {
        cell_position_2d := cell_position_from_1d_to_2d(i, grid.width)
        cell_position_x := cell_position_2d.x * ASSETS_SIZE + grid.start_point.x
        cell_position_y := cell_position_2d.y * ASSETS_SIZE + grid.start_point.y

        switch cell.tile.type {
        case .None:
        case .Defult:
            rl.DrawRectangleRec({ f32(cell_position_x), f32(cell_position_y), ASSETS_SIZE, ASSETS_SIZE}, rl.WHITE)
            rl.DrawRectangleLinesEx({ f32(cell_position_x), f32(cell_position_y), ASSETS_SIZE, ASSETS_SIZE}, 0.5, rl.GRAY)
        }

        if cell.grid_object.id != -1  do draw_object(cell.grid_object)

    }
}

debug_grid :: proc(grid: Grid) {
    fmt.println(grid.cells)
}

cell_position_from_1d_to_2d :: proc(position: int, grid_width: int) -> [2]int {
    position_n : [2]int
    position_n.x = position % grid_width
    position_n.y = position / grid_width

    return position_n
}

set_object_in_cell :: proc(grid: Grid, object: ^GridObject, cell_pos: [2]f32){
    object.position = {f32(grid.start_point.x) + (cell_pos.x * ASSETS_SIZE), f32(grid.start_point.y) + (cell_pos.y * ASSETS_SIZE)}
    object.collider = {object.position.x, object.position.y, ASSETS_SIZE, ASSETS_SIZE}
}