extends Node2D

var pic = load("res://Scenes/Pic.tscn")
var mechant = load("res://Scenes/méchant2.tscn") 
var plateforme = load("res://Scenes/méchant.tscn")
var x = 0

func _ready():
	$AudioStreamPlayer.play()
	for i in range(7):
		gen_des_structures(0)
	for i in range(5):
		gen_des_structures(1)
	for i in range(4):
		gen_des_structures(2)

func id_du_truc(id):
	return Vector2(id%6, floor(id/6))

func gen_dune_structure(x, y, structure):
	# Génération des blocs
	var struct = structure.slice(0, -2)
	for i in range(len(struct)):
		for j in range(len(struct[i])):
			$TileMap.set_cell(x+j, y+i, 0, false, false, false, id_du_truc(struct[i][j]))
	
	# Génération de l'entité
	var infos_entite = structure[-1]
	if infos_entite[0] == 1:
		var p = pic.instance()
		p.position = $TileMap.map_to_world(Vector2(infos_entite[1]+x, infos_entite[2]+y))
		p.position.y += 8
		$ennemis.add_child(p)
	elif infos_entite[0] == 2:
		var m = mechant.instance()
		m.position = $TileMap.map_to_world(Vector2(infos_entite[1]+x, infos_entite[2]+y))
		m.position.y += 8
		m.est_bugge = true
		$ennemis.add_child(m)
	elif infos_entite[0] == 3:
		var p = plateforme.instance()
		p.position = $TileMap.map_to_world(Vector2(infos_entite[1]+x, infos_entite[2]+y))
		#p.position.y += 8
		$ennemis.add_child(p)
	elif infos_entite[0] == 4:
		for i in range(6):
			var p = pic.instance()
			p.position = $TileMap.map_to_world(Vector2(infos_entite[1]+x+i, infos_entite[2]+y))
			p.position.y += 8
			$ennemis.add_child(p)

func gen_des_structures(type):
	var s1 = [[0, 1, 1, 2], [-1, 4, 4, -1], [1, 2, -1]]
	var s2 = [[-1, 0, 1, 2, 0, 1, 2, -1], [0, 1, 4, 1, 1, 4, 1, 2], [1, 4, 0]]
	var s3 = [[0,1,1,1,1,1,2], [-1,4,4,4,4,4,-1], [2, 2, -1]]
	var s4 = [[-1,-1,-1,-1,-1], [0,1,1,1,2], [1, 2, 0]]
	var s5 = [[-1,-1,3,-1,-1],[0,1,1,1,2],[-1,4,4,4,-1],[0]]
	var s6 = [[0,1,2,-1,-1,-1,0,1,2],[-1,4,-1,-1,-1,-1,-1,4,-1],[-1,4,-1,-1,-1,-1,-1,4,-1],[-1,4,4,4,4,4,4,4,-1],[4,2,2]]
	var s7 = [[-1, -1, -1, -1, -1, -1, 3, -1], [-1, -1, -1, -1, 0, 1, 1, 2], [-1, -1, 0, 1, 1, 4, 4, -1], [0, 1, 1, 4, 4, 4, 4, -1], [1, 4, 1]]
	
	var sb1 = [[-1, 10, 10, -1, 10, 10, -1], [6, 7, 7, 7, 7, 7, 8], [1, 4, 0]]
	var sb2 = [[6, 7, 8, -1, -1, -1, -1, -1], [-1, 5, -1, -1, -1, 6, 7, 8], [-1, 5, -1, -1, 6, 7, 5, -1], [-1, 5, -1, 6, 7, 5, 5, -1], [-1, 5, 5, 5, 5, 5, 5, -1], [2, 2, -1]]
	var sb3 = [[-1, -1, -1, -1, -1], [6, 7, 7, 7, 8], [-1, -1, -1, -1, -1], [-1, -1, 3, -1, -1], [6, 7, 7, 7, 8], [0]]
	var sb4 = [[-1, -1, -1, -1, -1], [6, 7, 7, 7, 8], [-1, 5, 5, 5, -1], [1, 3, 0]]
	var sb5 = [[6, 7, 7, 7, 7, 8], [0]]
	
	var sn1 = [[12, 13, 14, -1, -1, -1, -1, -1, -1, -1, -1, 12, 13, 14], [-1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1], [-1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1], [-1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1], [3, 5, 3]]
	var sn2 = [[12, 13, 14, -1, -1, -1, -1, 12, 13, 14], [-1, 9, -1, -1, 12, 13, 14, -1, 9, -1], [-1, 9, -1, -1, -1, -1, -1, -1, 9, -1], [-1, 9, 9, 9, 9, 9, 9, 9, 9, -1], [4, 3, 2]]
	var sn3 = [[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [-1, 12, 13, 13, 14, -1, -1, 12, 13, 13, 14, -1, -1], [12, 13, 9, 9, 13, 14, 12, 13, 9, 9, 13, 14, -1], [-1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 13, 14], [2, 2, 0]]
	var sn4 = [[-1, -1, -1, -1, -1, -1, -1, -1, 3], [-1, -1, -1, -1, -1, -1, 12, 13, 13], [-1, -1, 10, 12, 13, 13, 14, -1, -1], [12, 13, 13, 14, -1, -1, -1, -1, -1], [1, 2, 2]]
	var structures_normales = [s1, s2, s3, s4, s5, s6, s7]
	var structures_bleues = [sb1, sb2, sb3, sb4, sb5]
	var structures_noires = [sn1, sn2, sn3, sn4]
	
	var l = len(structures_normales)
	var lb = len(structures_bleues)
	var ln = len(structures_noires)
	
	var x_bonus = randi() % 3
	var structure_choisie = []
	if type == 0:
		structure_choisie = structures_normales[randi() % l]
	elif type == 1:
		structure_choisie = structures_bleues[randi() % lb]
	elif type == 2:
		structure_choisie = structures_noires[randi() % ln]
	gen_dune_structure(x + x_bonus, randi() % 2 - 1, structure_choisie)
	x += len(structure_choisie[0]) + x_bonus
