extends CharacterBody2D

const speed = 500

func _physics_process(_delta: float) -> void:
	# handle movement
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	velocity = input_dir * speed
	move_and_slide()
