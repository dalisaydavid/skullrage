extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2()
var motion = 0.0
const walk_speed = 10000 
var last_direction = ''
var projectile_scene = load('res://prefabs/Projectile.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	set_process_input(true)
	
func _physics_process(delta):
	# Handle movement inputs every frame.
	velocity.y = 0
	velocity.x = 0

	handle_movement()
	motion = velocity * delta
	move_and_slide(motion)
	
func _input(event):
	if event.is_action_released('shoot'):
        shoot_projectile()

func shoot_projectile():
	var new_projectile = projectile_scene.instance()
	new_projectile.set_direction(last_direction)
	var projectile_spawn = get_node("ProjectileSpawn_" + last_direction)
	new_projectile.global_position = Vector2(projectile_spawn.global_position.x, projectile_spawn.global_position.y)
	get_parent().add_child(new_projectile)

func handle_movement():
	if (Input.is_key_pressed(KEY_A)):
		velocity.x = -walk_speed
		last_direction = 'left'
	elif (Input.is_key_pressed(KEY_D)):
		velocity.x =  walk_speed
		last_direction = 'right'
	elif (Input.is_key_pressed(KEY_W)):
		velocity.y = -walk_speed
		last_direction = 'up'
	elif (Input.is_key_pressed(KEY_S)):
		velocity.y =  walk_speed
		last_direction = 'down'
