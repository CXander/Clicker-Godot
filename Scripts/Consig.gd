extends TextureButton

var Consigs = 0
var productionmultiplier = 100
var costmultiplier = 1.0
var basecost = 10000
var cost = basecost*costmultiplier
var respect
signal respect_from_consigs


func _ready():
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Consigs
	emit_signal("respect_from_consigs", respect)


func _on_Consig_button_down():
	Consigs += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Consigs:", Consigs)

func _on_F_enable_button(me, boolval):
	if(me == 3):
		set_disabled(!boolval)

func save():
	var save_dict = {
		Consigs = Consigs
	}
	return save_dict