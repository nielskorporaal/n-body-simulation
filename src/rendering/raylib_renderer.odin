package rendering;

import c "./../core"
import rl "vendor:raylib"

raylib_render :: proc(bodies: []c.Body) {
    rl.InitWindow(800, 600, "N-Body Simulation")
    rl.SetTargetFPS(60)

    frame_count := 0
    paused := false

    for !rl.WindowShouldClose() {

        if rl.IsKeyPressed(rl.KeyboardKey.SPACE) {
            paused = !paused
        }

        if !paused {
            frame_count += 1
            if frame_count >= 5 {
                frame_count = 0
                c.simulate_bodies(1, 5) // for 1 step and delta 5
            }
        }

        rl.BeginDrawing()
        rl.ClearBackground(rl.RAYWHITE)
        
        for body in bodies {
            rl.DrawCircleV(rl.Vector2{body.position.x, body.position.y}, body.mass, rl.RED)
        }

        if paused {
            rl.DrawText("Paused", 400 - 60, 300 - 30, 30, rl.DARKGRAY)
        }
        
        rl.EndDrawing()
    }

    rl.CloseWindow()
}




