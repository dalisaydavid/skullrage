extends CanvasLayer

var progress_bar
var timer
var rage_threshold
func _ready():
	set_process(true)
	progress_bar = get_node("ProgressBar")
	timer = get_node("Timer")
	rage_threshold = 95

func _process(delta):
#	if timer.is_stopped():
	progress_bar.value -= progress_bar.step/2
	if progress_bar.value >= rage_threshold:
		progress_bar.get("custom_styles/fg").set_bg_color(Color("C32A2A"))
	else:
		progress_bar.get("custom_styles/fg").set_bg_color(Color("999999"))

func add_rage(value):
#	print("rage value " + value)
	progress_bar.value += value
