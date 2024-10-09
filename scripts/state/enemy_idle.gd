class_name EnemyIdle
extends EnemyState

@export var enemy: CharacterBody3D

var player: CharacterBody3D

func enter():
	player = get_tree().get_first_node_in_group("Player")

func physics_update(delta: float):
	enemy.velocity.x = 0
	enemy.velocity.z = 0
	
	var distance = (player.position - enemy.position).length()
	if distance < 5:
		Transitioned.emit(self, "Approach")
