pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- pico sonic v6.1 (titlemenu)
-- by leyn
a={print=print}if nil then b=0 end
c={d=0,e=1,f=2,g=3,h=4,i=5,j=6,k=7,l=8,m=9,n=10,o=11,p=12,q=13,r=14,s=15}function u(v)return shl(1,15-v)end
function w(x)palt()palt(0,false)palt(x,true)end
function y(z,A)for B=1,#z do pal(z[B],A[B])end end
function C(D,E)local F={}for G,H in pairs(D)do F[G]=E(H)end
return F end
function I(D,J)for K,H in pairs(D)do if H==J then return true end end
return false end
function L(D)return next(D)==nil end
function M(D)for N in pairs(D)do D[N]=nil end end
function O(P)for Q=1,P do yield()end end
function R(H)if type(H)=='table'and H._tostring then return H:_tostring()else return tostr(H)end end
function S(T)return tostr(T)end
U=tostr
V=tostr
local function W(cls,...)local self=setmetatable({},cls)self:X(...)return self end
local function Y(Z,_)return R(Z)..R(_)end
local function a0(self)local a1=setmetatable({},getmetatable(self))for G,H in pairs(self)do local a2=false
if type(H)=='table'and not a2 then a1[G]=H:a0()else a1[G]=H end end
return a1 end
local function a3(self,a4)for G,H in pairs(a4)do if type(H)=='table'then self[G]=H:a0()else self[G]=H end end end
function a5()local a6={}a6.__index=a6
a6.__concat=Y
setmetatable(a6,{__call=W})return a6 end
function a7(a8)local a6={}a6.__index=a6
a6.__concat=Y
setmetatable(a6,{__index=a8,__call=W})return a6 end
function a9()local aa={}aa.__index=aa
aa.__concat=Y
aa.a0=a0
aa.a3=a3
setmetatable(aa,{__call=W})return aa end
function ab(ac)local ad={}ad.__index=ad
ad.__concat=Y
setmetatable(ad,{__index=ac,__call=W})return ad end
function ae(X)local af={}setmetatable(af,{__concat=Y})af.X=X
af:X()return af end
function ag(ah,ai)local aj={}setmetatable(aj,{__index=ah,__concat=Y})function aj:X()ah.X(self)if ai then ai(self)end end
aj:X()return aj end
ak=1/0
function al(am,an)return flr(am/an)end
ao=a9()function ao:X(ap,aq)self.ap=ap
self.aq=aq end
function ao.__eq(Z,_)return ao.ar(Z-_)end
function ao:as(at)return at=="x"and self.ap or self.aq end
function ao:au(at,H)if at=="x"then self.ap=H else self.aq=H end end
function ao.__add(Z,_)return ao(Z.ap+_.ap,Z.aq+_.aq)end
function ao:av(aw)self:a3(self+aw)end
function ao.__sub(Z,_)return Z+-_ end
function ao:ax(aw)self:a3(self-aw)end
function ao.__unm(ay)return-1*ay end
function ao.__mul(Z,_)if getmetatable(_)then return ao(Z*_.ap,Z*_.aq)else return _*Z end end
function ao:az(aA)self:a3(self*aA)end
function ao.__div(Z,_)return Z*1/_ end
function ao:aB(aA)self:a3(self/aA)end
function ao:aC(aw)return self.ap*aw.ap+self.aq*aw.aq end
function ao:aD()return self:aC(self)end
function ao:ar()return self:aD()==0 end
function ao.aE()return ao(0,0)end
aF=a9()function aF:X(B,aG)self.B=B
self.aG=aG end
function aF:aH()return ao(8*self.B,8*self.aG)end
aI=ab(aF)function aI:aJ()return 16*self.aG+self.B end
function aI.aK(aL)return aI(aL%16,al(aL,16))end
aM=ab(aF)function aM.__eq(Z,_)return Z.B==_.B and Z.aG==_.aG end
function aM:aN()return ao(8*self.B+4,8*self.aG+4)end
function aM.__add(Z,_)return aM(Z.B+_.B,Z.aG+_.aG)end
function aM.__sub(Z,_)return aM(Z.B-_.B,Z.aG-_.aG)end
function ao:aO()return aM(flr(self.ap/8),flr(self.aq/8))end
aP={aQ=0,aR=1,aS=2,aT=3}aU={[0]=ao(-1,0),ao(0,-1),ao(1,0),ao(0,1)}aV={aQ=1,aS=2}aW={aR=1,aT=2}aX={ao(-1,0),ao(1,0)}aY={-1,1}function aZ(a_)return a_<0 and 1 or 2 end
function b0(b1)return(b1+2)%4 end
b2={aQ=0,aS=1,aR=2,aT=3,b3=4,ap=5}b4={b5=0,b6=1,b7=2,b8=3}function b9(B,aG,ap,aq,ba,bb,bc,bd,be,bf,bg,bh)bg=bg or 0
if bg>=0.5 then bg=bg-0.5
bc=not bc
bd=not bd end
if bg==0 then local bi=bc and ba*8-be or be
local bj=bd and bb*8-bf or bf
palt(bh)spr(16*aG+B,ap-bi,aq-bj,ba,bb,bc,bd)palt()else local bk=8*B
local bl=8*aG
local bm=8*ba
local bn=8*bb
local bo=bc and-1 or 1
local bp=bd and-1 or 1
for bq=0,bm-1 do for br=0,bn-1 do local v=sget(bk+bq,bl+br)if band(u(v),bh)==0 then pset(ap+bp*(br-bf+0.5),aq-bo*(bq-be+0.5),v)end end end end end
bs={aQ=1,bt=2,bu=3,aS=4}function bv(bw)return function(bx)return bw(unpack(bx))end end
function by(bz,bA)for G,H in pairs(bA)do bz[G]=H end end
function bB(af,bC,bD)local bE={}local bF=""for B=1,#af do local v=sub(af,B,B)local bG=type(bC)=="table"and I(bC,v)or v==bC
if bG then if#bF>0 or not bD then add(bE,bF)bF=""end else bF=bF..v end end
if#bF>0 or not bD then add(bE,bF)end
return bE end
bH={bI=1,bJ=2,bK=3,bL=4}local bM=a9()function bM:X(bN,bO,bP)self.bN=bN
self.bO=bO
self.bP=bP end
function bM.bQ(bR)return bM({bR},1,2)end
local bS=a9()function bS:X(bT,bU,bV,bW)self.bT=bT
self.bU=bU or aF(1,1)self.bV=bV or ao.aE()if type(bW)=="table"then self.bh=0
for v in all(bW)do self.bh=self.bh+u(v)end elseif bW then self.bh=u(bW)else self.bh=u(0)end end
function bS:bX(bY,bc,bd,bg,bZ)if bZ and bZ~=1 then local bm=8*self.bU.B
local bn=8*self.bU.aG
palt(self.bh)sspr(8*self.bT.B,8*self.bT.aG,bm,bn,bY.ap-bZ*self.bV.ap,bY.aq-bZ*self.bV.aq,bZ*bm,bZ*bn,bc,bd)palt()else b9(self.bT.B,self.bT.aG,bY.ap,bY.aq,self.bU.B,self.bU.aG,bc,bd,self.bV.ap,self.bV.aq,bg,self.bh)end end
local b_={c0={{8,2},{15,9},{14,2},{13,5},{12,1},{11,3},{10,9},{9,4}}}local c1=C({c2={12,0,4,4},c3={13,0,4,4},c4={14,0,4,4},c5={15,0,4,4}},function(c6)return bS(aI(c6[1],c6[2]),nil,ao(c6[3],c6[4]),14)end)b_.c1=c1
b_.c7={c8=bM({c1.c2,c1.c3,c1.c4,c1.c5},5,2)}local c9={ca=1.3,cb={{1,6},{13,6},{6,6},{6,13},{6,1},{6,1},{6,13},{13,13}},cc=30,cd=1.6,ce=30}local cf={cg=bS(aI(1,0),aF(2,1),ao(8,5),14),ch=bS(aI(3,0),aF(2,1),ao(8,5),14),ci=bS(aI(0,1),aF(14,10),nil,14),cj=bS(aI(0,11),aF(16,5),nil,14),ck=bS(aI(0,4),aF(16,5),nil,14),cl=bS(aI(10,0),nil,ao(3,2),14),cm=bS(aI(0,1),aF(7,3),ao(0,11),14),cn=bS(aI(7,1),aF(4,2),ao(0,6),14),co=bS(aI(11,1),aF(3,2),ao(0,4),14),cp=bS(aI(14,1),aF(2,1),ao(0,4),14),cq=bS(aI(0,10),aF(2,1),ao(6,2),14),cr=bS(aI(2,10),aF(2,1),ao(6,2),14),cs=bS(aI(4,10),aF(2,1),ao(6,2),14),ct=bS(aI(6,10),aF(2,1),ao(6,2),14),cu=bS(aI(0,9),nil,ao(2,5),14),cv=bS(aI(1,9),nil,ao(3,3),14),cw=bS(aI(2,9),nil,ao(3,3),14),cx=bS(aI(3,9),nil,ao(3,3),14),cy=bS(aI(4,9),nil,ao(3,3),14)}local cz={cA={["loop"]=bM({cf.cq,cf.cr,cf.cs,cf.ct},6,4)},cB=bM({cf.cw,cf.cx,cf.cy},5,3)}by(b_,c9)by(b_.c1,cf)by(b_.c7,cz)local cC={}function cD(cE,cF)return cF end
local cG=ae(function(self)self.cH={}self.cI=nil
self.cJ=nil end)function cG:cK()self:cL()if self.cI then self.cI:cK()end end
function cG:bX()if self.cI then self.cI:bX()end end
function cG:cM(cN)self.cH[cN.type]=cN end
function cG:cO(cP)self.cJ=self.cH[cP]end
function cG:cL(cP)if self.cJ then self:cQ(self.cJ)end end
function cG:cQ(cR)if self.cI then self.cI:cS()end
self.cI=cR
cR:cT()self.cJ=nil end
local cU=a5()function cU:X(cV,...)self.cV=cV
self.bx={...}end
local cW=a5()function cW:X()self.cX={}end
function cW:cY(cZ,...)local cV=cocreate(cZ)add(self.cX,cU(cV,...))return#self.cX end
function cW:c_()local d0={}for B,cU in pairs(self.cX)do local d1=costatus(cU.cV)if d1=="suspended"then local d2,d3=coresume(cU.cV,unpack(cU.bx))elseif d1=="dead"then add(d0,cU)end end
for cU in all(d0)do del(self.cX,cU)end end
function cW:d4(d5)deli(self.cX,d5)end
function cW:d6()M(self.cX)end
local d7=ae(function(self)self.d8={}for B=0,1 do local D={}for B=0,5 do D[B]=0 end
self.d8[B]=D end end)local d9=0x5f2d
local da=32
local db=33
function d7:dc(dd,de)de=de or 0
return self.d8[de][dd]end
function d7:df(dd,de)local dg=self:dc(dd,de)return dg==0 or dg==3 end
function d7:dh(dd,de)return not self:df(dd,de)end
function d7:di(dd,de)local dg=self:dc(dd,de)return dg==3 end
function d7:dj(dd,de)local dg=self:dc(dd,de)return dg==1 end
function d7:dk()for de=0,1 do self:dl(de)end end
function d7:dl(de)local dm=self.d8[de]for dd,dn in pairs(dm)do if self:df(dd,de)and btn(dd,de)and not btnp(dd,de)then dn=2 end
local dp=btn(dd,de)dm[dd]=self:dq(dn,dp)end end
function d7:dq(dr,dh)if dr==0 then if dh then return 1 end elseif dr==1 then if dh then return 2 else return 3 end elseif dr==2 then if not dh then return 3 end else if dh then return 1 else return 0 end end
return dr end
local ds=a5()function ds:X(dt)self.cW=cW()self.dt=dt
self.du=1/dt end
function ds:dv(cH)for dw in all(cH)do dw.dx=self
cG:cM(dw)end end
function ds:dy()self:dv(self:dz())end
function ds:dA()if self.dB then self:dB()end
self:dy()cG:cO(self.dC)if self.dD then self:dD()end end
function ds:cK()d7:dk()self:dE()end
function ds:dE()cG:cK()self.cW:c_()self:dF()end
function ds:dF()end
function ds:dG()cls()cG:bX()self:dH()end
function ds:dH()end
function ds:cY(cZ,...)return self.cW:cY(cZ,...)end
function ds:d4(d5)self.cW:d4(d5)end
function ds:d6()self.cW:d6()end
function ds:dI(dJ)O(ceil(dJ*self.dt))end
local dK=a7(ds)function dK:X()ds.X(self,60)end
function dK:dD()extcmd("set_title","Pico Sonic")poke(0x5f5c,-1)end
local cN=a5()cN.type=':undefined'function cN:X()end
function cN:cT()end
function cN:cS()end
function cN:cK()end
function cN:bX()end
function cN:dL()end
local dM=a5()function dM:X(dN)self.dN=dN
self.dO=false
self.dP=0
self.dQ=1
self.dR=0 end
function dM:dS(dT,dU,dV)dV=dV or 1
self.dP=dV
if self.dW~=dT or dU then self.dO=true
self.dW=dT
self.dQ=1
self.dR=0 end end
function dM:dX()self.dO=false
self.dW=nil
self.dQ=1
self.dR=0 end
function dM:cK()if self.dO then local dY=self.dN[self.dW]self.dR=self.dR+self.dP
while self.dR>=dY.bO do if self.dQ<#dY.bN then self.dQ=self.dQ+1
self.dR=self.dR-dY.bO else if dY.bP==1 then self.dO=false
self.dQ=1
self.dR=0 elseif dY.bP==2 then self.dO=false
self.dQ=#dY.bN
self.dR=0 elseif dY.bP==3 then self:dX()else self.dQ=1
self.dR=self.dR-dY.bO end end end end end
function dM:bX(bY,bc,bd,bg)if self.dW then local dY=self.dN[self.dW]local dZ=dY.bN[self.dQ]dZ:bX(bY,bc,bd,bg)end end
local d_=a5()function d_:X(e0,bY,bZ)self.bS=e0
self.e1=true
self.bY=bY and bY:a0()or ao.aE()self.bZ=bZ or 1 end
function d_:dG()if self.e1 then self.bS:bX(self.bY,false,false,0,self.bZ)end end
local e2={}function e2.e3(e4,ap,aq,e5,e6)if e6 then for e7=-1,1,2 do for e8=-1,1,2 do local bq=(e7+e8)/2
local br=(e7-e8)/2
print(e4,ap+bq,aq+br,e6)end end end
print(e4,ap,aq,e5)end
local e9={}function e9.ea(af,ba)local eb=''local ec=bB(af,'\n')local ed=count(ec)for B=1,ed do local ee=0
local ef=bB(ec[B],' ')local eg=count(ef)for N=1,eg do local eh=ef[N]local ei=false
if N>1 then if ee+1+#eh>ba then eb=eb..'\n'ee=0
ei=true else eb=eb..' 'ee=ee+1 end end
eb=eb..eh
ee=ee+#eh end
if B<ed then eb=eb..'\n'end end
return eb end
function e9.ej(e4,ek)return ek-#e4*2+1 end
function e9.el(e4,em)return em-2 end
function e9.en(e4,ek,em)return e9.ej(e4,ek),e9.el(e4,em)end
function e9.eo(e4,ek,em,e5)local ec=bB(e4,'\n')em=em-(#ec-1)*3
for ep in all(ec)do local ap,aq=e9.en(ep,ek,em)print(ep,ap,aq,e5)em=em+6 end end
function e9.eq(e4,ap,aq,er,e5,es)if er==3 then ap,aq=e9.en(e4,ap,aq)elseif er==2 then ap=e9.ej(e4,ap)elseif er==4 then ap=ap-#e4*4+1 end
e2.e3(e4,ap,aq,e5,es)end
local et=a5()et.eu={{1,1,0,0},{2,2,1,0},{1,1,0,0},{2,2,5,0},{5,1,1,0},{13,13,5,5},{15,6,4,5},{4,2,2,5},{4,4,5,5},{15,9,4,13},{3,3,1,1},{13,2,1,1},{2,2,1,1},{4,4,2,2},{9,4,5,5}}function et:X()self.ev=0 end
function et:ew()if self.ev==0 then pal()elseif self.ev<5 then for v=1,15 do pal(v,et.eu[v][self.ev],1)end else cls()end end
local ex=a5()function ex:X(bY,dY)self.bY=bY
self.ey=dM({["once"]=dY})self.ey:dS("once")end
function ex:ez()return self.ey.dO end
function ex:cK()self.ey:cK()end
function ex:bX()self.ey:bX(self.bY)end
local eA={}function eA.eB(aA,eC)eC=eC or 0
local eD,eE=unpack(b_.c0[aA])local eF={{eD,eE},{7,eD},{7,7}}y({8,2},eF[eC+1])end
function eA.dG(aA,bY,eC)if aA>=0 then eA.eB(aA,eC)b_.c1.cl:bX(bY)pal()else b_.c1.eG:bX(bY)end end
local eH=a7(ex)function eH:X(aA,bY,dY)ex.X(self,bY,dY)self.aA=aA end
function eH:bX()eA.eB(self.aA)self.ey:bX(self.bY)pal()end
local eI=a5()function eI:X(aA,bY,bZ)self.aA=aA
self.bY=bY
self.bZ=bZ or 1
self.eC=0 end
function eI:dG()if self.eC<0 then local ev=-self.eC
local eD,eE=unpack(b_.c0[self.aA])pal(8,et.eu[eD][ev])pal(2,et.eu[eE][ev])else eA.eB(self.aA,self.eC)end
b_.c1.cl:bX(self.bY,false,false,0,self.bZ)pal()end
local eJ=a9()function eJ:X(eK,eL,eM)self.eK=eK
self.eL=eL
self.eM=eM end
local eN=a5()function eN:X(dx,er,eO,eP,eQ,eR)self.dx=dx
self.er=er
self.eO=eO
self.eP=eP
self.eQ=eQ
self.eR=eR
self.eS={}self.eT=false
self.eU=0
self.eV=0
self.eW=0 end
function eN:eX(eS)self.eT=true
M(self.eS)for eY in all(eS)do add(self.eS,eY:a0())end
self.eU=1
self:eZ(1)self.eV=0
self.eW=0 end
function eN:bK(eS)self.eT=false
M(self.eS)self.eU=0 end
function eN:cK()if self.eT then if d7:dj(2)then self:e_()elseif d7:dj(3)then self:f0()elseif d7:dj(4)then self:f1()end
self.eV=(self.eV+self.dx.du)%2
local f2=self.eV/2
if f2<0.5 then self.eW=0 else self.eW=-1 end end end
function eN:f3(d5)if self.eU~=d5 then self.eU=d5
self:eZ(d5)self:f4()end end
function eN:e_()if self.eU>1 then self:f3(self.eU-1)end end
function eN:f0()if self.eU<#self.eS then self:f3(self.eU+1)end end
function eN:eZ(d5)local eM=self.eS[d5].eM
if eM then eM(self.dx)end end
function eN:f4()end
function eN:f1()self.eT=false
self.eS[self.eU].eL(self.dx)self:f5()end
function eN:f5()end
function eN:dG(ap,f6)local eS=self.eS
if#eS==0 then return end
local aq=f6
local f7=0
local f8=#eS-1
for B=f7+1,f8+1 do local eK=eS[B].eK
local f9=ap
if B==self.eU then if self.er==1 then if self.eQ then self.eQ:bX(ao(ap-self.eR-3,aq+3))else eK="> "..eK end else eK="> "..eK.." <"end else if self.er==1 and not self.eQ then f9=f9+2*4 end end
e9.eq(eK,f9,aq,self.er,self.eP,0)aq=aq+6+self.eO end end
local fa=a7(eN)function fa:f4()sfx(50)end
function fa:f5()sfx(51)end
local fb={}function fb.fc(am,an,fd)return am+(an-am)*fd end
function fb.fe(am,an,fd)return am+(an-am)*mid(fd,0,1)end
function fb.ff(am,an,fd)return am+(an-am)*fd*fd end
function fb.fg(am,an,fd)return am+(an-am)*(2-fd)*fd end
function fb.fh(am,an,fd)if fd<=0.5 then return fb.ff(am,(am+an)/2,2*fd)else return fb.fg((am+an)/2,an,2*fd-1)end end
function fb.fi(at,fj,fk,am,an,aL)for Q=1,aL do local fd=Q/aL
for B,fl in ipairs(fj)do fl.bY:au(at,fb.fc(am,an,fd)+fk[B])end
yield()end end
function fb.fm(fj,a4,fn,aL)for Q=1,aL do local fd=Q/aL
for B,fl in ipairs(fj)do fl.bY:a3(fb.fc(a4,fn,fd))end
yield()end end
local fo=a7(cN)fo.type=':titlemenu'local fp={{"start",function(dx)local fq=cG.cI
fq:fr()end},{"credits",function(dx)cG:cO(':credits')end}}local fs=1/(b_.cd*60)local ft=1296
local fu=52
local fv=64+fu
local fw=fv-ft/6
local fx=88-ft
local fy={{1,ao(2,fw+31)},{1,ao(62,fw+12)},{1,ao(120,fw+24)},{2,ao(8,fw+57)},{2,ao(49,fw+38)},{2,ao(82,fw+49)},{2,ao(131,fw+62)},{3,ao(50,fw+70)},{3,ao(100,fw+76)},{4,ao(10,fw+72)},{4,ao(80,fw+84)}}local fz={b_.c1.cm,b_.c1.cn,b_.c1.co,b_.c1.cp}function fo:X()self.eS=C(fp,bv(eJ))self.fA=d_(b_.c1.ci)self.fB={d_(b_.c1.cj),d_(b_.c1.ck)}self.fC={}self.fD={}self.fE={}self.fF={}self.fG=0
self.fH=0
self.fI={bZ=1}self.fJ={}self.fK={}self.fL=false
self.fM=0
self.fN=0
self.fO=false
self.fP=false
self.fQ=false
self.fR=0
self.fS=et()end
function fo:cT()self.dx:cY(self.fT,self)self.fN=96
self.fO=false
self.fP=false
self.fQ=false
self.fA.bY=ao(8,16)self.fA.e1=true
self.fB[1].bY=ao(0,88)self.fB[2].e1=false end
function fo:fT()music(0)O(864)music(-1,800)O(108)self.fO=true end
function fo:fU()self.eN=eN(self.dx,1,3,7,b_.c1.ch,7)self.eN:eX(self.eS)end
function fo:cS()self.eN=nil
M(self.fC)M(self.fD)M(self.fE)M(self.fF)self.fG=0
self.fH=0
M(self.fJ)M(self.fK)self.cA=nil
self.fV=nil
self.fL=false
self.fW=nil
self.fM=0
self.dx:d6()end
function fo:cK()if self.fP then if d7:dj(4)or d7:dj(5)then self.dx:cY(self.fX,self)end
self:fY()self:fZ()self:f_()self:g0()if self.cA then self.cA:cK()self.fV.ap=self.fV.ap-0.5 end
if self.fW then local g1=76
if self.fW.bY.aq>g1 then self.fW.bZ=fb.fe(1,0.3,(self.fW.bY.aq-g1)/(110-g1))end
local g2=0.35
local g3=g2*self.fW.bZ
local g4=self.fM*self.fW.bZ
self.fW.bY.ap=self.fW.bY.ap-g3
self.fW.bY.aq=self.fW.bY.aq+g4
self.fM=self.fM+0.04
if self.fW.bY.aq>110 then self.dx:cY(self.g5,self)end end
return end
if self.eN then self.eN:cK()if self.fO then self:g6()end else if d7:dj(4)or d7:dj(5)then self.fN=0 else self.fN=self.fN-1 end
if self.fN<=0 then self:fU()end end end
local g7={-0.3,-0.2,-0.15,-0.1}function fo:fY()if#self.fF>0 then self.fG=(self.fG-self.fH)%1 end end
function fo:fZ()for B=1,#self.fK do local g8=self.fK[B]local g9=(B-1)%#fy+1
local ga=fy[g9]local gb=ga[1]local gc=g7[gb]g8.bY.ap=(g8.bY.ap+gc+56)%(128+2*56)-56 end end
local gd={-1,0,1,0}function fo:f_()end
function fo:g0()local ge={}for gf in all(self.fJ)do gf:cK()if not gf:ez()then add(ge,gf)end end
for gf in all(ge)do del(self.fJ,gf)end end
function fo:g6()load('picosonic_attract_mode')end
function fo:bX()self:gg()camera(0,self.fR)self:gh()for gi in all(self.fC)do gi:dG()end
camera()self:gj()if not self.fP then self:gk()end
if self.eN then self.eN:dG(55,101)end
for gi in all(self.fD)do gi:dG()end
for gl in all(self.fF)do local gm=self:gn(gl)local eC=self.fE[gl].eC
if eC<0 then local ev=-eC
local eD,eE=unpack(b_.c0[gl])pal(8,et.eu[eD][ev])pal(2,et.eu[eE][ev])else eA.eB(gl,eC)end
b_.c1.cl:bX(gm,false,false,0)pal()end
self:go()if self.cA then self.cA:bX(self.fV)if self.fL then b_.c1.cu:bX(self.fV)end end
self.fS:ew()end
function fo:gn(aA)local gp=b_.cc
local bg=self.fG-(aA-1)/8
local gm=ao(64+gp*cos(bg),68+self.fI.bZ*gp*sin(bg))return gm end
function fo:gg()rectfill(0,0,128,128,1)end
function fo:gh()local gq=b_.ca
local gr=t()%gq/gq
local gs=#b_.cb
local dE=min(flr(gr*gs)+1,gs)local A=b_.cb[dE]y({8,10},A)for gt in all(self.fB)do gt:dG()end
if fu-ft/2+64-12>self.fR and self.fR>fu-ft-64+12 then local gu=9
local gv={{13,30,46,62,111},{22,45,51,89,120},{5,17,34,70,80},{23,90}}local gw=0
local gx=780+cD("start scale d",0)local gy=fu-gx-self.fR
if gy>0 then local gz=100+cD("max scale d",0)local gA=240+cD("hold scale d",0)local gB=180+cD("back scale d",0)if gy<gz+gA then local fd=mid(gy/gz,0,1)gw=fb.fh(0,1,fd)elseif gy>gz+gA then local fd=mid((gy-gz-gA)/gB,0,1)gw=fb.fh(1,0,fd)end end
local aG=0
local gC=fv-ft/2-12
local gD=fv-ft+12
for aq=gC,gD,-gu do aG=aG%#gv+1
if aq>=self.fR and aq<self.fR+128 then for ap in all(gv[aG])do local gE,gF
if ap%2==0 then gE=8
gF=10 else gE=10
gF=8 end
ap=ap+aq*aq
ap=ap%128
local br=aq-self.fR
local gG=fb.fc(1,2.5+cD("scale x0.1",0)*0.1,gw*br/128)ap=64+(ap-64)*gG
local gH=self.fR+(aq-self.fR)*gG
if ap>=-2 and ap<128 and gH<128 then pset(ap%128,gH,gE)pset((ap+1)%128,gH,gF)pset((ap+2)%128,gH,gE)end end end end end
pal()end
function fo:go()for gf in all(self.fJ)do gf:bX()end end
function fo:gj()self.fA:dG()end
function fo:gk()e9.eq("V6.1",126,2,4,7,0)end
function fo:gI(a4,fn,aL,gJ)for Q=1,aL do local fd=Q/aL
self.fR=gJ(a4,fn,fd)yield()end end
function fo:gK(gL,a4,fn,aL,gJ)for Q=1,aL do local fd=Q/aL
gL.bZ=gJ(a4,fn,fd)yield()end end
function fo:gM(gN,gO,aL,gJ)for Q=1,aL do local fd=Q/aL
self.fH=fs*gJ(gN,gO,fd)yield()end end
function fo:fr()self.eN=nil
music(-1,b_.ce*50/3)self.fP=true
self.dx:cY(self.gP,self)end
function fo:gP()self.gQ=t()self.dx:cY(self.gR,self)O(b_.ce+cD("emerald enter dt",0))self.fG=-0.75
self.fH=fs
for B=1,8 do local cl=eI(B,ao(-4,93))add(self.fE,cl)add(self.fD,cl)self.dx:cY(self.gS,self,self.fE[B])end
music(8)O(36)self.dx:cY(self.gT,self,ft,fu)reload(0x0,0x0,0x2000,"data_stage1_00.p8")for ga in all(fy)do local gb=ga[1]local gU=ga[2]add(self.fK,d_(fz[gb],gU))end
local gV=2*fv-ft/2
for ga in all(fy)do local gb=ga[1]local gU=ga[2]add(self.fK,d_(fz[gb],ao(gU.ap,gV-gU.aq)))end
for g8 in all(self.fK)do add(self.fC,g8)end
O(45)self.fB[2].bY.aq=fv-14-ft/2
self.fB[2].e1=true
self.fB[1].bY.aq=fx
O(40)self.dx:cY(self.gM,self,1,2,70,fb.fh)self:gK(self.fI,1,0.5,50,fb.fh)O(60)self.dx:cY(self.gM,self,2,1,50,fb.fh)self:gK(self.fI,0.5,1,50,fb.fh)O(70)self.dx:cY(self.gM,self,1,2,50,fb.fh)self:gK(self.fI,1,0.5,50,fb.fh)O(90)self.dx:cY(self.gM,self,2,1,50,fb.fh)self:gK(self.fI,0.5,1,50,fb.fh)end
function fo:gR()fb.fi("y",{self.fA},{0},16,-80,42+cD("move logo dt",0))self.fA.e1=false end
function fo:gT(ft,fu)self:gI(0,fu-ft/2,250,fb.fh)self:gI(fu-ft/2,-ft,360+cD("->back dt",0)*30,fb.fh)self:gW()end
local gq=b_.cd
local gX=7.5*gq
function fo:gS(cl)O(gX*(8-cl.aA))fb.fm({cl},ao(-4,93),ao(42,47),gX)del(self.fD,cl)add(self.fF,cl.aA)end
function fo:gW(cl)while true do if 1-1/8-fs<self.fG and self.fG<1-1/8+fs then break else yield()end end
self.dx:cY(self.gY,self)O(70)self.dx:cY(self.gZ,self)O(89)self:g_()end
function fo:gY()for B=8,1,-1 do self.dx:cY(self.h0,self,self.fE[B])O(gX)end
music(-1,1000)end
local h1={ao(68,111),ao(71,108),ao(72,114),ao(76,108),ao(84,110),ao(80,112),ao(89,111),ao(86,114)}function fo:h0(cl)del(self.fF,cl.aA)add(self.fD,cl)self.dx:cY(self.gK,self,cl,1,0.2,24,fb.fc)local h2=self:gn(cl.aA)fb.fm({cl},h2,h1[cl.aA],24)del(self.fD,cl)local gf=eH(cl.aA,cl.bY,b_.c7.cB)add(self.fJ,gf)end
function fo:gZ()self.cA=dM(b_.c7.cA)self.cA:dS('loop')self.fV=ao(136,63)self.fL=true end
function fo:g_()self.fL=false
self.fW=d_(b_.c1.cv,self.fV)self.fM=-0.2
add(self.fD,self.fW)sfx(55)end
function fo:g5()local gf=eH(5,self.fW.bY,b_.c7.cB)add(self.fJ,gf)del(self.fD,self.fW)self.fW=nil
O(20)self:fX()end
function fo:fX()if not self.fQ then self.fQ=true
for B=1,5 do self.fS.ev=B
O(6)end
load('picosonic_stage_intro')end end
local h3=a7(cN)h3.type=':credits'local fp={{"back",function(dx)cG:cO(':titlemenu')end}}local h4=e9.ea("this is a fan game distributed for free on itch.io and sfghq (sage 2021) and is not endorsed by sega games co. ltd, which owns the sonic the hedgehog trademark and copyrights.",31)function h3:X()self.eS=C(fp,bv(eJ))end
function h3:cT()music(-1)self.eN=eN(self.dx,1,3,7,b_.c1.cg,7)self.eN:eX(self.eS)end
function h3:cS()end
function h3:cK()self.eN:cK()end
function h3:bX()self:h5()self.eN:dG(64,121)end
function h3:h5()rectfill(0,0,127,127,1)local eP=7
local h6=2
local h7=6
local h8=3
local aq=2
e9.eq("pico sonic - credits",64,aq,2,eP)aq=aq+h7+h8+2
print("sonic team",h6,aq,eP)e9.eq("original games",127-h6,aq,4,eP)aq=aq+h7+h8
print("leyn (komehara)",h6,aq,eP)e9.eq("code, sprites",127-h6,aq,4,eP)aq=aq+h7
e9.eq("sfx, bgm adjustments",127-h6,aq,4,eP)aq=aq+h7+h8
print("original 8-bit bgm by danooct1\n  thx to midi2pico by gamax92",h6,aq,eP)aq=aq+2*h7+h8
print("gameplay resources\n  - sonic physics guide\n  - tas videos game resources",h6,aq,eP)aq=aq+3*h7+h8
print(h4,h6,aq,eP)aq=aq+6*h7+h8
print("komehara.itch.io/pico-sonic",h6,aq,eP)end
local h9=a7(dK)function h9:dz()return{fo(),h3()}end
local dx=h9()function _init()dx.dC=':titlemenu'dx:dA()end
function _update60()dx:cK()end
function _draw()dx:dG()end

__gfx__
00000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee5eeeeeee77778eeeeeeeeeeee8eeeeeeeeeeeeeeeeee8eeeeeeeeee
00000000ee7eeeeeeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee575eeeee7777788eeeeeeeeee272eeeeee2eeeeeeeee272eeeeee2ee
00700700eed7eee87eee7deeeeeeeee0000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee5775eeee2288822eeeeeeeee877782eee272e2eeee287778ee2e272e
00077000eee7ee8008ee7eeeeeeeee0222700eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee57775eeee28882eeeeeeeeeee272eeeeee2ee8eeeeee272eee8ee2ee
00077000edd7780970877ddeeeeee028887720eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee577775eeee282eeeeeeeeeeeee8ee2eeeeee272eee2ee8eee272eeee
00700700eedd78049087ddeeeeeee0888877820eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee57755eeeeee2eeeeeeeeeeeeee2e272eee287778e272e2ee877782ee
00000000eeedde8008eddeeeeeeee0000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee575eeeeeeeeeeeeeeeeeeeeeeeeee2eeeeee272eee2eeeeee272eeee
00000000eeeeeee88eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee5eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee8eeeeeeeeeeee8eeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d77777777d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d7777dddddddd7777d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d77dd111111111111dd77d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d777d111144444444441111d777d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e1d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d7d1114919aaaaaaaaaa9194111d7d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d1eeeeeeecccceeeeee
e1d7dd1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d711144901110aaaaaaaa011109441117d1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1dd7d1eeeeeecccccceceee
e0dd777dd1eeeeeeeeeeeeeeeeeeeeeeeeeeed7d11499aaa101aaaaaaaaaa101aaa99411d7deeeeeeeeeeeeeeeeeeeeeeeeeee1dd777dd0eeeeeeecffcccceee
ee1d777777dd1eeeeeeeeeeeeeeeeeeeeee11d1144aaaaaa0a0aaaaaaaaaa0a0aaaaaa4411d11eeeeeeeeeeeeeeeeeeeeee1dd777777d1eeeeeeeccfccc7ccee
eee1d77777777dd1eeeeeeeeeeeeeeeeee1dd1149aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9411dd1eeeeeeeeeeeeeeeeee1dd77777777d1eeeeeeecccccc770cee
eee0dd77777777777dd1eeeeeeeeeeeee1dd1491aaaaaaaaaaa1d7d77d7d1aaaaaaaaaaa1941dd1eeeeeeeeeeeee1dd77777777777dd0eeeeeeccccccc770cee
eeee0dd77777777777777dd1eeeeeeee1d11401110aaaaaad17dddddddddd71daaaaaa01110411d1eeeeeeee1dd77777777777777dd0eeeeeeeeeecccff77f0e
eeeee1dd77777777777777777dd1eee1d114aa101aaaa1d1ddd1111111111ddd1d1aaaa101aa411d1eee1dd77777777777777777dd1eeeeeeeee9c888cfffeee
eeeeee0dd7777777777777777777771dd14aaa0a0aaa7ddd1110000000000111ddd7aaa0a0aaa41dd1777777777777777777777dd0eeeeeeeee9f888856eeeee
eeeeeee1dd7777777777777777777d1d14aaaaaaaa11dd11000000000000000011dd11aaaaaaaa41d1d7777777777777777777dd1eeeeeeeee228887766eeeee
eeeeeeee01d77777777777777777d1d14aaaaaaaa1dd110000000000000000000011dd1aaaaaaaa41d1d77777777777777777d10eeeeeeeee22888cffeeeeee2
eeeeeeeee10d77777777777777771d11aaaaaaaa1dd10000000000000000000000001dd1aaaaaaaa11d17777777777777777d01eeeeeeeee222ccee11eeee2e2
e11eeeeeeee1dd7777777777777d1d19aaaaaaa1dd1000000000000000000000000001dd1aaaaaaa91d1d7777777777777dd1eeeeeeee11e22eeeeee1eeee222
e1dd10eeeeee10dd777777777771d140000000000000000000000000000000000000000000001aa1a41d177777777777dd01eeeeee01dd1e2eeee871eeee222e
ee1d77d10eeeee1ddd777777771dd100111111111111000111111100011111111000100499941011101dd177777777ddd1eeeee01d77d1eee2ee8877222222ee
ee0dd7777d10eee01ddd7777771d19a019777aaaa9941001977aa100104aaa99991104a7aaaa94011a91d1777777ddd10eee01d7777dd0eeeeee82227222eeee
eee1d77777771100000dd7777d1d1aa019799999999941019a999111097a9999991097a99999aa900aa1d1d7777dd00000117777777d1eeeeeeeeeeeeeeeeeee
eee0dd77777777777777777771d19aa019799999999991019a9991109799999990047a99999999940aa91d17777777777777777777dd0eeeeeeeeeeeeeeeeeee
eeee0dd7777777777777777771d1aaa019799911199994119a999109799999999109a9999999999910aa1d1777777777777777777dd0eeeeeeeeeeeeeeeeeeee
eeeee1d777777777777777771d11aaa01979991110a999119a99910a99999119400a99999119999910aa11d177777777777777777d1eeeeeeeeeeeeeeeeeeeee
eeeeee1d77777777777777771d1aaaa019a9991110a994119a99914a99991111104a999911109999410aa1d17777777777777777d1eeeeeeeeeeeeeeeeeeeeee
eeeeee0dd7777777777777771d1aaaa019a9990007a991019a99919a99911111109a99911110a999910aa1d1777777777777777dd0eeeeeeeeeeeeeeeeeeeeee
eeeeeee0dd777777777777771d1aaaa019a999aa7a9991019a99919999901110104a99911109a999410aa1d177777777777777dd0eeeeeeeeeeeeeeeeeeeeeee
eeeeeeee0dd77777777777711d1aaaa019a99999999941019a99914999900009400a99990097a99910aaa1d11777777777777dd0eeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeee0dd777777777771d1aaa1a019a99999999410019a9991099aa949aa910a9999aa7a9999101aaa1d177777777777dd0eeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeee01d77777777771d1a0111019a99911111100019a999104999a77a99104a9999999999410110a1d17777777777d10eeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeee1dd7777777771d1aa101019a99910000000019a9991019999999994109a99999999910101aa1d1777777777dd1eeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeee01dd77777771d1aa0a0019a99910000000019a999101149999999910049999999410a0a0aa1d17777777dd10eeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeee11eeee0ddd777771d1aaaaa0111111100000000111111100111049941000001499941001aaaaaa1d177777ddd0eeee11eeeeeeeeeeeeeeeeeeeeeeee
eeeeeeee1dd000001ddd7771d1aaaaa00000000000000000000000000010000000000000000001d1aaaaaa1d1777ddd100000dd1eeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeee0ddddd777777771d1aaaaaa1d10000000000000000000000000000000000000000001d1aaaaaa1d177777777ddddd0eeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeee0dd77777777771d1aaaaaa1d10000000000000000000000000000000000000000001d1aaaaaa1d17777777777dd0eeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeee0dd7777777771d1aaaaaa122288888888888888888888888888888888888888882221aaaaaa1d1777777777dd0eeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeee0dd7777777722888888888888888888888888888888888888888888888888888888888888882277777777dd0eeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeee01dd777888888888888888888888888888888888888888888888888888888888888888888888888777dd10eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeee1d88888888888800011100088888000000188800000001800000000000008888000000088888888dd1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee8288888888880004999411088100499941018011111111011111111111108011111111008888882eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeee02288888888804a7a99999908104a7aaaa940100777aa91197aaa1977aa100104aaa9999188888828eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee228888888814aa9999999001097a99999aa9000799999019a99919a999111097a999999188888828eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee228888888119a9999999911047a999999999400799999919a99919a9991109799999990088888828eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee20888888811a9999011111109a9999999999910799999909a99919a9991097999999991888888828eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee208877777019999aa9401110a99999119999910799999999a99919a99910a9999911940777778828eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee207777777719999999999004a99991110999940a99999999a99919a99914a9999111117777777788eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee407777777701999999999909a99911110a99990a99999999999919a99919a9991111117777777708eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee007777777771149999999904a99911109a99940a9999a999999919a9991999990111010777777709eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee00777777777011100a999910a99990097a99910a99999a99999919a9991499990000940777777709eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee40777777777049a7a9999910a9999aa7a999910a99994799999919a9991099aa949aa91777777709eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeee4077777778009999999999104a9999999999410a999909a9999919a999104999a77a991077777709eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeee840778888800499999999911109a999999999100a999914a9999919a99910199999999941888877098eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeee8822408888888001999999941008004999999941000a99991099999919a9991011499999999188888809228eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeee888822242888888880001111110088880014999410080111111001111111111111081110499410088888809228888eeeeeeeeeeeeeeeeeeeeeeeeee
eeeeee888888822222888888888800000088888888800000008880000000080000000000000088810000008888888828228888888eeeeeeeeeeeeeeeeeeeeeee
ee88888888888222228888888888888888888888888888888888888888888888888888888888888888888888888888282288888888888eeeeeeeeeeeeeeeeeee
e8888888888882948288888888888888888824444444444444444444444444444444444444288888888888888888822492888888888888eeeeeeeeeeeeeeeeee
ee888888888779948288888888882eee01dd1449494999999999999999999999999994949441dd10eee28888888882249977788888888eeeeeeeeeeeeeeeeeee
eee88888777779948288828eeeeeeeeee01dd11a9a9a9a9a9a9a9a9aa9a9a9a9a9a9a9a9a11dd10eeeeeeeeee2088224997777778888eeeeeeeeeeeeeeeeeeee
eeee8777777779944800028eeeeeeeeeee011d11aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa11d110eeeeeeeeeee200002499777777777eeeeeeeeeeeeeeeeeeeee
eeeee877777779944000028eeeeeeeeeeee001dd1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1dd100eeeeeeeeeeee20000849977777777eeeeeeeeeeeeeeeeeeeeee
eeeeee77777779944080028eeeeeeeeeeeeee011d111aaaaaaaaaaaaaaaaaaaaaaaa111d110eeeeeeeeeeeeee20088449977777778eeeeeeeeeeeeeeeeeeeeee
eeeee877777779942000028eeeeeeeeeeeeeee001ddd111aaaaaaaaaaaaaaaaaa111ddd100eeeeeeeeeeeeeee20000249977777777eeeeeeeeeeeeeeeeeeeeee
eeeee777777779222000008eeeeeeeeeeeeeeeee0111ddd1111aaaaaaaaaa1111ddd1110eeeeeeeeeeeeeeeee000002222777777778eeeeeeeeeeeeeeeeeeeee
eeee877777788222200000eeeeeeeeeeeeeeeeeee00011dddd111111111111dddd11000eeeeeeeeeeeeeeeeee800002222888777777eeeeeeeeeeeeeeeeeeeee
eeee77788888822220008eeeeeeeeeeeeeeeeeeeeeee001111dddddddddddd111100eeeeeeeeeeeeeeeeeeeeee800022228888887778eeeeeeeeeeeeeeeeeeee
eee8888888888222208eeeeeeeeeeeeeeeeeeeeeeeeeee00001111111111110000eeeeeeeeeeeeeeeeeeeeeeeeee8022228888888888eeeeeeeeeeeeeeeeeeee
eee88888888882228eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee822288888888888eeeeeeeeeeeeeeeeeee
ee8888888888888eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee888888888888eeeeeeeeeeeeeeeeeee
ee8888888888eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee8888888888eeeeeeeeeeeeeeeeee
e8888888eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee888888eeeeeeeeeeeeeeeeee
e88eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee888eeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed6766deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed677776deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed67777776ddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed67777776666deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedd666677777777776deeeeeeeeeeeeeeeeeeeeeeeeeeeeee97eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeed67777777777777776deeeeeeeeeeeeeeeeeeeeeeeeeeeee249eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeed77777777777777777deeeeeeeeeeeeeeeeeeeeeeeeeeeee249eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeed677777777777777777666deeeeeeeeeeeeeeeeeeeeeeeeee249eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeed6777777777777777777776deeeeeeeeeeeeeeeeeeeeeeee2249eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeedd66eeeeeeeeeeeeeeeeed67777777777777777777776deeeeeeeeeeeeeeeeeeeeeee2249eeeeeeeeeeed66deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeed67776ddddeeeeeeeeeeed667772477777777777777777deeeeeeeeeeeeeeeeeeeeeee22449eeeeeeddd67776de24eeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeee777776776deeeeeddedd6667772477777777777777777deeeeeeeeeeeeeeeeeeeeeee22449eeeee6677677776e24eeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeed7777777776deeed666677777772277777777777777777deeeeeeeeeeeeeeeeeeeeee2224249749e6777777776622eeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeee666777777777d666666677777777227777777777777777766eeeeeeeeeeeeeeeeeeee2122422444967777777776622eeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeed66777777777776777766677777777224977777777777777776deeeeeeeeeeeee99eeee221222244246777777777762249eeeeeeedddddddeeeeeeeeddd6
eeee6677777777777777777766677777772249777777777777777766eeeeeeeeeeeee49eee2212222244249649777777662249eeeeeed666666ddeeeeee66776
eee66777777777777777777766677777272229729777777777777776d666deeeeeeee294942121221224244929677776262229e2966666776666666dee677777
eee66777777777777777777777777677242224229777777777777776666666dd66de424494b3bb121b2224442496776924222422966667777766776766777777
eed66677777777777777777777777677222222229477777777777777666666d6666442bbb1333bb1b3b2b2442249696422222222947777767777777777777777
ed677777777777777777777777777774222b2222224774677777777776777776643422b3b331333bb3bbbbb222444964222b2222224977776777776676777777
d677777777777777777777777777244421313b22322424467777777667777744bb3b3333b33313333bb3333b1324444223113b22322429777777777667777777
66777777777777777777777777772333131313bb333332244966677767777744333333341221313331333b1113b32224111313b1333332244977777767777777
7777777777777777777777777442233331111113311131322224ddddddddd43b31122424242211311111331b3333113331111113311131322224777766777777
ddddddddddddddddddddddddddddddd11dd11dd13bdddd11dddddd67dddddddd1ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddd6d676d6dddddddddddddddddddddddddddd76dddd67dd1ddddd67ddddddddd6676dddddddddddddddddd676d6ddddddddd666ddddddd66dd
1ddddddd666666dddddddddddd6d6776d6ddddddddddddddddddddddddddddddddddddddd1dddddddddddddddddd666dddddddddddddddd66666ddd1ddd66666
11dd1ddddd666ddddddddddddddddddddddddddddd666ddddddd1ddd11dd111111111dd1111ddddddd1dddd6dd666666d6ddddddddddd666666dd1111dddd666
11111111dddddddddddd11111111dddddd676ddd6666ddddddd1111111111111111111111111dd67dd111d666666666666ddd1111111dddddddd11111111dddd
1111111111ddd111dd11111111111dddddddddd6666dd1ddd1111111111111111111111111111dddd1111dd66666767766ddd1111111111111111111111111dd
11111111111111111111111111111111dddddd66dddd111111118a11111111111a81111111111dddd11111dd666666666dd111111a8111111111111111111111
11111111111111111111111118a1111111ddddddddd11111111111111111111111111111a81111dd1111111ddddd6666dd11111111111188a111111111111111
11111a8a11111111111111111111111111111111111111111111111111111111111111111111111111111111111ddddd11111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111aa811111111111111111111111111111111111111111111111111111118aa811111111
111111111111111118a811111111111111111111111a811111111111111111111111111111111a8111111a8a1111111111118a11111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111d77777777d11111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111d7777dddddddd7777d1111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111d77dd111111111111dd77d11111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111d777d111144444444441111d777d11111111111111111111111111111111111111111111111111
1111111111d11111111111111111111111111111111111111d7d1114919aaaaaaaaaa9194111d7d11111111111111111111111111111111111111d1111111111
1111111111d7dd111111111111111111111111111111111d711144901110aaaaaaaa011109441117d111111111111111111111111111111111dd7d1111111111
1111111110dd777dd1111111111111111111111111111d7d11499aaa101aaaaaaaaaa101aaa99411d7d1111111111111111111111111111dd777dd0111111111
11111111111d777777dd1111111111111111111111111d1144aaaaaa0a0aaaaaaaaaa0a0aaaaaa4411d1111111111111111111111111dd777777d11111111111
111111111111d77777777dd11111111111111111111dd1149aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9411dd11111111111111111111dd77777777d111111111111
111111111110dd77777777777dd111111111111111dd1491aaaaaaaaaaa1d7d77d7d1aaaaaaaaaaa1941dd111111111111111dd77777777777dd011111111111
1111111111110dd77777777777777dd1111111111d11401110aaaaaad17dddddddddd71daaaaaa01110411d1111111111dd77777777777777dd0111111111111
11111111111111dd77777777777777777dd11111d114aa101aaaa1d1ddd1111111111ddd1d1aaaa101aa411d11111dd77777777777777777dd11111111111111
111111111111110dd7777777777777777777771dd14aaa0a0aaa7ddd1110000000000111ddd7aaa0a0aaa41dd1777777777777777777777dd011111111111111
1111111111111111dd7777777777777777777d1d14aaaaaaaa11dd11000000000000000011dd11aaaaaaaa41d1d7777777777777777777dd1111111111111111
111111111111111101d77777777777777777d1d14aaaaaaaa1dd110000000000000000000011dd1aaaaaaaa41d1d77777777777777777d101111111111111111
1111111111111111110d77777777777777771d11aaaaaaaa1dd10000000000000000000000001dd1aaaaaaaa11d17777777777777777d0111111111111111111
11111111111111111111dd7777777777777d1d19aaaaaaa1dd1000000000000000000000000001dd1aaaaaaa91d1d7777777777777dd11111111111111111111
1111111111dd1011111110dd777777777771d140000000000000000000000000000000000000000000001aa1a41d177777777777dd0111111101dd1111111111
11111111111d77d10111111ddd777777771dd100111111111111000111111100011111111000100499941011101dd177777777ddd11111101d77d11111111111
11111111110dd7777d1011101ddd7777771d19a019777aaaa9941001977aa100104aaa99991104a7aaaa94011a91d1777777ddd1011101d7777dd01111111111
111111111111d77777771100000dd7777d1d1aa019799999999941019a999111097a9999991097a99999aa900aa1d1d7777dd00000117777777d111111111111
111111111110dd77777777777777777771d19aa019799999999991019a9991109799999990047a99999999940aa91d17777777777777777777dd011111111111
1111111111110dd7777777777777777771d1aaa019799911199994119a999109799999999109a9999999999910aa1d1777777777777777777dd0111111111111
11111111111111d777777777777777771d11aaa01979991110a999119a99910a99999119400a99999119999910aa11d177777777777777777d11111111111111
111111111111111d77777777777777771d1aaaa019a9991110a994119a99914a99991111104a999911109999410aa1d17777777777777777d111111111111111
111111111111110dd7777777777777771d1aaaa019a9990007a991019a99919a99911111109a99911110a999910aa1d1777777777777777dd011111111111111
1111111111111110dd777777777777771d1aaaa019a999aa7a9991019a99919999901110104a99911109a999410aa1d177777777777777dd0111111111111111
11111111111111110dd77777777777711d1aaaa019a99999999941019a99914999900009400a99990097a99910aaa1d11777777777777dd01111111111111111
111111111111111110dd777777777771d1aaa1a019a99999999410019a9991099aa949aa910a9999aa7a9999101aaa1d177777777777dd011111111111111111
11111111111111111101d77777777771d1a0111019a99911111100019a999104999a77a99104a9999999999410110a1d17777777777d10111111111111111111
11111111111111111111dd7777777771d1aa101019a99910000000019a9991019999999994109a99999999910101aa1d1777777777dd11111111111111111111
1111111111111111111101dd77777771d1aa0a0019a99910000000019a999101149999999910049999999410a0a0aa1d17777777dd1011111111111111111111
11111111111111111111110ddd777771d1aaaaa0111111100000000111111100111049941000001499941001aaaaaa1d177777ddd01111111111111111111111
11111111111111111dd000001ddd7771d1aaaaa00000000000000000000000000010000000000000000001d1aaaaaa1d1777ddd100000dd11111111111111111
111111111111111110ddddd777777771d1aaaaaa1d10000000000000000000000000000000000000000001d1aaaaaa1d177777777ddddd011111111111111111
1111111111111111110dd77777777771d1aaaaaa1d10000000000000000000000000000000000000000001d1aaaaaa1d17777777777dd0111111111111111111
11111111111111111110dd7777777771d1aaaaaa122288888888888888888888888888888888888888882221aaaaaa1d1777777777dd01111111111111111111
111111111111111111110dd7777777722888888888888888888888888888888888888888888888888888888888888882277777777dd011111111111111111111
11111111111111111111101dd777888888888888888888888888000000888888888888888888888888888888888888888888777dd10111111111111111111111
111111111111111111111111d88888888888800011100088888000000188800000001800000000000008888000000088888888dd111111111111111111111111
11111111111111111111111182888888888800049994110881004999410180111111110111111111111080111111110088888821111111111111111111111111
1111111111111111111111102288888888804a7a99999908104a7aaaa940100777aa91197aaa1977aa100104aaa9999188888828111111111111111111111111
111111111111111111111111228888888814aa9999999001097a99999aa9000799999019a99919a999111097a999999188888828111111111111111111111111
111111111111111111111111228888888119a9999999911047a999999999400799999919a99919a9991109799999990088888828111111111111111111111111
11111111111111111111111120888888811a9999011111109a9999999999910799999909a99919a9991097999999991888888828111111111111111111111111
111111111111111111111111208877777019999aa9401110a99999119999910799999999a99919a99910a9999911940777778828111111111111111111111111
111111111111111111111111207777777719999999999004a99991110999940a99999999a99919a99914a9999111117777777788111111111111111111111111
111111111111111111111111407777777701999999999909a99911110a99990a99999999999919a99919a9991111117777777708111111111111111111111111
111111111111111111111111007777777771149999999904a99911109a99940a9999a999999919a9991999990111010777777709111111111111111111111111
11111111111111111111111100777777777011100a999910a99990097a99910a99999a99999919a9991499990000940777777709111111111111111111111111
11111111111111111111111140777777777049a7a9999910a9999aa7a999910a99994799999919a9991099aa949aa91777777709111111111111111111111111
1111111111111111111111114077777778009999999999104a9999999999410a999909a9999919a999104999a77a991077777709111111111111111111111111
11111111111111111111111840778888800499999999911109a999999999100a999914a9999919a9991019999999994188887709811111111111111111111111
111111111111111111118822408888888001999999941008004999999941000a99991099999919a9991011499999999188888809228111111111111111111111
11111111111111111888822242888888880001111110088880014999410080111111001111111111111081110499410088888809228888111111111111111111
11111111111111888888822222888888888800000088888888800000008880000000080000000000000088810000008888888828228888888111111111111111
11111111118888888888822222888888888888888888888888888888888888888888888888888888888888888888888888888828228888888888811111111111
11111111188888888888829482888888888888888888244444444444444444444444444444444444442888888888888888888224928888888888881111111111
111111111188888888877994828888888888211101dd1449494999999999999999999999999994949441dd101112888888888224997778888888811111111111
1111111111188888777779948288828111111111101dd11a9a9a9a9a9a9a9a9aa9a9a9a9a9a9a9a9a11dd1011111111112088224997777778888111111111111
111111111111877777777994480002811111111111011d11aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa11d110111111111112000024997777777771111111111111
1111111111111877777779944000028111111111111001dd1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1dd1001111111111112000084997777777711111111111111
111111111111117777777994408002811111111111111011d111aaaaaaaaaaaaaaaaaaaaaaaa111d110111111111111112008844997777777811111111111111
1111111111111877777779942000028111111111111111001ddd111aaaaaaaaaaaaaaaaaa111ddd1001111111111111112000024997777777711111111111111
1111111111111777777779222000008111111111111111110111ddd1111aaaaaaaaaa1111ddd1110111111111111111110000022227777777781111111111111
111111111111877777788222200000111111111111111111100011dddd111111111111dddd110001111111111111111118000022228887777771111111111111
1111111111117778888882222000811111111111111111111111001111dddddddddddd1111001111111111111111111111800022228888887778111111111111
11111111111888888888822220811111111111111111111111111100001111111111110000111111111111111111111111118022228888888888111111111111
11111111111888888888822281111111111111111111111111111111110000000000001111111111111111111111111111111182228888888888811111111111
11111111118888888888888111111111111111111111111111111111111111111111111111111111111111111111111111111111188888888888811111111111
11111111118888888888111111111111111111111111111111111111111111111111111111111111111111111111111111111111111188888888881111111111
11111111188888881111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111118888881111111111
11111111188111111111111111111111111111ddd111111111111111111111111111111111111111111111111111111111111111111111111111888111111111
1111111111111111111111111111111111111d6766d1111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111111111111111111d677776d111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111d67777776dd1111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111d67777776666d11111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111dd666677777777776d1111111111111111111111111111119711111111111111111111111111111111111111111111111
111111111111111111111111111111d67777777777777776d1111111111111111111111111111124911111111111111111111111111111111111111111111111
111111111111111111111111111111d77777777777777777d1111111111111111111111111111124911111111111111111111111111111111111111111111111
11111111111111111111111111111d677777777777777777666d1111111111111111111111111124911111111111111111111111111111111111111111111111
11111111111111111111111111111d6777777777777777777776d111111111111111111111111224911111111111111111111111111111111111111111111111
11111111dd6611111111111111111d67777777777777777777776d11111111111111111111111224911111111111d66d11111111111111111111111111111111
1111111d67776dddd11111111111d667772477777777777777777d1111111111111111111111122449111111ddd67776d1241111111111111111111111111111
11111111777776776d11111dd1dd6667772477777777777777777d11111111111111111111111224491111166776777761241111111111111111111111111111
1111111d7777777776d111d666677777772277777777777777777d11111111111111111111112224249749167777777766221111111111111111111111111111
111111666777777777d6666666777777772277777777777777777661111111111111111111121224224449677777777766221111111111111111111111111111
1111d66777777777776777766677777777224977777777777777776d11111111111119911112212222442467777777777622491111111ddddddd11111111ddd6
111166777777777777777777666777777722497777777777777777661111111111111491112212222244249649777777662249111111d666666dd11111166776
11166777777777777777777766677777272229729777777777777776d666d1111111129494212122122424492967777626222912966666776666666d11677777
11166777777777777777777777777677242224229777777777777776666666dd66d1424494b3bb121b2224442496776924222422966667777766776766777777
11d66677777777777777777777777677222222229477777777777777666666d6666442bbb1333bb1b3b2b2442249696422222222947777767777777777777777
1d677777777777777777777777777774222b2222224774677777777776777776643422b3b331333bb3bbbbb222444964222b2222224977776777776676777777
d677777777777777777777777777244421313b22322424467777777667777744bb3b3333b33313333bb3333b1324444223113b22322429777777777667777777
66777777777777777777777777772333131313bb333332244966677767777744333333341221313331333b1113b32224111313b1333332244977777767777777
7777777777777777777777777442233331111113311131322224ddddddddd43b31122424242211311111331b3333113331111113311131322224777766777777
ddddddddddddddddddddddddddddddd11dd11dd13bdddd11dddddd67dddddddd1ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddd6d676d6dddddddddddddddddddddddddddd76dddd67dd1ddddd67ddddddddd6676dddddddddddddddddd676d6ddddddddd666ddddddd66dd
1ddddddd666666dddddddddddd6d6776d6ddddddddddddddddddddddddddddddddddddddd1dddddddddddddddddd666dddddddddddddddd66666ddd1ddd66666
11dd1ddddd666ddddddddddddddddddddddddddddd666ddddddd1ddd11dd111111111dd1111ddddddd1dddd6dd666666d6ddddddddddd666666dd1111dddd666
11111111dddddddddddd11111111dddddd676ddd6666ddddddd1111111111111111111111111dd67dd111d666666666666ddd1111111dddddddd11111111dddd
1111111111ddd111dd11111111111dddddddddd6666dd1ddd1111111111111111111111111111dddd1111dd66666767766ddd1111111111111111111111111dd
11111111111111111111111111111111dddddd66dddd111111116d11111111111d61111111111dddd11111dd666666666dd111111d6111111111111111111111
11111111111111111111111116d1111111ddddddddd11111111111111111111111111111d61111dd1111111ddddd6666dd11111111111166d111111111111111
11111d6d11111111111111111111111111111111111111111111111111111111111111111111111111111111111ddddd11111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111dd611111111111111111111111111111111111111111111111111111116dd611111111
111111111111111116d611111111111111111111111d611111111111111111111111111111111d6111111d6d1111111111116d11111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010100203005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050
010400093035030360303703235032360323703435034360343703c30000300003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102000430350303603037030370323003230034300343003c3000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
010800013c35000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000023150000002314023145241400000024140241452614026145000000000026140000002314023140
010c00002314023145231402314524140000002614026140261450000026140000002614026140261450000024140241450000000000241402414500000000002414024145231402314524140000002114021140
010c00002114021140211402114021140211402114021140211402114021140211450000000000000000000023140000002314023145241400000024140241452614026145000000000026140000002314023140
010c00002314023145231402314524140000002614026140261450000026140000002614026140261402614529140291450000000000291402914500000000002914029145281402814529140000002b1402b140
010c00002b1402b1402b1402b1402b1402b1402b1402b1402b1402b1402b1402b1402b1402b1402b1402b14500000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000037130351303213035130371303513032130351303713035130321303513037130351303213035130
010c00003713035130321303513037130351303213035130371303513032130351303713035130321303513039130371303413037130391303713034130371303913037130341303713039130371303413037130
010c000032130301302d1303013032130301302d1303013032130301302d1303013032130301302d1303013037130351303213035130371303513032130351303713035130321303513037130351303213035130
010c00003713035130321303513037130351303213035130371303513032130351303713035130321303513037120351203212035120371103511032110351150000000000000000000000000000000000000000
010c0000000000e1450e145000000e1450e105000000e1450e145000000e145000000e1450e1050e1450e10513145131451314500000131450000013145131450000013145131450000013145000001314500000
010c00000e1450e1450e145000000e145000000e1450e145000000e1450e145000000e14500000101450000011145111451114500000111450000011145111450000011145111450000011145000001114500000
010c00000e1450e1450e145000000e145000000e1450e145000000e1450e145000000e145000000e1450000013145131451314500000131450000013145131450000013145131450000013145000001314500000
010c00000e1450e1450e145000000e145000000e1450e145000000e1450e145000000e14500000101450000011145111451114500000111450000011145111450000011145111450000011145000001514500000
010c00001314513145131450000013145000001314513145000001314513145000001314013130131201312500000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000000002135021350000002135021050000002135021350000002135000000213502135021350213507135071350713500000071350000007135071350000007135071350000007135000000713500000
010c00000213502135021350000002135000000213502135000000213502135000000213500000041350000005135051350513500000051350000005135051350000005135051350000505135000000513500000
010c00000213502135021350000002135000000213502135000000213502135000000213500000021350000007135071350713500000071350000007135071350000007135071350000007135000000713500000
010c00000213502135021350000002135000000213502135000000213502135000000213500000041350000005135051350513500000051350000005135051350000005135051350000005135000000913500000
010c00000713507135071350000007135000000713507135000000713507135000000713007120071200711500000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800003c3743e3743f3743b3643c3643e364393543b3543c35437344393443b34435344373443934434334353343733435334373343933437324393243b324393243b3243c3243b3143c3143e3143c3143e314
010800003c3243e3243f3243b3343c3343e334393343b3343c33437344393443b34435344373443934434334353343733435334373343933437324393243b324393243b3243c3243b3143c3143e3143c3143e314
010800133fa003ba003ca003ea0039a003ba003ca0037a0039a003ba0035a0037a0039a0034a0035a0037a0035a0037a0039a0037a0039a003ba0039a003ba003ca003ba003ca003ea0000a0000a000000000000
010400002d85000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110300001351013510145101552016520185201b5301e530235312a54100501005010050100501005010050100501005010050100501005010050100501005010050100501005010050100000000000000000000
0108001e3c3003e3003f3003b3003c3003e300393003b3003c30037300393003b30035300373003930034300353003730035300373003930037300393003b300393003b3003c3003b3003c3003e3000030000300
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 080d1116
00 090e1217
00 0a0f1318
00 0b0e1419
04 0c10151a
00 41424344
00 41424344
00 41424344
00 30424344
03 31424344

