extends Control

const SAVE_PATH = "res://SAVES/save.json"


func quit_game():
	# closes the root scene, quitting the game.
	get_tree().quit()
	
# "func _input(event)" is a special function in Godot that polls the inputting
# device for information every frame.
func _input(event):
	# if the ESC key is pressed, call the "quit_game" function, ending the game
	if(event.is_action_pressed("ui_cancel")):
		print("The game is closing!")
		save_game()
		quit_game()

func _ready():
	load_game()
	
func save_game():
	#Gets data from persistent nodes
	var save_dict = {}
	var nodes_to_save = get_tree().get_nodes_in_group('persistent')
	for node in nodes_to_save:
		save_dict[node.get_path()] = node.save()
	
	#create save file
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	
	save_file.store_line(to_json(save_dict))
	
	save_file.close()
	
func load_game():
	
	# try to load file, if not return
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return
		
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	
	for node_path in data.keys():
		var node = get_node(node_path)
		
		for attribute in data[node_path]:
			node.set(attribute, data[node_path][attribute])
	
	save_file.close()
	