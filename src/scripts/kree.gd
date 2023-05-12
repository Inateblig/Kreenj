extends CharacterBody3D


const SPEED = 5.0

var inp_dir: Vector2 = Vector2.ZERO

func _input(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			var l: Vector2 = -lerp(Vector2.ZERO, event.relative * settings.MOUSE_SPEED, 0.75)
			rotate_y(-l.x)
			$HBoxContainer/SubViewportContainerMain/SubViewportMain/head.rotate_x(l.y)
	if event.is_action_pressed("mwU"):
		nodes.kree.inp_dir.x = -1
	elif event.is_action_pressed("mwD"):
		nodes.kree.inp_dir.x = 1

func _ready():
	nodes.kree = self

func _physics_process(_dt):
	var direction = (transform.basis * Vector3(inp_dir.x, 0, inp_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * settings.SPEED
		velocity.z = direction.z * settings.SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, settings.SPEED)
		velocity.z = move_toward(velocity.z, 0, settings.SPEED)

	move_and_slide()
