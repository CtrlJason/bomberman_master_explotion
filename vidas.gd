extends Node2D
@onready var p1 := $"../Player"
@onready var p2 := $"../Player_2"
@onready var p3 := $"../Player_3"
@onready var vidas := $"."


func _on_Area2D_body_entered(body):
	if body.is_in_group("p1"):
		get_parent().vidas -= 1
		print("player detectado")
		queue_free()
	pass
