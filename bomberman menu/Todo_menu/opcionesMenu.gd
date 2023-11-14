extends Control
func _on_jugar_pressed():
		get_tree().change_scene_to_file("res://Mundo/mundo.tscn")
func _on_salir_pressed():
	get_tree().quit()
func _on_controles_pressed():
	get_tree().change_scene_to_file("res://Todo_menu/controles.tscn")
