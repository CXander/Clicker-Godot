extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal gangster_enable

var x  = 0
var enabled_flag = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
		


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if(x >= 10 and enabled_flag != 1):
		enable_gangster_helper()



func _on_F_button_down():
	x += 1
	print(x)
	

func enable_gangster_helper():
	enabled_flag = 1
	enable_gangster()
	
func enable_gangster():
	emit_signal("gangster_enable")
	
