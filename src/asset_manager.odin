package src

import rl "vendor:raylib"

ASSETS_SIZE :: 16
ASSETS_FILE :: "../assets/Tilemap/tilemap_packed.png"
texture: rl.Texture2D

Asset :: enum {
}

assets: [Asset][2]int = {

}



draw_asset :: proc(asset_name: Asset, position: [2]int) {
    rl.DrawTextureRec(texture,
    {f32(assets[asset_name].x * ASSETS_SIZE),
    f32(assets[asset_name].y * ASSETS_SIZE),
    ASSETS_SIZE,ASSETS_SIZE},
    {f32(position.x), f32(position.y)},
    rl.WHITE)
}
