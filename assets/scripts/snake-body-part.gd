extends Area2D


enum BodyPart {HEAD, BODY, TAIL}

class_name SnakeBodyPart

var prev: Node = null
var next: Node = null
var instance: Area2D = null
var bp: int = -1

func _init(world: Node, previous: Area2D, bodyPart: int):
	prev = previous
	var resource: Resource
	match bodyPart:
		BodyPart.HEAD:
			resource = load("res://assets/scenes/snake-head.tscn")
			instance = resource.instance()
			instance.name = "snake-head"
			world.add_child(instance)
			bp = BodyPart.HEAD
		BodyPart.BODY:
			resource = load("res://assets/scenes/snake-body.tscn")
			instance = resource.instance()
			instance.name = "snake-body"
			bp = BodyPart.BODY
		BodyPart.TAIL:
			resource = load("res://assets/scenes/snake-tail.tscn")
			instance = resource.instance()
			instance.name = "snake-tail"
			world.get_node("snake-head").add_child(instance)
			bp = BodyPart.TAIL
	pass
