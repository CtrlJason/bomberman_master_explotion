extends Node2D
@onready var p1 := $"../Player"
@onready var p2 := $"../Player_2"
@onready var p3 := $"../Player_3"
@onready var vidas := $"."
@onready var bomba := $"../Bomba"


func _ready():
	if bomba.is_in_group("player"):
		get_parent().vidas -= 1
		print("player detectado")
		queue_free()
	pass
