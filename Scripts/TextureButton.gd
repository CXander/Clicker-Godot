extends TextureButton

func _ready():
	pass

func _on_F_gangster_enable(gangster_enabled):
	if(gangster_enabled == true):
		set_disabled(false)
		print("Gangster is enabled")
	else:
		print("Gangster is disabled")
