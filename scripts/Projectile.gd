extends KinematicBody2D

var velocity = Vector2(0,0)
var direction = 'right'
var move_speed = 15000 
var motion = 0.0

func _ready():
	set_process(true)

func _process(delta):
	if get_node('Timer').is_stopped():
		queue_free()
		
	#velocity = Vector2(0,0)
	set_velocity()
	motion = velocity * delta
	move_and_slide(motion)

func set_velocity():
	if direction == 'up':
		velocity.y = -move_speed
	elif direction == 'down':
		velocity.y = move_speed
	elif direction == 'left':
		velocity.x = -move_speed
	elif direction == 'right':
		velocity.x = move_speed
	
func set_direction(direction):
	self.direction = direction
	
