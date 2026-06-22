package src

import "core:fmt"

Cell :: struct {
    type: Tile_Type,
}

Grid :: struct {
    hight : i32,
    width: i32,
    start_point: [2]i32,
    cell_amount: i32,
    cells: []Cell,

}

Tile_Type :: enum {
    defult,
    grass,
    flower,
}

create_grid :: proc(hight: i32, width: i32, start_point: [2]i32) -> Grid {

    grid_n : Grid = Grid {
        hight = hight,
        width = width,
        start_point = start_point,
        cell_amount = hight * width,
    }

    grid_n.cells = make([]Cell, grid_n.cell_amount)

    for &cell in grid_n.cells {
        cell.type = .defult
    }

    return grid_n
}

delete_grid :: proc(grid: Grid) {
}

draw_gird :: proc(grid: Grid) {

    for cell, i in grid.cells {
        cell_position_2d := cell_position_from_1d_to_2d(i32(i), grid.width)
        cell_position_x := cell_position_2d.x * ASSETS_SIZE
        cell_position_y := cell_position_2d.y * ASSETS_SIZE

        switch cell.type {
            case .defult:
                draw_asset(.tile, {cell_position_x, cell_position_y})
            case .grass:
                draw_asset(.grass_tile, {cell_position_x, cell_position_y})
        case .flower:
                draw_asset(.flower_tile, {cell_position_x, cell_position_y})
        }
    }
}

debug_grid :: proc(grid: Grid) {
    fmt.println(grid.cells)
}

cell_position_from_1d_to_2d :: proc(position: i32, grid_width: i32) -> [2]i32 {
    position_n : [2]i32
    position_n.x = position % grid_width
    position_n.y = position / grid_width

    return position_n
}