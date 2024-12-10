class_name Player
extends CharacterBody2D

# Healing should do something cool/fun/stylish if you have no shields!

const HEAL_TIME = 1.5
const SPEED = 300.0

var can_move := true

@onready var shields: Shields = $Shields
@onready var heal_timer: Timer = $HealTimer
@onready var heal_timer_label: Label = $HealTimerLabel #debug


func _ready() -> void:
	heal_timer.wait_time = HEAL_TIME
	heal_timer.timeout.connect(_heal)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("heal"):
		start_healing()
	
	if event.is_action_released("heal"):
		can_move = true
		heal_timer.stop()


func _physics_process(_delta: float) -> void:
	debug_update_heal_timer_label()
	
	if can_move:
		move()


func start_healing() -> void:
	can_move = false
	heal_timer.start()


func _heal() -> void:
	shields.disable_random()
	can_move = true


func move() -> void:
	var direction := Vector2.ZERO 
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()


func debug_update_heal_timer_label() -> void:
	heal_timer_label.text = "%.1f" % heal_timer.time_left