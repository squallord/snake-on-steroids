extends Node2D


class_name Snake

var head: SnakeHead
var body: SnakeBody
var tail: SnakeTail

func _init(world: Node):
	head = SnakeHead.new(world)
	tail = SnakeTail.new(world)
	pass

