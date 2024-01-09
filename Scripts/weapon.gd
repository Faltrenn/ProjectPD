class_name Weapon
extends Node3D

@onready var anim_player := $AnimationPlayer


func _ready():
	if not anim_player:
		push_error("Missing AnimationPlayer on: ", name)

func fire():
	if anim_player:
		anim_player.play("fire")
