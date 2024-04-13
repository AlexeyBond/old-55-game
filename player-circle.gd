@tool
extends Node2D


@export var radius: float = 128

@export var color: Color = Color.RED * 2.0

@export var progress: float = 0.5

@export var segments: int = 360

@export var stride: int = 113

@export var rot_speed: int = 20

func _process(delta):
	queue_redraw()
	rotate(deg_to_rad(rot_speed * delta))

func _draw():
	if progress < 0.0666:
		return

	draw_arc(Vector2.ZERO, radius, 0, 360, 360, color, 1.0, true)
	draw_arc(Vector2.ZERO, radius - 16, 0, 360, 360, color, 1.0, true)

	for i in range(int(progress * float(segments))):
		var dir = Vector2.UP.rotated(deg_to_rad(i * stride * 360.0 / segments))

		draw_line(
			dir * (radius - 4),
			dir * (radius - 12),
			color, 1.0, true,
		)
