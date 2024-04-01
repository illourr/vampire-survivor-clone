extends CharacterBody2D

@export var movement_speed = 20.0
@export var hp = 10

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer
var lose_audio = load("res://Audio/SoundEffect/Lose.ogg")

func _ready():
	anim.play("Walk")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()

	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false

	# play death sound one intersection
	#if player.is_in_group('enemy'):
		#print("Collision with player detected!")
		#lose_audio.play()


func _on_hurt_box_hurt(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
