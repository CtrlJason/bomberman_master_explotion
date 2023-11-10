extends CanvasLayer #CanvasLayer es un nodo para poder modificar los textos de los label

func _process(_delta):  
	$vidas_jug1.text = str(Global.vidasPlayer1)  
	$vidas_jug2.text = str(Global.vidasPlayer2)
	$vidas_jug3.text = str(Global.vidasPlayer3)
#vidas_jug(1-2-3) es un label (str = String) - Global.vidasPlayer1: es la direccion de donde estan las variables

