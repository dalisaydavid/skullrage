extends StaticBody2D

var collision_disable_threshold

func _ready():
	collision_disable_threshold = 95

func _process(delta):
	if get_parent().get_parent().get_node('RageMeterHud').get_node('ProgressBar').value >= collision_disable_threshold:
		get_node("CollisionShape2D").disabled = true
	else:
		get_node("CollisionShape2D").disabled = false
