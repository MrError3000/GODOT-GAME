extends KinematicBody2D


var speed = 175
var velocity = Vector2.ZERO
var gravity = 10;
var g_velocity  = 0
var jump_height = -300


func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if is_on_floor():
		g_velocity = 0
		if Input.is_action_pressed("ui_up"):
			g_velocity  = jump_height
	g_velocity += gravity;
	velocity.y += g_velocity;
	velocity = move_and_slide(velocity,Vector2(0,-1))


func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	get_tree().change_scene("res://game_over_1.tscn")
