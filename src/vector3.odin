package n_body;

Vector3 :: struct {
    x,y,z: f64
}

add :: proc(lhs: Vector3, rhs: Vector3) -> Vector3 {
    return Vector3{lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z}
}

subtract :: proc(lhs: Vector3, rhs: Vector3) -> Vector3 {
    return Vector3{lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z}
}

multiply :: proc(lhs: Vector3, rhs: Vector3) -> Vector3 {
    return Vector3{lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z}
}