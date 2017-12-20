pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
-- drinktender

-- game state
start_screen = 0
in_progress = 1
between_rounds = 2
game_over = 3

-- in-game state
patron_state = 0

no_patron = 0
patron_waiting = 1
patron_served = 2

patron_clock = 30

-- drinks
drinks = {}

rum_coke = {}
rum_coke.num = 1
rum_coke.name = "rum & coke"
rum_coke.rec = {"⬅️","❎"}
drinks[rum_coke.num] = rum_coke

gin_tonic = {}
gin_tonic.num = 1
gin_tonic.name = "gin & tonic"
gin_tonic.rec = {"➡️", "🅾️"}
drinks[gin_tonic.num] = gin_tonic

-- controls
left=0 right=1 up=2 down=3
btnx=4 btno=5

valid_btn = {left,right,up,down,btnx,btno}

-- patrons
simple_drinker = {}
simple_drinker.drinks = {rum_coke, gin_tonic}

function new_game()
  -- new game
  playing_game(level)
end

function playing_game(level)
  draw_ui()
  draw_player()
  draw_patron(level)
end

function draw_player()
  print("im the player",75,121,6)
  for i=1,#valid_btn do
    if btn(valid_btn[i]) then
      mix_drink(valid_btn[i])
    end
  end
end

function mix_drink(button)
  if button == left then
    glyph = "⬅️"
    print(glyph, 70, 110, 3)
  elseif button == right then
    glyph = "➡️"
    print(glyph, 80, 110, 3)
  elseif button == up then
    glyph = "⬆️"
    print(glyph, 90, 110, 3)
  elseif button == down then
    glyph = "⬇️"
    print(glyph, 100, 110, 3)
  elseif button == btno then
    glyph = "🅾️"
    print(glyph, 110, 110, 3)
  elseif button == btnx then
    glyph = "❎"
    print(glyph, 120, 110, 3)
  end
end

function draw_patron(level)
  drink = simple_drinker.drinks[level]
  print("im the patron",2,2,6)
  print("give me",2,10,6)
  --print(level,50,50,5)
  print(drink.name,2,18,6)
  print_rec(drink,2,18)
end

function print_rec(drink,x,y)
  x = x + #drink.name*4
  for i=1,#drink.rec do
    x = x+8
    print(drink.rec[i],x,y)
  end
end

function draw_ui()
end

function draw_start_screen()
  cls()
  print("drinktender")
  print("press ❎ to start")
  if(btn(btnx)) then
    state = in_progress
  end
end

-- loops!
function _init()
  game_state = start_screen
end

function _draw()
  cls()
  if game_state == start_screen then
    draw_start_screen()
  elseif game_state == in_progress then
    playing_game(level)
  end
end
