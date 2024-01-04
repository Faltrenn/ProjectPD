extends CSGBox3D


@export var speed: int = 0

func _process(delta):
	rotate(Vector3.RIGHT, speed * delta)
	rotate(Vector3.UP, speed * delta)
	rotate(Vector3.FORWARD, speed * delta)
