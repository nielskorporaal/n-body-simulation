package main

import c "core"
import r "rendering"
import "core:fmt"

main :: proc() {
    fmt.println("Starting N-body simulation...")
    bodies := c.create_bodies(5)
    r.raylib_render(bodies)
}