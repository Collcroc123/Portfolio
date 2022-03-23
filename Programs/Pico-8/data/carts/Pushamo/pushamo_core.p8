pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
tile_size,
boundaries,
dirx,
diry,
_tsmod,
music_patterns,
endstring
=8,
3,
{0,-1,1,0,0},
{0,0,0,-1,1},
1,
{0,10,1,63},
"\npress z for menu,or x for stats"
function _init()
cartdata("pushamo-nuerodiversion")
map()
_menu_init()
shake_strength,
parties,
selection,
default_bag,
back2backbonus
=0,
{},
0,
{},
1
if dget(0)==0 then
first_time_setup()
p_load('pushamo_tutorial')
end
cart_setup()
for i=0,15 do
add(default_bag,i)
end
end
function _update()
thistime,lclick=time(),stat(34)==1 and not lastlclick
_upd()
lastlclick=stat(34)==1
end
function _draw()
cls(1)
camera()
_drawbg(level)
_draw_parties(bg_parties)
resolve_ss()
_grid_draw()
_draw_parties()
_drw()
_draw_parties(last_parties)
draw_with_outline(function() _draw_parties(text_parties)end)
recolor()
color(7)
end
function sfx2(a,b,c,d)
if(dget(4)==1) return
sfx(a,b,c,d)
end
function _game_desc(args)
local index,
func,
s 
=args.index
,args.checkrecord or points_record
,args.pre_desc or "no desc\n"
if(index>=50) index+=dget(3)
return s .."★ best: " .. func(index)
end
function cart_setup()
if stat(6)=="pushamo" then
ms_switch(next_menu)
end
end
function _game_init(setup)
num_pieces=0
srand(setup.seed or thistime)
set_pal_table(setup.palette) 
gridx,
gridy,
clearx,
cleary,
boundaries=
setup.gridx or 11,
setup.gridy or 11,
setup.clearx or 2,
setup.cleary or 2,
setup.boundaries or 3
reset_grid()
make_players(setup.numplayers or 1)
all_families={}
afterspawn,
aftermove,
afterframe,
afterclear,
afterdraw,
afterlevel,
afterstop,
aftergover,
afterinit,
wincond
,levelcond
,checkrecord
,new_record
,level_complete
,level
,speedmulti
,timetolose
,turnbased
,dangerinverse
,un_spawn_tries
,game_bag
,dir_formula
,record_index
,starttime
,score
,blocks_destroyed
,time_elapsed
,last_clear_time
,best_combo
,clears
,shake_strength
,gameover
,gamespeed
,nextspawntime
,functionqueue
,_tsmod
,block_color_overwrite
=
setup.afterspawn or donothing
,setup.aftermove or donothing
,setup.afterframe or donothing
,setup.afterclear or donothing
,setup.afterdraw or donothing
,setup.afterlevel or donothing
,setup.afterstop or function() add(functionqueue,spawn_block) end
,setup.aftergover or donothing
,setup.afterinit or spawn_block
,setup.wincond or  default_wincond or donothing
,setup.levelcond or function() return  score>=level * 50 end
,setup.checkrecord or points_record
,false
,false
,setup.level or 1
,setup.speedmulti or dget(2)
,setup.timetolose or 3
,setup.turnbased
,setup.dangerinverse or false
,setup.un_spawn_tries or 120
,setup.game_bag or default_bag
,setup.dir_formula or dir_default_calc
,setup.index
,thistime
,0
,0
,0
,0
,0
,{}
,0
,false
,3
,0
,{}
,0.0333
,setup.block_color_overwrite
for i=1,16 do
clears[i]=0
end
endonwin
,offsetx
,offsety
,_upd
,_drw
,cannotlose
,blockbag
=
setup.endonwin or checkrecord==time_record
,(128-tile_size*gridx)/2
,(128-tile_size*gridy)/2
,_game_update
,_game_draw
,cannotlose or dget(1)==0
,nil
bag_init()
update_values()
afterinit()
menuitem(1,"return to menu",_menu_init)
end
function _game_update()
for player in all(p) do
player.player_update(player)
end
_block_update()
check_for_match()
level_check()
time_elapsed+=speedmulti*_tsmod
local n=#functionqueue
for i=1,n do
local f=functionqueue[i]
if(f !=nil) f()
del(functionqueue,f)
end
afterframe()
if endonwin and wincond() then
_to_gameover()
_drawbg=bg_spiral
end
end
function points_record(index,multi)
multi=multi or 1
if score and score>dget(index) * multi then
dset(index,score * multi)
new_record=true
end
return tostr(flr(dget(index)*multi)) .. "0 points"
end
function time_record(index)
if level_complete and (playtime<dget(index) or dget(index)<1) then
dset(index,playtime)
new_record=true
end
if dget(index)<=0 then
return points_record(index,-1)
end
return time_to_str(dget(index))
end
function _to_gameover(x,y)
if(gameover) return
level_complete
,playtime
,lastsquare
,gameover
,shake_strength 
,_upd	
,blockbag
,spawnbag
=
wincond()
,thistime-starttime
,{x or p[1].x,y or p[1].y}
,thistime
,3
,_gameover_update
,{}
,{}
if record_index then
checkrecord(record_index)
end
music(-1)
if  level_complete then
_drawbg=bg_spiral
poke(13477,24)
sfx2(9)
else
sfx2(7)
end
aftergover()
end
function resolve_ss()
if not gameover then
_screenshake(2*shake_strength)
shake_strength*=(shake_strength-0.05)
else
_screenshake(shake_strength)
shake_strength=max(0,shake_strength-0.05)
end
end
function _game_draw()
_score_draw()
_show_next()
afterdraw()
_block_draw()
palt(0b0010000000000000)
for player in all(p) do
player_draw(player)
end
palt()
if(gameover) draw_with_outline(_gameover_draw)
end
function grid_to_screen_space(x,y)
return (x-boundaries)*tile_size+offsetx
,(y-boundaries)*tile_size+offsety
end
function _grid_draw()
clip(
offsetx+3,
offsety+3,
122-2*offsetx,
122-2*offsety
)
circfill(63,63,96,7)
local x1,x2,y1,y2,x3,y3,cx,cy
=offsetx-1,
123-offsetx,
offsety-1,
123-offsety,
offsetx+4,
offsety+4,
grid_to_screen_space(otx,oty)
rectfill(x3,y3,x2,y2,0)
fillp(▒)
for i=0,gridy do
local i8=i*8
line(x1+i8,y3,x1+i8,y2,1)
line(x3,y1+i8,x2,y1+i8)
end
if(not gameover) sfx2(7,2,flr(30-20*min(maxot,1)),1)
fillp(░)
circfill(cx,cy,128 * maxot - 0.1,14)
clip()
fillp()
end
function _gameover_update()
if gamespeed<4*score then
make_explode_particles(lastsquare[1],lastsquare[2],.4)
gamespeed+=1
end
if btnp(4) and thistime-gameover>2 then
_menu_init()
end
end
function time_to_str(t)
return flr(t/60) .. ":" .. pad(tostr(flr(t%60)),"0",2)
end
function gameover_stats()
local string="∧" .. gamemode .. "\n"
.. flr(score/blocks_destroyed*100)/10 .. " points per block\n"
.. flr(score/playtime*600) .. " points per min\n"
.. "best combo: " .. best_combo .. "0\n"
.. blocks_destroyed
.. " blocks destroyed\n--------------------\n"
.. clears[1] .. " single pushes\n"
.. clears[2] .. " big pushes\n"
.. clears[3] .. " huge pushes\n"
.. clears[4] .. " mega pushes\n"
local perfect=" perfect"
for i=5,16 do
if clears[i]>0 then
string=string .. clears[i] .. perfect .. " pushes\n"
end
perfect=perfect .. "+"
end
print(string,26,26,7)
return string
end
function _gameover_draw()
if btn(5) then
gameover_stats()	
else
local t=180*min(1,thistime-gameover)
sspr(0,112,39,16,t-142,46)
sspr(overx or 65,overy or 112,39,16,232-t,64)
if(level_complete) print("★stage clear★",222-t,81,3)
if(new_record) print("★high score★",t-150,40,9)
if(thistime-gameover>3)  print(endstring,1,116,7)
end
end
function gradual_increase(t)
local pt=(t-1)/4
local e,f=4-flr(pt),
1<<flr(pt)
return e-2*pt/f
end
function level_check()
if levelcond() then
level_up()
end
end
function level_up()
if (level>=16) return
sfx2(6,2)
level+=1
update_values()
levelup_party()
end
function update_values()
gamespeed
,blockspeed
=
1+gradual_increase(level)
,2+gradual_increase(16-level)
afterlevel()
end
function donothing()
return false
end
function flr_rnd(x)
return flr(rnd(x))
end
function reset_grid(x,y)
grid={}
for x=0,gridx+2*boundaries do
local ycol={}
for y=0,gridy+2*boundaries do
add(ycol,-1)
end
add(grid,ycol)
end
end
function is_space_in_bounds_of_region(x,y,a,b)
a,b= a or 0,b or 0
if(x<a or y<b) return false
if(x>=gridx+2*boundaries-a or y>=gridy+2*boundaries-b) return false
return true
end
function is_space_full(x,y)
if (not is_space_in_bounds_of_region(x,y)) return false
local output=grid[x+1][y+1]
if(output==-1) return false
return output
end
function is_space_empty_or_same_family(x,y,f)
local b=is_space_full(x,y)
if(b==false) return true
if(b.family==f) return true
return false
end
function enter_space(x,y,s)
grid[x+1][y+1],
s.x,
s.y
=
s,x,y
end
function exit_space(x,y) 
grid[x+1][y+1]=-1
end
function try_move(x,y,d,pushchain)
if(not is_space_full(x,y)) return true
local newx,newy,cx,cy=
x+dirx[d],y+diry[d]
,boundaries+gridx/2,boundaries+gridy/2
if(pushchain>=1 and not is_space_in_bounds_of_region(newx,newy,boundaries-2,boundaries-2)) return false
if(not is_space_in_bounds_of_region(newx,newy)) return false
if is_space_full(newx,newy) then
local family=is_space_full(newx,newy).family
if(family==is_space_full(x,y).family) return true
return canpush_family(family,d,pushchain)
end
return true
end
function try_pull(p)
if(not p.pull) return
local x,y=p.x-2*dirx[p.direction],p.y-2*diry[p.direction]
if(not is_space_in_bounds_of_region(x,y)) return
local b=grid[x+1][y+1]
if(b !=-1 and canpush_family(b.family,p.direction)) push_family(b.family,p.direction)
end
function execute_push(x,y,d)
if(not is_space_full(x,y)) return
if(not is_space_full(x+dirx[d],y+diry[d])) return
local nextsquarefamily=grid[x+dirx[d]+1][y+diry[d]+1].family
if(grid[x+1][y+1].family==nextsquarefamily) return
push_family(nextsquarefamily,d)
sfx2(4,2)
end
function canpush_family(family,d,pushchain)
if(family.notpushable) return false
if(family.pushtry==thistime) return true
family.pushtry=thistime
local family_trymove=false
for b in all(family) do
local result=	try_move(b.x,b.y,d,pushchain+1)
if(not result) return false
end
return true
end
function push_family(f,d)
if f.ismoving then
family_stop(f)
end
for b in all(f) do
if(not b.player_update) b.speed=p[1].speed*1.2
execute_push(
b.x,
b.y,
d
)
end
for b in all(f) do
exit_space(b.x,b.y)
end
for b in all(f) do
enter_space(b.x+dirx[d],b.y+diry[d],b)
b.direction,b.t=d,1
end
f.direction=d
end
function back2back()
local output=time_elapsed<last_clear_time+3
if(not output) back2backbonus=1
return output
end
function check_for_match()
squareList={}
for x=1,gridx+2*boundaries-1 do
for y=1,gridy+2*boundaries-1 do
if space_is_occupied_and_clearable(x,y) then
if check_for_rect(x,y) then
add(squareList,{x=x,y=y})
end
end
end
end
local matches,points,num_fam
=#squareList
,score
,#all_families
risky,auto,
match_pattern,match_color,
families_in_clear,
clear_color1,
clear_color2,
clear_shape
=
false,false,
true,true,
{},
-1,-1,-1
for b in all(squareList) do
get_families_in_clear(b.x,b.y)
end
for b in all(squareList) do
remove3x3(b.x,b.y)
end
local tidy,num_parties=
#families_in_clear==num_fam-#all_families
,#parties
if matches>0 then
local additional={}
if back2back() then
add(additional,{197,3})
for i=1,back2backbonus do
add(additional,{196,4})
score+=3
end
back2backbonus+=1
end
if(match_pattern) add(additional,{168,4}) score+=3
if(match_color) add(additional,{172,4}) score+=3
if(match_pattern or match_color) add(additional,{186,6})
if(tidy) add(additional,{200,3}) score+=3
if(risky) add(additional,{179,4}) score+=3
if(auto) add(additional,{183,3}) score+=3
if(test_all_clear()) sprite_from_bottom(221,3,2) score+=3
score+=matches*matches
points=score-points
clears[min(matches,15)]+=1
best_combo=max(points,best_combo)
local x,y=
squareList[1].x
+squareList[#squareList].x
,squareList[1].y
parties[num_parties].on_destroy=function()
combo_party(
matches,
points,
x/2,y,
additional
)
end
shake_strength,last_clear_time=1,time_elapsed
poke(13477,8+matches)
sfx2(9,3)
afterclear(points)
end
end
function test_all_clear()
local all_clear=true
for item in all(all_families) do
all_clear=all_clear and item.ismoving and #item>0
end
return all_clear
end
function check_for_rect(left,top)
for x=0,clearx do
for y=0,cleary do
if(not space_is_occupied_and_clearable(left+x,top+y)) return false
end
end
return true
end
function get_families_in_clear(left,top)
for x=0,clearx do
for y=0,cleary do
local b=is_space_full(left+x,top+y)
if b then
del(families_in_clear,b.family)
add(families_in_clear,b.family)
end
end
end
return true
end
function remove3x3(left,top)
for x=0,clearx do
for y=0,cleary do
local b=grid[left+x+1][y+top+1]
if type(b)=="table" then
local originx,originy,fam
=
squareList[1].x,
squareList[1].y
,b.family
local distance
,c1
,c2
,s
=
abs(originx-b.x)+abs(originy-b.y)
,reverse_color(fam.color_2)
,reverse_color(fam.color_1)
,b.sprite
local x,y=grid_to_screen_space(b.x,b.y)
if(clear_shape>0) match_pattern=match_pattern and s==clear_shape
if(clear_color1>0) match_color=match_color and c1==clear_color1
risky,
auto,
clear_shape,
clear_color1
=
risky or not is_space_in_bounds_of_region(b.x,b.y,boundaries,boundaries)
,auto or (fam.ismoving and b.family.hasstartedmoving)
,s
,c1
new_party(
spr,
.5+distance/12
,{b.sprite,x,y}
,{{16,59,15,14,13,0,58}}
,nil
,nil
,true
)
end
remove_block(b)
end
end
return risky,auto,match_pattern,match_color
end
function space_is_occupied_and_clearable(x,y)
local b=is_space_full(x,y)
return b and b.t<=.5 and b.clearable
end
function make_players(args)
p={ }
for i=1,args do
new_player(9-i,9-i)
end
end
function new_player(x,y)
if(is_space_full(x,y)) return nil
local player={
t=0,
direction=3,
speed=8,
sprite=60,
s=60+32*#p
,family={},
on_destroy=function(self) 
_to_gameover(self.x,self.y)
end,
player_update=player_input,
id=#p+1
,canmove=true
,gx=x
,gy=y
,newp=0
,lastp={false,false,false,false}
}
player.family=player
add(player,player)
enter_space(x,y,player)
add(p,player)
return player
end
function player_input(player)
make_trail_particles(player)
if (dget(3)==1) use_items(player)
local multi=player.q==1 and 2 or 1
player.q,np=1,player.newp+1
for i=np,np+3 do
local b=i%4
local button_hold=btn(b,player.id-1)
if button_hold then
player.q=b+2
end
if(not player.lastp[b+1] and button_hold) player.newp=b
player.lastp[b+1]=button_hold
end
new_do_move(player,player.q,multi)
local force=8-4*player.t
player.gx+=(player.x-player.gx)/force
player.gy+=(player.y-player.gy)/force
end
function new_do_move(player,d,multi)
local x,y=player.x,player.y
player.sprite=player.s+player.direction-2
if player.t>0 then
local dx,dy=player.gx-x,player.gy-y
if(abs(dx)<0.5 and abs(dy)<0.5) player.t=0
return
end
if(not player.canmove) return
if(d==1 or d==nil) return
player.sprite+=16
local s=player.speed*_tsmod * multi
player.gx+=dirx[d] * s
player.gy+=diry[d] * s
local nx,ny=
flr(player.gx+.5)
,flr(player.gy+.5)	
if nx !=x or ny !=y then
if try_move(x,y,d,0) or player.ghost then
sfx2(5,2)
player.direction,player.t=d,0
if not player.ghost then
execute_push(x,y,d)
exit_space(x,y)
enter_space(nx,ny,player)
try_pull(player)
else
player.x,player.y=nx,ny
end
aftermove()
else
player.gx-=dirx[d]*s
player.gy-=diry[d]*s
end
end
end
function new_family(fx,fy,fs,fd,sourcex,sourcey,skipanim)
?"",0,0 
sourcex,sourcey=
sourcex or 32,
sourcey or 24
local power_fam={
spawn_time=time_elapsed
,ismoving=true
,color_1=5
,color_2=6
,on_stop=donothing
,delay=gamespeed
,on_destroy=donothing
,direction=fd
}
for x=0,3 do
for y=0,3 do
if sget(x+sourcex,y+sourcey)==7 then
if is_space_full(fx+x,fy+y) then
return
end
local power_block={
x=fx+x,
y=fy+y,
t=0,
direction=fd,
speed=blockspeed,
sprite=flr(fs),
family=power_fam,
on_destroy=function() score+=1 end,
clearable=true,
outside_time=0
}
add(power_fam,power_block)
end
end
end
add(power_fam,power_block)
add(all_families,power_fam)
for b in all(power_fam) do
enter_space(b.x,b.y,b)
if not skipanim then
sfx2(3,0)
local dx=dirx[b.direction]
local dy=diry[b.direction]
local gx,gy=grid_to_screen_space(b.x-8*dx,b.y-8*dy)
local p=new_party(
rectfill,
gamespeed
,{gx-3,gy-3,gx+10,gy+10,14}
,{nil,nil,dx<<3,dy<<3,{14,14,14,15}}
,nil
,bg_parties
,true
)
p.before,p.after,b.party
=function() fillp(▒) end,
function() fillp() end,
p
end
end
if(#power_fam>1) set_corners(power_fam)
return power_fam
end
function set_corners(family)
for b in all (family) do
local neighbors=32
for i=2,5 do
local tx,ty=b.x+dirx[i],b.y+diry[i]
if is_space_full(tx,ty) and is_space_empty_or_same_family(tx,ty,family) then
neighbors+=1<<i-2
end
end
if  neighbors==32 and #family>1 then
local newfamily=shallow_copy(family)
add(newfamily,b)
del(family,b)
b.family=newfamily
add(all_families,newfamily)
end
b.neighbors=neighbors
end
end
function spawn_block()
local np=bag_peek()
local newf=spawn_block_det(np)
if type(newf)=="table" then 
bag_pull()
unsuccesful_spawns=0
else
if unsuccesful_spawns>un_spawn_tries then
_to_gameover(gridx+boundaries,gridy+boundaries)
end
unsuccesful_spawns+=1
end
end
function spawn_block_det(pieceID,sprite,color_1,skipanim)
if(not pieceID) return
pieceID=flr(pieceID)
local shapex,shapey=get_shapexy(pieceID)
local spawn=random_spawn_and_dir(pieceID,shapex,shapey)
local direction=spawn.direction
local fam=new_family(
spawn.x,
spawn.y,
sprite or 15+level,
direction,
shapex,
shapey,skipanim)
if not fam then
if(not sprite) add(functionqueue,spawn_block)
return nil
end
local colors=pick_colors(pieceID)
fam.color_1,
fam.color_2,
fam.on_stop,
fam.notpushable
=
block_color_overwrite or colors.a
,block_color_overwrite or color_1 or colors.b
,afterstop
,not turnbased
afterspawn()
return fam
end
function get_shapexy(piece)
local shapey=24+4 * (piece%2)
local shapex=4 * flr(piece/2)
return shapex,shapey
end
function random_spawn_and_dir(a)
local direction=dir_formula(a)
local spawnpos=	flr_rnd(min(gridy,gridx)-6)+2
local spawnx,spawny=
direction==2 and gridx or direction==3 and-2 or spawnpos,
direction==4 and gridx or direction==5 and-2 or spawnpos
local output={
x=spawnx+boundaries,
y=spawny+boundaries,
direction=direction
}
return output
end
function force_spawn(a,b,c,d)
local block
while(not block) do
block=spawn_block_det(a,b,c,d)
end
return block
end
function spawn_in_place(a,b,c,x,y)
local f=force_spawn(a,b,c,true)
f.on_stop=donothing
family_stop(f)
local dx,dy=x-f[1].x,y-f[1].y
for b in all(f) do
exit_space(b.x,b.y)
enter_space(b.x+dx,b.y+dy,b)
end
return f
end
function _block_update()
for f in all (all_families) do
if #f==0 then
f.on_destroy(f)
del(all_families,f)
elseif f.spawn_time+f.delay<time_elapsed or not f.ismoving then
f.hasstartedmoving=true
if f.ismoving then
_family_move(f)
else 
_family_danger_check(f)
end
end
end
end
function _family_danger_check(f)
local output=false
for b in all (f) do
local danger=is_space_in_bounds_of_region(b.x,b.y,boundaries,boundaries)
danger=danger~=dangerinverse
output=output or danger
if not danger then
if b.t==0 then
b.outside_time+=speedmulti*_tsmod
if(b.outside_time>timetolose and not cannotlose) _to_gameover(b.x,b.y)
end
else
b.outside_time=0
end
end
return output
end
function _family_move(f)
if(not f) return
for b in all (f) do
make_trail_particles(b)
end
local canmove=true
for b in all (f) do
if(b.t>0) return
local newx,newy=b.x+dirx[b.direction]
,b.y+diry[b.direction]
if not is_space_in_bounds_of_region(newx,newy,1,1) then
family_stop(b.family)
return
end
if not is_space_empty_or_same_family(newx,newy,b.family) then
local c=is_space_full(newx,newy)
if(c.direction==b.direction and c.family.ismoving) return
family_stop(b.family)
return
end
end
if canmove then
for b in all (f) do
exit_space(b.x,b.y)
end
for b in all (f) do
enter_space(
b.x+dirx[b.direction],
b.y+diry[b.direction],
b
)
b.t=1
end
end
if(turnbased) f.spawn_time+=0.5
end
function family_stop(f)
if(not f.ismoving) return
f.ismoving=false
f.notpushable=false
set_corners(f)
f.on_stop(f)
for b in all(f) do	
if(b.party) b.party.birthday=0
end
end
function remove_block(b)
if(b==-1 or not b) return
local family=b.family
del(b.family,b)
if #b.family==0 then
b.family.on_destroy(b)
del(all_families,b.family)
b.family=nil
end
grid[b.x+1][b.y+1]=-1
b.on_destroy(b)
family_stop(family)
set_corners(family)
local gx,gy=grid_to_screen_space(b.x,b.y)
b=nil
blocks_destroyed+=1
end
maxot,otx,oty=0,0,0
function _block_draw()
print("",0,0,8)
local newot=maxot * .9
for f in all(all_families) do
local dx,dy=0,0
if f.ismoving then
pal()
local timesincespawn=f.spawn_time-time_elapsed+1
if turnbased then
if(thistime%.5>.25 and f.spawn_time+f.delay<time_elapsed+.12) pal(6,10)
else
timesincespawn=max(timesincespawn)
if(timesincespawn==0) f.notpushable=false
dx-=dirx[f.direction] * timesincespawn^2 * 16
dy-=diry[f.direction] * timesincespawn^2 * 16			
end
else
pal(5,f.color_1)
pal(6,f.color_2)
local ot=0
for b in all(f) do
if not gameover then
ot=max(ot,b.outside_time/timetolose)
if(ot>newot) newot=ot otx=b.x oty=b.y
end
end
if ot>0 then
ot=min(ot+1.5,3.5)
dx,dy=rnd(2*ot)-ot,rnd(2*ot)-ot
end
end
for b in all(f) do
sprite_draw(b,dx,dy)	
end
end
if newot<.9 and maxot>.9 and not gameover then
sprite_from_bottom(204,4,2)
score+=1
end
maxot=newot
pal()
end
function shallow_copy(t)
local t2={}
for k,v in pairs(t) do
if(type(v) !="table") t2[k]=v
end
t2.on_destroy=donothing
return t2
end
function _screenshake(size)
local ssmod=dget(6)
if(ssmod<0.15) return
size *=ssmod
camera(
size * sin(thistime*2),
size * cos(thistime*3)
)
end
function getgxgy(b)
local t=b.t^3
return {
gx=b.x-dirx[b.direction] * t,
gy=b.y-diry[b.direction] * t
}
end
function player_draw(p)
local x,y=grid_to_screen_space(p.gx,p.gy)
spr(p.sprite_overwrite or p.sprite,x+.5,y+.5)
end
function sprite_draw(s,offx,offy)
local gxy=getgxgy(s)
local x,y=grid_to_screen_space(gxy.gx,gxy.gy)
offx,offy=offx or 0,offy or 0
x+=offx
y+=offy
if(s.neighbors) spr(s.neighbors,x,y) 
spr(s.sprite,x,y)
if(s.text) print(s.text,x+2,y+1,7)
s.t=max(s.t-s.speed*_tsmod)
end
function pad(s,c,n)
while(#s<n) do
s=c .. s
end
return s
end
function _score_draw()
rectfill(2,2,22,18,0)
print(
"score\n"
..pad(score..0,'0',5)
.."\nlvl"..pad(tostr(level),'0',2)
,3,2,6)
local timestr=tostr(flr(time_elapsed))
if(not gameover) playtime=thistime-starttime
rectfill(106,2,126,12,0)
print("time:\n" .. time_to_str(playtime),107,2,6)
end
function draw_with_outline(func)
local x,y=peek2(0x5f28),peek2(0x5f2a)
for i=0,4 do
if i<4 then
for j=0,15 do
pal(j,0)
end
end
func()
poke2(0x5f28,x+flr(i/2))
poke2(0x5f2a,y+i%2)
pal()
end
poke2(0x5f28,x)
poke2(0x5f2a,y)
end
parties,
last_parties,
text_parties
={},{},{}
function new_party(f,l,v,dv,ddv,p,overwrite)
if (dget(7)<.11 and not overwrite) return
p=p or parties
local party={
func=f,
lifespan=l,
vals=v,
dvals=dv,
ddvals=ddv,
birthday=thistime,
update=party_update,
table=p
}
add(p,party)
return party
end
function party_update(self)
local	lifelived=
(thistime-self.birthday)/self.lifespan
if lifelived>1 then
if(self.on_destroy) self.on_destroy()
del(self.table,self)
return
end
if(self.before) self.before()
self.func(unpack(self.vals))
if(self.after) self.after()
if(self.dvals) p_change_over_time(self.vals,self.dvals,lifelived)
if(self.ddvals) p_change_over_time(self.dvals,self.ddvals,lifelived)
end
function p_change_over_time(v,dv,l)
for i=1,#dv do
local t=type(dv[i])
if t=="number" then
v[i]+=dv[i]
elseif t=="table" then
local index=flr(l*#dv[i])
local newval=dv[i][index+1]
v[i]=newval
elseif t=="function" then
v[i]+=dv[i](l)
end
end
end
function _draw_parties(p)
p=p or parties
for party in all(p) do
party:update()
end
end
function party_vibrate(pos,size)
return pos+rnd(size)
end
function make_trail_particles(s,c,m)
local gxy=getgxgy(s)
local x,y=grid_to_screen_space(gxy.gx,gxy.gy)
make_trail_partcles2(x,y,c,m)
end
function make_trail_partcles2(x,y,c,m)	
x+=rnd(2)+2
y+=rnd(2)+2
c,m=
c or {6,5},
m or .2
new_party(
pset,
m,
{x,y,7},
{nil,nil,c}
)
end
function make_explode_text(str,x,y,c,d,g)
local t,gx,gy=d or  rnd(.5),grid_to_screen_space(x,y)
new_party(
print
,2
,{str,gx,gy,c or 7}
,{nil,cos(t),3*sin(t)}
,{nil,nil,g or.16}
,last_parties
)
end
function make_explode_particles(x,y,n)
pmod2,x,y=n or 1,
grid_to_screen_space(x+.5,y+.5)
local n=10.1* dget(7) * pmod2
for i=1,n do
local d,v,r=rnd(.5)
,rnd(3)
,1+rnd(2)
local s=r
new_party(
circ,
s,
{x,y,r,14}
,{v*cos(d),2*v*sin(d),-.033,{14,15,13,13}}
,{nil,0.16}
)
end
end
function levelup_party()
sprite_from_bottom(162,6,1)
party_party(2)
end
function party_party(n)
n *=n * dget(7)
for i=1,n do
local x=i/n * gridx
make_explode_particles(x+2,gridy+2)
end
end
function jiggle()
return rnd()-.5
end
function combo_party(n,points,lx,ly,additional)
local x,y=grid_to_screen_space(lx,ly)
for i=1,n*dget(7) do
make_explode_text(points .. "0",lx,ly-.75)
end
if(n>1) add(additional,{128+16*min(n,5),min(n,12)})
add(additional,{253,3})
if(#additional==1) return
make_explode_particles(lx+1,ly-1,points/5-3)
for item in all(additional) do
rising_sprite(item[1],x,y,item[2],#additional+n)
y+=9
end
end
function rising_sprite(n,x,y,w,l)
new_party(
spr
,l/4
,{n,x-4*w+12,y,w,1}
,{nil,nil,-.25/l}
,nil
,text_parties
)
end
function sprite_from_bottom(n,w,h)
local m=128-8*w
local x=rnd(m)
new_party(
spr
,3
,{n,x,128,w,h}
,{nil, (m/2-x)/60,-3-rnd()}
,{nil,nil,.16}
,last_parties
)
end
function first_time_setup()
for i=0,63 do
dset(i,0)
end
dset(0,1)
dset(1,1)
dset(2,1)
--dset(5,1)
dset(6,1)
dset(7,1)
end
function _reset_all()
dset(0,0)
first_time_setup()
shake_strength=1
ms_return()
ms_return()
end
function _menu_init()
palt(13,true)
music_patterns[1] = music_patterns[flr_rnd(#music_patterns-2)+2]
gridx,gridy,
timetolose,last_music,
playtime,score,level,
level_complete,
highscore,
gameover
,_upd,_drw
=11,11,1,-1,
nil,nil,nil,nil,nil,false
,_menu_update
,_menu_draw
offsetx,offsety,
_drawbg,
shake_strength,
maxot,
lastsel,
_m_active
=
(128-tile_size*gridx)/2,
(128-tile_size*gridy)/2,
_regular_bg
,0,0,0,
_m_active or _ms_main
menuitem(1)
set_pal_table(rnd())
end
function bindvar(i,bound)
return (i+bound)%bound
end
function _menu_update()
local m=music_patterns[dget(5)+1]
if(stat(24) !=m+stat(25)) music(m)
local input=btnp()
selection+=input>>3 & 1
selection-=input>>2 & 1
selection=
bindvar(selection,#_m_active)
menitem=_m_active[selection+1]
if menitem.bound then
local sel=		dget(menitem.index)
local increment=menitem.increment or 1
sel-=(input & 1) * increment
sel+=(input>>1 & 1) * increment
if(lclick) sel+=mid(-1,1,flr(stat(32)/32-1.5)) * increment
sel=bindvar(sel,menitem.bound)
dset(menitem.index,sel)
end
if btnp(5) then
ms_return()
end 
if(selection !=lastsel) sfx2(3)
lastsel=selection
local condition=_m_active.condition or menitem.condition
if(condition and condition(selection+1) and dget(0) !=2) return
if btnp(4) or lclick then
local func,args=menitem.click or _m_active.click or function() shake_strength=1 end
,menitem.arg
func(args)
gamemode=menitem.text
end
end
function _menu_draw()
sspr(0,112,74,16,27,4)
for i=1,#_m_active do
local m=_m_active[i]
local t=m.text or m[1]
local x,y,c,desc,condition=
65-4*#t/2
,20+i*7
,6
,m.desc or _m_active.desc or m[2]
,_m_active.condition or m.condition
if(condition and condition(i) and dget(0) !=2) desc,c=m.lockdesc or _m_active.lockdesc or desc,5
if selection+1==i then
if(menitem.bound) t="<" .. t .. ">" x-=4
if(type(desc)=="function") desc=desc(m.arg,m.index,i)
print(desc,25,_m_active.desc_ypos or 80,c)
if(c==6) c=12
rectfill(24,y-1,103,y+5,1)
x+=2*sin(thistime)
end
print(t,x,y,c)
end
end
function ms_switch(ms)
add(menustack,_m_active)
selection,_m_active=0,ms
end
function ms_return()
selection=0
local ms=menustack[#menustack] or _ms_main
del(menustack,ms)
_m_active=ms
end
back_option={text="back",desc="return to the\nprevious menu",click=ms_return}
function bag_init()
shuffle(0)
for item in all(game_bag) do
add(blockbag,item,flr_rnd(#blockbag-#game_bag)+#game_bag)
end
shuffle(#game_bag)
end
function shuffle(value)
local oldbag=blockbag or game_bag
local newbag={}
for item in all(oldbag) do
add(newbag,item,flr_rnd(#newbag)+1)
end
for i=1,value do
local item=oldbag[i]
del(newbag,item)
add(newbag,item,i)
end
blockbag=newbag
end
function bag_peek()
return blockbag[1]
end
function bag_pull()
local nextp=blockbag[1]
del(blockbag,nextp)
add(blockbag,nextp)
num_pieces+=1
local value=#blockbag/2
if num_pieces % value==0 then
shuffle(value)
end
return nextp
end
function dir_default_calc(a)
return 2+flr((a%4)/2)+2*(a%2)
end
function _show_next()
fillp(░)
circfill(115,115,(unsuccesful_spawns or 1)/ un_spawn_tries * 120,15)
fillp()
if(not blockbag or not blockbag[1]) return
rectfill(108,102,125,125,1)
rect(108,102,125,125,6)
line(108,119,125,119)
for i=2,4 do
local item=blockbag[i]
mini_spr(
0+4*flr(item/2),
24+4*(item%2),
100+5*i,
121
,1
)
end
local item=blockbag[1]
local direction=dir_formula(item)
palt(0,false)
spr(5,113,107)
pal()
pal(7,15-flr(item/8)%2)
mini_spr(
0+4*flr(item/2),
24+4*(item%2),
115-6 * dirx[direction],
109-6 * diry[direction]
,2
)
palt()
pal()
end
function mini_spr(sx,sy,dx,dy,mag)
sspr(sx,sy,4,4,dx,dy,4*mag,4*mag)
end
bg_parties,bgtime={},0
function _plasma_draw(level)
local dt=(level or 1)+3
bgtime+=dt/120
local colors,t=
{0,13,1,13,1},bgtime/12
local sint,cost=
sin(t/15)/120,cos(t/17)/180
for x=0,63 do
local xsint=x*sint
for y=0,63 do
local v=sin((xsint+y*cost)*8+t)
v *=cos(x/53+y/57)
v=flr((v+1)*2.5)
pset(x<<1,y<<1,colors[v+1])
end
end
end
function bg_spiral()
if(dget(11)==#all_bgs) return
for i=1,12 do 
local u=i+flr(thistime)
local sini,cosi=
sin(u/12),cos(u/12)
for j=1,96 do
circfill(63+j*cosi,63+j*sini,j/3,1+12*(i%2))
end
end
end
function bg_take2(level)
end
all_bgs={
_plasma_draw
,donothing
}
function _regular_bg(i)
all_bgs[dget(11)+1](i)
end
_drawbg=_regular_bg
bcolors={2,15,14,11}
paltable={0,10,141,7}
function set_pal_table(seed)
if  not seed then
local val=dget(12)
seed=val==0 and flr_rnd(16) or val>=3 and val-3 or flr_rnd(8)+val*8-8
end
paltable={}
for x=0,3 do
local c=mget(x,seed)
add(paltable,c)
end
end
function recolor()
for i=1,4 do
if (paltable) pal(bcolors[i],paltable[i],1)
end
end
function pick_colors(id)
local n=2+flr(id/8)%2
local dx=flr(id/4)%2
return {
b=bcolors[n],
a=bcolors[n+2*dx-1]
}
end
function reverse_color(c)
for i=1,4 do
if(c==bcolors[i]) return paltable[i]
end
return c
end
function getvalue(id,table)
local string=dget(id)
if(table) string=table[string+1]
return "\ncurrently: " .. tostr(string)
end
menustack,
bool_to_string
=
{},
{"enabled","disabled"}
function p_load(cart)
load(cart,nil,"pushamo")
end
_ms_credits={
{"bean borg","created by bean borg\ntwitter: @beanborg\n@neurodiversion\nthey/them"}
,{"emma ewert","elyon.itch.io\ncomposed music and\ngave so much support\nshe/her"}
,{"gruber","grubermusic.com\ncomposed main theme\n\nhe/him"}
--,{"trailer"}
,{"additional support","georgia game devs,\ntransdevs discord,\npico-8 community,\nand,of course,you!"}
,back_option
}
_ms_main={
click=ms_switch,
{"arcade","an original formula:\npush blocks,\nform squares,\nor die trying!",arg='pushamo_arcade',click=p_load}
,{"challenges","play hand-crafted\nscenarios which\neach have their own\nrule variations",arg='pushamo_scenario',click=p_load}
,{"puzzles","a thinky experiene:\ntry and sort shapes\ninto one huge combo\nwith no time limit",arg='pushamo_puzzles',click=p_load}
,{"settings","\nchange the sounds,\nvisuals,effects,\nand save data",click=function() load('pushamo_tutorial',nil,"settings") end}
,{"tutorial","learn (or re-learn)\ncore mechanics\nsuch as pushing,\nclears,and combos",arg='pushamo_tutorial',click=p_load}
,{"credits","\ncheck out the\nawesome folks\nwho created pushamo",arg=_ms_credits}
}
__gfx__
066666000eeeee000eeeee000fffff000fffff006666666600000000000000000000000000000000000000000000000000000001066666000666660006666600
66000660eefffee0eebbbee0ff222ff0ffeeeff06000000600000000000000000000000000000000000000010000000100000001666066606666666066666660
60000060efffffe0ebbbbbe0f22222f0feeeeef06010101600000000000000000000000000000001000000000000000100000001660006606600066066606660
60000060efffffe0ebbbbbe0f22222f0feeeeef06000000600000000000000000000000100000000000000010000000100000001600000606600066066000660
60000060efffffe0ebbbbbe0f22222f0feeeeef06010101600000000000000000000000000000001000000000000000100000001660006606600066066606660
66000660eefffee0eebbbee0ff222ff0ffeeeff06000000600000000000000000000000000000000000000010000000100000001666066606666666066666660
066666000eeeee000eeeee000fffff000fffff006010101600000000000000000000000000000000000000000000000000000001066666000666660006666600
00000000000000000000000000000000000000006666666600000000000000000001000100101001010101010111110111111111000000000000000000000000
06666600066666000666660006666600066666000666660006666600066666000666660006666600066666000666660006666600066666000666660006666600
66666660665556606665666066666660666666606655566066656660666666606666666066565660665656605666665066666660665556606665666065655560
66666660655555606655566066555660666666606566656066565660665556606666666065555560666666605555555066666660665556606665666065656660
66666660655555606555556066555660666666606566656065666560665656606666666065555560655555605655565066666660655555606665666065655560
66666660655555606655566066555660666666606566656066565660665556606666666066555660655555605655565066666660665556606666666065656560
66666660665556606665666066666660666666606655566066656660666666606666666066656660665556606555556066666660665656606665666065655560
06666600066666000666660006666600066666000666660006666600066666000666660006666600066666000666660006666600066666000666660006666600
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666000000000066666600666666666606666666066666666666666660000000066600000000006666660066666666660666666606666666666666666
00000000660000000000006666000066660006606600066066000666660006660000000066000000000000666600006666000660660006606600066666000666
00000000600000000000000660000006600000606000006060000066600000660000000060000000000000066000000660000060600000606000006660000066
00000000600000000000000660000006000000006000000000000066600000660000000060000000000000066000000600000000600000000000006660000066
00000000600000000000000660000006000000006000000000000066600000660000000060000000000000066000000600000000600000000000006660000066
00000000660000000000006666000066000000006600000000000066660000666000006066000060600000666600006660000060660000606000006666000066
00000000666000000000066666600666000000006660000000000666666006666600066066600660660006666660066666000660666006606600066666600666
00000000000000000000000000000000000000000000000000000000000000006666666066666660666666606666666066666660666666606666666066666660
7700700007007700070070000700700000007000700070007700700007007700eeeeeeeeeeeeeeee066666000666660022277722277722222227222227777722
0700700007007000770077007700770007000000700070007700777070007000eeeeeeeeeeeeeeee600000606666666022777772777772222277722277777772
0700770077007000070070007000070000000000700070007700007007007000eeeeeeeeeeeeeeee600000606666666027777772777777222777772277777772
0000000000000000000000000000000000000000700070000000000000007000eeeeeeeeeeeeeeee600000606660666077777772777777727777777277777772
0070777070007770070077707700077000007000777777770700770077770070eeeeeeeeeeeeeeee600000606666666027777772777777227777777227777722
7770700077700070777007000770770007000000000000007770000007000070eeeeeeeeeeeeeeee600000606666666022777772777772227777777222777222
0000000000000000000000000000000000000000000000000700000000007777eeeeeeeeeeeeeeee066666000666660022277722277722222777772222272222
0000000000000000000000000000000000000000000000000000000000000070eeeeeeeeeeeeeeee000000000000000022222222222222222222222222222222
ddd11111dddddddddd777ddddddd1d44ddaaa9dddd4555dd555dd5dddddddddddddddddd00000000ddd99dddeeeeeeee22222222222222222227222222777222
dd188787ddddddddd77777ddd11114dddaa9979dd545555d5dd5d5dddddd1dd1d7777ddd00000000dd9cc9ddeeeeeeee22227772277722222277722227777722
d1888888dcccccccd71717dd1176111dda99579ddd4555dd5dd5d5ddddd111d17ddd7ddd00000000d9c0c9ddeeeeeeee22777777777777222277722227777722
18811111c7777777d77776dd161111ddda99599ddd4dddddaaaad5ddd8881dd1d66d777700000000d9c0c9ddeeeeeeee27777777777777722777772227777722
d1187878c77777777777666d161111ddda99599ddd4ddddda55555ddd8998dddd66d777700000000d9c0c9ddeeeeeeee22777777777777222777772222777222
18887878dcccccccd66666dd111111ddda99599ddd1dddddaaaaa5ddd8998ddd7ddd7ddd00000000d9c0c9ddeeeeeeee22227772277722222777772222777222
88888888ddddddddd66666ddd1111dddda99999ddd1ddddd17d17d55d8888dddd7777ddd77700000d9cc9dddeeeeeeee22222222222222222277722222272222
88888888ddddddddd6d6d6dddddddddddda999dddd4ddddd11d11ddddddddddddddddddd07000000dd99ddddeeeeeeee22222222222222222222222222222222
dddddddddddddddddd666ddddddd5d66dd6665dddd5111dd111dd1dddddddddddddddddd00700000ddd55dddeeeeeeee22277722277722222227222227777722
ddd55656ddddddddd66666ddd55556ddd665565dd551111d1dd1d1dddddd1dd1d6666ddd07700000dd5665ddeeeeeeee22777772777772222277722277777772
dd555555d5555555d65656dd5566555dd655165ddd5111dd1dd1d1ddddd111d16ddd6ddd77770000d56065ddeeeeeeee27777772777777222777772277777772
d55ddddd56666666d66665dd565555ddd655155ddd5ddddd5555d1ddd5551dd1d55d666677700000d56065ddeeeeeeee77777772777777727777777277777772
ddd56565566666666666555d565555ddd655155ddd5ddddd511111ddd5665dddd55d666677700000d56065ddeeeeeeee27777772777777227777777227777722
d5556565d5555555d55555dd555555ddd655155ddd6ddddd555551ddd5665ddd6ddd6ddd77700000d56065ddeeeeeeee22777772777772227777777222777222
55555555ddddddddd55555ddd5555dddd655555ddd6ddddd16d16d11d5555dddd6666ddd77700000d5665dddeeeeeeee22277722277722222777772222272222
55555555ddddddddd5d5d5dddddddddddd6555dddd5ddddd11d11ddddddddddddddddddd07000000dd55ddddeeeeeeee22222222222222222222222222222222
0d5887000ddddd000d777d000000104400aaa9000d455500055dd5000ddddd0022777222007700000dd99d00eeeeeeee22222222222222222227222222777222
d5888880ddddddd0d77777d0011114000aa99790d54555505dd5d5d0ddd1dd102777772207770000dd9cc9d0eeeeeeee22227772277722222277722227777722
58855550dcccccc0d71717d0117611100a995790dd4555d05dd5d5d0dd111d102717172277777000d9c0c9d0eeeeeeee22777777777777222277722227777722
d5587870c7777770d77776d0161111000a995990dd4dddd0aaaad5d08881dd102777762277700000d9c0c9d0eeeeeeee27777777777777722777772227777722
58887870c777777077776660161111000a995990dd4dddd0a55555d08998ddd07777666277700000d9c0c9d0eeeeeeee22777777777777222777772222777222
88888880dcccccc0d66666d0111111000a995990dd1dddd0aaaaa5508998ddd02666662277700000d9c0c9d0eeeeeeee22227772277722222777772222777222
088888000ddddd0006666600011110000a9999900d1ddd0007d17d000888dd00266666220700000009cc9d00eeeeeeee22222222222222222277722222272222
0000000000000000000000000000000000a99900000000000000000000000000262626220000000000000000eeeeeeee22222222222222222222222222222222
ddd44444ddddddddddaaadddddddad99dddddddddddddddd999dd9dd066666000000a04400777770ddd99dddeeeeeeee00000000000000000000000000000000
dd499a9adddddddddaaaaadddaaaa9dddddd77dddd77dddd9dd9d9dd666766600aaaa40007777777dd9aa9ddeeeeeeee00000000000000000000000000000000
d4999999d9999999da1a1addaa99aaaddddd777dd777dddd9dd9d9dd66777660aa99aaa007777770d9a7a9ddeeeeeeee00000000000000000000000000000000
499444449aaaaaaadaaaa9dda9aaaadd7777777777777777aaaad9dd67777760a9aaaa0000000000d9a7a9ddeeeeeeee00000000000000000000000000000000
d449a9a99aaaaaaaaaaa999da9aaaadd7777777777777777a99999dd67777760a9aaaa0000000000d9a7a9ddeeeeeeee00000000000000000000000000000000
4999a9a9d9999999d99999ddaaaaaadddddd777dd777ddddaaaaa9dd66777660aaaaaa0000000000d9a7a9ddeeeeeeee00000000000000000000000000000000
99999999ddddddddd99999dddaaaaddddddd77dddd77dddd97d97d99066666000aaaa00000000000d9aa9dddeeeeeeee00000000000000000000000000000000
99999999ddddddddd9d9d9dddddddddddddddddddddddddd99d99ddd000000000000000000000000dd99ddddeeeeeeee00000000000000000000000000000000
111111111111111111111111111eee1111111111111111111111111111eee111111111111111111111111111111eee111111111111111111111111111111ee11
111111111111111111111111111e11111111111111111111111111111111e1111111111111111111111111111111e111111111111111111111111111111ee111
1177771111777711e1777711117777111177771e1177771111777711117777111177771111777711e1777711117777111177771e11777711e177771111777711
117007ee11700711e1700711117007111170071e11700711ee700711117007111170071e11700711ee70071111700711117007ee11700711ee70071111700711
1170071e11700711ee70071111700711117007ee11700711e170071111700711117007ee11700711e170071111700711117007e1117007111e70071111700711
1177771e1177771111777711117777111177771111777711e1777711117777111177771e11777711117777111177771111777711117777111177771111777711
111111111111e111111111111111111111111111111e1111111111111111111111111111111e1111111111111111111111111111111ee1111111111111111111
1111111111eee111111111111111111111111111111eee1111111111111111111111111111eee1111111111111111111111111111111ee111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111e1111111111111111111111111111eeee111111111111111111111111111111111111111111111111111111111111111111
11777711117777111177771111777711117777e1117777111e777711117777111177771111777711117777111177771111777711117777111177771111777711
117007e1117007111e70071111700711117007e1117007111e700711117007111170071111700711117007111170071111700711117007111170071111700711
11700711117007111170071111700711117007e1117007111e700711117007111170071111700711117007111170071111700711117007111170071111700711
11777711117777111177771111777711117777e1117777111e777711117777111177771111777711117777111177771111777711117777111177771111777711
11111111111e111111111111111111111111111111eeee1111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77770077770077777700007777707707707777707700000007707707777007700077700770770077700777700777770000777700777007700000777007777000
77777077770777777700007777707707707777707700000007707707777707700777770770770777770777770777770007777707777707700007777707777700
77077007700770007700007700007707707700007700000007707707707707700770770777770770770770770770000007700007707707700007707707707700
77770007700770007700007777007707707777007700000007707707777707700077000777770777770777770777700007700007707707700007707707777700
77770007700770777700007777007707707777007700000007707707777007700007700770770777770777700777700007700007707707700007707707777000
77077007700770777700007700007777707700007700000007707707700000000770770770770770770770000770000007700007707707700007707707707700
7777707777077777fffff0fffff00fff00fffff0fffff0000fffff0ff0000ff00fffff0ff0ff0ff0ff0ff0000fffff000fffff0fffff0fffff0fffff0ff0ff00
7777007777007770eeeee0eeeee000e000eeeee0eeeee00000eee00ee0000ee000eee00ee0ee0ee0ee0ee0000eeeee0000eeee00eee00eeeee00eee00ee0ee00
77077077077007777077777000777700777700777007707707707700077700770770777777007770777777700077700777700777077077077770770077007777
77077077077077777077777000777770777707777707707707707700777770770770777777077777777777770777770777707777077077077770777077077777
77777077077077000077000000770770077007707707777700777000770770770770007700077077770770770770770077007700077777007700777777077000
77777077077077000077770000777770077000770007777000777000777770770770007700077077770770770777770077007700077777007700777777077000
77077077077077077077770000777700077000077007777700770000777770770770007700077077770770770777770077007700077077007700777777077077
77077077077077077077000000770770077007707707707700770000770770770770007700077077770770770770770077007700077077007700777777077077
66066066666066666066666000ff0ff0ffff0fffff0ff0ff0ff00000660660666660006600066666ff0ff0ff0ff0ff00ff00ffff0ff0ff0ffff0ff0fff0fffff
55055005550005550055555000ee0ee0eeee00eee00ee0ee0ee00000550550055500005500005550ee0ee0ee0ee0ee00ee000eee0ee0ee0eeee0ee00ee00eee0
77777770000777770000777700007770777770007777000777000777707707707777007777007777000770770000000007777077000007770007770077777000
77777777000777770007777700077777777770007777707777707777707707707777007777007777700770770000000077777077000077777077777077777000
77077077000770000007700000077077000770007707707707707700707777700770000770007707700077700000000077000077000077077077077077000000
77077077000777700007700000077777777770007777007777707700007777000770000770007707700077700000000077000077000077077007700077770000
77077077000777700007707700077777777770007777007777707700007777700770000770007707700077000000000077000077000077077000770077770000
77077077000770000007707700077077770000007707707707707700007707700770000770007707700077000000590077000077000077077077077077000000
ff0ff0ff000fffff000fffff000ff0ff7777700077777077077077777077077006600066660066666006600000059990fffff0fffff0fffff0fffff0fffff000
ee0ee0ee000eeeee0000eee0000ee0ee77777000777700770770077770770770055000555500555550055000000059000eeee0eeeee00eee000eee00eeeee000
eeee00ffff0eeee00fffff0eeee00ffff0eeeeee0000000000000000000000000000000000000000000000000000000000777700007770000770000007700000
eeeee0ffff0eeeee0fffff0eeee0fffff0eeeeee000ff000000ee000000ff000000ee000000ff000000ee000000ff00007777700077777000770000007700000
ee0ee0ff000ee0ee0ff0000ee000ff000000ee00000ff000000ee000000ff000000ee000000ff000000ee000000ff00007700000077077000770000007700000
eeeee0fff00eeeee0ffff00eee00ff000000ee000ffffff00eeeeee00ffffff00eeeeee00ffffff00eeeeee00ffffff007700000077777000770000007700000
eeee00fff00eeee00ffff00eee00ff000000ee000ffffff00eeeeee00ffffff00eeeeee00ffffff00eeeeee00ffffff007700000077777000770000007700000
ee0000ff000ee0ee0ff0000ee000ff000000ee00000ff000000ee000000ff000000ee000000ff000000ee000000ff00007700000077077000770000007700000
ee0000ffff0ee0ee0ff0000eeee0fffff000ee00000ff000000ee000000ff000000ee000000ff000000ee000000ff0000fffff000ff0ff000fffff000fffff00
ee0000ffff0ee0ee0ff0000eeee00ffff000ee000000000000000000000000000000000000000000000000000000000000eeee000ee0ee000eeeee000eeeee00
77777777007777077770007777777077770777700777777700777777777777700077777770077770777707777777770777777770077770077700770077077777
77777777707777077770077777777077770777707777777770777777777777770777777777077770777707777777770777777777777770777770777077077777
77777777707777077770777777777077770777707777777770777777777777770777777777077770777707777777770777777777770000770770777777077000
77777777707777077770777777777077770777707777777770777777777777770777777777077770777707777777770777777777770000770770777777077770
77770777707777077770777700000077777777707777077770777707777077770777707777077770777707777700000777707777770770770770777777077770
77777777707777077770777700000077777777707777777770777707777077770777707777077770777707777700000777777777770770770770777777077000
77777777707777077770777777700077777777707777777770777707777077770777707777077770777707777777700777777777fffff0fffff0ff0fff0fffff
777777777077770777707777777700777777777077777777707777077770777707777077770777707777077777777007777777700eee000eee00ee00ee0eeeee
77777777007777077770077777777077770777707777777770777707777077770777707777077770777707777777700777777777777700770770077700770770
77770000007777077770007777777077770777707777077770777707777077770777707777077770777707777777700777707777777770770770777770770770
77770000007777077770000007777077770777707777077770777707777077770777707777077770777707777700000777707777770770770770770770777770
77770000007777077770000007777077770777707777077770777707777077770777707777077777777707777700000777707777777770770770077000777770
77770000007777777770777777777077770777707777077770777707777077770777777777007777777007777777770777707777777700770770007700770770
77770000007777777770777777777077770777707777077770777707777077770777777777000777770007777777770777707777770000770770770770770770
66660000006666666660666666660066660666606666066660666606666066660666666666000066600006666666660666606666770000777770777770770770
55550000000555555500555555500055550555505555055550555505555055550055555550000005000005555555550555505555770000077700077700770770
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000097f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000a777e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000b7d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007777077770077700777700000777700c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07707700770077000770770000070070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07777700770077000770770770777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07700000770077000770770000770070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07700007777077770777700000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606660066006600000666000006660000066600000660066600000000000000000000000000000000000000000000000000000000000000000000000000000
60600600600060600000606000006060000000600000060060600000000000000000000000000000000000000000000000000000000000000000000000000000
66600600600060606660666000006060000066600000060066000000000000000000000000000000000000000000000000000000000000000000000000000000
60000600600060600000606000006060000060000000060060600000000000000000000000000000000000000000000000000000000000000000000000000000
60006660066066000000666000006660060066600600666066600000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06000660060000006660666066006060000066606660000060006660606066606000066066606660600066600000066066606660666006600000600060006660
60006000006000000060606006006060000000606060000060006000606060606000606060006000600060000000600060606660600060000000600060006060
60006000006000006660606006006660666066606060000060006600060066606000606066006600600066000000600066606060660066600000600060006660
60006000006000006000606006000060000060006060000060006000606060606000606060006000600060000000606060606060600000600000600060006000
06000660060000006660666066600060000066606660000066606660606060606660660060006000666066600000666060606060666066000000666066606000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606060666066600000606066606000666000006660066066600000606066606000666000000000000000000000000000000000000000000000000000000000
06006060606060000000606060006000606000006000606060600000606060006000606000000000000000000000000000000000000000000000000000000000
06006660666066000000666066006000666000006600606066000000666066006000666000000000000000000000000000000000000000000000000000000000
06000060600060000000606060006000600000006000606060600000606060006000600000000000000000000000000000000000000000000000000000000000
06006660600066600000606066606660600000006000660060600000606066606660600000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000700007707770770000007770707007707070777077700770000007700770777077700000777077700000000000000000000000000000000000000000
07000000700070707070707000007070707070007070707077707070000070007070707070000000707070700000000000000000000000000000000000000000
00700000700070707770707000007770707077707770777070707070000070007070770077000000777077700000000000000000000000000000000000000000
07000000700070707070707000007000707000707070707070707070000070007070707070000000700070700000000000000000000000000000000000000000
70000000777077007070777000007000077077007070707070707700777007707700707077700700700077700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60000660666066006660660000006660606006606060666066600660000006600660666066600000666066600000060060606660660066606660000006606060
60006060606060606000606000006060606060006060606066606060000060006060606060000000606060600000600060606060060000606060000060006060
60006060666060606600606000006660606066606660666060606060000060006060660066000000666066600000600066606060060000606060000060006660
60006060606060606000606000006000606000606060606060606060000060006060606060000000600060600000600000606060060000606060000060006060
66606600606066606660666000006000066066006060606060606600666006606600606066600600600066600000060000606660666000606660000006606060
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606660066006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060600000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606600666000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060006000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060660006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000007088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000077088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000000088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000070088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000300000000000000000000000000000003000000000000000000000000000000030000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
078d0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
070c0e0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
018d880100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
828d898800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c880a0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07038b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
068d070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
038c880300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1f041f0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c8c0c8c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0802080200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0989098900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e020e0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8b838b8300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a090a0900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8700870087008700870000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0087008700870087000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8700870087008700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0087008700870087000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000c0000346312b601326312b6012f6312b6012d6312d6012b6012a60129603286042760326604246032360422603206041f6031e6041d6031c6041a603196041860317604166031560414603106010000000000
01100000001500004000120000100c0730004000120000100015000040001200001000173000400012000110001500004000120000100c0730004000120000100015000040001200001000173000400012000110
0110000018150000001815000000000000000018150000001c150000001c1500000000000000001c150000001f150000001f1500000000000000001f150000001815218152181521815200000000000000000000
0002000011350113500c350133501100011000110000a00025000250001500000000130000f000000000c00009000050000400000000000000000000000000000000000000000000000000000000000000000000
000100001575015740137400970008700077000670005705357003470034700347003470034700347003570035700357003570035700347003470034700337003370033700337000070000700007000070000700
000100001275014700017000970008700077000670005705357003470034700347003470034700347003570035700357003570035700347003470034700337003370033700337000070000700007000070000700
000300000d35011350163501c3501e35021300273000f300193501d35022350273502c3500030000300003001f350263502a3502f350343503835000300003000030000300003000030000300003000030000300
00070000346533365532643316452f6432f6452d6432d6352b6332a63529633286352762326625246232362522623206251f6231e6251d6131c6151a613196151861317615166131561514603106030000300003
000200000a6400c0600a6300f0500a610150300a610318000c8000a80009800008000080000800008000080000800008000080000800008000080000800008000080000800008000080000800008000080000800
00180000242501f250242301f230242201f220242101f210242101f2102f00528005210051c0051800514005110050e0050c0050a00508005070050600505005050050400503005020050100501005010051f005
01070000386503064025630206301c62019620176201562012620106100f6100d6100b6100a613086130761306613046130361303613006050060500605006050060500605006050060500605006050060500605
000d00000c0530445504255134453f6150445513245044550c0531344513245044553f6150445513245134450c0530445504255134453f6150445513245044550c0531344513245044553f615044551324513445
010c000020653216532065320653206532165323653286532c6533065333653346533465335653346533365331653306532d6532b65329653276532565322653206531e6531c6531a6531765314653116530f653
010d00000c0530045500255104453f6150045510245004550c0530044500245104553f6150045510245104450c0530045500255104453f6150045510245004550c0531044510245004553f615004551024500455
010d00000c0530245502255124453f6150245512245024550c0531244512245024553f6150245502255124450c0530245502255124453f6150245512245024550c0530244512245024553f615124550224512445
010d00002b5552a4452823523555214451f2351e5551c4452b235235552a445232352d5552b4452a2352b555284452a235285552644523235215551f4451c2351a555174451e2351a5551c4451e2351f55523235
010d000028555234452d2352b5552a4452b2352f55532245395303725536540374353b2503954537430342553654034235325552f2402d5352b2502a4452b530284552624623530214551f24023535284302a245
010d00002b5552a45528255235552b5452a44528545235452b5352a03528535235352b0352a03528735237352b0352a03528735237351f7251e7251c725177251f7151e7151c715177151371512715107150b715
010e00000f6200f6200f6200f6200f6200f6200e62010630136301d650216502365024650246502565025650266502665026650276502765027650276502765027650276502764027640206301e6201a61017610
01030020080500a0500c0500d0500e0500e0500f050110501105012050130501205012050120501105011050100500f0500e0500d0500c0500b0500a050090500905009050080500805009050090500a0500a050
01010020080500a0500c0500d0500e0500e0500f050110501105012050130501205012050120501105011050100500f0500e0500d0500c0500b0500a050090500905009050080500805009050090500a0500a050
000600003563033621306113061500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000700021363017660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c0000144100b4100b4100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00070000043000530006300093000f300173001d30021300233002430024300213001f3001f300213002330026300283002c3002e300303003230034300363003730037300383003830000300003000030000300
010400002f3502f3502f3503435034350343503434034340343403434034340343303433034320343203432034310343103431500300003000030000300003000030000300003000030000300003000030000300
00040000244401f44024440284402b440304402b4402044024440274402c440274402c440304403344038440334402244026440294402e440294402e44032440354403a440354400040000400004000040000400
000600003105036050390503000031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000018150000001815000000000000000018150000001c150000001c1500000000000000001c150000001f150000001f1500000000000000001f150000002415224152241522415200000000000000000000
01100000186251860018625186001c600186251862500000186250000018625186250000018625186250000018625186250000018625186250000018625000001862518625000001862500000186251862518625
011000001c335000001c300000001c335000001c300000001f335000001f300000001f335000001f3000000024335000002430000000243350000024300000001c3351c3001c3001c30013335133001330013300
011000001c335000001c300000001c335000001c300000001f335000001f300000001f335000001f300000002433500000243000000024335000002430000000283352830028300283002b3352b3002b3002b300
000c0000110501100011050110001105011000110501c0001105015050110502900011050150501105011000120001e0001f0001f0001e0501f0001f0501f0011100313003110001200011000000000000000000
011000001c330000001c330000001c330000001c330000001f330000001f330000001f330000001f3300000024330000002433000000243300000024330000001c3321c3321c3321c33213331133321333213332
011000001c330000001c330000001c330000001c330000001f330000001f330000001f330000001f330000002433000000243300000024330000002433000000283322833228332283322b3312b3322b3322b352
011000001815000000181501c150000000000018150000001c150000001c1501f15000000000001c150000001f150000001f1501815000000000001f15000000181521815218152181520c1510c1520c1520c152
011000001815000000181501c150000000000018150000001c150000001c1501f15000000000001c150000001f150000001f1502415000000000001f150000002415224152241522415218151181521815218152
011000001c330000001c3300000000000000001c330000001f330000001f3300000000000000001f3300000024330000002433000000000000000024330000001c3521c3521c3521c35200000000000000000000
011000001c330000001c3300000000000000001c330000001f330000001f3300000000000000001f3300000024330000002433000000000000000024330000002835228352283522835200000000000000000000
0110000018155181501c1551c1501d1001c100241001810018150181551c1501c1551315013155241000000018155181501c1551c1501310000000000000000018150181551c1501c155181561c1561f15600000
0110000018155181501c1551c1501d1001c1001c1551810018150181551c1501c15513150131551c1550000018155181501c1551c15013100000001c1550000018150181551c1501c1551f15624156281562b156
__music__
00 81828384
01 0b424344
00 0d424344
00 0e424344
00 0b424344
00 0b0f4344
00 0d0f4344
00 0e104344
02 0b114344
04 40010200
00 01024344
00 011c4344
01 01021d1e
00 011c1d1f
00 01021d21
00 011c1d22
00 01231d1e
00 01241d1f
00 01231d25
00 01241d26
00 01271d54
02 01281d55
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
03 41424344

