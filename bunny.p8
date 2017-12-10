pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
in_progress = 0
start_end_game = 1
game_over = 2

left=0 right=1 up=2 down=3
valid_moves = {left,right,up,down}

function _init()
	player = {}
	player.x = flr(rnd(120))
	player.y = flr(rnd(114)+8)
	player.sprite = 1
	player.speed = 2
	
	state = in_progress
	score = 0
end

function move_player()
	for i=1,#valid_moves do
		if btn(valid_moves[i]) then
			move_unit(player,valid_moves[i])
		end
	end
end

function move_unit(unit, direction)	
	if direction == left and unit.x - unit.speed > 0 then
		unit.x -= unit.speed
		unit.sprite = 2
	end
	if direction == right and unit.x + unit.speed < 120 then
		unit.x += unit.speed
		unit.sprite = 1
	end
  	if direction == up and unit.y - unit.speed > 8 then
    	unit.y -= unit.speed
  	end
  	if direction == down and unit.y + unit.speed < 120 then
		unit.y += unit.speed
	end
end

function draw_unit(unit)
	spr(unit.sprite, unit.x, unit.y)
end

function _update()
	move_player()
end

function _draw()
	cls()
	rectfill(0,0,127,127,3)
	if state == in_progress then
		draw_unit(player)
	elseif state == game_over then
		print("you win")
		if btn(4) then
			_init()
		end
	end
end
__gfx__
00000000006006000060060000777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000060060000600600077cc770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000066660000666600071ccc70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000006262600626260007171c70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000006626600662660007171770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000067760000677600071c7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066776000067766007111c70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066776000067766000777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88888888888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8888eee8888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888eee888ee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
56565656565555655656555556665656565656555655555557775555557556555655565555655555565655655655565655655555555555555555555555555555
56565666565555655656555556565656565656655666555555555555577556555665566555655555566555655655566655655555555555555555555555555555
56665656565555655656555556565656566656555556555557775555557556555655565555655575565655655656565655655575555555555555555555555555
55655656566656665666566656565665556556665665555555555555557756665666565555655755565656665666565655655755555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555556565666555556655566565656655775555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555556565656555556565656565656565575555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555556565666555556565656565656565577555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555556565655557556565656566656565575555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555665655575556665665566656565775555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5ee555ee5eee5eee55ee5ee5555555555666566556665666557555755555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555555555565565655655565575555575555555555555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e5e5555e555e55e5e5e5e555555555565565655655565575555575555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555555555565565655655565575555575555555555555555555555555555555555555555555555555555555555555555
5e5555ee5e5e55ee55e55eee5ee55e5e555556665666565656665565557555755555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555566656555666565656665666555555555555557757755555555555555555555555555555555555555555555555555555555555555555555555555555
55555555565656555656565656555656555557775555557555755555555555555555555555555555555555555555555555555555555555555555555555555555
55555555566656555666566656655665555555555555577555775555555555555555555555555555555555555555555555555555555555555555555555555555
55555555565556555656555656555656555557775555557555755555555555555555555555555555555555555555555555555555555555555555555555555555
55555555565556665656566656665656555555555555557757755555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555566656555666565656665666555556565555555555555c555c5c55555555555555555555555555555555555555555555555555555555555555555555
55555555565656555656565656555656555556565555577755555c555c5c55555555555555555555555555555555555555555555555555555555555555555555
55555555566656555666566656655665555555655155555555555ccc5ccc55555555555555555555555555555555555555555555555555555555555555555555
55555555565556555656555656555656555556561715577755555c5c555c55555555555555555555555555555555555555555555555555555555555555555555
55555555565556665656566656665656557556561771555555555ccc555c55555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555551777155555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555566656555666565656665666555556561777715555555c555c5c55555555555555555555555555555555555555555555555555555555555555555555
55555555565656555656565656555656555556561771177755555c555c5c55555555555555555555555555555555555555555555555555555555555555555555
55555555566656555666566656655665555556665117155555555ccc5ccc55555555555555555555555555555555555555555555555555555555555555555555
55555555565556555656555656555656555555565555577755555c5c555c55555555555555555555555555555555555555555555555555555555555555555555
55555555565556665656566656665656557556665555555555555ccc555c55555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5555555556665655566656565666566655555566566656665666566656665555555555555cc55555555555555555555555555555555555555555555555555555
55555555565656555656565656555656555556555656565655655565565555555777555555c55555555555555555555555555555555555555555555555555555
55555555566656555666566656655665555556665666566555655565566555555555555555c55555555555555555555555555555555555555555555555555555
55555555565556555656555656555656555555565655565655655565565555555777555555c55555555555555555555555555555555555555555555555555555
5555555556555666565656665666565655755665565556565666556556665555555555555ccc5555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555556656665666566656665555555555555666566555555666566655665566566656665566556655555555555555555555555555555555555555555555
55555555565555655656556556555555577755555565565655555656565656565655565656555655565555555555555555555555555555555555555555555555
55555555566655655666556556655555555555555565565655555666566556565655566556655666566655555555555555555555555555555555555555555555
55555555555655655656556556555555577755555565565655555655565656565656565656555556555655555555555555555555555555555555555555555555
55555555566555655656556556665555555555555666565656665655565656655666565656665665566555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555556655665566566656665555555555555ccc555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555565556555656565656555555577755555c5c555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555566656555656566556655555555555555c5c555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555656555656565656555555577755555c5c555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555566555665665565656665555555555555ccc555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5ee55ee555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5eee55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5ee555ee5eee5eee55ee5ee5555556665566565656665555566656555666565656665666557555755555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555556665656565656555555565656555656565656555656575555575555555555555555555555555555555555555555
5ee55e5e5e5e5e5555e555e55e5e5e5e555556565656565656655555566656555666566656655665575555575555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555556565656566656555555565556555656555656555656575555575555555555555555555555555555555555555555
5e5555ee5e5e55ee55e55eee5ee55e5e555556565665556556665666565556665656566656665656557555755555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555555eee55ee5eee5555566655555cc5555557575656566656555666566555555666556656565666556655555ee555ee5555555555555555555555555555
555555555e555e5e5e5e55555565577755c5555557775656565656555565565655555666565656565655565555555e5e5e5e5555555555555555555555555555
555555555ee55e5e5ee555555565555555c5555557575656566656555565565655555656565656565665566655555e5e5e5e5555555555555555555555555555
555555555e555e5e5e5e55555565577755c5557557775666565656555565565655555656565656665655555655555e5e5e5e5555555555555555555555555555
555555555e555ee55e5e5555566655555ccc575557575565565656665666566656665656566555655666566555555eee5ee55555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555eee5eee55555bbb5bbb5bb5557556565666565556665665555556665566565656665566577556665577557555555eee5e5e5eee5ee55555
555555555555555555e55e5555555b5b55b55b5b5755565656565655556556565555566656565656565556555755556555575557555555e55e5e5e555e5e5555
555555555555555555e55ee555555bb555b55b5b5755565656665655556556565555565656565656566556665755556555575557555555e55eee5ee55e5e5555
555555555555555555e55e5555555b5b55b55b5b5755566656565655556556565555565656565666565555565755556555575557555555e55e5e5e555e5e5555
55555555555555555eee5e5555555bbb55b55b5b5575556556565666566656665666565656655565566656655775566655775575555555e55e5e5eee5e5e5555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555556665566565656665555565656655666566655755666565556665656566656665555555555555555555555555555555555555555
55555555555555555555555556665656565656555555565656565565556557555656565556565656565556565555555555555555555555555555555555555555
55555555555555555555555556565656565656655555565656565565556557555666565556665666566556655555555555555555555555555555555555555555
55555555555555555555555556565656566656555555565656565565556557555655565556565556565556565575555555555555555555555555555555555555
55555555555555555555555556565665556556665666556656565666556555755655566656565666566656565755555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555656566656555666566555555666556656565666556657755666557755755555
55555555555555555555555555555555555555555555555555555555555555555656565656555565565655555666565656565655565557555565555755575555
55555555555555555555555555555555555555555555555555555555555555555656566656555565565655555656565656565665566657555565555755575555
55555555555555555555555555555555555555555555555555555555555555555666565656555565565655555656565656665655555657555565555755575555
55555555555555555555555555555555555555555555555555555555555555555565565656665666566656665656566555655666566557755666557755755555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822282228882822282228888888888888888888888888888888888888888888888888228822282228882822282288222822288866688
82888828828282888888888282888828888282828888888888888888888888888888888888888888888888888828888288828828828288288282888288888888
82888828828282288888822282228828882282228888888888888888888888888888888888888888888888888828882288828828822288288222822288822288
82888828828282888888828888828828888288828888888888888888888888888888888888888888888888888828888288828828828288288882828888888888
82228222828282228888822282228288822288828888888888888888888888888888888888888888888888888222822288828288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

