extends TextureButton



var Gangsters = 0
var productionmultiplier = 0.1
var costmultiplier = 1.0
var basecost = 10
var cost = basecost*costmultiplier
var respect
signal respect_from_gangsters


func _ready():
	pass
	
#signal that triggers everytime the timer elapses, 1 second
#sends respect to the main button
func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Gangsters
	emit_signal("respect_from_gangsters", respect)

#signal to indicate the buying of a new button
#updates the amount of buttons, the cost multiplier
#and the total cost
func _on_Gangster_button_down():
	Gangsters += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Gangsters:", Gangsters) 

#gets the enable signal from the main button based on wallet amount
func _on_F_enable_button(me, boolval):
	if(me == 0):
		set_disabled(!boolval)

func save():
	var save_dict = {
		
		Gangsters = Gangsters
	}
	return save_dict

#all child nodes act exactly as this one with differeing base cost


