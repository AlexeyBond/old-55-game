extends Node2D

@export var interval: float = 10.0


var passed: float = 0.0
var degenerator: Node2D

var degenerator_scene: PackedScene = preload("res://degenerator.tscn");

func _ready():
	pass

func _process(delta):
	if degenerator != null:
		return

	passed += delta
	if passed >= interval:
		passed = 0.0
		degenerator = degenerator_scene.instantiate()
		degenerator.position = get_node("..").position
		degenerator.done.connect(_on_degenerator_done)
		degenerator.target = get_node("../..")

		get_node("../..").add_child(degenerator)

	get_node("../circle").progress = passed / interval

func _on_degenerator_done():
	degenerator = null
