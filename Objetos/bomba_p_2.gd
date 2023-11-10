extends CharacterBody2D
@onready var Player2 = $"../Player_2"
@onready var Bomb = $"."
#Traer animaciones bomba jugador 2
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
func _processs(delta):
	var player_posaition = Player2.global_position

func _input(event):
	if  canUseSpaceInput and Input.is_key_pressed(KEY_CTRL):
		Bomb.position = Player2.global_position
		anim_tree_playback.travel("proceso_0")
		canUseSpaceInput = false #desactivamos el uso de la tecla espacio
		area_explosion.monitoring = false #Esto desactiva la hitbox de la explosion
		timer.start() # Iniciamos el temporizador para habilitar la hitbox despues del timer y el uso del espacio

func _on_timer_timeout():
	area_explosion.monitoring = true
	canUseSpaceInput = true
	#desde aqui hubo cambios

#Variables de las vidas vida(jugador)


func _on_area_2d_body_entered(body): #si un cuerpo(objeto) entra al area 2D entonces
	if body.is_in_group("jugador"): #si un cuerpo esta en el grupo jugador ejecuta lo demas
		#teletransporte de jugadores (muerte)
		teletransporte1(body)
		teletransporte2(body)
		teletransporte3(body)
		#vidas jugadores (label que muestra las vidas)
		vidaPlayer1(body)
		vidaPlayer2(body)
		vidaPlayer3(body)

func teletransporte1(body): #cree una funcion para llarmala despues al cuerpo que entre al area 2D
	if body.is_in_group("player1"): #si un cuerpo esta en el grupo player1
		body.global_position = Vector2(88, 37) #lo teletransporta a sus cordenadas iniciales
		Vidas.vida1 -=1  #aca le resta una vida al jugador 
		#esto se lleva a la funcion de _on_body_area_2D 
		if Vidas.vida1 == 0: #comparamos si las vidas del jugador es igual a 0
			set_process(false) # cancelamos la funcion process
			body.queue_free() #desaparecemos el cuerpo(objeto)
func teletransporte2(body): #cree una funcion para llamarla despues al cuerpo que entre al area2D
	if body.is_in_group("player2"): #si un cuerpo esta en el grupo player2
		body.global_position = Vector2(344, 39) #lo teletransporta a sus cordenadas iniciales
		Vidas.vida2 -=1  #aca le resta una vida al jugador
		#esto se lleva a la funcion de _on_body_area_2D
		if Vidas.vida2 == 0: #commparamos si las vidas del jugador es igual a 0
			set_process(false) #cancelamos la funcion process
			body.queue_free() #desaparecemos el cuerpo(objeto)
func teletransporte3(body): #cree una funcion para llarmala despues al cuerpo que entre al area2D
	if body.is_in_group("player3"): #si un cuerpo esta en el grupo player3
		body.global_position = Vector2(344, 202) #lo teletransporta a sus cordenadas iniciales
		Vidas.vida3 -=1 #aca le resta una vida al jugador
		if Vidas.vida3 == 0: #comparamos si las vidas del jugador es igual a 0 
			#en caso de que si
			set_process(false) #cancelamos la funcion Process 
			body.queue_free() #desaparecemos el cuerpo(objeto)

func vidaPlayer1(body): #se crea una funcion para  llarmala al _on_body
	if body.is_in_group("player1"): #si el cuerpo esta en el grupo player1
		Global.vidasPlayer1 -=1  #llamamos la variable (vidasPlayer1, que esta en el script Global) y le restamos 1 
func vidaPlayer2(body): #se crea una funcion para llarmala al _on_body
	if body.is_in_group("player2"): #si el cuerpo esta en el grupo player2
		Global.vidasPlayer2 -=1 #llamamos la variable (vidasPlayer, que esta en el script Global) y se le resta 1
func vidaPlayer3(body): #se crea una funcion para llamarla al on_body
	if body.is_in_group("player3"): #si el cuerpo esta en el grupo player3
		Global.vidasPlayer3 -=1 #llamamos la variable (vidasPlayer3, que esta en el script Global
