extends CharacterBody2D
@onready var Player_1 = $"../Player"
@onready var Bomb = $"."
#Traer animaciones bomba jugador 1
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var anim_tree_playback = anim_tree.get("parameters/playback")
#Traer contador
@onready var timer: Timer = $Timer
var explosion_process: AnimationPlayer
var boom_x: AnimationPlayer
var canUseSpaceInput: bool = true
#inicializar
func _ready():
	explosion_process = $AnimationBomb
	boom_x = $AnimationBomb
	anim_tree.active = true #inicializar animaciones de la bomba aquí
	timer = $Timer # Inicializa el temporizador aquí
func _process(delta):
	var player_position = Player_1.global_position
func _input(event):
	if  canUseSpaceInput and Input.is_key_pressed(KEY_SPACE):
		Bomb.position = Player_1.global_position
		anim_tree_playback.travel("proceso_0")
		canUseSpaceInput = false #desactivamos el uso de la tecla espacio
		timer.start() # Iniciamos el temporizador
func _on_timer_timeout():
	canUseSpaceInput = true
