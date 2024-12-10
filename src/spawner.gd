class_name Spawner
extends Node2D

const HEART = preload("res://src/heart.tscn")
const LIGHTNING = preload("res://src/lightning.tscn")

@onready var screen := get_viewport().get_visible_rect().size

@onready var player: Player = %Player


# func _ready() -> void:
# 	spawn(HEART)
# 	spawn(LIGHTNING)
# 	spawn(HEART)
# 	spawn(HEART)
# 	spawn(HEART)
# 	spawn(HEART)
# 	spawn(HEART)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("heal"):
		spawn(LIGHTNING)
		spawn(LIGHTNING)
		spawn(LIGHTNING)
		spawn(LIGHTNING)
		spawn(LIGHTNING)
		spawn(HEART)
		spawn(HEART)
		spawn(HEART)
		spawn(HEART)
		spawn(HEART)


func spawn(item: Resource) -> void:
	var scene := item.instantiate() as RigidBody2D
	scene.position = get_random_position_ONscreen()
	var direction_to_player := scene.position.direction_to(player.position)
	scene.apply_central_impulse(direction_to_player * 2000)
	scene.apply_torque_impulse(10)
	add_child(scene)


func get_random_position_ONscreen() -> Vector2:
	var pos := Vector2()
	var buffer := 20.0

	pos.x = randf_range(buffer, screen.x - buffer)
	pos.y = randf_range(buffer, screen.y - buffer)

	return pos


func get_random_position_OFFscreen() -> Vector2:
	var quadrant := randi() % 4
	var pos := Vector2()
	var buffer := 20.0

	match quadrant:
		0: #top
			pos.x = randf_range(-buffer, screen.x + buffer)
			pos.y = randf_range(-buffer, 0)
		1: #right
			pos.x = randf_range(screen.x, screen.x + buffer)
			pos.y = randf_range(-buffer, screen.y + buffer)
		2: #bot
			pos.x = randf_range(-buffer, screen.x + buffer)
			pos.y = randf_range(screen.y, screen.y + buffer)
		3: #left
			pos.x = randf_range(-buffer, 0)
			pos.y = randf_range(-buffer, screen.y + buffer)

	return pos