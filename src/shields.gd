class_name Shields
extends Node2D

enum Shield {
	TOP_LEFT,
	TOP_RIGHT,
	BOT_LEFT,
	BOT_RIGHT
}

@onready var top_left: CharacterBody2D = $TopLeft
@onready var top_right: CharacterBody2D = $TopRight
@onready var bot_left: CharacterBody2D = $BotLeft
@onready var bot_right: CharacterBody2D = $BotRight

@onready var shields: Array[CharacterBody2D] = [top_left, top_right, bot_left, bot_right]


func enable_random() -> void:
	var i := randi_range(0, 3)
	enable(i)


func disable_random() -> void:
	var i := randi_range(0, 3)
	disable(i)


func enable(index: Shield) -> void:
	shields[index].show()


func disable(index: Shield) -> void:
	shields[index].hide()
