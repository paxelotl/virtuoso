extends CharacterBody3D

const SPEED = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var player: CharacterBody3D
@onready var animation_player = $AnimationPlayer
@onready var player_pointer = $PlayerPointer

var can_move: bool = false

func _physics_process(delta: float) -> void:
	# Move object down
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	move_and_slide()
