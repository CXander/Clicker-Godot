extends TextureButton

var Hitmen = 0
var productionmultiplier = 1000
var costmultiplier = 1.0
var basecost = 100000
var cost = basecost*costmultiplier
var respect
signal respect_from_hitmen


func _ready():
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Hitmen
	emit_signal("respect_from_hitmen	", respect)


func _on_Hitman_button_down():
	Hitmen += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Hitmen:", Hitmen)

func _on_F_enable_button(me, boolval):
	if(me == 4):
		set_disabled(!boolval)