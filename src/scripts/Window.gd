extends Window



func _on_button_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Button.set_disabled(true)
