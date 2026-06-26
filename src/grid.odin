package src

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
    Grass,
    Flower,
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
        cell_position_x := cell_position_2d.x * ASSETS_SIZE
        cell_position_y := cell_position_2d.y * ASSETS_SIZE

        switch cell.tile.type {
        case .None:
        case .Defult:
            draw_asset(.Tile, { cell_position_x, cell_position_y })
        case .Grass:
            draw_asset(.Grass_tile, { cell_position_x, cell_position_y })
        case .Flower:
            draw_asset(.Flower_tile, { cell_position_x, cell_position_y })
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