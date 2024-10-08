extends CharacterBody3D

const SPEED = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var player: CharacterBody3D
@onready var animation_player = $AnimationPlayer
@onready var player_pointer = $PlayerPointer

var can_move: bool = false

enum State {
	Idle,
	MovingForward,
	Attacking,
}

var current_state: int = State.Idle

func _ready() -> void:
	current_state = State.MovingForward

func _physics_process(delta: float) -> void:
	
	# TODO: Use math function
	look_at(player.global_position)
	rotation.x = 0
	rotation.z = 0
	
	# Move object down
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Allow movement if far away
	if position.distance_to(player.position) > 4:
		can_move = true
	else:
		can_move = false
	
	# Set velocity to forward
	var direction = (transform.basis * Vector3.FORWARD).normalized()
	if current_state == State.MovingForward and can_move:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
