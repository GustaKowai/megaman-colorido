extends Node

#opçoes jogador:
var pulo_controlavel:bool = false
var is_fullscreen:bool = true


func change_screen_size():
	print_debug("tentei")
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


# Disquetes
var disquete_number_max = {"verde":2,"magenta":1,"azul":0,"amarelo":0,"vermelho":0}
var disquetes_coletados = {"verde":0,"magenta":0,"azul":0,"amarelo":0,"vermelho":0}
var recorde_fase = {"verde":0,"magenta":0,"azul":0,"amarelo":0,"vermelho":0}

signal item_coletado

# Fitas
var fita_number_max = {"verde":4,"magenta":7,"azul":0,"amarelo":0,"vermelho":0}
var fitas_coletados = {"verde":0,"magenta":0,"azul":0,"amarelo":0,"vermelho":0}
var recorde_fase_fita = {"verde":0,"magenta":0,"azul":0,"amarelo":0,"vermelho":0}

func Update_recordes(color_check):
	if recorde_fase[color_check] < disquetes_coletados[color_check]:
		recorde_fase[color_check] = disquetes_coletados[color_check]
		print_debug(str(recorde_fase[color_check]),"/", disquete_number_max[color_check])
	if recorde_fase_fita[color_check] < fitas_coletados[color_check]:
		recorde_fase_fita[color_check] = fitas_coletados[color_check]
		print_debug(str(recorde_fase_fita[color_check]),"/", fita_number_max[color_check])
	
