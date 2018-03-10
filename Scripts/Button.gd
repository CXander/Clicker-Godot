extends TextureButton

	
signal gangster_enable

export var wallet  = 0
var enable_gangster_flag = false

func _ready():
	pass


func _process(delta):
	if(wallet >= 10 and enable_gangster_flag != true):
		enable_gangster_helper()

func _on_F_button_down():
	wallet += 1
	print(wallet)
	

func enable_gangster_helper():
	enable_gangster_flag = true
	enable_gangster()

func enable_gangster():
	emit_signal("gangster_enable", enable_gangster_flag)

