pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- pico sonic v6.1 (stage_clear)
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
bB={bC=0,bD=1,bE=2,bF=4,bG=5,bH=6,bI=7}bJ={bC=1,bD=2,bE=4,bF=16,bG=32,bH=64,bI=128}bK={bL=1,bM=2,bN=3,bO=4}local bP=a9()function bP:X(bQ,bR,bS)self.bQ=bQ
self.bR=bR
self.bS=bS end
function bP.bT(bU)return bP({bU},1,2)end
local bV=a9()function bV:X(bW,bX,bY,bZ)self.bW=bW
self.bX=bX or aF(1,1)self.bY=bY or ao.aE()if type(bZ)=="table"then self.bh=0
for v in all(bZ)do self.bh=self.bh+u(v)end elseif bZ then self.bh=u(bZ)else self.bh=u(0)end end
function bV:b_(c0,bc,bd,bg,c1)b9(self.bW.B,self.bW.aG,c0.ap,c0.aq,self.bX.B,self.bX.aG,bc,bd,self.bY.ap,self.bY.aq,bg,self.bh)end
local c2={c3={{8,2},{15,9},{14,2},{13,5},{12,1},{11,3},{10,9},{9,4}}}local c4=C({c5={12,0,4,4},c6={13,0,4,4},c7={14,0,4,4},c8={15,0,4,4}},function(c9)return bV(aI(c9[1],c9[2]),nil,ao(c9[3],c9[4]),14)end)c2.c4=c4
c2.ca={cb=bP({c4.c5,c4.c6,c4.c7,c4.c8},5,2)}local cc=C({cd={12,12,1,2,0,16},ce={13,12,3,4,0,16},cf={1,0,2,3,0,0},cg={13,1,3,2,0,0},ch={9,1,1,1,3,2},ci={3,0,3,2,12,16},cj={6,0,3,2,12,16},ck={0,1,1,2,4,16},cl={6,14,2,2,7,16},cm={8,14,2,2,8,16},cn={10,15,1,1,3,2},bG={10,4,2,1,10,2},co={10,5,2,2,10,10}},function(c9)return bV(aI(c9[1],c9[2]),aF(c9[3],c9[4]),ao(c9[5],c9[6]),14)end)c2.cp=cc.cn.bW:aJ()local cq={cr={["goal"]=bP.bT(cc.ci),["sonic"]=bP.bT(cc.cj),["rotating"]=bP({cc.ci,cc.cl,cc.ck,cc.cm,cc.cj,cc.cl,cc.ck,cc.cm},3,4)}}by(c2.c4,cc)by(c2.ca,cq)local cs={ct=11,cu=15}local cv={cw=bV(aI(10,0),aF(2,1),ao(8,5),14)}by(c2,cs)by(c2.c4,cv)local cx={}function cy(cz,cA)return cA end
local cB=ae(function(self)self.cC={}self.cD=nil
self.cE=nil end)function cB:cF()self:cG()if self.cD then self.cD:cF()end end
function cB:b_()if self.cD then self.cD:b_()end end
function cB:cH(cI)self.cC[cI.type]=cI end
function cB:cJ(cK)self.cE=self.cC[cK]end
function cB:cG(cK)if self.cE then self:cL(self.cE)end end
function cB:cL(cM)if self.cD then self.cD:cN()end
self.cD=cM
cM:cO()self.cE=nil end
local cP=a5()function cP:X(cQ,...)self.cQ=cQ
self.bx={...}end
local cR=a5()function cR:X()self.cS={}end
function cR:cT(cU,...)local cQ=cocreate(cU)add(self.cS,cP(cQ,...))return#self.cS end
function cR:cV()local cW={}for B,cP in pairs(self.cS)do local cX=costatus(cP.cQ)if cX=="suspended"then local cY,cZ=coresume(cP.cQ,unpack(cP.bx))elseif cX=="dead"then add(cW,cP)end end
for cP in all(cW)do del(self.cS,cP)end end
function cR:c_(d0)deli(self.cS,d0)end
function cR:d1()M(self.cS)end
local d2=ae(function(self)self.d3={}for B=0,1 do local D={}for B=0,5 do D[B]=0 end
self.d3[B]=D end end)local d4=0x5f2d
local d5=32
local d6=33
function d2:d7(d8,d9)d9=d9 or 0
return self.d3[d9][d8]end
function d2:da(d8,d9)local db=self:d7(d8,d9)return db==0 or db==3 end
function d2:dc(d8,d9)return not self:da(d8,d9)end
function d2:dd(d8,d9)local db=self:d7(d8,d9)return db==3 end
function d2:de(d8,d9)local db=self:d7(d8,d9)return db==1 end
function d2:df()for d9=0,1 do self:dg(d9)end end
function d2:dg(d9)local dh=self.d3[d9]for d8,di in pairs(dh)do if self:da(d8,d9)and btn(d8,d9)and not btnp(d8,d9)then di=2 end
local dj=btn(d8,d9)dh[d8]=self:dk(di,dj)end end
function d2:dk(dl,dc)if dl==0 then if dc then return 1 end elseif dl==1 then if dc then return 2 else return 3 end elseif dl==2 then if not dc then return 3 end else if dc then return 1 else return 0 end end
return dl end
local dm=a5()function dm:X(dn)self.cR=cR()self.dn=dn
self.dp=1/dn end
function dm:dq(cC)for dr in all(cC)do dr.ds=self
cB:cH(dr)end end
function dm:dt()self:dq(self:du())end
function dm:dv()if self.dw then self:dw()end
self:dt()cB:cJ(self.dx)if self.dy then self:dy()end end
function dm:cF()d2:df()self:dz()end
function dm:dz()cB:cF()self.cR:cV()self:dA()end
function dm:dA()end
function dm:dB()cls()cB:b_()self:dC()end
function dm:dC()end
function dm:cT(cU,...)return self.cR:cT(cU,...)end
function dm:c_(d0)self.cR:c_(d0)end
function dm:d1()self.cR:d1()end
function dm:dD(dE)O(ceil(dE*self.dn))end
local dF=a7(dm)function dF:X()dm.X(self,60)end
function dF:dy()extcmd("set_title","Pico Sonic")poke(0x5f5c,-1)end
local dG=a5()dG.dH={{1,1,0,0},{2,2,1,0},{1,1,0,0},{2,2,5,0},{5,1,1,0},{13,13,5,5},{15,6,4,5},{4,2,2,5},{4,4,5,5},{15,9,4,13},{3,3,1,1},{13,2,1,1},{2,2,1,1},{4,4,2,2},{9,4,5,5}}function dG:X()self.dI=0 end
function dG:dJ()if self.dI==0 then pal()elseif self.dI<5 then for v=1,15 do pal(v,dG.dH[v][self.dI],1)end else cls()end end
local dK={}function dK.dL(dM,ap,aq,dN,dO)if dO then for dP=-1,1,2 do for dQ=-1,1,2 do local bq=(dP+dQ)/2
local br=(dP-dQ)/2
print(dM,ap+bq,aq+br,dO)end end end
print(dM,ap,aq,dN)end
local dR=a9()function dR:X(dM,c0,x,dS)self.dM=dM
self.c0=c0
self.x=x
self.dS=dS or-1 end
function dR:dB()dK.dL(self.dM,self.c0.ap,self.c0.aq,self.x,self.dS>=0 and self.dS or nil)end
local dT=a5()function dT:X()self.dU={}self.dV={}end
function dT:dW(cz,dX)local dY=self.dV[cz]if dY==nil then add(self.dU,dX)self.dV[cz]=dX else dY:a3(dX)end end
function dT:dZ(cz)local dY=self.dV[cz]if dY~=nil then del(self.dU,dY)self.dV[cz]=nil else end end
function dT:d_()M(self.dU)M(self.dV)end
function dT:dB()for dX in all(self.dU)do dX:dB()end end
local e0=a9()function e0:X(c0,e1,e2,x)self.c0=c0
self.e1=e1
self.e2=e2
self.x=x end
function e0:dB()rectfill(self.c0.ap,self.c0.aq,self.c0.ap+self.e1-1,self.c0.aq+self.e2-1,self.x)end
local cI=a5()cI.type=':undefined'function cI:X()end
function cI:cO()end
function cI:cN()end
function cI:cF()end
function cI:b_()end
function cI:e3()end
local e4=a5()function e4:X()self.c0=ao.aE()self.e5=0
self.e6=2
self.e7=0
self.e8=2
self.e9=0
self.ea=0
self.eb=ao.aE()self.ec=0
self.ed=ao.aE()end
function e4:ee(ef)self.eg=ef
self:eh(ef.ei:aH())self.e5=8 end
function e4:eh(ej)self.c0:a3(ej)self.eb.ap=ej.ap
self.eb.aq=ej.aq end
function e4:cF()local ek=false
if self.el:em()then if self.e6~=self.el.en then self.e6=self.el.en
ek=true end end
if ek then self.e7=0 elseif self.e8~=self.e6 then self.e7=self.e7+1
if self.e7>=30 then self.e8=self.e6 end end
if self.el.eo==5 then if self.e9>=120 then self.ea=min(self.ea+1,44)else self.e9=self.e9+1 end else self.e9=0
self.ea=max(0,self.ea-1)end
if self.el.eo==6 then self.ec=16
self.ed:a3(self.el.c0)self.ep=self.el.en elseif self.ec>0 then self.ec=self.ec-1 end
local eq
local er
local es
local et
if self.ec>0 then eq=self.ed
er=0
es=true
et=self.ep else eq=self.el.c0
er=self.el.eu.ap
es=self.el:em()et=self.e8 end
local ev=mid(self.eb.ap,eq.ap-4,eq.ap+4)local bq=ev-self.eb.ap
bq=sgn(bq)*min(abs(bq),8)self.eb.ap=self.eb.ap+bq
local ew=8*aY[et]local ex=3-2.5
local ey=mid(0,1,(abs(er)-2.5)/ex)local ez=sgn(er)*ey*32
local eA=ew+ez
local eB=eA-self.e5
eB=sgn(eB)*min(abs(eB),0.5)self.e5=self.e5+eB
self.c0.ap=self.eb.ap+self.e5
local eC=eq.aq+self.el:eD()-8
local br
if self.el:em()then local eE=mid(self.eb.aq,eC- -4-1,eC- -4+1)br=eE-self.eb.aq
local eF=abs(self.el.eG)<4 and 3 or 8
br=sgn(br)*min(abs(br),eF)else local eE=mid(self.eb.aq,eC- -4-16,eC- -4+16)br=eE-self.eb.aq
br=sgn(br)*min(abs(br),8)end
self.eb.aq=self.eb.aq+br
self.c0.aq=self.eb.aq+self.ea
self.c0.ap=mid(64,self.c0.ap,self.eg.eH*8-64)local eI=self:eJ(self.c0.ap)self.c0.aq=mid(64,self.c0.aq,eI-64)end
function e4:eK()return ao(flr(self.c0.ap),flr(self.c0.aq))end
function e4:eJ(ap)local eL=0
for eM in all(self.eg.eN)do if ap<eM.ap*8 then eL=eM.aq
break end end
return(self.eg.eO-eL)*8 end
function e4:eP(eQ,eR)local eS=self.c0.ap-64
local eT=self.c0.ap+64
local eU=self.c0.aq-64
local eV=self.c0.aq+64
return eS<eR.ap and eT>eQ.ap and eU<eR.aq and eV>eQ.aq end
local eW=a5()function eW:X(eX)self.eX=eX
self.eY=false
self.eZ=0
self.e_=1
self.f0=0 end
function eW:f1(f2,f3,f4)f4=f4 or 1
self.eZ=f4
if self.f5~=f2 or f3 then self.eY=true
self.f5=f2
self.e_=1
self.f0=0 end end
function eW:f6()self.eY=false
self.f5=nil
self.e_=1
self.f0=0 end
function eW:cF()if self.eY then local f7=self.eX[self.f5]self.f0=self.f0+self.eZ
while self.f0>=f7.bR do if self.e_<#f7.bQ then self.e_=self.e_+1
self.f0=self.f0-f7.bR else if f7.bS==1 then self.eY=false
self.e_=1
self.f0=0 elseif f7.bS==2 then self.eY=false
self.e_=#f7.bQ
self.f0=0 elseif f7.bS==3 then self:f6()else self.e_=1
self.f0=self.f0-f7.bR end end end end end
function eW:b_(c0,bc,bd,bg)if self.f5 then local f7=self.eX[self.f5]local f8=f7.bQ[self.e_]f8:b_(c0,bc,bd,bg)end end
local f9={}local fa=a9()function fa:X(fb,fc,fd,fe,ff,fg,fh)self.fb=fb
self.fc=fc
self.fd=fd
self.fe=fe
self.ff=ff
self.fg=fg
self.fh=fh end
function fa:fi(fj)return self.fc[fj+1]end
function fa:fk(fl)return self.fd[fl+1]end
local function fm(fn)for ay in all(fn)do if ay~=0 and ay~=8 then return false end end
return true end
function fa:fo()return fm(self.fc)end
function fa:fp()return fm(self.fd)end
function fa:fq()if self.fh then return false end
local fr
for ay in all(self.fc)do if ay~=0 then if fr then if ay~=fr then return false end else fr=ay end end end
return true end
function fa.fs(fe)local ft=fe<0.25 or fe>=0.75
local ff=ft and 2 or 1
local fg=fe<0.5 and 2 or 1
return ff,fg end
function fa.fu(fv,fe,fh)local ff,fg=fa.fs(fe)local fb=aI.aK(fv)return fa(fb,fa.fw(fb,ff),fa.fx(fb,fg),fe,ff,fg,fh)end
local function ex(a4,fy,dz)dz=dz or 1
return function(K,fz)local fA=fz+dz
if dz>0 and fA<=fy or dz<0 and fA>=fy or dz==0 then return fA end end,nil,a4-dz end
function fa.fB(fC,fD,bq,br,ff,fg,fE)local fF=sget(fC+bq,fD+br)if fF~=0 then return fE(bq,br,ff,fg)end end
function fa.fG(bq,br,ff,fg)if ff==2 then return 8-br else return br+1 end end
function fa.fH(bq,br,ff,fg)if fg==2 then return 8-bq else return bq+1 end end
function fa.fw(fI,ff)local fn={}local fJ=fI:aH()local fK=ff==2 and{ex(0,8-1)}or{ex(8-1,0,-1)}for bq=0,8-1 do for br in unpack(fK)do fL=fa.fB(fJ.ap,fJ.aq,bq,br,ff,nil,fa.fG)if fL then break end end
if not fL then fL=0 end
add(fn,fL)end
return fn end
function fa.fx(fI,fg)local fn={}local fJ=fI:aH()local fM=fg==2 and{ex(0,8-1)}or{ex(8-1,0,-1)}for br=0,8-1 do for bq in unpack(fM)do fN=fa.fB(fJ.ap,fJ.aq,bq,br,nil,fg,fa.fH)if fN then break end end
if not fN then fN=0 end
add(fn,fN)end
return fn end
local fO={}local fP=C({[1]={8,2},[2]={8,0},[3]={8,2},[4]={8,0},[5]={8,2},[6]={8,0},[7]={8,2},[8]={8,-2},[9]={8,-2},[10]={8,-2},[11]={8,-2},[12]={8,3},[13]={8,3},[14]={8,-3},[15]={8,-3},[16]={8,8},[17]={8,5},[18]={8,3},[19]={8,-3},[20]={8,-5},[21]={8,-8},[38]={4,-8},[22]={3,-8},[39]={-3,-8},[23]={-4,-8},[32]={-8,8},[33]={-8,5},[34]={-8,3},[35]={-8,-3},[36]={-8,-5},[37]={-8,-8},[24]={-4,8},[40]={-3,8},[25]={3,8},[41]={4,8},[44]={4,-8},[28]={4,-8},[26]={8,-0.0625},[29]={8,0},[30]={0,-8},[31]={0,8},[42]={8,-4},[43]={8,-4},[45]={8,0}},function(fQ)return atan2(fQ[1],fQ[2])end)local fR={[7]=true,[8]=true,[13]=true,[14]=true,[18]=true,[19]=true,[34]=true,[35]=true}local fS={[35]=29,[36]=29,[218]=29,[219]=29,[235]=29,[48]=29,[64]=29,[80]=29,[83]=29,[84]=29,[182]=44,[166]=28,[124]=29,[125]=29,[49]=1,[50]=2,[51]=3,[52]=4,[53]=5,[54]=6,[55]=7,[56]=8,[57]=9,[58]=10,[59]=11,[60]=12,[61]=13,[62]=14,[63]=15,[65]=29,[66]=29,[67]=29,[68]=29,[69]=29,[70]=29,[71]=29,[72]=29,[73]=29,[85]=29,[86]=29,[87]=29,[88]=29,[89]=29,[160]=45,[161]=45,[213]=45,[214]=45,[164]=13,[94]=29,[95]=29,[110]=29,[111]=29,[74]=26,[75]=2,[202]=30,[173]=31,[176]=4,[177]=4,[192]=29,[193]=29,[208]=29,[209]=29,[162]=29,[163]=29,[178]=29,[179]=29,[194]=29,[195]=29,[210]=29,[211]=29,[96]=16,[97]=17,[98]=18,[99]=19,[100]=20,[101]=21,[118]=38,[102]=22,[119]=39,[103]=23,[112]=32,[113]=33,[114]=34,[115]=35,[116]=36,[117]=37,[104]=24,[120]=40,[105]=25,[121]=41,[240]=8,[241]=9,[242]=10,[243]=11,[244]=29,[245]=32,[228]=19,[229]=20}local fT={}for fU,fv in pairs(fS)do fT[fU]=fa.fu(fv,fP[fv],fR[fv])end
fO.fV=function(fU)return fT[fU]end
local fW=C({fX={{12,8},{2,2},{10,8},14},fY={{0,8},{2,2},{8,8},14},fZ={{2,8},{2,2},{8,8},14},f_={{4,8},{2,2},{9,8},14},g0={{6,8},{2,2},{8,8},14},g1={{8,8},{2,2},{8,8},14},g2={{10,8},{2,2},{8,8},14},g3={{10,8},{2,2},{9,8},14},g4={{12,8},{2,2},{9,8},14},g5={{14,8},{2,2},{11,8},14},g6={{14,8},{2,3},{9,8},14},g7={{0,8},{2,2},{8,8},14},g8={{2,8},{2,2},{8,8},14},g9={{4,8},{2,2},{8,8},14},ga={{6,8},{2,2},{8,8},14},gb={{0,8},{2,2},{6,6},14},gc={{2,8},{2,2},{6,6},14},gd={{4,8},{2,2},{6,6},14},ge={{6,8},{2,2},{6,6},14},gf={{8,8},{2,2},{6,6},14},gg={{12,8},{2,2},{7,10},14},gh={{14,8},{2,2},{7,10},14},gi={{0,8},{2,2},{3,10},14},gj={{2,8},{2,2},{3,10},14},gk={{4,8},{2,2},{3,10},14},gl={{6,8},{2,2},{3,10},14},gm={{8,8},{2,2},{3,10},14}},function(gn)return bV(aI(gn[1][1],gn[1][2]),aF(gn[2][1],gn[2][2]),ao(gn[3][1],gn[3][2]),gn[4])end)local go=C({["idle"]={{fW.fX},1,2},["walk"]={{fW.fY,fW.fZ,fW.f_,fW.g0,fW.g1,fW.g2},10,4},["brake_start"]={{fW.g3,fW.g4},10,2},["brake_reverse"]={{fW.g5},15,2},["run"]={{fW.g7,fW.g8,fW.g9,fW.ga},5,4},["spin"]={{fW.gb,fW.gc,fW.gb,fW.gd,fW.gb,fW.ge,fW.gb,fW.gf},5,4},["crouch"]={{fW.gg,fW.gh},6,2},["spring_jump"]={{fW.g6},1,2},["spin_dash"]={{fW.gi,fW.gj,fW.gi,fW.gk,fW.gi,fW.gl,fW.gi,fW.gm},1,4}},function(gn)return bP(gn[1],gn[2],gn[3])end)local gp={gq=fW,gr=go}local gs={}local gt=a9()gs.gt=gt
function gt:X(gu,gv,fe)self.gu=gu
self.gv=gv
self.fe=fe end
local gw=a9()gs.gw=gw
function gw:X(gu,c0,fe,gx,gy)self.gu=gu
self.c0=c0
self.fe=fe
self.gx=gx
self.gy=gy end
local gz=a9()gs.gz=gz
function gz:X(gu,gA,gB,gC,fe)self.gu=gu
self.gA=gA
self.gB=gB
self.gC=gC
self.fe=fe end
function gz:gD(b1)if b1==0 or b1==2 then return self.gA elseif b1==1 then return self.gB else return self.gC end end
local gE={}function gE.gF(bg)if not bg or bg>=0.875 or bg<=0.125 then return 3 elseif bg<0.375 then return 2 elseif bg<=0.625 then return 1 else return 0 end end
function gE.gG(gH)return 0.25*(3-gH)%4 end
function gE.gI(gJ,gH)return gH%2==0 and gJ.aq or gJ.ap end
function gE.gK(gJ,gH)return gH%2==1 and gJ.aq or gJ.ap end
function gE.gL(gJ,H,gH)if gH%2==0 then gJ.aq=H else gJ.ap=H end end
function gE.gM(gN,gO,gH)if gH<2 then return gO-gN else return gN-gO end end
function gE.gP(gQ,gH)return gE.gK(gQ:aN()+4*aU[gH],gH)end
function gE.gR(gS,gT,gH,gU)if gS.B>=0 and gS.B<128 and gS.aG>=0 and gS.aG<32 then local gV=mget(gS.B,gS.aG)local gW=fget(gV,0)if gW then local gX=fO.fV(gV)if gX then local fo=gX:fo()local fp=gX:fp()local fq=gX:fq()if gH%2==1 then local e2=gX:fi(gT)if gX.ff==2 and gH==1 or gX.ff==1 and gH==3 then if gU and not fo then return 0 end
if e2>0 then return 8,gE.gG(gH)end elseif fq then if e2>0 then return e2,gE.gG(gH)end else if e2>0 or gX.fh and gE.gF(gX.fe)==gH then return e2,gX.fe end end else local e1=gX:fk(gT)if gX.fg==2 and gH==0 or gX.fg==1 and gH==2 then if gU and not fp then return 0 end
if e1>0 then return 8,gE.gG(gH)end elseif fq then if e1>0 then return e1,gE.gG(gH)end else if e1>0 or gX.fh and gE.gF(gX.fe)==gH then return e1,gX.fe end end end end end end
return 0 end
local gY=a5()function gY:X()self.gZ=eW(gp.gr)self:g_()end
function gY:g_()self.h0=1
self.eo=1
self.gH=3
self.en=2
self.h1=1
self.h2=0
self.c0=ao(-1,-1)self.eG=0
self.h3=0
self.eu=ao.aE()self.fe=0
self.h4=0
self.h5=0
self.h6=ao.aE()self.h7=false
self.h8=false
self.h9=false
self.ha=false
self.hb=false
self.hc=0
self:hd(0)self:he("idle")self.hf=0
self.hg=false
self.hh=0 end
function gY:em()return I({1,4,5,6},self.eo)end
function gY:hi()return I({3,4,5,6},self.eo)end
function gY:eD()return self:hi()and 6 or 8 end
function gY:hj()return self:hi()and 12 or 16 end
function gY:hk(hl)return(self.gH-aY[hl])%4 end
function gY:hm()return aU[self.gH]end
function gY:hn(ay)return ay:ho(gE.gG(self.gH))end
function gY:hp(c0)self:g_()self:hq(c0)end
function gY:hq(c0)self.c0=c0
self:hr(2)self:hs()end
function gY:ht()return self.c0+self:eD()*self:hm()end
function gY:hu(hv)if self.hw~=hv then self.hw=hv end end
function gY:hd(bg)self.hx=bg
self:hy()end
function gY:hy()local hz=0
local hA=false
if self.gZ.f5=="idle"then hz=flr(4*self.hx+0.5)/4 elseif I({"walk","run"},self.gZ.f5)then hz=flr(8*self.hx+0.5)/8
if hz%0.25~=0 then hA=true
local bc=self.en==1
hz=hz+(bc and 1 or-1)*0.125 end end
self.hz=hz%1
self.hA=hA end
function gY:hB(bg,hC)self.fe=bg
if hC then self:hd(0)elseif bg then self:hd(bg)end
self.gH=gE.gF(bg)end
function gY:cF()self:hD()self:hE()self.gZ:cF()end
function gY:hD()self:hF()self:hG()end
function gY:hH(hI)return self:hJ(self.hK,hI)end
function gY:hL(hI)return self:hJ(self.hM,hI)end
function gY:hJ(hN,hI)local hO=1/0
local hP=nil
for B=1,2 do local hQ=self:hR(hI,B)local hS=hN(self,hQ)local gv=hS.gv
if gv<hO or gv==hO and self:hT()==B then hO=gv
hP=hS end end
return gs.gt(hP.gu,hO,hP.fe)end
function gY:hT()if self:em()then if self.eG~=0 then return aZ(self.eG)end else if self.eu.ap~=0 then return aZ(self.eu.ap)end end
return self.en end
function gY:hR(hI,hU)local ap=hI.ap
local aq=hI.aq
if self.gH%2==1 then ap=flr(ap)else aq=flr(aq)end
local hV=ao(ap,aq)+self:eD()*self:hm()local hW=self:hn(2.5*aX[hU])hW=ao(flr(hW.ap),flr(hW.aq))return hV+hW end
function gY:hX(hI)local ap=hI.ap
local aq=hI.aq
if self.gH%2==0 then ap=flr(ap)else aq=flr(aq)end
local hY=ao(ap,aq)if self.fe==0 then return hY+(self:eD()-6)*self:hm()else return hY:a0()end end
local function hZ(h_,i0,i1,i2,i3,i4,i5,i6,i7)local i8=cB.cD
local i9=i8:ia()local ib=aU[i0]local hQ=i3+i4*ib
local ic=ao.aO(hQ+i1*ib)local id=ao.aO(hQ+i2*ib)local ie=ic:aH()local ig=aF(ib.ap,ib.aq)local gT=gE.gI(hQ-ie,i0)local ih=ic:a0()while true do local ii,fe
local ij=false
local ik=i8:il(ih)local im=mget(ik.B,ik.aG)local io=fget(im,1)local bE=fget(im,2)if ij then ii,fe=0 else local gU=i7 and ic==ih
ii,fe=gE.gR(ih-i9,gT,i0,gU)end
if fe then local ip=gE.gP(ih,i0)local iq=gE.gM(ip,gE.gK(hQ,i0),i0)-ii
local cY=i5(ih,iq,fe)if cY then return cY end end
if ih==id then local cY=i6()return cY end
ih=ih+ig end end
local function ir()return gs.gt(nil,4+1,nil)end
local function is(gu,it,fe)if it<-7 then return ir()elseif it<=4 then return gs.gt(gu,it,fe)end end
function gY:hK(hQ)return hZ(self,self.gH,-(7+1),4,hQ,0,is,ir)end
local function iu()return gs.gt(nil,4+1,nil)end
local function iv(iw,ix,fe)if ix<=0 then return gs.gt(iw,ix,fe)else return nil end end
function gY:hM(hQ)local iy=self:hj()return hZ(self,b0(self.gH),7+1-iy,0,hQ,iy,iv,iu,true)end
local function iz()return gs.gt(nil,ceil(2.5)+1,nil)end
local function iA(iw,iB,fe)if iB<ceil(2.5)then return gs.gt(iw,iB,fe)else return iz()end end
function gY:iC(hQ,iD)return hZ(self,self:hk(iD),0,ceil(2.5),hQ,0,iA,iz)end
function gY:hs()local hS=self:hH(self.c0)local it,iE=hS.gv,hS.fe
if-7<=it and it<=0 then local iF=it*self:hm()self.c0:av(iF)self:hu(hS.gu)self:hB(iE)if not self:em()then self:hr(1)end end end
function gY:hr(iG)local iH=self:em()local iI=self:hi()self.eo=iG
if iI~=self:hi()then local iJ=self:hn(ao(0,8-6))local iK=iI and-1 or 1
self.c0:av(iK*iJ)end
if iG==2 then self.hw=nil
self:hB(nil)self.eG=0
self.h9=false elseif iG==3 then self.hw=nil
self:hB(nil,true)self.eG=0
self.h9=false
self.hg=false elseif iG==1 then if not iH then self.eG=self.eu:aC(ao.iL(self.fe))self.eu:a3(self:iM())self.ha=false
self.hb=false
self.hg=false end elseif iG==4 then if not iH then self.ha=false
self.hb=false
self.hg=false end end
if iG~=1 and iG~=2 then self.hh=0 end
if iG~=2 then self.hc=0 end end
function gY:hF()if self.h2>0 then self.h2=self.h2-1 end end
function gY:hG()if self:em()or self.hc>0 then if self.hc>0 then end
self:iN()self:iO()end
if self.hc>0 then self.hc=self.hc-1 end
if I({1,5},self.eo)then self:iP()elseif self.eo==4 then self:iQ()end
if self:em()then self:iR()else self:iS()end
if self:em()or self.hc>0 then if self.hc>0 then end
self:iT()end end
function gY:iP()if self:iU()then if abs(self.eG)>=0.5 then self:hr(4)self:iV(57)elseif self.eo~=5 then self:hr(5)end elseif self.eo~=1 then self:hr(1)end end
function gY:iQ()if abs(self.eG)<0.25 then self:hr(1)end end
function gY:iR()self:iW()local gw=self:iX()if gw.gx then self.eG=0 end
if flr(gw.c0.ap)<2.5 then gw.c0.ap=ceil(2.5)self.eG=max(-0.1,self.eG)end
if self.eG~=0 then self.hf=abs(self.eG)else self.hf=0 end
self.eu:a3(self:iM())self.c0:a3(gw.c0)local iY=gw.gy
if not iY and self.gH~=3 and abs(self.eG)<1.25 then if self.fe>=0.25 and self.fe<=0.75 then iY=true end
self.h3=30 end
if iY then local iZ
self.hc=6
self.h4=self.fe
if I({1,5},self.eo)then iZ=2 else iZ=3 end
self:hr(iZ)else self:hu(gw.gu)self:hB(gw.fe)end end
function gY:iW()if I({1,5},self.eo)then local i_=self.eG
self:j0()self:j1()self:j2(i_)elseif self.eo==4 then self:j0()self:j3()end end
function gY:j0()local j4=false
self.eG=self.eG+0.0625*sin(self.fe)end
function gY:j1()local j5=self.eG
if self.h6.ap~=0 then if self.eG==0 or sgn(self.eG)==sgn(self.h6.ap)then j5=self.eG+self.h6.ap*0.0234375
self.en=aZ(self.h6.ap)if self.hh==1 then self.hh=0 end else j5=self.eG+self.h6.ap*0.25
local j6=j5==0 or sgn(j5)==sgn(self.h6.ap)if j6 then if abs(j5)>0.0234375 then j5=sgn(j5)*0.0234375 end
self.en=aZ(self.h6.ap)if self.hh==1 then self.hh=2 end elseif self.gH==3 and abs(self.eG)>=2 then self.en=aZ(self.eG)self.hh=1
self:iV(58)end end else if self.eG~=0 then j5=sgn(self.eG)*max(0,abs(self.eG)-0.0234375)end
if self.hh==1 and not self.gZ.eY then self.hh=0 end end
self.eG=j5 end
function gY:j3()local j7=0.01171875
if self.eG~=0 and self.h6.ap~=0 then if sgn(self.eG)~=sgn(self.h6.ap)then j7=j7+0.0625 else self.en=aZ(self.h6.ap)end end
self.eG=sgn(self.eG)*max(0,abs(self.eG)-j7)end
function gY:j2(i_)local j8=max(abs(i_),3)if abs(self.eG)>j8 then self.eG=sgn(self.eG)*j8 end end
function gY:iM()return self.eG*ao.iL(self.fe)end
function gY:iX()if self.eG==0 then return gs.gw(self.hw:a0(),self.c0:a0(),self.fe,false,false)end
local gy=false
local j9=self.gH
local hU=aZ(self.eG)local ja=self.c0+self:iM()local gx=self:jb(ja,hU)local hS=self:hH(ja)local it=hS.gv
local iF=it*self:hm()if it<0 then if-it<=7 then ja:av(iF)end elseif it>=0 then if it<=4 then local jc=compute_signed_angle_between(hS.fe,self.fe)if aY[hU]*jc>0.125 then gy=true else ja:av(iF)end else gy=true end end
local jd=not gy and hS.gu or nil
if gx and j9~=gE.gF(hS.fe)then self:hu(jd)gx=self:jb(ja,hU)end
local je=gs.gw(jd,ja,hS.fe,gx,gy)return je end
function gY:jb(ja,hU)local i3=self:hX(ja)local jf=self:iC(i3,hU)if jf.gu then if-6<=jf.gv and jf.gv<ceil(2.5)then local iB=jf.gv-ceil(2.5)local jg=aU[self:hk(hU)]local jh=iB*jg
ja:av(jh)return true end end
return false end
function gY:iU()return self.h6.ap==0 and self.h6.aq>0 end
function gY:iT()if self.h7 then self.h7=false
self.h9=true end end
function gY:iN()if self.h9 then self.h9=false
local ji=self.hc>0 and self.h4 or self.fe
local jj=3.25*ao.iL(ji):jk()self.eu:av(jj)self:hr(3)self.ha=true
self.hb=true
self:iV(55)return true end
return false end
function gY:iO()if I({5,6},self.eo)then if self.eo==6 and self.h6.aq<=0 then self:jl()elseif self.h7 then self.h7=false
if self.eo==5 then self:hr(6)self.eG=0
self.h5=0 end
self.h5=min(self.h5+2,8)self:he("spin_dash",true)self:iV(61)else if self.eo==6 then self.h5=self.h5*0.96875 end end end end
function gY:jl()local jm=aY[self.en]self:hr(4)self.eG=jm*(4+flr(self.h5)*0.25)self:iV(62)end
function gY:iS()if self.ha then self.ha=false else self.eu.aq=self.eu.aq+0.109375 end
if self.eo==3 then self:jn()end
if self.h6.ap~=0 then local jo=self.eu.ap
self.eu.ap=self.eu.ap+self.h6.ap*0.046875
self:jp(jo)self.en=aZ(self.h6.ap)end
self:jq()if self.eu.aq>32 then self.eu.aq=32 end
self.c0:av(self.eu)local gz=self:jr()if gz.gA then self.eu.ap=0 end
if gz.gB then self.eu.aq=0 end
if flr(self.c0.ap)<2.5 then self.c0.ap=ceil(2.5)self.eu.ap=max(0,self.eu.ap)end
if gz.gC then self:hu(gz.gu)self:hB(gz.fe)self:hr(1)end end
function gY:jn()if self.hb and not self.h8 then self.hb=false
local js=-2
if self.eu.aq<js then self.eu.aq=js end end end
function gY:jq()local jt=self.eu
if jt.aq<0 and jt.aq>-8 and abs(jt.ap)>=0.25 then jt.ap=jt.ap*0.96875 end end
function gY:jp(jo)local ju=max(abs(jo),3)if abs(self.eu.ap)>ju then self.eu.ap=sgn(self.eu.ap)*ju end end
function gY:jr()if self.eu:ar()then return gs.gz(nil,false,false,false,nil)end
local hw
local gA=false
local gB=false
local gC=false
local fe
if self.eu.ap~=0 then local hU=aZ(self.eu.ap)gA=self:jb(self.c0,hU)end
if self.eu.aq>0 then local gt=self:hH(self.c0)local it=gt.gv
if-7<=it and it<0 then local iF=it*self:hm()self.c0:av(iF)gC=true
hw=gt.gu
fe=gt.fe end elseif self.eu.aq<0 then local jv=self:hL(self.c0)local ix=jv.gv
if ix<0 then assert(jv.fe>0.25 and jv.fe<0.75,"detected ceiling with slope angle expected between 0.25 and 0.75 excluded, got: "..jv.fe.." (we don't check for those bounds in ceiling adherence check so Sonic may adhere to unwanted walls)")local jw=-ix*self:hm()self.c0:av(jw)if jv.fe<=0.25+0.125 or jv.fe>=0.75-0.125 then hw=jv.gu
gC=true
fe=jv.fe else gB=true end end end
return gs.gz(hw,gA,gB,gC,fe)end
function gY:hE()self:jx()self:jy()end
function gY:jx()if self.hh==1 then self:he("brake_start")return elseif self.hh==2 then self:he("brake_reverse")if self.gZ.eY then return else self.hh=0 end end
if self.eo==1 then if self.eG==0 then self:he("idle")else if self.hf<3 then self:he("walk",false,max(0.625,self.hf))else self:he("run",false,self.hf)end end elseif self.eo==2 then if self.hg and self.eu.aq>0 then self.hg=false end
if self.hg then self:he("spring_jump")else if self.hf<3 then self:he("walk",false,max(0.625,self.hf))else self:he("run",false,self.hf)end end elseif self.eo==5 then self:he("crouch")elseif self.eo==6 then else local jz=self.eo==4 and 1.25 or 0.625
self:he("spin",false,max(jz,self.hf))end end
local jA={["idle"]=0,["walk"]=0,["walk45"]=1,["brake_start"]=3,["brake_reverse"]=3,["run"]=2,["run45"]=2+1/32,["spin"]=3,["crouch"]=1,["spring_jump"]=0,["spin_dash"]=4}function gY:he(f2,f3,f4)self.gZ:f1(f2,f3,f4)self:hy()local jB
if self.hA then jB=f2 .."45"else jB=f2 end
local jC=jA[jB]if self.jD~=jC then self.jD=jC
local jE=0x4b00+jC*0x400
if jC<4 then memcpy(0x1000,jE,0x400)else for B=0,15 do memcpy(0x1000+B*0x40,jE+B*0x28,0x28)end end end end
function gY:jy()local bg=self.hx
if self.eo==2 and bg~=0 then if bg<0.5 then self:hd(max(0,abs(bg)-1/128))else self.hx=min(1,abs(bg)+1/128)%1 end end end
function gY:b_()local jF=ao(flr(self.c0.ap),flr(self.c0.aq))local bc=self.en==1
self.gZ:b_(jF,bc,false,self.hz)end
function gY:iV(aL)if stat(19)~=59 then sfx(aL)end end
local jG=a7(cI)function jG:X()self.camera=e4()end
function jG:jH(jI,ay)return"data_stage"..self.jJ.."_"..jI..ay..".p8"end
function jG:jK(jL)return jL+self:ia()end
function jG:jM(jN)jN=jN or ao.aE()camera(self.camera.c0.ap-64-jN.ap,self.camera.c0.aq-64-jN.aq)end
function jG:jO()local i9=self:ia()self:jM(ao(8*i9.B,8*i9.aG))end
function jG:ia()return aM(128*self.jP.ap,32*self.jP.aq)end
local jQ={{1,12,12,7},{7,1,12,12},{12,7,1,12},{12,12,7,1}}function jG:jR()local jS=0.5
local ey=t()%jS/jS
local jT=#jQ
local dz=min(flr(ey*jT)+1,jT)local A=jQ[dz]y({1,13,12,7},A)end
function jG:jU()self:jO()self:jV()self:jW()end
function jG:jV()w(14)map(0,0,0,0,128,32,64)end
function jG:jW()self:jR()map(0,0,0,0,128,32,16)pal()end
function jG:jX()w(14)self:jO()map(0,0,0,0,128,32,128)end
local cr=a5()function cr:X(jY)self.jY=jY
self.gZ=eW(c2.ca.cr)self.gZ:f1("goal")end
function cr:cF()self.gZ:cF()end
function cr:b_()self.gZ:b_(self.jY:aH()+ao(4,0))end
local jZ=a9()function jZ:X(dR,j_,k0)self.dR=dR
self.j_=j_
self.k0=k0 end
function k1(af,k2,k3)local k4={}local k5=""for B=1,#af do local v=sub(af,B,B)local k6=type(k2)=="table"and I(k2,v)or v==k2
if k6 then if#k5>0 or not k3 then add(k4,k5)k5=""end else k5=k5 ..v end end
if#k5>0 or not k3 then add(k4,k5)end
return k4 end
local k7={}function k7.k8(af,ba)local k9=''local ka=k1(af,'\n')local kb=count(ka)for B=1,kb do local kc=0
local kd=k1(ka[B],' ')local ke=count(kd)for N=1,ke do local kf=kd[N]local kg=false
if N>1 then if kc+1+#kf>ba then k9=k9 ..'\n'kc=0
kg=true else k9=k9 ..' 'kc=kc+1 end end
k9=k9 ..kf
kc=kc+#kf end
if B<kb then k9=k9 ..'\n'end end
return k9 end
function k7.kh(dM,ki)return ki-#dM*2+1 end
function k7.kj(dM,kk)return kk-2 end
function k7.kl(dM,ki,kk)return k7.kh(dM,ki),k7.kj(dM,kk)end
function k7.km(dM,ki,kk,dN)local ka=k1(dM,'\n')kk=kk-(#ka-1)*3
for kn in all(ka)do local ap,aq=k7.kl(kn,ki,kk)print(kn,ap,aq,dN)kk=kk+6 end end
function k7.ko(dM,ap,aq,kp,dN,kq)if kp==3 then ap,aq=k7.kl(dM,ap,aq)elseif kp==2 then ap=k7.kh(dM,ap)elseif kp==4 then ap=ap-#dM*4+1 end
dK.dL(dM,ap,aq,dN,kq)end
local kr=a5()function kr:X(ds,kp,ks,kt,ku,kv)self.ds=ds
self.kp=kp
self.ks=ks
self.kt=kt
self.ku=ku
self.kv=kv
self.kw={}self.kx=false
self.ky=0
self.kz=0
self.kA=0 end
function kr:kB(kw)self.kx=true
M(self.kw)for kC in all(kw)do add(self.kw,kC:a0())end
self.ky=1
self:kD(1)self.kz=0
self.kA=0 end
function kr:bN(kw)self.kx=false
M(self.kw)self.ky=0 end
function kr:cF()if self.kx then if d2:de(2)then self:kE()elseif d2:de(3)then self:kF()elseif d2:de(4)then self:kG()end
self.kz=(self.kz+self.ds.dp)%2
local kH=self.kz/2
if kH<0.5 then self.kA=0 else self.kA=-1 end end end
function kr:kI(d0)if self.ky~=d0 then self.ky=d0
self:kD(d0)self:kJ()end end
function kr:kE()if self.ky>1 then self:kI(self.ky-1)end end
function kr:kF()if self.ky<#self.kw then self:kI(self.ky+1)end end
function kr:kD(d0)local k0=self.kw[d0].k0
if k0 then k0(self.ds)end end
function kr:kJ()end
function kr:kG()self.kx=false
self.kw[self.ky].j_(self.ds)self:kK()end
function kr:kK()end
function kr:dB(ap,kL)local kw=self.kw
if#kw==0 then return end
local aq=kL
local kM=0
local kN=#kw-1
for B=kM+1,kN+1 do local dR=kw[B].dR
local kO=ap
if B==self.ky then if self.kp==1 then if self.ku then self.ku:b_(ao(ap-self.kv-3,aq+3))else dR="> "..dR end else dR="> "..dR.." <"end else if self.kp==1 and not self.ku then kO=kO+2*4 end end
k7.ko(dR,kO,aq,self.kp,self.kt,0)aq=aq+6+self.ks end end
local kP=a7(kr)function kP:kJ()sfx(50)end
function kP:kK()sfx(51)end
local kQ={}function kQ.kR(aA,kS)kS=kS or 0
local kT,kU=unpack(c2.c3[aA])local kV={{kT,kU},{7,kT},{7,7}}y({8,2},kV[kS+1])end
function kQ.dB(aA,c0,kS)if aA>=0 then kQ.kR(aA,kS)c2.c4.cn:b_(c0)pal()else c2.c4.ch:b_(c0)end end
local kW={}function kW.kX(am,an,kY)return am+(an-am)*kY end
function kW.kZ(am,an,kY)return am+(an-am)*mid(kY,0,1)end
function kW.k_(am,an,kY)return am+(an-am)*kY*kY end
function kW.l0(am,an,kY)return am+(an-am)*(2-kY)*kY end
function kW.l1(am,an,kY)if kY<=0.5 then return kW.k_(am,(am+an)/2,2*kY)else return kW.l0((am+an)/2,an,2*kY-1)end end
function kW.l2(at,l3,l4,am,an,aL)for Q=1,aL do local kY=Q/aL
for B,l5 in ipairs(l3)do l5.c0:au(at,kW.kX(am,an,kY)+l4[B])end
yield()end end
function kW.l6(l3,a4,fy,aL)for Q=1,aL do local kY=Q/aL
for B,l5 in ipairs(l3)do l5.c0:a3(kW.kX(a4,fy,kY))end
yield()end end
local l7={}local function l8(aq,v)line(0,aq,127,aq,v)end
function l7.l9(la)camera()rectfill(0,0,127,127,1)local lb=156-0.5*la.aq
camera(0,-lb)if lb>=-31 then l7.lc(la)end
if lb<=58 then l7.ld(la,lb)end
l7.le(la)end
function l7.lc(la)l8(-1,12)l8(0,7)l8(1,13)local lf={{0,60,140,220},{30,150,240},{10,90,210},{50,130}}local lg={{0,0,-1,0},{0,-1,-1,0},{0,-1,1,0},{0,1,-1,1}}for aG=0,3 do for lh in all(lf[aG+1])do l7.li(lh,-8.9-14.7*aG,lg[aG+1],2+0.9*aG,3+3.5*aG)end end
local lj={4,3,6,2,1,5}local lk={0.7,1.5,1.2,1.7,1.1}local ll=0.015
for B=0,21 do local br=lj[B%6+1]local aq=2+br
local lm=ll*min(6,br)/6
local ln=flr(lm*la.ap)l7.lo(ln,6*B,aq,lk[B%5+1])end end
function l7.le(la)local lp=0.3
local lq=0.42
local lr=lq-lp
local ls=0.36
local lt=lq-ls
for aG=0,1 do local lm=ls+lt*aG
local ln=flr(lm*la.ap)l7.lu(ln,31+18*(1-aG),19,aG,aG%2==1 and 11 or 3)end
for aG=0,2 do local lm=lp+lr*aG/3
local ln=flr(lm*la.ap)l7.lv(ln,31+8*aG,10,aG,aG%2==0 and 11 or 3)end end
function l7.ld(la,lb)fillp(0x5a5a)rectfill(0,50,127,127-lb,3*0x10+0)fillp()local lm=0.3
local ln=flr(lm*la.ap)local lw={0,1,3}local lx={0,0,2}for B=0,2 do local ly=8*8
local x0=80-ln+ly*B
local lz=ly-2*8
x0=(x0+lz)%192-lz
local lA=102
local lB=lx[B+1]rectfill(x0,lA-8,x0+4*8,lA+(5+lB)*8,3)l7.lC(x0-1,lA,lB,-1)l7.lC(x0+4*8,lA,lB,1)l7.lD(x0,lA-8-1,-1)l7.lD(x0,lA+(5+lB)*8,1)local lE=lA+lw[B+1]*8
c2.c4.cf:b_(ao(x0,lE))c2.c4.cg:b_(ao(x0-24,lE+16))end end
function l7.lC(x0,lA,lB,lF)for br=-8,(5+lB)*8-1 do local aq=lA+br
line(x0+lF*flr(2.5*(1+sin(br/1.7)*sin(br/1.41))),aq,x0,aq,3)end end
function l7.lD(x0,lA,lF)for bq=0,4*8-1 do local ap=x0+bq
line(ap,lA+lF*flr(3.7*(1+sin(bq/1.65)*sin(bq/1.45))),ap,lA,3)end end
function l7.li(ap,aq,lG,lH,f4)local lI=t()*f4
lJ=(ap-lI+100)%300-100
local lK={0,1.5,3,4.5}local lL={0.8,1.4,1.1,0.7}for B=1,4 do circfill(lJ+flr(lK[B]*lH),aq+lG[B],lL[B]*lH+1,13)end
for B=1,4 do circfill(lJ+flr(lK[B]*lH),aq+lG[B],lL[B]*lH,7)end end
local lM={{1,12},{7,12},{12,1},{12,7},{1,12}}function l7.lo(ln,ap,aq,jS)local ey=t()%jS/jS
local jT=#lM
local dz=min(flr(ey*jT)+1,jT)local lN=lM[dz]pset((ap-ln)%128,aq,lN[1])pset((ap-ln+1)%128,aq,lN[2])end
function l7.lv(ln,aq,lO,fl,lP)for lJ=0,127 do local ap=lJ+ln
local e2=lO+flr((3+0.5*fl)*(1+sin(ap/(1.7+0.2*fl))*sin(ap/1.41)))line(lJ,aq,lJ,aq-e2,lP)end end
function l7.lu(ln,aq,lO,fl,lP)for lJ=0,127 do local ap=lJ+ln
local e2=lO+flr((4.5-0.3*fl)*(1+sin(ap/(41.4-9.1*fl)))+1.8*sin(ap/1.41))line(lJ,aq,lJ,aq+e2,lP)end end
local lQ=a7(jG)lQ.type=':stage_clear'local lR=jZ("retry (keep emeralds)",function(ds)ds:cT(lQ.lS)end)local lT=jZ("retry from zero",function(ds)ds:cT(lQ.lU)end)local lV=jZ("back to title",function(ds)ds:cT(lQ.lW)end)function lQ.lS()cB.cD:lX()load('picosonic_ingame')end
function lQ.lU()poke(24063,0)lQ.lS()end
function lQ.lW()poke(24063,0)cB.cD:lX()load('picosonic_titlemenu')end
function lQ:X()jG.X(self)self.jJ=1
self.lY=0
self.lZ=dG()self.l_=dT()self.m0={}self.m1=0
self.m2={}self.m3={}end
function lQ:cO()self:m4()self.camera:eh(ao(3376,328))reload(0x2000,0x2000,0x1000,self:jH(3,1))self.jP=ao(3,1)self:m5()self.ds:cT(self.m6,self)end
function lQ:m6()self:m7()music(0)O(364)self:m8()self.ds:dD(1.0)self:lX()self.lY=1
self.ds:dD(1.0)self:m9()end
function lQ:cF()if self.ma then self.ma:cF()end end
function lQ:b_()if self.lY==0 then l7.l9(ao(3376,328))self:mb()else cls()if self.ma then self.ma:dB(29,95)end end
self:mc()self:md()self.lZ:dJ()end
function lQ:me(jY)self.cr=cr(jY)self.cr.gZ:f1("sonic")end
function lQ:m5()for B=0,128-1 do for aG=0,32-1 do local mf=mget(B,aG)if mf==226 then local jL=aM(B,aG)local jY=jL+aM(128*3,32*1)self:me(jY)end end end end
function lQ:m4()local mg=peek(24063)for B=1,8 do if band(mg,shl(1,B-1))~=0 then self.m0[B]=true
self.m1=self.m1+1 end end end
function lQ:m7()local mh=dR("sonic",ao(0,14),1,9)self.l_:dW("sonic",mh)local mi=dR("got through",ao(0,14),7,0)self.l_:dW("through",mi)kW.l2("x",{mh,mi},{0,24},-68,30,20)local mj=dR("pico island",ao(0,26),7,0)self.l_:dW("stage",mj)kW.l2("x",{mj},{0},128,42,20)end
function lQ:m8()for mk=1,8 do if self.m0[mk]then self.m2[mk]=true
for dz=1,2 do local kT,kU=unpack(c2.c3[mk])self.m3[mk]=3-dz
O(9)end end
M(self.m3)O(9)end
O(30)local mh=self.l_.dV["sonic"]local mi=self.l_.dV["through"]local mj=self.l_.dV["stage"]kW.l2("x",{mh,mi},{0,24},30,-68,10)kW.l2("x",{mj},{0},40,128,10)self.l_:dZ("through")self.l_:dZ("stage")O(30)local ml=self.m1>=8
local mm
local mn=0
if ml then mm="got all emeralds"else mm="got "..self.m1 .." emeralds"mn=6 end
local mo=dR(mm,ao(0,14),7,0)self.l_:dW("emerald",mo)kW.l2("x",{mh,mo},{0,24},-88+mn,20+mn,20)if ml then self.ds:dD(1.0)sfx(56)self.ds:dD(2.0)end end
local mp={c0=ao(0,0)}function mp:dB()for aG=0,127 do local mq=abs((aG-8)%(2*c2.ct)-c2.ct)line(self.c0.ap,aG,self.c0.ap+mq,aG,0)end end
function lQ:lX()local mr=e0(ao(0,0),128,128,0)self.l_:dW("fadeout_rect",mr)self.l_:dW("zigzag",mp)sfx(52)kW.l2("x",{mr,mp},{-128,0},-c2.ct,128,18)self.l_:d_()M(self.m2)end
function lQ:m9()local ms=false
local mt=false
for mk=1,8 do local mu=self.m0[mk]self.m2[mk]=not mu
ms=ms or mu
mt=mt or not mu end
local mv
if mt then mv=dR("try again?",ao(45,30),7)else mv=dR("congratulations!",ao(35,45),7)end
self.l_:dW("result text",mv)self.ma=kr(self.ds,1,1,7,c2.c4.cw,7)local mw={}if ms then add(mw,lR)end
add(mw,lT)add(mw,lV)self.ma:kB(mw)for B=4,0,-1 do self.lZ.dI=B
O(4)end end
function lQ:mb()self:jU()self:mx()self:jX()end
function lQ:mx()self:jM()self.cr:b_()end
function lQ:md()camera()self.l_:dB()end
function lQ:mc()camera()self:my(64,64)end
function lQ:my(ap,aq)for mk=1,8 do if self.m2[mk]then local mz=c2.cu
local mA=ao(ap+mz*cos(0.25-(mk-1)/8),aq+mz*sin(0.25-(mk-1)/8))kQ.dB(mk,mA,self.m3[mk])end end end
local mB=a7(dF)function mB:du()return{lQ()}end
local ds=mB()function _init()ds.dx=':stage_clear'ds:dv()end
function _update60()ds:cF()end
function _draw()ds:dB()end

__gfx__
00000000eeeeebbbeeeeeeeeeeeeeeeeeeed65eeeeeeeeeeeeeeeccccced65eeeeeeeeeee5eeeeeeeeeeeeeeeeeeeeeeee8eeeeeeeeeeeeeeeeee8eeeeeeeeee
00000000eeeebbbeeeeeeeeeed66666666666666666666deed66cccccccc6666666666de575eeeeeee7eeeeeeeeee7eee272eeeeee2eeeeeeeee272eeeeee2ee
00700700eeebbbb7eeebeeee56000000000000000000006556000cc4ccccc0c0000000655775eeeeeed7eee87eee7dee877782eee272e2eeee287778ee2e272e
00077000eeeeeb77eebbbeee56ddd440dddddd4a0dd40d65569999cf4cccccc99999996557775eeeeee7ee8008ee7eeee272eeeeee2ee8eeeeee272eee8ee2ee
00077000eeebb3b7e777eeee56dd47a0d44404aaa047a06556999ccfccccccc995995965577775eeedd7780970877ddeee8ee2eeeeee272eee2ee8eee272eeee
00700700ebb7bb3bb3b7beee56d4aaa047aa4a7aa047a0655699ccccccccccc95759756557755eeeeedd78049087ddeeee2e272eee287778e272e2ee877782ee
00000000ebb77bbbb777bbee564aa0047aaaa700a04aa065569ccccc77cccc7c57757565575eeeeeeeedde8008eddeeeeeeee2eeeeee272eee2eeeeee272eeee
00000000eebb777777bbbbee564a0a04a004aa0d704aa06556ccccc7077cc07c95757565e5eeeeeeeeeeeee88eeeeeeeeeeeeeeeeeeee8eeeeeeeeeeee8eeeee
eeed6deeeb773777777bbeee564a0a70a0d4aaaa707a0d655cccccc70777707c95777565e00000ee333bbeeebbeeeeeebbeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eee777eebb77bb37777eeeee564a00a0a447aa44ad7a006556999cc7077ff07c995775650eeeee0ebb3be3e33bbeeeee3bbeeeeeeeeeeeeeeeeeeeeeeeeeeee3
ee66666eeebbeebb777bb7bb560aaaa0aaaa0a00a0aaa0655699ccffffffff00557577550eeeee0e0bbeee3bbbb3eeeebbb3eeeeeeeeeeeeeeeeeeeeeeeeee3b
eed666deeeeeee77b777b7b756d0a0a00aa00a0da00000655699cccfffffff9957757755e0eee0eebb3eb3bb33b3eeee33b3eeeeeeeeeeeeeeeeeeeeeeee33bb
eed666deeeba77777777777756dd00a0d00d0a0da0dddd65569cccc9fffff99957566655ee0e0eee33bbbb3e03b33eee43b33eeeeeeeeeeeeeeeeeeeee337bba
eed666deebba77777777b77b56dddd0dddddd0dd00dddd65569cc9999999999995666655eee0eeeebbe3bbbe0333eeee4433eeeeeeeeeeeeeeeeeeee337abba7
eed666deebbb77777777bb775d77777777777777777777d55d7c777777777777775555d5eeeeeeee0b33bb3eb3bbb3eeb3bbb3eeeeeeeeeeeeeeee33abbbb7b3
eed666debbbba7777777bbbbe0000000000000000000000ee0000000000000000000000eeeeeeeeebbeeb3bb3bbb33ee4bbb33eeeeeeeeeeeeee337bbbb3b33e
eed666debbbb7a7777777777bbbb3bbbbbbbbbbbeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeebbbb3eee33eb3bbe43eb3bbeeeeeeeeee333babbbb333eee
eed666de77b77777777777bbbbb303bbbb3bb0bbeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeb3b33eee33e3bbbe33e3bbbeeeeeeee333b7bbbb3b33eeee
eed666debbba777777777ebb3b300033b30b3003eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeb33eeeee333bb3ee333bb3eeeeeee33337bb3bb3333eeeee
eed666de7bbba7777777eeee0300400030030400eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee3333eeee033bb3ee443bb3eeeee333b33ab3bb3b33eeeeee
eed666dea7b7777777777bbe4004444000000444eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeebbb3eeee3b3e33b34b3e33b3ee33ab37bb33b3333eeeeeee
eed666debbbb77777b3377bb4444444444004494eeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee033eeeeeb333e333b333e333e33333333bbb3b33eeeeeeee
ee06660eebbe77b777bbbbeb4449444444044494eaeaeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee33beeeee33b3eeeb33b3eeebe33ab33a3b33333eeeeeeeee
eee000eeeebee77bebebeeee4449444444444444baebeebeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee33eeeeee03eeeeee43eeeeeeee33333333333eeeeeeeeeee
44444444eaeaeeeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaebeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeee
44449444babaeabeeaeebeebeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaeeebaeabbbabbeeeeeeeeeeeeeeeeeeeeeeeeeaeab
44444494bbbababbbababbbbeebeeaeeeeeeeebeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaeeaeebbabab3babbbeaeeeeeeeeeeeeeeeeeeaeeebbab
44949444bbbbbbbbabbbbbbababbeaaeebeaeebeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaeeaaebbabbbbbbb3bbbbbbaeeeeeeeeeeeeeeeeeeaeabbbbb
44499444b3babbb3bbbbabbababbb3ababbababaeaeeeeaeeeeeaeeeeeeeeeeeeeeeeeeeeaeeeeaeba3bbbabbb3bab3bb3bababbeaeeeeeeeeeeeeaeabbab3bb
44949944b3bb3bb3bb3ba3bbb3bbb3b3b3bbbbbababaebaeeeaebeeaeeeeeeeeeeeeeeeeeabeababbb3bbbbbbb3bbbbbb3babbbbbaeaeeeeeeeeaeabbbbab3bb
44949944bbbb3bbbbb3bb3b3bbb3b3bbb3bb3bb3bbbabbabababbabbbaeeaeeeeeeaeeabbabbabbbbb3bbbbbbbbbbb3bb3bbb3bbbbbaeeaeeaeeabbbb3bbbb3b
44449444bb3bbbbb3bbbb3bbbbb3bbbbbbbb3bb3bb3abbbbbb3bbbbbbabaaeaeeaeaababbbbbabbbbbbb3b3bbbbbbbbbbbbbbbbb3ababbaeeabbaba3b3b3bb3b
44949444bbbbbbbbbbbbbbbbbbbb3bbbb3bbbbbbbbbbbb3bbbbbbb3bbababbabbabbababb3bbbbbbeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
44999444bb0bb3b3bb3bb0bbbbb303bbb3b3bb3bb3bb3b3bb3b3bbbbb3bbbbabbabbbbbbbbbb3b3beeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
449944443003b030b30b30033b300033bbbbbb3bb3bbbbbbbbb3bb3bb3bbbbbbbbbb3b3bb3bb3bbbeeee999aaa7777a9eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
49494944004030003003040003004000bbbb0bbbbbb0bbbb3bbbb33bbbbb3b3bbbbbbb3bb33bbbb3eeee444999aa7aa9eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
44499444044400440000044440044440b03b03bbbb30b30b033b303bbbbbbb3bbb3bbbbbb303b330eeee44999aa777a9eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
44999444444444444400449444444444000b00b03b00b00003033003bbbbbbbbbb3bbbbb30033030eeeeeeddddddddeeeeeeeeeeeeeaeeeeeeeeeaeeeeeeeeee
44994944444944444404449444494444040300300300304040003040b3b3bbbbbbbb3b3b30400000eeeeed66777766deeaeeeeaeeaeaeeaeeeaeaaeeeeeeeeee
444949444444444444444444444944444440040000440444404004403bb3bb3bb3bb3bb304400404eeeeeeddddddddeeebeebeaebaebeebeeabeabebeeeeeeee
49499444eeeeeeebbeeeeeee4444444494444444bb3bbbb33bbbbbbb0b30b30bb3bb03b03bbbb3bbeeeeeeeeeeeeeeeeeeebb333eeeeeebb4444449999494444
44949444eeeeeeabbaeeeeee4449444494944444bbbb3b300bb3b3b30030b00bb03b030003b3bbbbeeeeeeeeeeeeeeee3e3eb3bbeeeeebb34444949999444444
49949944eeeeeeabbaeeeeee4444494444444444b3bb3b0403b333b040003003b003000440b3bb3beeeeeeeeeeeeeeeeb3eeebb0eeee3bbb4344999994494444
44949494eeeeeeb33beeeeee4444494994444444b33bbb0440303030440400403000404440bbb33beeeeeeeeeeeeeeeebb3be3bbeeee3b334b34394999494444
44999944eeeeeebeebeeeeee44444449949444443003b304400000004444444004044444403b3003eeee999aaa7777a9e3bbbb33eee33b303bb4b94999994444
49994934eeeeeebeebeeeeee44449499994444440403300444040404444494440444444440033040eeee444999aa7aa9ebbb3ebbeeee3330bbbb3999999944b3
b39933b3eeeeeeeeeeeeeeee44449499494944444440304444444444444494444449444444030444eeee44999aa777a9e3bb33b0ee3bbb3bb33bb939993b43bb
bb93bbbbeeeeeeeeeeeeeeee44449449494944444444004444444444444444444444444444004444eeeeeeedd766deeebb3beebbee33bbb3bb33b3b3393b3bbb
0eeeeeee0eeeeeeeeeeeeeeeeeeeeeeeeeeeeee0eeeeeee0eeeeeeee0444444444444444eeeeeeeeeeeeeed67dddeeeeeee3bbbbebb3be33bb3b3bbbbb3bbb3b
40eeeeee40eeeeeeeeeeeeeeeeeeeeeeeeeeee04eeeeee04eeeeeee4e04944444444944e4eeeeeeeeeeeed6ddeeeeeeeeee33b3bebbb3e33b3bb33bbb333bb3b
444eeeee4440eeeeeeeeeeeeeeeeeeeeeeee0044eeeee444eeeeeee4e04944444944440e4eeeeeeeeeeeee55dddeeeeeeeeee33bee3bb33303b3bbbbb3b3b3b0
4940eeee44440eeeeeeeeeeeeeeeeeeeeee04444eeee0494eeeeee04ee044944449440ee40eeeeeeeeeeeee55ddddeeeeeee3333ee3bb330b03bbb333bbbbbb0
44440eee4944400eeeeeeeeeeeeeeeaee0444944eee04494eeeeee04eee0444444940eee40eeeeeeeeeeeeeeeedd6deeeeee3bbb3b33e3b3b333bbbbb33b30bb
494944ee449444400eeeeeeeeeeeaea004444994ee449444eeeeee44eee0449444440eee40eeeeeeeeeeeeeeed77deeeeeeee330333e333bb3bbb3bb30033bbb
4449440e44944944440eeeeeeeee303b44944494e0444494eeeee044eeee44944944eeee440eeeeeeeeeeeed77ddeeeeeeeeeb33beee3b333bb330bbbb3b33bb
444444404444444444440eeeebebbb3b4444444404444444eeeee044eeee04444440eeee444eeeeeeeeeeed6ddeeeeeeeeeeee33eeeeee30bbbbb0bbb33bb3bb
444444404444444444440eeeeee044444444444404444444eeee0444eeeee494440eeeee4440eeeeeeeeeeeeeeeeeeee4444444444444444e3bbbbb3bbbb3bbe
4494440e44444444440eeeeeeeeee00494494444e0449494eeee4444eeeee044440eeeee4944eeeeeeeeeeeeeeeeeeee0449444449444444eeba3b3e3bb3e3b3
449940ee499449400eeeeeeeeeeeeee044444944ee444494eee04494eeeeee4444eeeeee49440eeeeeeeeeeeeeeeeeee0449494449444940e3b3e3ee3bb3eebb
44444eee4494440eeeeeeeeeeeeeeeeee0044994eee04444eee04494eeeeee0444eeeeee44440eeeeeeeeeeeeeeeeeee4449494444444940ebb3eeeeeabbeea3
4940eeee44440eeeeeeeeeeeeeeeeeeeeee04494eeee0494ee044444eeeeee0440eeeeee494440eeeeeeeeeeeeeeeeee0444494444440944ebbeeeeee3b3ee3e
440eeeee4400eeeeeeeeeeeeeeeeeeeeeeee0444eeeee444e0444494eeeeeee44eeeeeee4449440eeeeeeeeeeeeeeeee0044444400000440eabbeeeeee3eeeee
44eeeeee40eeeeeeeeeeeeeeeeeeeeeeeeeeee04eeeeee04e4449444eeeeeee44eeeeeee4949444eeeeeeeeeeeeeeeee0000040000e00000ee3beeeeeeeeeeee
0eeeeeee0eeeeeeeeeeeeeeeeeeeeeeeeeeeeee0eeeeeee004444444eeeeeee44eeeeeee44444440eeeeeeeeeeeeeeeee00000000ee00000eeebbeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeee77dded777deeeeeeeeeeeeeeeeeeeeeeeeeee444444499949444494494444eeeeeeee99000000eeeeeeeed6d949eeeeeeee0288eeeeee
eeeeeeeeeeeeeeeeeedd77d1dd777ddeeeeeeeeeeeeeeeeeeeeeeee0444449499444444494444444eeeeee99aa9000499eeeeeeed6d99aeeeeeeeee0870eeeee
eeeeeeeeeeeeeeeee7d1111dddd77d1eeeeeeeeeeeeeeeeeeeeeee00444449499444444499494444eeeee9aa9a94049aa9eeeeeed7d99aeeeeeeeeee780eeeee
eeeeeeeeeeeeeeeeed11111dddd7d111eeeeeeeeeeeeeeeeeeeeee00444444499949444499444944eeee9aa9aa94049aaa9eeeeed7da9aeeeeeeeeee080eeeee
eeeeeeeeeeeeeeeee111117ddddd1111eaeeeeeeeeeeeeeeeeeee040444444499944444444444444eeee9a9aaa94049aaa9eeeeed7daa7eeeeeeeeeee0eeeeee
eeeeeeaeeaeeeeeee111d777dddddd11baeaeeeeeeeeeeeeeeeee004444494949994444444004444eeee9a9aa994004999eeeeeed7d7a7eeeeeeeeeeeeeeeeee
eeaeaebeebeaeaeee11ddd77710d1111bbbaeeeeeeeeeeeeeeee0440444494949949444440000044eeeee99999403344eeeeeeeed6d777eeeeeeeeeeeeeeeeee
ababbbbbbbbbbabae0ddddd7111111113abbbaeeeeeeeeeeeeee0444444494999949444400000004eeeeeeee449aa934eeeeeeeed6d7a7eeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeee7dddddd1110110eeeeeeeeeeeeeeeeeeee04444444444999949444404411444eeeeeeee49aaaa94eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeee1dd1dd107777ddeeeeeeeeeeeeeeeeeeee049444404949999444044044dd444eeeeeeee3bb99bb3eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeee1d1ddd0dd7777deeeeeeeeeeeeeeeeeee0444444404999900094444444cd444eeeeeeee4b9aa9b4eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeee111d77dddd7777eeeeeeeeeeeeeeeeeee0444444444494044494044494cc494eeeeeeee4b9aa9b4eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeedd7d11dd7eeeee11d777777d7777deeeeeeeeeeeeeeeee044949400044940444900004447c494eeeeeeee49aaaa94eeeeeeeeeeeeebbbeeeeeeeeeeeeeeee
eedd777ddd7d11eeeed77777777d7dddeeeeeeeeeeeeeeeee0449444494049444440449440077444eeeeeeee3bb99bb3eeeeeeeeeeeebabbeeeeeeeeeeeeeeee
ee1ddd77d0dd111eed77777777d1d111eeeeeeeeeeeeeeee04944444444044444440449444477044eeeeeeee4b9aa9b4eeeeeeeeeebbbbbeeeeeeeeeeeeeeeee
ee11dd7dd011111ed777777777111111eeeeeeeeeeeeeeee04444444444044444444444494417000eeeeeeee4b9aa9b4eeeeeeeeebbabbbeeeeeeeeeeeeeeeee
ee17dddd101dd11edd7777777d111111eeeeeeee17ccdc70dd1c7c714440444400004444cd104444ee7a7d6d49aaaa94beeeeeeebaabbeeeeeeeeeeeeeeeeeee
edd777dd0dd77dd1dddddddddd111111eeeeeeee177cc773ccd77711000444444440404411044949ee777d6d3bb99bb3bbeeeeebbbbbbbeeeeeeeeeeeeeeeeee
ddd7777d1ddddd11ddd1dddddd111111eeeeeeee1717c7107cc7171d440440404440444411444444ee7a7d7d4b9449b4bbbeeebbabbbbbeeeeeeeeeeeeeeeeee
dddd77d11ddd1111ddd7dddddd111110eeeeeeeed11171131771111d4400000049404040d0499444ee7aad7d49b44b94bbbbebbbbbbbbeeeeeeeeeeeeeeeeeee
dddddd111ddd1111ddd7dddddd111110eeeeeeeed1d171d31171d1dc4404444044440000d0494444eea9ad7d04bbbb40babbbbbbbb3eeeeeeeeeeeeeeeeeeeee
ddddd1111ddd1111ddddddddd111111eeeeeeeeecddd1dc0111ddddc0004444000004440c0444444eea99d7d049bb940bbabb3bbbbbbeeeeeeeeeeeeeeeeeeee
ddddd11111d11110ddddddddd111101eeeeeeeeeccddddc01d1dcdd74440400440404490c0449494eea99d6d00433400bbbbb33bebbeeeeeeeeeeeeeeeeeeeee
111d11110110110eddddddddd111101eeeeeeeee7ccddc70dd1dccd74440444444444444c0449444ee949d6d0a4334a0bbbabbbbbee33e33eeeeeeeeeeeeeeee
e1111dd10dd777dedddddddd1111101eeeeeeeee44404444404444404440444440444440704449444444444999494444bbbbbbbbe333333333eebbbbbbeeeeee
ee11d77ddd77777ddddddddd11111011eeeeeeee04044444444040400404444444404040704944444444494994444444bbbbabbb33333bbbbbbbbbbaabbbeeee
ee1d7777ddd7777d1ddddddd11111111eeeeeeee0000440444400000000044044440000070494444444449499444444433bbabbbbb3bbabbabbbbebbbbbbbeee
eedd777d10dddd1101dddddd11111111eeeeeeee040044444040000004004444404000007444444444444449994944443bbbb3bbbb3bbabbbbbbbbebbbbbbbee
edddd7dd10ddd111e111dddd11110111eeeeeeee00000404000000000000040400000000100004444444444999444444bb3bbbbbbabbbbbbbbebbbbbbbebbbbe
dddddd1110ddd111e111ddd111100111eeeeeeee000000a00a40000000000000004a0000d04044444444949499944444bb3bbb3bbbbbbbebbbbebbeeeeeeeeee
ddddd11110dd1111eee0111111011110eeeeeeee00a0a4b00b0a0a000a0004a00a0a00a0c09444444444949499494444abbbbb33bbbbbbbebbbbeeeeeeeeeeee
dd1111110011011eeeee00000000000eeeeeeeeeababbbbbbbbbbaba0b00b0a0ba0b00b0c94944444444949999494444bbbbbbbbbbbbb33eeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeee5d5eeeeeeeeeeaaaaaaaaaaaaaaa9eeeeee56deeeeeeeeeeeeeed65eeeeeee30bbebe44444444ababb3bbbbb33bbbbeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeed65eeeeeeeeeaaaaaaaaaaaaaaa94ed6566666666666ee6666666666656de3bebeeb349444444bba33bbbbabbb3333bbeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeed65eeeeeeee9a9a9a9a9a9aaa9940d656000000000005500000000000656dbeb33b3e44444494bbbbbbbbbbbabb33333bbeeeeeeeeeee
eeeeeeeeeeeeeeeeeeed65eeeeeee9a9a9a9a9a9aaa94400d656d944dc49d91551d944dc49d9656deb3e33eb44494444b3abba3bbbbbabb333333beeeeeeeeee
eeeea994eeeeeeeeeeed65eeeeee999999999999aa944400d65694cdc0ca9a155194cdc0ca9a656de03bb03b44494444b00bb00bbbbbbbbbe33333beeeeeeeee
eeeaaaa94eeeeeeeeeed65eeeee99999999999aa99444000d656dcacac75471551dcacac7547656d3beb3ebe44444494b00bb00bbbbbbbab3333b33beeeeeeee
eeaaaaaaa999eeeeeeed65eeee9999999999aa9449444400d6569ac7ca7a7a15519ac7ca7a7a656db3b33eb3449444443b0330b33b3bbbbbb33bee3beeeeeeee
eaaaaaaaaaaa999eeeed65eee4949494999a944444444000d6564c000c094715514c000c0947656deebeebee444444440b0330b0eeebbebbbbeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeee949494449a99494444444440ed656c0ca7a77701551c0ca7a7770656de77778ee4444444444444444eeeeebbbbbeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeee99444449a9944444444444440eed65649a04f4977155149a04f4977656d7777788e0449449949944444eeeeeebbbbaeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeee44449a994444444444994440eeeed6569afaf00a7a15519afaf00a7a656d2288822e0449444994444000eeeeeeeebbbbeeeeeeeeeeee
eeeeeeeeeeeeeeeeee4499994444494444944494444eeeeed656dcafaf05071551dcafaf0507656de28882ee4444444999444044eeeeeeeeebbbeeeeeeeeeeee
eeeeeeeeeeeeeeeea9994494499449444494444440eeeeeed65690cdf09a5d155190cdf09a5d656dee282eee0444499444444444eeeeeeeeebbbbeeeeeeeeeee
eeeeeeeeeeee99994494444444944444449444444eeeeeeed656dc09d9d9d61551dc09d9d9d6656deee2eeee0444444444444440eeeeeeeeeebbaeeeeeeeeeee
eeeeeeee44994494449444444494444444444400eeeeeeeed60d777777777775577777777777d06deeeeeeee004499440e004440eeeeeeeeeeebaeeeeeeeeeee
eeee44994444444444444444444444444440eeeeeeeeeeeeed6000000000000ee0000000000006deeeeeeeeee0049eeeeeee000eeeeeeeeeeeeeeeeeeeeeeeee
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
0000000000000000000000000000000000000000000000000000808040000000000000434340000000008080400000004141414141414141414141414141414141414141414141414141212180808000414040414141414141410000808041414141414141414141414101018080818141414141414141414141000041418080
0000000000000000000000000000000000000000000000000000000000000000414141414500414040408080800100004141414100004140401000800080101041414141001010404010018080801010414141410041414040104141808080804040404043430000000080418080800041414141434300000000004040008000
__map__
000000000000000000006e6f6e6f6e6f6e6f6f6e6f6e6f6e6f6e6f6e6f6e49466e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f497e7f7e7f7e7f7e7f7e7f7e7f7e7f7e7f7e7f7e7f000000000000000000007c7d7c7d7c7d7c7d1e1f1e1f1e1f1e1f5e5f5e5f5f
000000000000000000006e6f6e6f6e6f6e6f6f585945434443454244455554307e7f7e7f7e7f7e7f7e7f7e7f7e2e6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6f6f6e6f6e6f6e6f6e6f6e6f44417000000000000000000000000000000000000000000000000000000000000000000000000000007c7d5e5f5e5f5e5f6e6f6e6f6f
000000000000000000006e6f6e6f6e6f6e6f6f7c7d7c7d535453545354531f40000000000000000000000000002e6e6f6e6f6e6f6e6f6f584345436e6f6e6f6e6f6e6f6e6e6f6e6f6e6f520000000000000000000000000000000000000000000000000000000000000000000000000000000000516e6f6e6f6e6f7e7f7e7f7f
000000000000000000006e6f6e6f6e6f6e6f6f2e0000001e1f1e1f1e1f1e1f504d4e7a4c4e00000000000000000057464344464344425853547c7d002e2e2e6e6f6e6f6e6f2e2e2e2e2e000000000000000000000000000000000000000000000000000000000000000000000000000000000000007e7f7e7f7e7f0000000000
000000000000000000006e6f6e6f6e6f6e6f6e2e0000005e5f5e5f5e5f5e5f6e48454645415200000000000000002f2f2f2f2f2f2f2f307d70000000002e2e2e2e2e2e2e2e2e000000000000000000000000000000007a0000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000006e6f6e6f6e6f6e6f6e2e0000516e6f6e6f6e6f6e6f49582f2f2f7d0000004d4c000000002f2f2f2f2f2f2f2f70000000000000002e2e2e2e2e2e2e000000000000000000000000000000005c5d0000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000006e6f6e6f6e6f6e6f6f2e0000007e7f7f7e7e7f6f582f2f2f2f7d000000514342520000007c7d2f2f7c7d7c7d000000000000000000000000000000000000000000004e4d4d4c4d4e5c5d4e6c6d4d00000000000000000000000000004d4e7a4c4d00000000000000004e4e4c4d4e4c4d4d4c00000000
000000000000000000006e6f6e6f6e6f6e6f6f2e0000000000000000007f7c7c7d7c7d00000000007c7d0000000000007c7d00000000000000000000000000000000000000000000000000514241424441564146424445483c3d0000000000000000000000514344454943520000000000005142414643424246464352000000
000000000000000000006e6f6e6f6e6f6e6f6f2e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000535453545354535453542f5759425200000000000000000000005354305354000000000000000040407172007374404000000000
000000000000000000006e6f6e6f6e4543444352000000000000000000000000000000000000000000000000000000000000000000000000004d4e000000004d4e4d38393434343d000000001e1f1e1f1e1f1e1f1e1f5e5f7c7d000000000000000000000000757c7d7c70000000000000000040680000000000674000000000
000000000000000000004542444558535453544c4e7a4d4c4d000000000000000000000000000000000000000000000000000000004e4d4c5147493132323b4745444644454342463c3d4d4c1e1f1e1f1e1f1e1f5e5f6e6f00000000000000000000000000000000000000000000000000000040780000000000774000000000
0000000000000000000030535453541e1f1e1f5642454344555200000000000000000000000000000000004d4d000000004c393a3b49444644555357454442585354535453545354594542561e1f1e1f5e5f5e5f6e6f7f7e00000000000000000000000000000000000000000000000000000040000000000000004000000000
00000000000000000000401e1f1e1f1e1f1e1f535453545354004d4e00000000000000000000000000005143463132323b4749455554535453545354535453541e1f1e1f1e1f1e1f1e1f1e1f5e5f5e5f6e6f6e6f7e7f000000000000000000000000000000000000000000000000000000000067690000000000664000000000
00000000000000000000401e1f1e1f1e1f1e1f1e1f1e1f7c7d514142520000000000000000000000000000535459454542555354531f1e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f5e5f6e6f6e6f7f7e7f7e0000000000000000000000000000000000000000000000000000000000000077790000000000766800000000
000000000000000000007c7d7c7d7c7d7c7d1f1e1f1e7d0000007c7d0000000000000000000000000000007c2f53545354301e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f1e1f5e5f6e6f7f7e7e7f00000000000000000000005c5d00004d4c000000000000000000000000000051313335377561624c6364407800000000
0000000000000000000000000000000000007c1e1f7d000000000000000000000000000000004e4d000000007c5e5f5e5f505e5f5e5f5e5f5e5f5e5f5e5f5e5f5e5f5e5f5e5f5e5f6e6f7f7e0000000000000000000000005c5d006c6d005143463c3d000000005c5d0000000000000057444447474955595854533c3d000000
000000000000000000000000000000000000007c7d0000000000000000000000000000000051424152000000006e6f6e6f6e6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f7e7f000000000000000000004c5c5d4e6c6d4c6c6d4c4e1e1f59483c3d00006c6d00000000000000535453595854535453544059483c3d4c
00000000000000000000000000000000000000000000000000000000000000000000000000007c7d00000000007e7e7f7e7f7e7f7e7f7f7e7e7e7f7e7e7f7f7e7f7e7e7f7e7f7e7f00000000000000000000005142434649434646474848481e1f1e57594546434549434631330000001e1f1e1f1e1f1e1f1e1f404057444243
00000000000000000000000000000000000000000000000000000000000000004a4b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004d4c00007c7d7c402f2f2f576e6f6e5e5f5e5f5e5f5e5f5e5f5e5f57555200005e5f5e5f5e5f5e5f5e5f50505e5f5e5f
0000000000000000000000000000000000000000000000000000000000000051434252000000000000000000000000000000000000000000000000000000000000000000000000000000000000000051434152000000004071727374596e6f6e6f6e6f6e6f6e6f6e6f6e6f7c7d0000516e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f
00000000000000000000000000000000000000000000000000000000000000007c7d000000000000000000000000004c4e5c5d4e4c5c5d4e4c4c000000000000000000000000000000000000000000007c7d00000000006800000000677e7f7f7e7f7f7e7e7e7f7e7f7e7f00000000002e2e2e2e2e2e2e2e2e2e2e2e6e6f6e6f
00000000000000000000000000000000000000000000000000000000000000000000000000000000004e4c38393a3b47484847484847484748473133000000000000000000000000000000000000000000000000000000780000000077000000000000000000000000000000000000000000000000000000000000002e2e2e2e
00000000000000000000000000000000000000000000000000000000000000000000000000000000514346474849414343445556434649424143414252000000000000000000000000000000000000000000000000000069000000006600000000000000000000000000000000000000000000000000000000000000002e2e2e
00000000000000000000000000004c4e0000000000000000000000000000004c4c4e4d4a4b4e4d4c4d535457585354535453545354535453545e5f7d000000000000000000000000000000004d4c5c5d4e4d4e000000007900000000760000000000000000000000000000000000004e4c000000000000000000000000002e2e
4d000000004c0000000038393a3b45463c3d00000000000000000000000066564142434142414346555e5f5e5f5e5f5e5f5e5f5e5f5e5f5e5f6e6f0000000000000000000000000000000051434455434441463133353740616263644000000000000000000000000000000000005144463c3d0000000000000000000000002e
483132323b473132323b45424155535457463c3d000000000000000000007653545354535453545e5f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f7f7e00000000000000000000000000004e4e4d53545354535430574447474748495853543c3d00000000006570000000000000000000535457463c3d4d4e5c5d00004d4e4c4e4c
41434649414243444558535453541e1f535457443c3d0000000000000065401e1f1e1f1e1f5e5f6e6f6e6f7e7f7e7f7e7f2e2e2e2e2e2e2e2e000000000000000000000000000000514149561e1f1e1f1e1f40301e5945445854401e1f42463c3d4d636470000000000000000000001e1f535459434245424152514441454645
535453545354535453541e1f1e1f1e1f1e1f535459463c3d000000636440401e1f1e1f5e5f6e6f6e6f6e6f0000000000002e2e2e2e2e2e2e2e00000000000000000000000000004e4e301e1f1e1f1e1f1e1f40401e545354531f505e5f5e5f59454455700000004c4e4d4c4d4e4a4b1e1f1e1f535430307c7d00003053545354
5e5f5e5f5e5f5e5f5e5f5e5f5e5f1e1f1e1f5e5f53545741424341584050505e5f5e5f6e6f6e6f6e6f6e6f00000000004d2e2e2e2e2e2e2e2e4d00000000000000000000003e3f4749401e1f1e1f1e1f1e1f50501e1f1e1f1e1f7e7f7e7f7e000000000000006556444246555644451e1f1e1f1e1f407d00000000401e1f1e1f
6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f5e5f535453545354506e6f6e6f6e6f6e6f6e6f6e6f6e6f00007a005148474748484748474748313335374e4d4c4d4c3e3f47495830505e5f5e5f5e5f5e5f6e6f5e5f1e1f1e1f000000000000004d4c4d63643053545354535453541e1f1e1f1e1f400000000000401e1f1e1f
6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f5e5f5e5f5e5f6e6f6e6f6e6f6e6f6e6f6e6e6f6e6f3536373839495857555859434143444946444748474848474845555354506f6e6f6e6f6e6f6e6f6e6f6e6f5e5f1e1f4d4c7a4e4d3e3f4749445530405e5f5e5f5e5f5e5f5e5f5e5f5e5f504e7a4d3e3f505e5f5e5f
6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6e6f6e6e6e48474558535453545354535453545354305745555657445853541e1f6e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f5e5f56464748474845555f5e5f50506e6f6e6f6e6f6e6f6e6f6e6f6e6f6e6f47484849466e6f6e6f
__sfx__
011000003005032050300503205030050320503005032050300503205030050320503005032050300503205030050320503005032050300503205030050320503005032050300503205030050320503005032050
010c00001835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350
000a0000326203c610346202b630206301c620226102f62037630326302b6202461021620286203463030630376203162033610296202f6300060000600006000060000600006000060000600006000060000600
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e00001a1351a1351a1351a135000001a135000001c135000001c135000001c135000001c1301c1301c1351f1301f1350000021130211350000024130241350000026130261302613026130261302613026130
010e0000131351313513135131350000013135000001513500000151350000015135000001513015130151351813018135000001a1301a135000001d1301d135000001f1301f1301f1301f1301f1301f1301f130
010e00002613026130261302613026130261302613026130261302613026130261302613026130261302613026130261302613500000000000000000000000000000000000000000000000000000000000000000
010e00001f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f1301f13500000000000000000000000000000000000000000000000000000000000000000
0107000015645156050c6450c6050c6450c60515645156050c6450c6050c6450c60515645156050c6450c60515645156050c6450c60515645156050c6450c6050c6450c6050c6450c605156450c645156450c645
010e00000000000000000000000000000000000000000000000000000000000000000000000000000000000015635116351763515635116351763515635116351763515635156001560015600156001560015605
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
000400002d8502d800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0002000027a102da3031a4034a5037a503aa503aa5039a5038a5036a5031a402ca4024a401fa401ba3017a3014a3011a200ea200da200ba1009a1008a1007a1006a1005a1004a1003a1003a1003a1003a0000a00
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e000024755267552875526755280502975528050297552b050290502f050300503004030030300203001500000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 08090c0d
04 0a0b4040

