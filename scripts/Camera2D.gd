extends Camera2D

func _ready():
	set_process(true)
	shake_on = false
	
# Animate this to increase/decrease/fade the shaking
var shake_amount = 1.5
var shake_on
func toggle_shake():
	shake_on = not shake_on
	
func _process(delta):
	#if event.type == InputEvent.MOUSE_MOTION:
	var dude_position = get_parent().get_node('dude').position
	self.position = dude_position
	
#	if not get_parent().get_node('dude').is_last_attack_animation_over():
#		shake_on = true
#	else:
#		shake_on = false

	if shake_on:
		self.set_offset(Vector2( \
			rand_range(-1.0, 1.0) * shake_amount, \
			rand_range(-1.0, 1.0) * shake_amount \
		))