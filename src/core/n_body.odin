package core

import "core:fmt"
import "core:math"
import "core:math/rand"

bodies := [dynamic]Body{}

create_bodies :: proc(num_bodies: int) -> []Body {
	for i in 1 ..= num_bodies {
		body := Body {
			position     = Vector3{random(), random(), random()},
			velocity     = Vector3{0, 0, 0},
			acceleration = Vector3{0, 0, 0},
			mass         = 2.0 * f32(i),
		}
		append(&bodies, body)
	}

	fmt.printf("Created %v bodies\n", len(bodies))
	return bodies[:]
}

render_bodies :: proc() {
	for body in bodies {
		fmt.printf(
			"Position: (%f, %f, %f)\tMass: (%f)\tAcceleration: (%f, %f, %f)\n",
			body.position.x,
			body.position.y,
			body.position.z,
			body.mass,
			body.acceleration.x,
			body.acceleration.y,
			body.acceleration.z,
		)
	}
}

simulate_bodies :: proc(steps: int, dt: f32 = 25) {
	for step in 1 ..= steps {
		for i in 0 ..= len(bodies) - 1 {
			// Calculate forces
			bodies[i].acceleration = Vector3{dt, dt, dt}
			for j in 0 ..= len(bodies) - 1 {
				if i != j {
					r := subtract(bodies[j].position, bodies[i].position)
					distance := math.sqrt(r.x * r.x + r.y * r.y + r.z * r.z)
					force := bodies[j].mass / (distance * distance * distance)
					bodies[i].acceleration = Vector3{r.x * force, r.y * force, r.z * force}
				}
			}

			for i in 0 ..= len(bodies) - 1 {
				bodies[i].velocity = add(
					bodies[i].velocity,
					multiply(bodies[i].acceleration, Vector3{dt, dt, dt}),
				)
				bodies[i].position = add(
					bodies[i].position,
					multiply(bodies[i].velocity, Vector3{dt, dt, dt}),
				)
			}
		}
	}
}

random :: proc() -> f32 {
	return abs((rand.float32() * 2.0 - 1.0) * 800.0)
}
