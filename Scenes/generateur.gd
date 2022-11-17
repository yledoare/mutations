extends TileMap

func _ready():
	var arr = []
	for i in range(4):
		arr.append([])
		for j in range(9):
			var truc = get_cell_autotile_coord(j, i)
			var t = 6*truc.y + truc.x
			if t == 0:
				t = -1
			arr[-1].append(t)
	print(arr)
