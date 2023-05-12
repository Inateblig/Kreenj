extends Node


func _on_button_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Button.hide()

func _input(event):
	if event.is_action_pressed("mwU"):
		nodes.kree.inp_dir.y = -1
	elif event.is_action_pressed("mwD"):
		nodes.kree.inp_dir.y = 1
