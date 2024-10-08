extends Area2D

var main_scene: PackedScene = preload("res://worlds/main.tscn")

func _ready() -> void:
	pass

func _on_body_entered(_body: Node2D) -> void: # this call is deferred
	get_tree().change_scene_to_packed(main_scene)
