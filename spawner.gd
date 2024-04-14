extends Node2D

@export var monsterScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = randf_range(5, 15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	var instance: Node2D = monsterScene.instantiate()
	instance.position = self.position
	get_node("../..").add_child(instance)


func _on_timer_timeout():
	$AnimationPlayer.play('run')
