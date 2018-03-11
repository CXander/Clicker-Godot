extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal enable_button

export var wallet  = 0

onready var Gangster = get_child(0)
onready var Enforcer = get_child(1)
onready var Framer = get_child(2)
onready var Consig = get_child(3)
onready var Hitman = get_child(4)
onready var Godfather = get_child(5)


func _ready():
	pass


#every frame checks to if a button any button can be enabled
#enables if walet >= button.cost, disables if not
func _process(delta):
	if(wallet >= Gangster.cost):
		enable_gangster(true)
	elif(wallet < Gangster.cost):
		enable_gangster(false)
	
	if(wallet >= Enforcer.cost):
		enable_enforcer(true)
	elif(wallet < Enforcer.cost):
		enable_enforcer(false)
	
	if(wallet >= Framer.cost):
		enable_framer(true)
	elif(wallet < Framer.cost):
		enable_framer(false)
		
	if(wallet >=Consig.cost ):
		enable_consig(true)
	elif(wallet < Consig.cost):
		enable_consig(false)
		
	if(wallet >= Hitman.cost):
		enable_hitman(true)
	elif(wallet < Hitman.cost):
		enable_hitman(false)
	
	if(wallet >= Godfather.cost):
		enable_godfather(true)
	elif(wallet < Godfather.cost):
		enable_godfather(false)
		
		
#increases respect count everytime you click the F button
func _on_F_button_down():
	wallet += 1
	print(wallet)
	
#can also increase wallet with the space bar 
func _input(event):

	if(event.is_action_pressed("ui_select")):
		wallet += 1
		print(wallet)

#signals that enable their respective buttons
func enable_gangster(boolval):
	emit_signal("enable_button", 0, boolval)

func enable_enforcer(boolval):
	emit_signal("enable_button", 1, boolval)
	
func enable_framer(boolval):
	emit_signal("enable_button", 2, boolval)

func enable_consig(boolval):
	emit_signal("enable_button", 3, boolval)
	
func enable_hitman(boolval):
	emit_signal("enable_button", 4, boolval)

func enable_godfather(boolval):
	emit_signal("enable_button", 5, boolval)


#signal recievers for updating wallet based on the production of the buttons
#of the buttons and if anymore buttons are bought
func _on_Gangster_respect_from_gangsters(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Gangster_button_down():
	wallet -= Gangster.cost
	print(wallet)
	
func _on_Enforcer_respect_from_enforcers(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Enforcer_button_down():
	wallet -= Enforcer.cost
	print(wallet)


func _on_Framer_respect_from_framers(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Framer_button_down():
	wallet -= Framer.cost
	print(wallet)


func _on_Consig_respect_from_consigs(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Consig_button_down():
	wallet -= Consig.cost
	print(wallet)


func _on_Hitman_respect_from_hitmen(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Hitman_button_down():
	wallet -= Hitman.cost
	print(wallet)


func _on_Godfather_respect_from_godfathers(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Godfather_button_down():
	wallet -= Godfather.cost
	print(wallet)
