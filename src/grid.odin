package src

import "core:fmt"

Cell :: struct {
    type: Tile_Type,
    unit: Unit,
}

Grid :: struct {
    hight : int,
    width: int,
    start_point: [2]int,
    cell_amount: int,
    cells: []Cell,

}

Tile_Type :: enum {
    none,
    defult,
    grass,
    flower,
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
        cell.type = .defult
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

        switch cell.type {
        case .none:
        case .defult:
            draw_asset(.tile, { cell_position_x, cell_position_y })
        case .grass:
            draw_asset(.grass_tile, { cell_position_x, cell_position_y })
        case .flower:
            draw_asset(.flower_tile, { cell_position_x, cell_position_y })
        }

        if cell.unit != { }  do draw_unit(cell.unit)

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