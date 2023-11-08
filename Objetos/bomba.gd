extends CharacterBody2D
@onready var Player_1 = $"../Player"
@onready var Player_2 = $"../Player_2"
@onready var Player_3 = $"../Player_3"
@onready var Bomb = $"."
#Traer animaciones bomba jugador 1
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var anim_tree_playback = anim_tree.get("parameters/playback")
#Traer contador
@onready var timer: Timer = $Timer
@onready var area_explosion: Area2D = $Area2D
var explosion_process: AnimationPlayer
var boom_x: AnimationPlayer
var canUseSpaceInput: bool = true
#inicializar
func _ready():
	explosion_process = $AnimationBomb
	boom_x = $AnimationBomb
	anim_tree.active = true #inicializar animaciones de la bomba aquí
	timer = $Timer # Inicializa el temporizador aquí
	area_explosion.monitoring = false
func _process(delta):
	var player_posaition = Player_1.global_position

func _input(event):
	if  canUseSpaceInput and Input.is_key_pressed(KEY_SPACE):
		Bomb.position = Player_1.global_position
		anim_tree_playback.travel("proceso_0")
		canUseSpaceInput = false #desactivamos el uso de la tecla espacio
		area_explosion.monitoring = false
		timer.start() # Iniciamos el temporizador
	#desde aqui hubo cambios
func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		print ("muelto")

	
func _on_timer_timeout():
	canUseSpaceInput = true
	area_explosion.monitoring = true
