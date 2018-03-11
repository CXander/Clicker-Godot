extends TextureButton

var Godfathers = 0
var productionmultiplier = 10000
var costmultiplier = 1.0
var basecost = 1000000
var cost = basecost*costmultiplier
var respect
signal respect_from_godfathers


func _ready():
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Godfathers
	emit_signal("respect_from_godfathers", respect)


func _on_Godfather_button_down():
	Godfathers += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Godfathers:", Godfathers)

func _on_F_enable_button(me, boolval):
	if(me == 5):
		set_disabled(!boolval)