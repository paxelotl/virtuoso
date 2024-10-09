class_name EnemyIdle
extends State

@export var enemy: CharacterBody3D

var player: CharacterBody3D

func enter():
	print("STATE: Idle")
	
	player = get_tree().get_first_node_in_group("Player")

func physics_update(_delta: float):
	enemy.velocity.x = 0
	enemy.velocity.z = 0
	
	var distance = (player.position - enemy.position).length()
	if distance < 3:
		Transitioned.emit(self, "Approach")
