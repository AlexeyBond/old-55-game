@tool
class_name MagicCircle

extends Node2D

@export var radius: float = 128

@export var color: Color = Color.RED * 2.0

func _ready():
	pass # Replace with function body.


func _process(delta):
	rotate(delta * deg_to_rad(180))
	queue_redraw()

func _draw():
	draw_arc(Vector2.ZERO, radius, 0, 360, 360, color, 1.0, true)

	if radius < 16:
		return

	draw_arc(Vector2.ZERO, radius - 16, 0, 360, 360, color, 1.0, true)

	if radius < 32:
		return

	var t := Time.get_ticks_msec() % 1500
	var k = clamp(float(t) / 250.0, 0.0, 1.0)
	var m = clamp(float(t) / 250.0 - 1.0, 0.0, 1.0)

	for i in range(5):
		var a = i * 360 / 5

		var p = (Vector2.DOWN * (radius - 24)).rotated(deg_to_rad(a))
		var q = p.rotated(deg_to_rad(2 * 360 / 5))

		draw_line(p, q, color, 0.5, true)

		draw_line(
			lerp(p, q, k),
			lerp(p, q, m),
			color, 1.5, true
		)
