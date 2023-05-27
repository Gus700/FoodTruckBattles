extends ColorRect



func _on_showbig(big_img):
	$BigMem.texture = load(big_img)
	self.color = Color(0, 0, 0, 1)
	$BigMem.set_modulate(Color(1, 1, 1, 1))
	$BigMem/hide.set_mouse_filter(0)


func _on_hide_pressed():
	self.color = Color(0, 0, 0, 0)
	$BigMem.set_modulate(Color(1, 1, 1, 0))
	$BigMem/hide.set_mouse_filter(2)
