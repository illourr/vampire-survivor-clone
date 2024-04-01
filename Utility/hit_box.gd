extends Area2D

@export var damage = 1
@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableHitBoxTimer

func tempdisable():
	collision.set_deferred("disabled", true)
	disableTimer.play()


func _on_disable_hit_box_timer_timeout():
	collision.set_deferred("disabled", false)
