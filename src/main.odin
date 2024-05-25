package n_body

import "core:fmt"

main :: proc() {
    fmt.println("Starting N-body simulation...")
    create_bodies(5)
    simulate_bodies(1)
}