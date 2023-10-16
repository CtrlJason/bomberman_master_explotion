extends CharacterBody2D
var velocidad := 120
var direccion := Vector2()

@onready var anim := $AnimationPlayer
@onready var sprite := $sprite_jugador
func _physics_process(delta):
	direccion.x = Input.get_axis("ui_left","ui_right")
	velocity.x = direccion.x * velocidad
	if direccion.x != 0:
		anim.play ("Caminar_X")
	elif Input.is_action_just_released("ui_left"):
		anim.play("idle_x_left")
	elif Input.is_action_just_released("ui_right"):
		anim.play("idle_x_right")

	direccion.y = Input.get_axis("ui_up","ui_down")
	velocity.y = direccion.y * velocidad
	if direccion.y < 0:
		anim.play ("caminar_up")
	elif direccion.y > 0:
		anim.play ("caminar_down")
	elif Input.is_action_just_released("ui_up"):
		anim.play("idle_y_up")
	elif Input.is_action_just_released("ui_down"):
		anim.play("Idle_y_down")
	sprite.flip_h = direccion.x < 0 if direccion.x != 0 else sprite.flip_h
	move_and_slide()
