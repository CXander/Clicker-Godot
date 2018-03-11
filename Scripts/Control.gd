extends Control


func quit_game():
	# closes the root scene, quitting the game.
	get_tree().quit()
	
# "func _input(event)" is a special function in Godot that polls the inputting
# device for information every frame.
func _input(event):
	# if the ESC key is pressed, call the "quit_game" function, ending the game
	if(event.is_action_pressed("ui_cancel")):
		print("The game is closing!")
		quit_game()

func _ready():
	pass

