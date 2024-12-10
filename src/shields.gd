class_name Shields
extends Node2D

enum Shield {
	TOP_LEFT,
	TOP_RIGHT,
	BOT_LEFT,
	BOT_RIGHT
}

@onready var top_left: Area2D = $TopLeft
@onready var top_right: Area2D = $TopRight
@onready var bot_left: Area2D = $BotLeft
@onready var bot_right: Area2D = $BotRight

@onready var shields: Array[Area2D] = [top_left, top_right, bot_left, bot_right]


func enable(index: Shield) -> void:
	shields[index].show()


func disable(index: Shield) -> void:
	shields[index].hide()