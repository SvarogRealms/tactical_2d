package src

import rl "vendor:raylib"

ASSETS_SIZE :: 16
ASSETS_FILE :: "assets/Tilemap/tilemap_packed.png"
texture: rl.Texture2D

Asset :: enum {
    tile,
    grass_tile,
    flower_tile,
}

assets: [Asset][2]i32 = {
    .tile = {0, 0},
    .grass_tile = {1, 0},
    .flower_tile = {2, 0},

}



draw_asset :: proc(asset_name: Asset, position: [2]i32) {
    rl.DrawTextureRec(texture,
    {f32(assets[asset_name].x * ASSETS_SIZE),
    f32(assets[asset_name].y * ASSETS_SIZE),
    ASSETS_SIZE,ASSETS_SIZE},
    {f32(position.x), f32(position.y)},
    rl.WHITE)
}
