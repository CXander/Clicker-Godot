extends TextureButton

var Enforcers = 0
var productionmultiplier = 1
var costmultiplier = 1.0
var basecost = 100
var cost = basecost*costmultiplier
var respect
signal respect_from_enforcers


func _ready():
	pass


func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Enforcers
	emit_signal("respect_from_enforcers", respect)


func _on_Enforcer_button_down():
	Enforcers += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Enforcers:", Enforcers)

func _on_F_enable_button(me, boolval):
	if(me == 1):
		set_disabled(!boolval)