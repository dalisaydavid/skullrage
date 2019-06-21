extends Area2D

var health = 5

func _ready():
	set_process(true)

func _process(delta):
	if health <= 0:
		queue_free()


func _on_StaticBody2D_body_entered(body):
	print(body.get_name() + ' collided with ' + get_name())
	if body.get_name().find('Projectile') > -1:
		body.queue_free()
		get_parent().get_node('RageMeterHud').add_rage(25)
		health -= 1