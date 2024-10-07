extends Node3D

@onready var player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.current_animation = "CubeAction"
	player.play()
