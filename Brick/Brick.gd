extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")
var row = 0
var col = 0

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()

func update_color():
	if HUD.color_blocks:
		if row == 0:
			$Color.color = Color8(224, 49, 49) #Red 8
		if row == 1:
			$Color.color = Color8(253, 126, 20) # Orange 6
		if row == 2:
			$Color.color = Color8(255, 236, 102) # Yellow 3
		if row == 3:
			$Color.color = Color8(148, 216, 45) # Lime 5
		if row == 4:
			$Color.color = Color8(34, 139, 230) # Blue 6
		if row == 5:
			$Color.color = Color8(132, 94, 247) # Violet 5
		if row == 6:
			$Color.color = Color8(190, 75, 219) # Grape 6
	else:
		$Color.color = Color(1, 1, 1, 1)

func emit_particle(pos):
	if HUD.particle_blocks:
		$Particles2D.global_position = pos
		$Particles2D.emitting = true
	else:
		pass
	
	
func _on_HUD_changed():
	update_color()


func die():
	queue_free()
