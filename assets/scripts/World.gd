extends Node


var world : Node
var dirt_array = []
var game_viewport : Vector2
var game_camera : Camera2D

func _ready():
	world = get_tree().get_root().get_node("World")
	game_viewport = get_viewport().size
	game_camera = get_child(0)
	game_camera.translate(game_viewport / 2)
	print ("camera: " + String(game_camera.get_viewport_rect()))
	_draw_bkg()
	pass

func _input(event):
	if event.is_action_pressed("ui_up"):
		print(Snake.new(world).head.instance.name)
		pass
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_WHEEL_DOWN:
			game_camera.zoom -= Vector2(-0.02, -0.02)
		if event.button_index == BUTTON_WHEEL_UP:
			game_camera.zoom -= Vector2(0.02, 0.02)
	pass

func _draw_bkg():
	var resource = load("res://assets/scenes/dirt-bkg.tscn")
	var cursor : Vector2 = Vector2(-4, -4)
	var instance : Node2D
	var i : int = 0
	while cursor.y < game_viewport.y:
		if cursor.x > game_viewport.x:
			cursor.x = -4
			cursor.y += 8
		cursor.x += 8
		instance = resource.instance()
		instance.set_position(cursor)
		dirt_array.append(instance)
		world.add_child(dirt_array[i])
		i += 1
		pass
	#instance.name = "snake-head"
	pass
