pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- pico sonic v6.1 (stage_intro)
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
bs={aQ=1,bt=2,bu=3,aS=4}function ao.bv(bg)return ao(cos(bg),sin(bg))end
function ao:bw(bg)local bx=sin(bg)local by=cos(bg)return ao(by*self.ap-bx*self.aq,bx*self.ap+by*self.aq)end
function ao:bz()return ao(-self.aq,self.ap)end
function ao:bA()self:a3(self:bz())end
function ao:bB()return ao(self.aq,-self.ap)end
function ao:bC()self:a3(self:bB())end
function bD(bE,bF)for G,H in pairs(bF)do bE[G]=H end end
bG={bH=0,bI=1,bJ=2,bK=4,bL=5,bM=6,bN=7}bO={bH=1,bI=2,bJ=4,bK=16,bL=32,bM=64,bN=128}bP={bQ=1,bR=2}bS={bT=1,bU=2,bV=3,bW=4,bX=5,bY=6}function bZ(b_)return function(c0)return b_(unpack(c0))end end
c1={c2=1,c3=2,c4=3,c5=4}local c6=a9()function c6:X(c7,c8,c9)self.c7=c7
self.c8=c8
self.c9=c9 end
function c6.ca(cb)return c6({cb},1,2)end
local cc=a9()function cc:X(cd,ce,cf,cg)self.cd=cd
self.ce=ce or aF(1,1)self.cf=cf or ao.aE()if type(cg)=="table"then self.bh=0
for v in all(cg)do self.bh=self.bh+u(v)end elseif cg then self.bh=u(cg)else self.bh=u(0)end end
function cc:ch(ci,bc,bd,bg,cj)b9(self.cd.B,self.cd.aG,ci.ap,ci.aq,self.ce.B,self.ce.aG,bc,bd,self.cf.ap,self.cf.aq,bg,self.bh)end
local ck={cl={{8,2},{15,9},{14,2},{13,5},{12,1},{11,3},{10,9},{9,4}}}local cm=C({cn={12,0,4,4},co={13,0,4,4},cp={14,0,4,4},cq={15,0,4,4}},function(cr)return cc(aI(cr[1],cr[2]),nil,ao(cr[3],cr[4]),14)end)ck.cm=cm
ck.cs={ct=c6({cm.cn,cm.co,cm.cp,cm.cq},5,2)}local cu=C({cv={12,12,1,2,0,16},cw={13,12,3,4,0,16},cx={1,0,2,3,0,0},cy={13,1,3,2,0,0},cz={9,1,1,1,3,2},cA={3,0,3,2,12,16},cB={6,0,3,2,12,16},cC={0,1,1,2,4,16},cD={6,14,2,2,7,16},cE={8,14,2,2,8,16},cF={10,15,1,1,3,2},bL={10,4,2,1,10,2},cG={10,5,2,2,10,10}},function(cr)return cc(aI(cr[1],cr[2]),aF(cr[3],cr[4]),ao(cr[5],cr[6]),14)end)ck.cH=cu.cF.cd:aJ()local cI={cJ={["goal"]=c6.ca(cu.cA),["sonic"]=c6.ca(cu.cB),["rotating"]=c6({cu.cA,cu.cD,cu.cC,cu.cE,cu.cB,cu.cD,cu.cC,cu.cE},3,4)}}bD(ck.cm,cu)bD(ck.cs,cI)local cK={}function cL(cM,cN)return cN end
local cO=ae(function(self)self.cP={}self.cQ=nil
self.cR=nil end)function cO:cS()self:cT()if self.cQ then self.cQ:cS()end end
function cO:ch()if self.cQ then self.cQ:ch()end end
function cO:cU(cV)self.cP[cV.type]=cV end
function cO:cW(cX)self.cR=self.cP[cX]end
function cO:cT(cX)if self.cR then self:cY(self.cR)end end
function cO:cY(cZ)if self.cQ then self.cQ:c_()end
self.cQ=cZ
cZ:d0()self.cR=nil end
local d1=a5()function d1:X(d2,...)self.d2=d2
self.c0={...}end
local d3=a5()function d3:X()self.d4={}end
function d3:d5(d6,...)local d2=cocreate(d6)add(self.d4,d1(d2,...))return#self.d4 end
function d3:d7()local d8={}for B,d1 in pairs(self.d4)do local d9=costatus(d1.d2)if d9=="suspended"then local da,db=coresume(d1.d2,unpack(d1.c0))elseif d9=="dead"then add(d8,d1)end end
for d1 in all(d8)do del(self.d4,d1)end end
function d3:dc(dd)deli(self.d4,dd)end
function d3:de()M(self.d4)end
local df=ae(function(self)self.dg={}for B=0,1 do local D={}for B=0,5 do D[B]=0 end
self.dg[B]=D end end)local dh=0x5f2d
local di=32
local dj=33
function df:dk(dl,dm)dm=dm or 0
return self.dg[dm][dl]end
function df:dn(dl,dm)local dp=self:dk(dl,dm)return dp==0 or dp==3 end
function df:dq(dl,dm)return not self:dn(dl,dm)end
function df:dr(dl,dm)local dp=self:dk(dl,dm)return dp==3 end
function df:ds(dl,dm)local dp=self:dk(dl,dm)return dp==1 end
function df:dt()for dm=0,1 do self:du(dm)end end
function df:du(dm)local dv=self.dg[dm]for dl,dw in pairs(dv)do if self:dn(dl,dm)and btn(dl,dm)and not btnp(dl,dm)then dw=2 end
local dx=btn(dl,dm)dv[dl]=self:dy(dw,dx)end end
function df:dy(dz,dq)if dz==0 then if dq then return 1 end elseif dz==1 then if dq then return 2 else return 3 end elseif dz==2 then if not dq then return 3 end else if dq then return 1 else return 0 end end
return dz end
local dA=a5()function dA:X(dB)self.d3=d3()self.dB=dB
self.dC=1/dB end
function dA:dD(cP)for dE in all(cP)do dE.dF=self
cO:cU(dE)end end
function dA:dG()self:dD(self:dH())end
function dA:dI()if self.dJ then self:dJ()end
self:dG()cO:cW(self.dK)if self.dL then self:dL()end end
function dA:cS()df:dt()self:dM()end
function dA:dM()cO:cS()self.d3:d7()self:dN()end
function dA:dN()end
function dA:dO()cls()cO:ch()self:dP()end
function dA:dP()end
function dA:d5(d6,...)return self.d3:d5(d6,...)end
function dA:dc(dd)self.d3:dc(dd)end
function dA:de()self.d3:de()end
function dA:dQ(dR)O(ceil(dR*self.dB))end
local dS=a7(dA)function dS:X()dA.X(self,60)end
function dS:dL()extcmd("set_title","Pico Sonic")poke(0x5f5c,-1)end
local dT=a5()dT.dU={{1,1,0,0},{2,2,1,0},{1,1,0,0},{2,2,5,0},{5,1,1,0},{13,13,5,5},{15,6,4,5},{4,2,2,5},{4,4,5,5},{15,9,4,13},{3,3,1,1},{13,2,1,1},{2,2,1,1},{4,4,2,2},{9,4,5,5}}function dT:X()self.dV=0 end
function dT:dW()if self.dV==0 then pal()elseif self.dV<5 then for v=1,15 do pal(v,dT.dU[v][self.dV],1)end else cls()end end
local dX={}function dX.dY(dZ,ap,aq,d_,e0)if e0 then for e1=-1,1,2 do for e2=-1,1,2 do local bq=(e1+e2)/2
local br=(e1-e2)/2
print(dZ,ap+bq,aq+br,e0)end end end
print(dZ,ap,aq,d_)end
local e3=a9()function e3:X(dZ,ci,x,e4)self.dZ=dZ
self.ci=ci
self.x=x
self.e4=e4 or-1 end
function e3:dO()dX.dY(self.dZ,self.ci.ap,self.ci.aq,self.x,self.e4>=0 and self.e4 or nil)end
local e5=a5()function e5:X()self.e6={}self.e7={}end
function e5:e8(cM,e9)local ea=self.e7[cM]if ea==nil then add(self.e6,e9)self.e7[cM]=e9 else ea:a3(e9)end end
function e5:eb(cM)local ea=self.e7[cM]if ea~=nil then del(self.e6,ea)self.e7[cM]=nil else end end
function e5:ec()M(self.e6)M(self.e7)end
function e5:dO()for e9 in all(self.e6)do e9:dO()end end
local ed=a9()function ed:X(ci,ee,ef,x)self.ci=ci
self.ee=ee
self.ef=ef
self.x=x end
function ed:dO()rectfill(self.ci.ap,self.ci.aq,self.ci.ap+self.ee-1,self.ci.aq+self.ef-1,self.x)end
local eg=a9()function eg:X(aQ,eh,aS,ei)self.aQ=aQ
self.eh=eh
self.aS=aS
self.ei=ei end
function eg:I(ej)return self.aQ<=ej.B and ej.B<=self.aS and self.eh<=ej.aG and ej.aG<=self.ei end
local ek={[1]={el="pico island",em=430,en=64,eo=aM(5,47),ep=3456,eq={ao(47,11),ao(104,8),ao(384,0),ao(513,15)},er={eg(222,44,228,54),eg(337,20,343,30),eg(361,28,367,37)},es={eg(229,44,234,54),eg(344,20,349,30),eg(368,28,373,37)}}}local et={eu=0.2}local cV=a5()cV.type=':undefined'function cV:X()end
function cV:d0()end
function cV:c_()end
function cV:cS()end
function cV:ch()end
function cV:ev()end
local ew=a5()function ew:X()self.ci=ao.aE()self.ex=0
self.ey=2
self.ez=0
self.eA=2
self.eB=0
self.eC=0
self.eD=ao.aE()self.eE=0
self.eF=ao.aE()end
function ew:eG(eH)self.eI=eH
self:eJ(eH.eo:aH())self.ex=8 end
function ew:eJ(eK)self.ci:a3(eK)self.eD.ap=eK.ap
self.eD.aq=eK.aq end
function ew:cS()local eL=false
if self.eM:eN()then if self.ey~=self.eM.eO then self.ey=self.eM.eO
eL=true end end
if eL then self.ez=0 elseif self.eA~=self.ey then self.ez=self.ez+1
if self.ez>=30 then self.eA=self.ey end end
if self.eM.eP==5 then if self.eB>=120 then self.eC=min(self.eC+1,44)else self.eB=self.eB+1 end else self.eB=0
self.eC=max(0,self.eC-1)end
if self.eM.eP==6 then self.eE=16
self.eF:a3(self.eM.ci)self.eQ=self.eM.eO elseif self.eE>0 then self.eE=self.eE-1 end
local eR
local eS
local eT
local eU
if self.eE>0 then eR=self.eF
eS=0
eT=true
eU=self.eQ else eR=self.eM.ci
eS=self.eM.eV.ap
eT=self.eM:eN()eU=self.eA end
local eW=mid(self.eD.ap,eR.ap-4,eR.ap+4)local bq=eW-self.eD.ap
bq=sgn(bq)*min(abs(bq),8)self.eD.ap=self.eD.ap+bq
local eX=8*aY[eU]local eY=3-2.5
local eZ=mid(0,1,(abs(eS)-2.5)/eY)local e_=sgn(eS)*eZ*32
local f0=eX+e_
local f1=f0-self.ex
f1=sgn(f1)*min(abs(f1),0.5)self.ex=self.ex+f1
self.ci.ap=self.eD.ap+self.ex
local f2=eR.aq+self.eM:f3()-8
local br
if self.eM:eN()then local f4=mid(self.eD.aq,f2- -4-1,f2- -4+1)br=f4-self.eD.aq
local f5=abs(self.eM.f6)<4 and 3 or 8
br=sgn(br)*min(abs(br),f5)else local f4=mid(self.eD.aq,f2- -4-16,f2- -4+16)br=f4-self.eD.aq
br=sgn(br)*min(abs(br),8)end
self.eD.aq=self.eD.aq+br
self.ci.aq=self.eD.aq+self.eC
self.ci.ap=mid(64,self.ci.ap,self.eI.em*8-64)local f7=self:f8(self.ci.ap)self.ci.aq=mid(64,self.ci.aq,f7-64)end
function ew:f9()return ao(flr(self.ci.ap),flr(self.ci.aq))end
function ew:f8(ap)local fa=0
for fb in all(self.eI.eq)do if ap<fb.ap*8 then fa=fb.aq
break end end
return(self.eI.en-fa)*8 end
function ew:fc(fd,fe)local ff=self.ci.ap-64
local fg=self.ci.ap+64
local fh=self.ci.aq-64
local fi=self.ci.aq+64
return ff<fe.ap and fg>fd.ap and fh<fe.aq and fi>fd.aq end
local fj=a5()function fj:X(fk)self.fk=fk
self.fl=false
self.fm=0
self.fn=1
self.fo=0 end
function fj:fp(fq,fr,fs)fs=fs or 1
self.fm=fs
if self.ft~=fq or fr then self.fl=true
self.ft=fq
self.fn=1
self.fo=0 end end
function fj:fu()self.fl=false
self.ft=nil
self.fn=1
self.fo=0 end
function fj:cS()if self.fl then local fv=self.fk[self.ft]self.fo=self.fo+self.fm
while self.fo>=fv.c8 do if self.fn<#fv.c7 then self.fn=self.fn+1
self.fo=self.fo-fv.c8 else if fv.c9==1 then self.fl=false
self.fn=1
self.fo=0 elseif fv.c9==2 then self.fl=false
self.fn=#fv.c7
self.fo=0 elseif fv.c9==3 then self:fu()else self.fn=1
self.fo=self.fo-fv.c8 end end end end end
function fj:ch(ci,bc,bd,bg)if self.ft then local fv=self.fk[self.ft]local fw=fv.c7[self.fn]fw:ch(ci,bc,bd,bg)end end
local fx={}local fy=a9()function fy:X(fz,fA,fB,fC,fD,fE,fF)self.fz=fz
self.fA=fA
self.fB=fB
self.fC=fC
self.fD=fD
self.fE=fE
self.fF=fF end
function fy:fG(fH)return self.fA[fH+1]end
function fy:fI(fJ)return self.fB[fJ+1]end
local function fK(fL)for ay in all(fL)do if ay~=0 and ay~=8 then return false end end
return true end
function fy:fM()return fK(self.fA)end
function fy:fN()return fK(self.fB)end
function fy:fO()if self.fF then return false end
local fP
for ay in all(self.fA)do if ay~=0 then if fP then if ay~=fP then return false end else fP=ay end end end
return true end
function fy.fQ(fC)local fR=fC<0.25 or fC>=0.75
local fD=fR and 2 or 1
local fE=fC<0.5 and 2 or 1
return fD,fE end
function fy.fS(fT,fC,fF)local fD,fE=fy.fQ(fC)local fz=aI.aK(fT)return fy(fz,fy.fU(fz,fD),fy.fV(fz,fE),fC,fD,fE,fF)end
local function eY(a4,fW,dM)dM=dM or 1
return function(K,fX)local fY=fX+dM
if dM>0 and fY<=fW or dM<0 and fY>=fW or dM==0 then return fY end end,nil,a4-dM end
function fy.fZ(f_,g0,bq,br,fD,fE,g1)local g2=sget(f_+bq,g0+br)if g2~=0 then return g1(bq,br,fD,fE)end end
function fy.g3(bq,br,fD,fE)if fD==2 then return 8-br else return br+1 end end
function fy.g4(bq,br,fD,fE)if fE==2 then return 8-bq else return bq+1 end end
function fy.fU(g5,fD)local fL={}local g6=g5:aH()local g7=fD==2 and{eY(0,8-1)}or{eY(8-1,0,-1)}for bq=0,8-1 do for br in unpack(g7)do g8=fy.fZ(g6.ap,g6.aq,bq,br,fD,nil,fy.g3)if g8 then break end end
if not g8 then g8=0 end
add(fL,g8)end
return fL end
function fy.fV(g5,fE)local fL={}local g6=g5:aH()local g9=fE==2 and{eY(0,8-1)}or{eY(8-1,0,-1)}for br=0,8-1 do for bq in unpack(g9)do ga=fy.fZ(g6.ap,g6.aq,bq,br,nil,fE,fy.g4)if ga then break end end
if not ga then ga=0 end
add(fL,ga)end
return fL end
local gb={}local gc=C({[1]={8,2},[2]={8,0},[3]={8,2},[4]={8,0},[5]={8,2},[6]={8,0},[7]={8,2},[8]={8,-2},[9]={8,-2},[10]={8,-2},[11]={8,-2},[12]={8,3},[13]={8,3},[14]={8,-3},[15]={8,-3},[16]={8,8},[17]={8,5},[18]={8,3},[19]={8,-3},[20]={8,-5},[21]={8,-8},[38]={4,-8},[22]={3,-8},[39]={-3,-8},[23]={-4,-8},[32]={-8,8},[33]={-8,5},[34]={-8,3},[35]={-8,-3},[36]={-8,-5},[37]={-8,-8},[24]={-4,8},[40]={-3,8},[25]={3,8},[41]={4,8},[44]={4,-8},[28]={4,-8},[26]={8,-0.0625},[29]={8,0},[30]={0,-8},[31]={0,8},[42]={8,-4},[43]={8,-4},[45]={8,0}},function(gd)return atan2(gd[1],gd[2])end)local ge={[7]=true,[8]=true,[13]=true,[14]=true,[18]=true,[19]=true,[34]=true,[35]=true}local gf={[35]=29,[36]=29,[218]=29,[219]=29,[235]=29,[48]=29,[64]=29,[80]=29,[83]=29,[84]=29,[182]=44,[166]=28,[124]=29,[125]=29,[49]=1,[50]=2,[51]=3,[52]=4,[53]=5,[54]=6,[55]=7,[56]=8,[57]=9,[58]=10,[59]=11,[60]=12,[61]=13,[62]=14,[63]=15,[65]=29,[66]=29,[67]=29,[68]=29,[69]=29,[70]=29,[71]=29,[72]=29,[73]=29,[85]=29,[86]=29,[87]=29,[88]=29,[89]=29,[160]=45,[161]=45,[213]=45,[214]=45,[164]=13,[94]=29,[95]=29,[110]=29,[111]=29,[74]=26,[75]=2,[202]=30,[173]=31,[176]=4,[177]=4,[192]=29,[193]=29,[208]=29,[209]=29,[162]=29,[163]=29,[178]=29,[179]=29,[194]=29,[195]=29,[210]=29,[211]=29,[96]=16,[97]=17,[98]=18,[99]=19,[100]=20,[101]=21,[118]=38,[102]=22,[119]=39,[103]=23,[112]=32,[113]=33,[114]=34,[115]=35,[116]=36,[117]=37,[104]=24,[120]=40,[105]=25,[121]=41,[240]=8,[241]=9,[242]=10,[243]=11,[244]=29,[245]=32,[228]=19,[229]=20}local gg={}for gh,fT in pairs(gf)do gg[gh]=fy.fS(fT,gc[fT],ge[fT])end
gb.gi=function(gh)return gg[gh]end
local gj=C({gk={{12,8},{2,2},{10,8},14},gl={{0,8},{2,2},{8,8},14},gm={{2,8},{2,2},{8,8},14},gn={{4,8},{2,2},{9,8},14},go={{6,8},{2,2},{8,8},14},gp={{8,8},{2,2},{8,8},14},gq={{10,8},{2,2},{8,8},14},gr={{10,8},{2,2},{9,8},14},gs={{12,8},{2,2},{9,8},14},gt={{14,8},{2,2},{11,8},14},gu={{14,8},{2,3},{9,8},14},gv={{0,8},{2,2},{8,8},14},gw={{2,8},{2,2},{8,8},14},gx={{4,8},{2,2},{8,8},14},gy={{6,8},{2,2},{8,8},14},gz={{0,8},{2,2},{6,6},14},gA={{2,8},{2,2},{6,6},14},gB={{4,8},{2,2},{6,6},14},gC={{6,8},{2,2},{6,6},14},gD={{8,8},{2,2},{6,6},14},gE={{12,8},{2,2},{7,10},14},gF={{14,8},{2,2},{7,10},14},gG={{0,8},{2,2},{3,10},14},gH={{2,8},{2,2},{3,10},14},gI={{4,8},{2,2},{3,10},14},gJ={{6,8},{2,2},{3,10},14},gK={{8,8},{2,2},{3,10},14}},function(gL)return cc(aI(gL[1][1],gL[1][2]),aF(gL[2][1],gL[2][2]),ao(gL[3][1],gL[3][2]),gL[4])end)local gM=C({["idle"]={{gj.gk},1,2},["walk"]={{gj.gl,gj.gm,gj.gn,gj.go,gj.gp,gj.gq},10,4},["brake_start"]={{gj.gr,gj.gs},10,2},["brake_reverse"]={{gj.gt},15,2},["run"]={{gj.gv,gj.gw,gj.gx,gj.gy},5,4},["spin"]={{gj.gz,gj.gA,gj.gz,gj.gB,gj.gz,gj.gC,gj.gz,gj.gD},5,4},["crouch"]={{gj.gE,gj.gF},6,2},["spring_jump"]={{gj.gu},1,2},["spin_dash"]={{gj.gG,gj.gH,gj.gG,gj.gI,gj.gG,gj.gJ,gj.gG,gj.gK},1,4}},function(gL)return c6(gL[1],gL[2],gL[3])end)local gN={gO=gj,gP=gM}local gQ={}local gR=a9()gQ.gR=gR
function gR:X(gS,gT,fC)self.gS=gS
self.gT=gT
self.fC=fC end
local gU=a9()gQ.gU=gU
function gU:X(gS,ci,fC,gV,gW)self.gS=gS
self.ci=ci
self.fC=fC
self.gV=gV
self.gW=gW end
local gX=a9()gQ.gX=gX
function gX:X(gS,gY,gZ,g_,fC)self.gS=gS
self.gY=gY
self.gZ=gZ
self.g_=g_
self.fC=fC end
function gX:h0(b1)if b1==0 or b1==2 then return self.gY elseif b1==1 then return self.gZ else return self.g_ end end
local h1={}function h1.h2(bg)if not bg or bg>=0.875 or bg<=0.125 then return 3 elseif bg<0.375 then return 2 elseif bg<=0.625 then return 1 else return 0 end end
function h1.h3(h4)return 0.25*(3-h4)%4 end
function h1.h5(h6,h4)return h4%2==0 and h6.aq or h6.ap end
function h1.h7(h6,h4)return h4%2==1 and h6.aq or h6.ap end
function h1.h8(h6,H,h4)if h4%2==0 then h6.aq=H else h6.ap=H end end
function h1.h9(ha,hb,h4)if h4<2 then return hb-ha else return ha-hb end end
function h1.hc(ej,h4)return h1.h7(ej:aN()+4*aU[h4],h4)end
function h1.hd(he,hf,h4,hg)if he.B>=0 and he.B<128 and he.aG>=0 and he.aG<32 then local hh=mget(he.B,he.aG)local hi=fget(hh,0)if hi then local hj=gb.gi(hh)if hj then local fM=hj:fM()local fN=hj:fN()local fO=hj:fO()if h4%2==1 then local ef=hj:fG(hf)if hj.fD==2 and h4==1 or hj.fD==1 and h4==3 then if hg and not fM then return 0 end
if ef>0 then return 8,h1.h3(h4)end elseif fO then if ef>0 then return ef,h1.h3(h4)end else if ef>0 or hj.fF and h1.h2(hj.fC)==h4 then return ef,hj.fC end end else local ee=hj:fI(hf)if hj.fE==2 and h4==0 or hj.fE==1 and h4==2 then if hg and not fN then return 0 end
if ee>0 then return 8,h1.h3(h4)end elseif fO then if ee>0 then return ee,h1.h3(h4)end else if ee>0 or hj.fF and h1.h2(hj.fC)==h4 then return ee,hj.fC end end end end end end
return 0 end
local hk=a5()function hk:X()self.hl=fj(gN.gP)self:hm()end
function hk:hm()self.hn=1
self.eP=1
self.h4=3
self.eO=2
self.ho=1
self.hp=0
self.ci=ao(-1,-1)self.f6=0
self.hq=0
self.eV=ao.aE()self.fC=0
self.hr=0
self.hs=0
self.ht=ao.aE()self.hu=false
self.hv=false
self.hw=false
self.hx=false
self.hy=false
self.hz=0
self:hA(0)self:hB("idle")self.hC=0
self.hD=false
self.hE=0 end
function hk:eN()return I({1,4,5,6},self.eP)end
function hk:hF()return I({3,4,5,6},self.eP)end
function hk:f3()return self:hF()and 6 or 8 end
function hk:hG()return self:hF()and 12 or 16 end
function hk:hH(hI)return(self.h4-aY[hI])%4 end
function hk:hJ()return aU[self.h4]end
function hk:hK(ay)return ay:bw(h1.h3(self.h4))end
function hk:hL(ci)self:hm()self:hM(ci)end
function hk:hM(ci)self.ci=ci
self:hN(2)self:hO()end
function hk:hP()return self.ci+self:f3()*self:hJ()end
function hk:hQ(hR)if self.hS~=hR then self.hS=hR end end
function hk:hA(bg)self.hT=bg
self:hU()end
function hk:hU()local hV=0
local hW=false
if self.hl.ft=="idle"then hV=flr(4*self.hT+0.5)/4 elseif I({"walk","run"},self.hl.ft)then hV=flr(8*self.hT+0.5)/8
if hV%0.25~=0 then hW=true
local bc=self.eO==1
hV=hV+(bc and 1 or-1)*0.125 end end
self.hV=hV%1
self.hW=hW end
function hk:hX(bg,hY)self.fC=bg
if hY then self:hA(0)elseif bg then self:hA(bg)end
self.h4=h1.h2(bg)end
function hk:cS()self:hZ()self:h_()self.hl:cS()end
function hk:hZ()self:i0()self:i1()end
function hk:i2(i3)return self:i4(self.i5,i3)end
function hk:i6(i3)return self:i4(self.i7,i3)end
function hk:i4(i8,i3)local i9=1/0
local ia=nil
for B=1,2 do local ib=self:ic(i3,B)local id=i8(self,ib)local gT=id.gT
if gT<i9 or gT==i9 and self:ie()==B then i9=gT
ia=id end end
return gQ.gR(ia.gS,i9,ia.fC)end
function hk:ie()if self:eN()then if self.f6~=0 then return aZ(self.f6)end else if self.eV.ap~=0 then return aZ(self.eV.ap)end end
return self.eO end
function hk:ic(i3,ig)local ap=i3.ap
local aq=i3.aq
if self.h4%2==1 then ap=flr(ap)else aq=flr(aq)end
local ih=ao(ap,aq)+self:f3()*self:hJ()local ii=self:hK(2.5*aX[ig])ii=ao(flr(ii.ap),flr(ii.aq))return ih+ii end
function hk:ij(i3)local ap=i3.ap
local aq=i3.aq
if self.h4%2==0 then ap=flr(ap)else aq=flr(aq)end
local ik=ao(ap,aq)if self.fC==0 then return ik+(self:f3()-6)*self:hJ()else return ik:a0()end end
local function il(im,io,ip,iq,ir,is,it,iu,iv)local iw=cO.cQ
local ix=iw:iy()local iz=aU[io]local ib=ir+is*iz
local iA=ao.aO(ib+ip*iz)local iB=ao.aO(ib+iq*iz)local iC=iA:aH()local iD=aF(iz.ap,iz.aq)local hf=h1.h5(ib-iC,io)local iE=iA:a0()while true do local iF,fC
local iG=false
local iH=iw:iI(iE)local iJ=mget(iH.B,iH.aG)local iK=fget(iJ,1)local bJ=fget(iJ,2)if iG then iF,fC=0 else local hg=iv and iA==iE
iF,fC=h1.hd(iE-ix,hf,io,hg)end
if fC then local iL=h1.hc(iE,io)local iM=h1.h9(iL,h1.h7(ib,io),io)-iF
local da=it(iE,iM,fC)if da then return da end end
if iE==iB then local da=iu()return da end
iE=iE+iD end end
local function iN()return gQ.gR(nil,4+1,nil)end
local function iO(gS,iP,fC)if iP<-7 then return iN()elseif iP<=4 then return gQ.gR(gS,iP,fC)end end
function hk:i5(ib)return il(self,self.h4,-(7+1),4,ib,0,iO,iN)end
local function iQ()return gQ.gR(nil,4+1,nil)end
local function iR(iS,iT,fC)if iT<=0 then return gQ.gR(iS,iT,fC)else return nil end end
function hk:i7(ib)local iU=self:hG()return il(self,b0(self.h4),7+1-iU,0,ib,iU,iR,iQ,true)end
local function iV()return gQ.gR(nil,ceil(2.5)+1,nil)end
local function iW(iS,iX,fC)if iX<ceil(2.5)then return gQ.gR(iS,iX,fC)else return iV()end end
function hk:iY(ib,iZ)return il(self,self:hH(iZ),0,ceil(2.5),ib,0,iW,iV)end
function hk:hO()local id=self:i2(self.ci)local iP,i_=id.gT,id.fC
if-7<=iP and iP<=0 then local j0=iP*self:hJ()self.ci:av(j0)self:hQ(id.gS)self:hX(i_)if not self:eN()then self:hN(1)end end end
function hk:hN(j1)local j2=self:eN()local j3=self:hF()self.eP=j1
if j3~=self:hF()then local j4=self:hK(ao(0,8-6))local j5=j3 and-1 or 1
self.ci:av(j5*j4)end
if j1==2 then self.hS=nil
self:hX(nil)self.f6=0
self.hw=false elseif j1==3 then self.hS=nil
self:hX(nil,true)self.f6=0
self.hw=false
self.hD=false elseif j1==1 then if not j2 then self.f6=self.eV:aC(ao.bv(self.fC))self.eV:a3(self:j6())self.hx=false
self.hy=false
self.hD=false end elseif j1==4 then if not j2 then self.hx=false
self.hy=false
self.hD=false end end
if j1~=1 and j1~=2 then self.hE=0 end
if j1~=2 then self.hz=0 end end
function hk:i0()if self.hp>0 then self.hp=self.hp-1 end end
function hk:i1()if self:eN()or self.hz>0 then if self.hz>0 then end
self:j7()self:j8()end
if self.hz>0 then self.hz=self.hz-1 end
if I({1,5},self.eP)then self:j9()elseif self.eP==4 then self:ja()end
if self:eN()then self:jb()else self:jc()end
if self:eN()or self.hz>0 then if self.hz>0 then end
self:jd()end end
function hk:j9()if self:je()then if abs(self.f6)>=0.5 then self:hN(4)self:jf(57)elseif self.eP~=5 then self:hN(5)end elseif self.eP~=1 then self:hN(1)end end
function hk:ja()if abs(self.f6)<0.25 then self:hN(1)end end
function hk:jb()self:jg()local gU=self:jh()if gU.gV then self.f6=0 end
if flr(gU.ci.ap)<2.5 then gU.ci.ap=ceil(2.5)self.f6=max(-0.1,self.f6)end
if self.f6~=0 then self.hC=abs(self.f6)else self.hC=0 end
self.eV:a3(self:j6())self.ci:a3(gU.ci)local ji=gU.gW
if not ji and self.h4~=3 and abs(self.f6)<1.25 then if self.fC>=0.25 and self.fC<=0.75 then ji=true end
self.hq=30 end
if ji then local jj
self.hz=6
self.hr=self.fC
if I({1,5},self.eP)then jj=2 else jj=3 end
self:hN(jj)else self:hQ(gU.gS)self:hX(gU.fC)end end
function hk:jg()if I({1,5},self.eP)then local jk=self.f6
self:jl()self:jm()self:jn(jk)elseif self.eP==4 then self:jl()self:jo()end end
function hk:jl()local jp=false
self.f6=self.f6+0.0625*sin(self.fC)end
function hk:jm()local jq=self.f6
if self.ht.ap~=0 then if self.f6==0 or sgn(self.f6)==sgn(self.ht.ap)then jq=self.f6+self.ht.ap*0.0234375
self.eO=aZ(self.ht.ap)if self.hE==1 then self.hE=0 end else jq=self.f6+self.ht.ap*0.25
local jr=jq==0 or sgn(jq)==sgn(self.ht.ap)if jr then if abs(jq)>0.0234375 then jq=sgn(jq)*0.0234375 end
self.eO=aZ(self.ht.ap)if self.hE==1 then self.hE=2 end elseif self.h4==3 and abs(self.f6)>=2 then self.eO=aZ(self.f6)self.hE=1
self:jf(58)end end else if self.f6~=0 then jq=sgn(self.f6)*max(0,abs(self.f6)-0.0234375)end
if self.hE==1 and not self.hl.fl then self.hE=0 end end
self.f6=jq end
function hk:jo()local js=0.01171875
if self.f6~=0 and self.ht.ap~=0 then if sgn(self.f6)~=sgn(self.ht.ap)then js=js+0.0625 else self.eO=aZ(self.ht.ap)end end
self.f6=sgn(self.f6)*max(0,abs(self.f6)-js)end
function hk:jn(jk)local jt=max(abs(jk),3)if abs(self.f6)>jt then self.f6=sgn(self.f6)*jt end end
function hk:j6()return self.f6*ao.bv(self.fC)end
function hk:jh()if self.f6==0 then return gQ.gU(self.hS:a0(),self.ci:a0(),self.fC,false,false)end
local gW=false
local ju=self.h4
local ig=aZ(self.f6)local jv=self.ci+self:j6()local gV=self:jw(jv,ig)local id=self:i2(jv)local iP=id.gT
local j0=iP*self:hJ()if iP<0 then if-iP<=7 then jv:av(j0)end elseif iP>=0 then if iP<=4 then local jx=compute_signed_angle_between(id.fC,self.fC)if aY[ig]*jx>0.125 then gW=true else jv:av(j0)end else gW=true end end
local jy=not gW and id.gS or nil
if gV and ju~=h1.h2(id.fC)then self:hQ(jy)gV=self:jw(jv,ig)end
local jz=gQ.gU(jy,jv,id.fC,gV,gW)return jz end
function hk:jw(jv,ig)local ir=self:ij(jv)local jA=self:iY(ir,ig)if jA.gS then if-6<=jA.gT and jA.gT<ceil(2.5)then local iX=jA.gT-ceil(2.5)local jB=aU[self:hH(ig)]local jC=iX*jB
jv:av(jC)return true end end
return false end
function hk:je()return self.ht.ap==0 and self.ht.aq>0 end
function hk:jd()if self.hu then self.hu=false
self.hw=true end end
function hk:j7()if self.hw then self.hw=false
local jD=self.hz>0 and self.hr or self.fC
local jE=3.25*ao.bv(jD):bB()self.eV:av(jE)self:hN(3)self.hx=true
self.hy=true
self:jf(55)return true end
return false end
function hk:j8()if I({5,6},self.eP)then if self.eP==6 and self.ht.aq<=0 then self:jF()elseif self.hu then self.hu=false
if self.eP==5 then self:hN(6)self.f6=0
self.hs=0 end
self.hs=min(self.hs+2,8)self:hB("spin_dash",true)self:jf(61)else if self.eP==6 then self.hs=self.hs*0.96875 end end end end
function hk:jF()local jG=aY[self.eO]self:hN(4)self.f6=jG*(4+flr(self.hs)*0.25)self:jf(62)end
function hk:jc()if self.hx then self.hx=false else self.eV.aq=self.eV.aq+0.109375 end
if self.eP==3 then self:jH()end
if self.ht.ap~=0 then local jI=self.eV.ap
self.eV.ap=self.eV.ap+self.ht.ap*0.046875
self:jJ(jI)self.eO=aZ(self.ht.ap)end
self:jK()if self.eV.aq>32 then self.eV.aq=32 end
self.ci:av(self.eV)local gX=self:jL()if gX.gY then self.eV.ap=0 end
if gX.gZ then self.eV.aq=0 end
if flr(self.ci.ap)<2.5 then self.ci.ap=ceil(2.5)self.eV.ap=max(0,self.eV.ap)end
if gX.g_ then self:hQ(gX.gS)self:hX(gX.fC)self:hN(1)end end
function hk:jH()if self.hy and not self.hv then self.hy=false
local jM=-2
if self.eV.aq<jM then self.eV.aq=jM end end end
function hk:jK()local jN=self.eV
if jN.aq<0 and jN.aq>-8 and abs(jN.ap)>=0.25 then jN.ap=jN.ap*0.96875 end end
function hk:jJ(jI)local jO=max(abs(jI),3)if abs(self.eV.ap)>jO then self.eV.ap=sgn(self.eV.ap)*jO end end
function hk:jL()if self.eV:ar()then return gQ.gX(nil,false,false,false,nil)end
local hS
local gY=false
local gZ=false
local g_=false
local fC
if self.eV.ap~=0 then local ig=aZ(self.eV.ap)gY=self:jw(self.ci,ig)end
if self.eV.aq>0 then local gR=self:i2(self.ci)local iP=gR.gT
if-7<=iP and iP<0 then local j0=iP*self:hJ()self.ci:av(j0)g_=true
hS=gR.gS
fC=gR.fC end elseif self.eV.aq<0 then local jP=self:i6(self.ci)local iT=jP.gT
if iT<0 then assert(jP.fC>0.25 and jP.fC<0.75,"detected ceiling with slope angle expected between 0.25 and 0.75 excluded, got: "..jP.fC.." (we don't check for those bounds in ceiling adherence check so Sonic may adhere to unwanted walls)")local jQ=-iT*self:hJ()self.ci:av(jQ)if jP.fC<=0.25+0.125 or jP.fC>=0.75-0.125 then hS=jP.gS
g_=true
fC=jP.fC else gZ=true end end end
return gQ.gX(hS,gY,gZ,g_,fC)end
function hk:h_()self:jR()self:jS()end
function hk:jR()if self.hE==1 then self:hB("brake_start")return elseif self.hE==2 then self:hB("brake_reverse")if self.hl.fl then return else self.hE=0 end end
if self.eP==1 then if self.f6==0 then self:hB("idle")else if self.hC<3 then self:hB("walk",false,max(0.625,self.hC))else self:hB("run",false,self.hC)end end elseif self.eP==2 then if self.hD and self.eV.aq>0 then self.hD=false end
if self.hD then self:hB("spring_jump")else if self.hC<3 then self:hB("walk",false,max(0.625,self.hC))else self:hB("run",false,self.hC)end end elseif self.eP==5 then self:hB("crouch")elseif self.eP==6 then else local jT=self.eP==4 and 1.25 or 0.625
self:hB("spin",false,max(jT,self.hC))end end
local jU={["idle"]=0,["walk"]=0,["walk45"]=1,["brake_start"]=3,["brake_reverse"]=3,["run"]=2,["run45"]=2+1/32,["spin"]=3,["crouch"]=1,["spring_jump"]=0,["spin_dash"]=4}function hk:hB(fq,fr,fs)self.hl:fp(fq,fr,fs)self:hU()local jV
if self.hW then jV=fq.."45"else jV=fq end
local jW=jU[jV]if self.jX~=jW then self.jX=jW
local jY=0x4b00+jW*0x400
if jW<4 then memcpy(0x1000,jY,0x400)else for B=0,15 do memcpy(0x1000+B*0x40,jY+B*0x28,0x28)end end end end
function hk:jS()local bg=self.hT
if self.eP==2 and bg~=0 then if bg<0.5 then self:hA(max(0,abs(bg)-1/128))else self.hT=min(1,abs(bg)+1/128)%1 end end end
function hk:ch()local jZ=ao(flr(self.ci.ap),flr(self.ci.aq))local bc=self.eO==1
self.hl:ch(jZ,bc,false,self.hV)end
function hk:jf(aL)if stat(19)~=59 then sfx(aL)end end
local j_=a7(cV)function j_:X()self.camera=ew()end
function j_:k0(k1,ay)return"data_stage"..self.k2 .."_"..k1 ..ay..".p8"end
function j_:k3(k4)return k4+self:iy()end
function j_:iI(k5)return k5-self:iy()end
function j_:k6()local k7=self.eI.eo:aH()self.hk=hk()self.hk:hL(k7)end
function j_:k8(hR,k9,ka)for kb in all(k9)do if(ka==nil or ka(hR,kb))and kb:I(hR)then return true end end
return false end
function j_:kc(hR)return self:k8(hR,self.eI.es,function(hR,kb)return hR~=aM(kb.aQ,kb.eh)end)end
function j_:kd(hR)return self:k8(hR,self.eI.er,function(hR,kb)return hR~=aM(kb.aS,kb.eh)end)end
function j_:ke(hR)for kb in all(self.eI.es)do if hR==aM(kb.aQ,kb.eh)then return true end end end
function j_:kf(hR)for kb in all(self.eI.er)do if hR==aM(kb.aS,kb.eh)then return true end end end
function j_:kg(kh)kh=kh or ao.aE()camera(self.camera.ci.ap-64-kh.ap,self.camera.ci.aq-64-kh.aq)end
function j_:ki()local ix=self:iy()self:kg(ao(8*ix.B,8*ix.aG))end
function j_:iy()return aM(128*self.kj.ap,32*self.kj.aq)end
local kk={{1,12,12,7},{7,1,12,12},{12,7,1,12},{12,12,7,1}}function j_:kl()local km=0.5
local eZ=t()%km/km
local kn=#kk
local dM=min(flr(eZ*kn)+1,kn)local A=kk[dM]y({1,13,12,7},A)end
function j_:ko()self:ki()self:kp()self:kq()end
function j_:kp()w(14)map(0,0,0,0,128,32,64)end
function j_:kq()self:kl()map(0,0,0,0,128,32,16)pal()end
function j_:kr()w(14)self:ki()map(0,0,0,0,128,32,128)end
local ks={}local function kt(aq,v)line(0,aq,127,aq,v)end
function ks.ku(kv)camera()rectfill(0,0,127,127,1)local kw=156-0.5*kv.aq
camera(0,-kw)if kw>=-31 then ks.kx(kv)end
if kw<=58 then ks.ky(kv,kw)end
ks.kz(kv)end
function ks.kx(kv)kt(-1,12)kt(0,7)kt(1,13)local kA={{0,60,140,220},{30,150,240},{10,90,210},{50,130}}local kB={{0,0,-1,0},{0,-1,-1,0},{0,-1,1,0},{0,1,-1,1}}for aG=0,3 do for kC in all(kA[aG+1])do ks.kD(kC,-8.9-14.7*aG,kB[aG+1],2+0.9*aG,3+3.5*aG)end end
local kE={4,3,6,2,1,5}local kF={0.7,1.5,1.2,1.7,1.1}local kG=0.015
for B=0,21 do local br=kE[B%6+1]local aq=2+br
local kH=kG*min(6,br)/6
local kI=flr(kH*kv.ap)ks.kJ(kI,6*B,aq,kF[B%5+1])end end
function ks.kz(kv)local kK=0.3
local kL=0.42
local kM=kL-kK
local kN=0.36
local kO=kL-kN
for aG=0,1 do local kH=kN+kO*aG
local kI=flr(kH*kv.ap)ks.kP(kI,31+18*(1-aG),19,aG,aG%2==1 and 11 or 3)end
for aG=0,2 do local kH=kK+kM*aG/3
local kI=flr(kH*kv.ap)ks.kQ(kI,31+8*aG,10,aG,aG%2==0 and 11 or 3)end end
function ks.ky(kv,kw)fillp(0x5a5a)rectfill(0,50,127,127-kw,3*0x10+0)fillp()local kH=0.3
local kI=flr(kH*kv.ap)local kR={0,1,3}local kS={0,0,2}for B=0,2 do local kT=8*8
local x0=80-kI+kT*B
local kU=kT-2*8
x0=(x0+kU)%192-kU
local kV=102
local kW=kS[B+1]rectfill(x0,kV-8,x0+4*8,kV+(5+kW)*8,3)ks.kX(x0-1,kV,kW,-1)ks.kX(x0+4*8,kV,kW,1)ks.kY(x0,kV-8-1,-1)ks.kY(x0,kV+(5+kW)*8,1)local kZ=kV+kR[B+1]*8
ck.cm.cx:ch(ao(x0,kZ))ck.cm.cy:ch(ao(x0-24,kZ+16))end end
function ks.kX(x0,kV,kW,k_)for br=-8,(5+kW)*8-1 do local aq=kV+br
line(x0+k_*flr(2.5*(1+sin(br/1.7)*sin(br/1.41))),aq,x0,aq,3)end end
function ks.kY(x0,kV,k_)for bq=0,4*8-1 do local ap=x0+bq
line(ap,kV+k_*flr(3.7*(1+sin(bq/1.65)*sin(bq/1.45))),ap,kV,3)end end
function ks.kD(ap,aq,l0,l1,fs)local l2=t()*fs
l3=(ap-l2+100)%300-100
local l4={0,1.5,3,4.5}local l5={0.8,1.4,1.1,0.7}for B=1,4 do circfill(l3+flr(l4[B]*l1),aq+l0[B],l5[B]*l1+1,13)end
for B=1,4 do circfill(l3+flr(l4[B]*l1),aq+l0[B],l5[B]*l1,7)end end
local l6={{1,12},{7,12},{12,1},{12,7},{1,12}}function ks.kJ(kI,ap,aq,km)local eZ=t()%km/km
local kn=#l6
local dM=min(flr(eZ*kn)+1,kn)local l7=l6[dM]pset((ap-kI)%128,aq,l7[1])pset((ap-kI+1)%128,aq,l7[2])end
function ks.kQ(kI,aq,l8,fJ,l9)for l3=0,127 do local ap=l3+kI
local ef=l8+flr((3+0.5*fJ)*(1+sin(ap/(1.7+0.2*fJ))*sin(ap/1.41)))line(l3,aq,l3,aq-ef,l9)end end
function ks.kP(kI,aq,l8,fJ,l9)for l3=0,127 do local ap=l3+kI
local ef=l8+flr((4.5-0.3*fJ)*(1+sin(ap/(41.4-9.1*fJ)))+1.8*sin(ap/1.41))line(l3,aq,l3,aq+ef,l9)end end
local la={}function la.lb(am,an,lc)return am+(an-am)*lc end
function la.ld(am,an,lc)return am+(an-am)*mid(lc,0,1)end
function la.le(am,an,lc)return am+(an-am)*lc*lc end
function la.lf(am,an,lc)return am+(an-am)*(2-lc)*lc end
function la.lg(am,an,lc)if lc<=0.5 then return la.le(am,(am+an)/2,2*lc)else return la.lf((am+an)/2,an,2*lc-1)end end
function la.lh(at,li,lj,am,an,aL)for Q=1,aL do local lc=Q/aL
for B,lk in ipairs(li)do lk.ci:au(at,la.lb(am,an,lc)+lj[B])end
yield()end end
function la.ll(li,a4,fW,aL)for Q=1,aL do local lc=Q/aL
for B,lk in ipairs(li)do lk.ci:a3(la.lb(a4,fW,lc))end
yield()end end
local lm=a7(j_)lm.type=':stage_intro'function lm:X()j_.X(self)self.k2=1
self.eI=ek[1]self.camera=ew()self.e5=e5()self.ln=dT()end
function lm:d0()local lo="data_stage"..self.k2 .."_intro.p8"reload(0x0,0x0,0x2000,lo)reload(0x4b00,0x400,0x1000,"data_stage_sonic.p8")self.camera:eG(self.eI)reload(0x2000,0x2000,0x1000,self:k0(0,1))self.kj=ao(0,1)self:k6()self.camera.eM=self.hk
self.dF:d5(self.lp,self)end
function lm:cS()self.hk:cS()self.camera:cS()end
function lm:ch()ks.ku(self.camera.ci)self:lq()self:lr()self.ln:dW()end
function lm:lq()self:ko()self:ls()self:kr()end
function lm:ls()self:kg()self.hk:ch()end
function lm:lr()camera()self.e5:dO()end
function lm:lp()for B=5,0,-1 do self.ln.dV=B
O(6)end
self.dF:dQ(et.eu)local lt=ed(ao(9,-106),32,106,8)self.e5:e8("banner",lt)local lu=e3("pico\nsonic",ao(16,-17),7)self.e5:e8("banner_text",lu)la.lh("y",{lt,lu},{0,89},-106,0,9)local lv=ed(ao(128,45),47,3,0)self.e5:e8("zone_rect",lv)local lw=e3(self.eI.el,ao(129,43),7)self.e5:e8("zone",lw)la.lh("x",{lv,lw},{0,1},128,41,14)O(101)la.lh("y",{lt,lu},{0,89},0,-106,8)la.lh("x",{lv,lw},{0,1},41,128,14)self.e5:eb("banner")self.e5:eb("banner_text")self.e5:eb("zone")load('picosonic_ingame')end
local lx=a7(dS)function lx:dH()return{lm()}end
local dF=lx()function _init()dF.dK=':stage_intro'dF:dI()end
function _update60()dF:cS()end
function _draw()dF:dO()end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777700000000000000000000000000000000000000000000000000000000000000000000000000000000777777000000000000000000000000000077
00700700777777777777777700000000000000000000000000000000000000000000000000000000000000007777777777770000000000000000000000007777
00077000777777777777777777770000000000000000000000000000000000000000000000000000000077777777777777777700000000000000000000777777
00077000777777777777777777777777777777770000000000000000000000000000000000000000777777777777777777777777000000000000000077777777
00700700777777777777777777777777777777777777000000000000000000000000000000007777777777777777777777777777770000000000007777777777
00000000777777777777777777777777777777777777777777777777000000000000000077777777777777777777777777777777777700000000777777777777
00000000777777777777777777777777777777777777777777777777777700000000777777777777777777777777777777777777777777000077777777777777
70000000700000000000000000000000000000070000000700000000777777777777777700000000000000000000000000000000777777770077777777777700
77000000770000000000000000000000000000770000007700000007077777777777777070000000000000000000000000000007777777770077777777777700
77700000777700000000000000000000000077770000077700000007077777777777777070000000000077770000000000000077777777770077777777777700
77770000777770000000000000000000000777770000777700000077007777777777770077000000000077770000000000000077777777770077777777777700
77777000777777700000000000000000077777770007777700000077000777777777700077000000000077770000000000000777777777770077777777777700
77777700777777777000000000000007777777770077777700000077000777777777700077000000000077770000000000000777777777770077777777777700
77777770777777777770000000000777777777770777777700000777000077777777000077700000000077770000000000007777777777770077777777777700
77777777777777777777700000077777777777777777777700000777000077777777000077700000000077770000000000007777777777770077777777777700
77777777777777777777700000077777777777777777777700007777000007777770000077770000000000000000007700077777000000000000000000000000
77777770777777777770000000000777777777770777777700007777000007777770000077770000000000000000777700077777000000000000000000000000
77777700777777777000000000000007777777770077777700077777000000777700000077777000000000000077777700777777000000000000000000000000
77777000777777700000000000000000077777770007777700077777000000777700000077777000000000777777777700777777000000000000000000000000
77770000777770000000000000000000000777770000777700777777000000777700000077777700000077777777777707777777000000000000000000000000
77700000777700000000000000000000000077770000077707777777000000077000000077777770007777777777777707777777000000000000000000000000
77000000770000000000000000000000000000770000007707777777000000077000000077777770777777777777777777777777000000000000000000000000
70000000700000000000000000000000000000070000000777777777000000077000000077777777777777777777777777777777777777770000000000000000
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
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
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
011000003005032050300503205030050320503005032050300503205030050320503005032050300503205030050320503005032050300503205030050320503005032050300503205000000000000000000000
010c00001835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350183501835018350
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
0110000024755287552b75530755307002d7550000032755327000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010900003f5733f5633f5433f5233f5133f5233f5433f5633f5733f5633f5433f5233f5133f503025030250302503025030250301503025030250302503025030050300503005030050300503005030050300503
010300001354013540145401555016550185501b5601e560235712a56100501005010050100501005010050100501005010050100501005010050100501005010050100501005010050100000000000000000000
01030000144721447215462164621a4621d4522144222432234222342224422244222442225412254122541225412254121640216402164021640216402164021640216402164021640216402164021640216402
01070000285512c5512d5512d5512d5512d5412d5412d5312d5212d5212d5112d5112d5112d5112d5112d5002a5012a5012a5012a5012a5012c5012c5012c5012c5012d5012d5012d5011e5011e5011e5011e501
010400002433024330243002433024330243302433024330243302433024330243302433022300223000830008300083000830008300083000830008300083000830008300083000830008300083000830008300
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
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
04 39777879

