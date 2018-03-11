extends Timer
#timer elapses every second sends a signal each time it elapses

func _ready():
	pass


func Times_Up():
	emit_signal("timeout")

