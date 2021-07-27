extends Node


var world : Node
var dirt_array = []
var game_viewport_cell_size : Vector2 # based on shrink parameter
var game_viewport_size : Vector2 # based on actual viewport pixels
var game_camera : Camera2D
var cell : Vector2

func _print_data():
	print ("viewport in cells: " + String(get_viewport().size))
	print ("viewport in pixels: " + String(OS.window_size))
	print ("screen size in pixels: " + String(OS.get_screen_size()))
	print ("camera: " + String(game_camera.get_viewport_rect()))
	pass

func _center_game_window():
	OS.set_window_position((OS.get_screen_size() - OS.window_size) / 2)
	pass

func _ready():
	world = get_tree().get_root().get_node("World")
	game_viewport_cell_size = get_viewport().size
	game_viewport_size = OS.window_size
	game_camera = get_node("Camera2D")
	cell = Vector2(8, 8)
	_center_game_window()
	_print_data()
	_draw_bkg()
	pass

func _draw_bkg():
	#var resource = load("res://assets/scenes/dirt-bkg.tscn")
	var resource = load("res://assets/scenes/dirt-bkg-debug.tscn")
	#var cursor : Vector2 = -cell/2
	var starting_cell : Vector2 = (-game_viewport_cell_size + cell) / 2
	var cursor : Vector2 = starting_cell
	var instance : Node2D
	var i : int = 0
	
	instance = resource.instance()
	instance.set_position(cursor)
	dirt_array.append(instance)
	world.add_child(dirt_array[i])
	
	while cursor.y < game_viewport_cell_size.y:
		if cursor.x > game_viewport_cell_size.x:
			#cursor.x = -cell.x/2
			cursor.x = starting_cell.x - cell.x
			cursor.y += cell.y
		cursor.x += cell.x
		instance = resource.instance()
		instance.set_position(cursor)
		dirt_array.append(instance)
		world.add_child(dirt_array[i])
		i += 1
	pass

func _input(event):
	if event.is_action_pressed("ui_up"):
		print(Snake.new(world).head.instance.name)
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == BUTTON_WHEEL_DOWN:
			game_camera.zoom -= Vector2(-0.02, -0.02)
		if event.button_index == BUTTON_WHEEL_UP:
			game_camera.zoom -= Vector2(0.02, 0.02)
		if event.button_index == BUTTON_LEFT:
			print ("LEFT")
	pass

