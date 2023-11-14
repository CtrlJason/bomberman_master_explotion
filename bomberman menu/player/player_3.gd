extends CharacterBody2D
var velocidad := 120
var direccion := Vector2()

@onready var anim := $AnimationPlayer
@onready var sprite := $sprite_jugador
func _physics_process(delta):
	direccion.x = Input.get_axis("ui_left_4","ui_right_6")
	velocity.x = direccion.x * velocidad
	if direccion.x != 0:
		anim.play ("Caminar_X")
	elif Input.is_action_just_released("ui_left_4"):
		anim.play("idle_x_left")
	elif Input.is_action_just_released("ui_right_6"):
		anim.play("idle_x_right")

	direccion.y = Input.get_axis("ui_up_8","ui_down_5")
	velocity.y = direccion.y * velocidad
	if direccion.y < 0:
		anim.play ("caminar_up")
	elif direccion.y > 0:
		anim.play ("caminar_down")
	elif Input.is_action_just_released("ui_up_8"):
		anim.play("idle_y_up")
	elif Input.is_action_just_released("ui_down_5"):
		anim.play("Idle_y_down")
	sprite.flip_h = direccion.x < 0 if direccion.x != 0 else sprite.flip_h
	move_and_slide()
