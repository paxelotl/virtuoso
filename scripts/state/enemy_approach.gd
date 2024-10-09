class_name EnemyApproach
extends EnemyState

@export var enemy: CharacterBody3D
@export var move_speed: float = 2.0

var player: CharacterBody3D
var can_move: bool = false
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func enter():
	player = get_tree().get_first_node_in_group("Player")

func exit():
	enemy.velocity = Vector3.ZERO

func physics_update(delta: float):
	handle_state()
	handle_movement(delta)

func handle_movement(delta: float) -> void:
	# TODO: Use math function
	enemy.look_at(player.global_position)
	enemy.rotation.x = 0
	enemy.rotation.z = 0
	
	# Set velocity to forward
	var direction = (enemy.transform.basis * Vector3.FORWARD).normalized()
	if can_move:
		enemy.velocity.x = direction.x * move_speed
		enemy.velocity.z = direction.z * move_speed
	else:
		enemy.velocity.x = move_toward(enemy.velocity.x, 0, move_speed)
		enemy.velocity.z = move_toward(enemy.velocity.z, 0, move_speed)

func handle_state():
	# Allow movement if far away
	var distance = (player.position - enemy.position).length()
	if distance > 3:
		can_move = true
	else:
		can_move = false
	
	if distance > 8:
		Transitioned.emit(self, "Idle")
