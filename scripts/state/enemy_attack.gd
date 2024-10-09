class_name EnemyAttack
extends State


@export var enemy: CharacterBody3D

@onready var animation_player = $"../../AnimationPlayer"

var player: CharacterBody3D

func _ready():
	animation_player.animation_finished.connect(on_animation_finish)

func enter():
	print("STATE: Attack")
	
	player = get_tree().get_first_node_in_group("Player")
	
	animation_player.play("attack")

func on_animation_finish(_d):
	print("Attack Finished")
	Transitioned.emit(self, "Approach")
