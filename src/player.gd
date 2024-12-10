extends CharacterBody2D


const SPEED = 300.0


func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO 
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
