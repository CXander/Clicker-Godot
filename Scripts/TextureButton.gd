extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _on_F_gangster_enable(gangster_enabled):
	if(gangster_enabled == true):
		set_disabled(false)
		print("Gangster is enabled")
	else:
		print("Gangster is disabled")

