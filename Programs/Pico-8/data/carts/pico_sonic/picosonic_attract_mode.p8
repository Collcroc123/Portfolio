pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- pico sonic v6.1 (attract_mode)
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
bs={aQ=1,bt=2,bu=3,aS=4}function bv(bw,bx)local by=bx-bw
return(by+0.5)%1-0.5 end
function ao.bz(bg)return ao(cos(bg),sin(bg))end
function ao:bA(bg)local bB=sin(bg)local bC=cos(bg)return ao(bC*self.ap-bB*self.aq,bB*self.ap+bC*self.aq)end
function ao:bD()return ao(-self.aq,self.ap)end
function ao:bE()self:a3(self:bD())end
function ao:bF()return ao(self.aq,-self.ap)end
function ao:bG()self:a3(self:bF())end
function bH(bI,bJ)for G,H in pairs(bJ)do bI[G]=H end end
bK={bL=1,bM=2,bN=3,bO=4}bP={bQ=0,bR=1,bS=2,bT=4,bU=5,bV=6,bW=7}bX={bQ=1,bR=2,bS=4,bT=16,bU=32,bV=64,bW=128}bY={bZ=1,b_=2}c0={c1=1,c2=2,c3=3,c4=4,c5=5,c6=6}function c7(c8)return function(c9)return c8(unpack(c9))end end
local ca=a9()function ca:X(cb,cc,cd)self.cb=cb
self.cc=cc
self.cd=cd end
function ca.ce(cf)return ca({cf},1,2)end
local cg=a9()function cg:X(ch,ci,cj,ck)self.ch=ch
self.ci=ci or aF(1,1)self.cj=cj or ao.aE()if type(ck)=="table"then self.bh=0
for v in all(ck)do self.bh=self.bh+u(v)end elseif ck then self.bh=u(ck)else self.bh=u(0)end end
function cg:cl(cm,bc,bd,bg,cn)b9(self.ch.B,self.ch.aG,cm.ap,cm.aq,self.ci.B,self.ci.aG,bc,bd,self.cj.ap,self.cj.aq,bg,self.bh)end
local co={cp={{8,2},{15,9},{14,2},{13,5},{12,1},{11,3},{10,9},{9,4}}}local cq=C({cr={12,0,4,4},cs={13,0,4,4},ct={14,0,4,4},cu={15,0,4,4}},function(cv)return cg(aI(cv[1],cv[2]),nil,ao(cv[3],cv[4]),14)end)co.cq=cq
co.cw={cx=ca({cq.cr,cq.cs,cq.ct,cq.cu},5,2)}local cy=C({cz={12,12,1,2,0,16},cA={13,12,3,4,0,16},cB={1,0,2,3,0,0},cC={13,1,3,2,0,0},cD={9,1,1,1,3,2},cE={3,0,3,2,12,16},cF={6,0,3,2,12,16},cG={0,1,1,2,4,16},cH={6,14,2,2,7,16},cI={8,14,2,2,8,16},cJ={10,15,1,1,3,2},bU={10,4,2,1,10,2},cK={10,5,2,2,10,10}},function(cv)return cg(aI(cv[1],cv[2]),aF(cv[3],cv[4]),ao(cv[5],cv[6]),14)end)co.cL=cy.cJ.ch:aJ()local cM={cN={["goal"]=ca.ce(cy.cE),["sonic"]=ca.ce(cy.cF),["rotating"]=ca({cy.cE,cy.cH,cy.cG,cy.cI,cy.cF,cy.cH,cy.cG,cy.cI},3,4)}}bH(co.cq,cy)bH(co.cw,cM)local cO={}function cP(cQ,cR)return cR end
local cS=ae(function(self)self.cT={}self.cU=nil
self.cV=nil end)function cS:cW()self:cX()if self.cU then self.cU:cW()end end
function cS:cl()if self.cU then self.cU:cl()end end
function cS:cY(cZ)self.cT[cZ.type]=cZ end
function cS:c_(d0)self.cV=self.cT[d0]end
function cS:cX(d0)if self.cV then self:d1(self.cV)end end
function cS:d1(d2)if self.cU then self.cU:d3()end
self.cU=d2
d2:d4()self.cV=nil end
local d5=a5()function d5:X(d6,...)self.d6=d6
self.c9={...}end
local d7=a5()function d7:X()self.d8={}end
function d7:d9(da,...)local d6=cocreate(da)add(self.d8,d5(d6,...))return#self.d8 end
function d7:db()local dc={}for B,d5 in pairs(self.d8)do local dd=costatus(d5.d6)if dd=="suspended"then local de,df=coresume(d5.d6,unpack(d5.c9))elseif dd=="dead"then add(dc,d5)end end
for d5 in all(dc)do del(self.d8,d5)end end
function d7:dg(dh)deli(self.d8,dh)end
function d7:di()M(self.d8)end
local dj=ae(function(self)self.dk={}for B=0,1 do local D={}for B=0,5 do D[B]=0 end
self.dk[B]=D end end)local dl=0x5f2d
local dm=32
local dn=33
function dj:dp(dq,dr)dr=dr or 0
return self.dk[dr][dq]end
function dj:ds(dq,dr)local dt=self:dp(dq,dr)return dt==0 or dt==3 end
function dj:du(dq,dr)return not self:ds(dq,dr)end
function dj:dv(dq,dr)local dt=self:dp(dq,dr)return dt==3 end
function dj:dw(dq,dr)local dt=self:dp(dq,dr)return dt==1 end
function dj:dx()for dr=0,1 do self:dy(dr)end end
function dj:dy(dr)local dz=self.dk[dr]for dq,dA in pairs(dz)do if self:ds(dq,dr)and btn(dq,dr)and not btnp(dq,dr)then dA=2 end
local dB=btn(dq,dr)dz[dq]=self:dC(dA,dB)end end
function dj:dC(dD,du)if dD==0 then if du then return 1 end elseif dD==1 then if du then return 2 else return 3 end elseif dD==2 then if not du then return 3 end else if du then return 1 else return 0 end end
return dD end
local dE=a5()function dE:X(dF)self.d7=d7()self.dF=dF
self.dG=1/dF end
function dE:dH(cT)for dI in all(cT)do dI.dJ=self
cS:cY(dI)end end
function dE:dK()self:dH(self:dL())end
function dE:dM()if self.dN then self:dN()end
self:dK()cS:c_(self.dO)if self.dP then self:dP()end end
function dE:cW()dj:dx()self:dQ()end
function dE:dQ()cS:cW()self.d7:db()self:dR()end
function dE:dR()end
function dE:dS()cls()cS:cl()self:dT()end
function dE:dT()end
function dE:d9(da,...)return self.d7:d9(da,...)end
function dE:dg(dh)self.d7:dg(dh)end
function dE:di()self.d7:di()end
function dE:dU(dV)O(ceil(dV*self.dF))end
local dW=a7(dE)function dW:X()dE.X(self,60)end
function dW:dP()extcmd("set_title","Pico Sonic")poke(0x5f5c,-1)end
local dX=a5()dX.dY={{1,1,0,0},{2,2,1,0},{1,1,0,0},{2,2,5,0},{5,1,1,0},{13,13,5,5},{15,6,4,5},{4,2,2,5},{4,4,5,5},{15,9,4,13},{3,3,1,1},{13,2,1,1},{2,2,1,1},{4,4,2,2},{9,4,5,5}}function dX:X()self.dZ=0 end
function dX:d_()if self.dZ==0 then pal()elseif self.dZ<5 then for v=1,15 do pal(v,dX.dY[v][self.dZ],1)end else cls()end end
local e0={}function e0.e1(a4,e2,e3)for e4=a4,e2 do e0.e5(e4,e3)end end
function e0.e5(e4,e3)for B=0,31 do e0.e6(e4,B,e3)end end
function e0.e6(e4,e7,e3)local e8=0x3200+68*e4+2*e7+1
local e9=e0.ea(peek(e8),e3)poke(e8,e9)end
function e0.ea(eb,e3)local e0=max(0,band(eb,14)/2-e3)return bor(band(eb,bnot(14)),e0*2)end
local cZ=a5()cZ.type=':undefined'function cZ:X()end
function cZ:d4()end
function cZ:d3()end
function cZ:cW()end
function cZ:cl()end
function cZ:ec()end
local ed=a5()function ed:X()self.cm=ao.aE()self.ee=0
self.ef=2
self.eg=0
self.eh=2
self.ei=0
self.ej=0
self.ek=ao.aE()self.el=0
self.em=ao.aE()end
function ed:en(eo)self.ep=eo
self:eq(eo.er:aH())self.ee=8 end
function ed:eq(es)self.cm:a3(es)self.ek.ap=es.ap
self.ek.aq=es.aq end
function ed:cW()local et=false
if self.eu:ev()then if self.ef~=self.eu.ew then self.ef=self.eu.ew
et=true end end
if et then self.eg=0 elseif self.eh~=self.ef then self.eg=self.eg+1
if self.eg>=30 then self.eh=self.ef end end
if self.eu.ex==5 then if self.ei>=120 then self.ej=min(self.ej+1,44)else self.ei=self.ei+1 end else self.ei=0
self.ej=max(0,self.ej-1)end
if self.eu.ex==6 then self.el=16
self.em:a3(self.eu.cm)self.ey=self.eu.ew elseif self.el>0 then self.el=self.el-1 end
local ez
local eA
local eB
local eC
if self.el>0 then ez=self.em
eA=0
eB=true
eC=self.ey else ez=self.eu.cm
eA=self.eu.eD.ap
eB=self.eu:ev()eC=self.eh end
local eE=mid(self.ek.ap,ez.ap-4,ez.ap+4)local bq=eE-self.ek.ap
bq=sgn(bq)*min(abs(bq),8)self.ek.ap=self.ek.ap+bq
local eF=8*aY[eC]local eG=3-2.5
local eH=mid(0,1,(abs(eA)-2.5)/eG)local eI=sgn(eA)*eH*32
local eJ=eF+eI
local eK=eJ-self.ee
eK=sgn(eK)*min(abs(eK),0.5)self.ee=self.ee+eK
self.cm.ap=self.ek.ap+self.ee
local eL=ez.aq+self.eu:eM()-8
local br
if self.eu:ev()then local eN=mid(self.ek.aq,eL- -4-1,eL- -4+1)br=eN-self.ek.aq
local eO=abs(self.eu.eP)<4 and 3 or 8
br=sgn(br)*min(abs(br),eO)else local eN=mid(self.ek.aq,eL- -4-16,eL- -4+16)br=eN-self.ek.aq
br=sgn(br)*min(abs(br),8)end
self.ek.aq=self.ek.aq+br
self.cm.aq=self.ek.aq+self.ej
self.cm.ap=mid(64,self.cm.ap,self.ep.eQ*8-64)local eR=self:eS(self.cm.ap)self.cm.aq=mid(64,self.cm.aq,eR-64)end
function ed:eT()return ao(flr(self.cm.ap),flr(self.cm.aq))end
function ed:eS(ap)local eU=0
for eV in all(self.ep.eW)do if ap<eV.ap*8 then eU=eV.aq
break end end
return(self.ep.eX-eU)*8 end
function ed:eY(eZ,e_)local f0=self.cm.ap-64
local f1=self.cm.ap+64
local f2=self.cm.aq-64
local f3=self.cm.aq+64
return f0<e_.ap and f1>eZ.ap and f2<e_.aq and f3>eZ.aq end
local f4=a5()function f4:X(f5)self.f5=f5
self.f6=false
self.f7=0
self.f8=1
self.f9=0 end
function f4:fa(fb,fc,fd)fd=fd or 1
self.f7=fd
if self.fe~=fb or fc then self.f6=true
self.fe=fb
self.f8=1
self.f9=0 end end
function f4:ff()self.f6=false
self.fe=nil
self.f8=1
self.f9=0 end
function f4:cW()if self.f6 then local fg=self.f5[self.fe]self.f9=self.f9+self.f7
while self.f9>=fg.cc do if self.f8<#fg.cb then self.f8=self.f8+1
self.f9=self.f9-fg.cc else if fg.cd==1 then self.f6=false
self.f8=1
self.f9=0 elseif fg.cd==2 then self.f6=false
self.f8=#fg.cb
self.f9=0 elseif fg.cd==3 then self:ff()else self.f8=1
self.f9=self.f9-fg.cc end end end end end
function f4:cl(cm,bc,bd,bg)if self.fe then local fg=self.f5[self.fe]local fh=fg.cb[self.f8]fh:cl(cm,bc,bd,bg)end end
local fi={}local fj=a9()function fj:X(fk,fl,fm,fn,fo,fp,fq)self.fk=fk
self.fl=fl
self.fm=fm
self.fn=fn
self.fo=fo
self.fp=fp
self.fq=fq end
function fj:fr(fs)return self.fl[fs+1]end
function fj:ft(fu)return self.fm[fu+1]end
local function fv(fw)for ay in all(fw)do if ay~=0 and ay~=8 then return false end end
return true end
function fj:fx()return fv(self.fl)end
function fj:fy()return fv(self.fm)end
function fj:fz()if self.fq then return false end
local fA
for ay in all(self.fl)do if ay~=0 then if fA then if ay~=fA then return false end else fA=ay end end end
return true end
function fj.fB(fn)local fC=fn<0.25 or fn>=0.75
local fo=fC and 2 or 1
local fp=fn<0.5 and 2 or 1
return fo,fp end
function fj.fD(fE,fn,fq)local fo,fp=fj.fB(fn)local fk=aI.aK(fE)return fj(fk,fj.fF(fk,fo),fj.fG(fk,fp),fn,fo,fp,fq)end
local function eG(a4,e2,dQ)dQ=dQ or 1
return function(K,fH)local fI=fH+dQ
if dQ>0 and fI<=e2 or dQ<0 and fI>=e2 or dQ==0 then return fI end end,nil,a4-dQ end
function fj.fJ(fK,fL,bq,br,fo,fp,fM)local fN=sget(fK+bq,fL+br)if fN~=0 then return fM(bq,br,fo,fp)end end
function fj.fO(bq,br,fo,fp)if fo==2 then return 8-br else return br+1 end end
function fj.fP(bq,br,fo,fp)if fp==2 then return 8-bq else return bq+1 end end
function fj.fF(fQ,fo)local fw={}local fR=fQ:aH()local fS=fo==2 and{eG(0,8-1)}or{eG(8-1,0,-1)}for bq=0,8-1 do for br in unpack(fS)do fT=fj.fJ(fR.ap,fR.aq,bq,br,fo,nil,fj.fO)if fT then break end end
if not fT then fT=0 end
add(fw,fT)end
return fw end
function fj.fG(fQ,fp)local fw={}local fR=fQ:aH()local fU=fp==2 and{eG(0,8-1)}or{eG(8-1,0,-1)}for br=0,8-1 do for bq in unpack(fU)do fV=fj.fJ(fR.ap,fR.aq,bq,br,nil,fp,fj.fP)if fV then break end end
if not fV then fV=0 end
add(fw,fV)end
return fw end
local fW={}local fX=C({[1]={8,2},[2]={8,0},[3]={8,2},[4]={8,0},[5]={8,2},[6]={8,0},[7]={8,2},[8]={8,-2},[9]={8,-2},[10]={8,-2},[11]={8,-2},[12]={8,3},[13]={8,3},[14]={8,-3},[15]={8,-3},[16]={8,8},[17]={8,5},[18]={8,3},[19]={8,-3},[20]={8,-5},[21]={8,-8},[38]={4,-8},[22]={3,-8},[39]={-3,-8},[23]={-4,-8},[32]={-8,8},[33]={-8,5},[34]={-8,3},[35]={-8,-3},[36]={-8,-5},[37]={-8,-8},[24]={-4,8},[40]={-3,8},[25]={3,8},[41]={4,8},[44]={4,-8},[28]={4,-8},[26]={8,-0.0625},[29]={8,0},[30]={0,-8},[31]={0,8},[42]={8,-4},[43]={8,-4},[45]={8,0}},function(fY)return atan2(fY[1],fY[2])end)local fZ={[7]=true,[8]=true,[13]=true,[14]=true,[18]=true,[19]=true,[34]=true,[35]=true}local f_={[35]=29,[36]=29,[218]=29,[219]=29,[235]=29,[48]=29,[64]=29,[80]=29,[83]=29,[84]=29,[182]=44,[166]=28,[124]=29,[125]=29,[49]=1,[50]=2,[51]=3,[52]=4,[53]=5,[54]=6,[55]=7,[56]=8,[57]=9,[58]=10,[59]=11,[60]=12,[61]=13,[62]=14,[63]=15,[65]=29,[66]=29,[67]=29,[68]=29,[69]=29,[70]=29,[71]=29,[72]=29,[73]=29,[85]=29,[86]=29,[87]=29,[88]=29,[89]=29,[160]=45,[161]=45,[213]=45,[214]=45,[164]=13,[94]=29,[95]=29,[110]=29,[111]=29,[74]=26,[75]=2,[202]=30,[173]=31,[176]=4,[177]=4,[192]=29,[193]=29,[208]=29,[209]=29,[162]=29,[163]=29,[178]=29,[179]=29,[194]=29,[195]=29,[210]=29,[211]=29,[96]=16,[97]=17,[98]=18,[99]=19,[100]=20,[101]=21,[118]=38,[102]=22,[119]=39,[103]=23,[112]=32,[113]=33,[114]=34,[115]=35,[116]=36,[117]=37,[104]=24,[120]=40,[105]=25,[121]=41,[240]=8,[241]=9,[242]=10,[243]=11,[244]=29,[245]=32,[228]=19,[229]=20}local g0={}for g1,fE in pairs(f_)do g0[g1]=fj.fD(fE,fX[fE],fZ[fE])end
fW.g2=function(g1)return g0[g1]end
local g3=C({g4={{12,8},{2,2},{10,8},14},g5={{0,8},{2,2},{8,8},14},g6={{2,8},{2,2},{8,8},14},g7={{4,8},{2,2},{9,8},14},g8={{6,8},{2,2},{8,8},14},g9={{8,8},{2,2},{8,8},14},ga={{10,8},{2,2},{8,8},14},gb={{10,8},{2,2},{9,8},14},gc={{12,8},{2,2},{9,8},14},gd={{14,8},{2,2},{11,8},14},ge={{14,8},{2,3},{9,8},14},gf={{0,8},{2,2},{8,8},14},gg={{2,8},{2,2},{8,8},14},gh={{4,8},{2,2},{8,8},14},gi={{6,8},{2,2},{8,8},14},gj={{0,8},{2,2},{6,6},14},gk={{2,8},{2,2},{6,6},14},gl={{4,8},{2,2},{6,6},14},gm={{6,8},{2,2},{6,6},14},gn={{8,8},{2,2},{6,6},14},go={{12,8},{2,2},{7,10},14},gp={{14,8},{2,2},{7,10},14},gq={{0,8},{2,2},{3,10},14},gr={{2,8},{2,2},{3,10},14},gs={{4,8},{2,2},{3,10},14},gt={{6,8},{2,2},{3,10},14},gu={{8,8},{2,2},{3,10},14}},function(gv)return cg(aI(gv[1][1],gv[1][2]),aF(gv[2][1],gv[2][2]),ao(gv[3][1],gv[3][2]),gv[4])end)local gw=C({["idle"]={{g3.g4},1,2},["walk"]={{g3.g5,g3.g6,g3.g7,g3.g8,g3.g9,g3.ga},10,4},["brake_start"]={{g3.gb,g3.gc},10,2},["brake_reverse"]={{g3.gd},15,2},["run"]={{g3.gf,g3.gg,g3.gh,g3.gi},5,4},["spin"]={{g3.gj,g3.gk,g3.gj,g3.gl,g3.gj,g3.gm,g3.gj,g3.gn},5,4},["crouch"]={{g3.go,g3.gp},6,2},["spring_jump"]={{g3.ge},1,2},["spin_dash"]={{g3.gq,g3.gr,g3.gq,g3.gs,g3.gq,g3.gt,g3.gq,g3.gu},1,4}},function(gv)return ca(gv[1],gv[2],gv[3])end)local gx={gy=g3,gz=gw}local gA={}local gB=a9()gA.gB=gB
function gB:X(gC,gD,fn)self.gC=gC
self.gD=gD
self.fn=fn end
local gE=a9()gA.gE=gE
function gE:X(gC,cm,fn,gF,gG)self.gC=gC
self.cm=cm
self.fn=fn
self.gF=gF
self.gG=gG end
local gH=a9()gA.gH=gH
function gH:X(gC,gI,gJ,gK,fn)self.gC=gC
self.gI=gI
self.gJ=gJ
self.gK=gK
self.fn=fn end
function gH:gL(b1)if b1==0 or b1==2 then return self.gI elseif b1==1 then return self.gJ else return self.gK end end
local gM={}function gM.gN(bg)if not bg or bg>=0.875 or bg<=0.125 then return 3 elseif bg<0.375 then return 2 elseif bg<=0.625 then return 1 else return 0 end end
function gM.gO(gP)return 0.25*(3-gP)%4 end
function gM.gQ(gR,gP)return gP%2==0 and gR.aq or gR.ap end
function gM.gS(gR,gP)return gP%2==1 and gR.aq or gR.ap end
function gM.gT(gR,H,gP)if gP%2==0 then gR.aq=H else gR.ap=H end end
function gM.gU(gV,gW,gP)if gP<2 then return gW-gV else return gV-gW end end
function gM.gX(gY,gP)return gM.gS(gY:aN()+4*aU[gP],gP)end
function gM.gZ(g_,h0,gP,h1)if g_.B>=0 and g_.B<128 and g_.aG>=0 and g_.aG<32 then local h2=mget(g_.B,g_.aG)local h3=fget(h2,0)if h3 then local h4=fW.g2(h2)if h4 then local fx=h4:fx()local fy=h4:fy()local fz=h4:fz()if gP%2==1 then local h5=h4:fr(h0)if h4.fo==2 and gP==1 or h4.fo==1 and gP==3 then if h1 and not fx then return 0 end
if h5>0 then return 8,gM.gO(gP)end elseif fz then if h5>0 then return h5,gM.gO(gP)end else if h5>0 or h4.fq and gM.gN(h4.fn)==gP then return h5,h4.fn end end else local h6=h4:ft(h0)if h4.fp==2 and gP==0 or h4.fp==1 and gP==2 then if h1 and not fy then return 0 end
if h6>0 then return 8,gM.gO(gP)end elseif fz then if h6>0 then return h6,gM.gO(gP)end else if h6>0 or h4.fq and gM.gN(h4.fn)==gP then return h6,h4.fn end end end end end end
return 0 end
local h7=a5()function h7:X()self.h8=f4(gx.gz)self:h9()end
function h7:h9()self.ha=1
self.ex=1
self.gP=3
self.ew=2
self.hb=1
self.hc=0
self.cm=ao(-1,-1)self.eP=0
self.hd=0
self.eD=ao.aE()self.fn=0
self.he=0
self.hf=0
self.hg=ao.aE()self.hh=false
self.hi=false
self.hj=false
self.hk=false
self.hl=false
self.hm=0
self:hn(0)self:ho("idle")self.hp=0
self.hq=false
self.hr=0 end
function h7:ev()return I({1,4,5,6},self.ex)end
function h7:hs()return I({3,4,5,6},self.ex)end
function h7:eM()return self:hs()and 6 or 8 end
function h7:ht()return self:hs()and 12 or 16 end
function h7:hu(hv)return(self.gP-aY[hv])%4 end
function h7:hw()return aU[self.gP]end
function h7:hx(ay)return ay:bA(gM.gO(self.gP))end
function h7:hy(cm)self:h9()self:hz(cm)end
function h7:hz(cm)self.cm=cm
self:hA(2)self:hB()end
function h7:hC()return self.cm+self:eM()*self:hw()end
function h7:hD(hE)if self.hF~=hE then self.hF=hE
local hG=cS.cU
if hG:hH(hE)then self.hb=1 elseif hG:hI(hE)then self.hb=2 end end end
function h7:hn(bg)self.hJ=bg
self:hK()end
function h7:hK()local hL=0
local hM=false
if self.h8.fe=="idle"then hL=flr(4*self.hJ+0.5)/4 elseif I({"walk","run"},self.h8.fe)then hL=flr(8*self.hJ+0.5)/8
if hL%0.25~=0 then hM=true
local bc=self.ew==1
hL=hL+(bc and 1 or-1)*0.125 end end
self.hL=hL%1
self.hM=hM end
function h7:hN(bg,hO)self.fn=bg
if hO then self:hn(0)elseif bg then self:hn(bg)end
self.gP=gM.gN(bg)end
function h7:cW()self:hP()self:hQ()self.h8:cW()end
function h7:hR()self.ha=2
self.hg=ao(1,0)self.hh=false
self.hi=false end
function h7:hP()self:hS()self:hT()end
function h7:hU(hV)return self:hW(self.hX,hV)end
function h7:hY(hV)return self:hW(self.hZ,hV)end
function h7:hW(h_,hV)local i0=1/0
local i1=nil
for B=1,2 do local i2=self:i3(hV,B)local i4=h_(self,i2)local gD=i4.gD
if gD<i0 or gD==i0 and self:i5()==B then i0=gD
i1=i4 end end
return gA.gB(i1.gC,i0,i1.fn)end
function h7:i5()if self:ev()then if self.eP~=0 then return aZ(self.eP)end else if self.eD.ap~=0 then return aZ(self.eD.ap)end end
return self.ew end
function h7:i3(hV,i6)local ap=hV.ap
local aq=hV.aq
if self.gP%2==1 then ap=flr(ap)else aq=flr(aq)end
local i7=ao(ap,aq)+self:eM()*self:hw()local i8=self:hx(2.5*aX[i6])i8=ao(flr(i8.ap),flr(i8.aq))return i7+i8 end
function h7:i9(hV)local ap=hV.ap
local aq=hV.aq
if self.gP%2==0 then ap=flr(ap)else aq=flr(aq)end
local ia=ao(ap,aq)if self.fn==0 then return ia+(self:eM()-6)*self:hw()else return ia:a0()end end
local function ib(ic,id,ie,ig,ih,ii,ij,ik,il)local hG=cS.cU
local im=hG:io()local ip=aU[id]local i2=ih+ii*ip
local iq=ao.aO(i2+ie*ip)local ir=ao.aO(i2+ig*ip)local is=iq:aH()local it=aF(ip.ap,ip.aq)local h0=gM.gQ(i2-is,id)local iu=iq:a0()while true do local iv,fn
local iw=false
local ix=hG:iy(iu)local iz=mget(ix.B,ix.aG)local iA=fget(iz,1)local bS=fget(iz,2)if ic.hc>0 and iz==229 or not bS and(ic.hb==1 and hG:iB(iu)or ic.hb==2 and hG:iC(iu))or iA and id~=3 then iw=true end
if iw then iv,fn=0 else local h1=il and iq==iu
iv,fn=gM.gZ(iu-im,h0,id,h1)end
if fn then local iD=gM.gX(iu,id)local iE=gM.gU(iD,gM.gS(i2,id),id)-iv
local de=ij(iu,iE,fn)if de then return de end end
if iu==ir then local de=ik()return de end
iu=iu+it end end
local function iF()return gA.gB(nil,4+1,nil)end
local function iG(gC,iH,fn)if iH<-7 then return iF()elseif iH<=4 then return gA.gB(gC,iH,fn)end end
function h7:hX(i2)return ib(self,self.gP,-(7+1),4,i2,0,iG,iF)end
local function iI()return gA.gB(nil,4+1,nil)end
local function iJ(iK,iL,fn)if iL<=0 then return gA.gB(iK,iL,fn)else return nil end end
function h7:hZ(i2)local iM=self:ht()return ib(self,b0(self.gP),7+1-iM,0,i2,iM,iJ,iI,true)end
local function iN()return gA.gB(nil,ceil(2.5)+1,nil)end
local function iO(iK,iP,fn)if iP<ceil(2.5)then return gA.gB(iK,iP,fn)else return iN()end end
function h7:iQ(i2,iR)return ib(self,self:hu(iR),0,ceil(2.5),i2,0,iO,iN)end
function h7:hB()local i4=self:hU(self.cm)local iH,iS=i4.gD,i4.fn
if-7<=iH and iH<=0 then local iT=iH*self:hw()self.cm:av(iT)self:hD(i4.gC)self:hN(iS)if not self:ev()then self:hA(1)end end end
function h7:hA(iU)local iV=self:ev()local iW=self:hs()self.ex=iU
if iW~=self:hs()then local iX=self:hx(ao(0,8-6))local iY=iW and-1 or 1
self.cm:av(iY*iX)end
if iU==2 then self.hF=nil
self:hN(nil)self.eP=0
self.hj=false elseif iU==3 then self.hF=nil
self:hN(nil,true)self.eP=0
self.hj=false
self.hq=false elseif iU==1 then if not iV then self.eP=self.eD:aC(ao.bz(self.fn))self.eD:a3(self:iZ())self.hk=false
self.hl=false
self.hq=false end elseif iU==4 then if not iV then self.hk=false
self.hl=false
self.hq=false end end
if iU~=1 and iU~=2 then self.hr=0 end
if iU~=2 then self.hm=0 end end
function h7:hS()if self.hc>0 then self.hc=self.hc-1 end end
function h7:hT()if self:ev()or self.hm>0 then if self.hm>0 then end
self:i_()self:j0()end
if self.hm>0 then self.hm=self.hm-1 end
if I({1,5},self.ex)then self:j1()elseif self.ex==4 then self:j2()end
if self:ev()then self:j3()else self:j4()end
if self:ev()or self.hm>0 then if self.hm>0 then end
self:j5()end
self:j6()self:j7()self:j8()self:j9()end
function h7:j1()if self:ja()then if abs(self.eP)>=0.5 then self:hA(4)self:jb(57)elseif self.ex~=5 then self:hA(5)end elseif self.ex~=1 then self:hA(1)end end
function h7:j2()if abs(self.eP)<0.25 then self:hA(1)end end
function h7:j3()self:jc()local gE=self:jd()if gE.gF then self.eP=0 end
if flr(gE.cm.ap)<2.5 then gE.cm.ap=ceil(2.5)self.eP=max(-0.1,self.eP)end
if self.eP~=0 then self.hp=abs(self.eP)else self.hp=0 end
self.eD:a3(self:iZ())self.cm:a3(gE.cm)local je=gE.gG
if not je and self.gP~=3 and abs(self.eP)<1.25 then if self.fn>=0.25 and self.fn<=0.75 then je=true end
self.hd=30 end
if je then local jf
self.hm=6
self.he=self.fn
if I({1,5},self.ex)then jf=2 else jf=3 end
self:hA(jf)else self:hD(gE.gC)self:hN(gE.fn)end end
function h7:jc()if I({1,5},self.ex)then local jg=self.eP
self:jh()self:ji()self:jj(jg)elseif self.ex==4 then self:jh()self:jk()end end
function h7:jh()local jl=false
self.eP=self.eP+0.0625*sin(self.fn)end
function h7:ji()local jm=self.eP
if self.hg.ap~=0 then if self.eP==0 or sgn(self.eP)==sgn(self.hg.ap)then jm=self.eP+self.hg.ap*0.0234375
self.ew=aZ(self.hg.ap)if self.hr==1 then self.hr=0 end else jm=self.eP+self.hg.ap*0.25
local jn=jm==0 or sgn(jm)==sgn(self.hg.ap)if jn then if abs(jm)>0.0234375 then jm=sgn(jm)*0.0234375 end
self.ew=aZ(self.hg.ap)if self.hr==1 then self.hr=2 end elseif self.gP==3 and abs(self.eP)>=2 then self.ew=aZ(self.eP)self.hr=1
self:jb(58)end end else if self.eP~=0 then jm=sgn(self.eP)*max(0,abs(self.eP)-0.0234375)end
if self.hr==1 and not self.h8.f6 then self.hr=0 end end
self.eP=jm end
function h7:jk()local jo=0.01171875
if self.eP~=0 and self.hg.ap~=0 then if sgn(self.eP)~=sgn(self.hg.ap)then jo=jo+0.0625 else self.ew=aZ(self.hg.ap)end end
self.eP=sgn(self.eP)*max(0,abs(self.eP)-jo)end
function h7:jj(jg)local jp=max(abs(jg),3)if abs(self.eP)>jp then self.eP=sgn(self.eP)*jp end end
function h7:iZ()return self.eP*ao.bz(self.fn)end
function h7:jd()if self.eP==0 then return gA.gE(self.hF:a0(),self.cm:a0(),self.fn,false,false)end
local gG=false
local jq=self.gP
local i6=aZ(self.eP)local jr=self.cm+self:iZ()local gF=self:js(jr,i6)local i4=self:hU(jr)local iH=i4.gD
local iT=iH*self:hw()if iH<0 then if-iH<=7 then jr:av(iT)end elseif iH>=0 then if iH<=4 then local jt=bv(i4.fn,self.fn)if aY[i6]*jt>0.125 then gG=true else jr:av(iT)end else gG=true end end
local ju=not gG and i4.gC or nil
if gF and jq~=gM.gN(i4.fn)then self:hD(ju)gF=self:js(jr,i6)end
local jv=gA.gE(ju,jr,i4.fn,gF,gG)return jv end
function h7:js(jr,i6)local ih=self:i9(jr)local jw=self:iQ(ih,i6)if jw.gC then if-6<=jw.gD and jw.gD<ceil(2.5)then local iP=jw.gD-ceil(2.5)local jx=aU[self:hu(i6)]local jy=iP*jx
jr:av(jy)return true end end
return false end
function h7:ja()return self.hg.ap==0 and self.hg.aq>0 end
function h7:j5()if self.hh then self.hh=false
self.hj=true end end
function h7:i_()if self.hj then self.hj=false
local jz=self.hm>0 and self.he or self.fn
local jA=3.25*ao.bz(jz):bF()self.eD:av(jA)self:hA(3)self.hk=true
self.hl=true
self:jb(55)return true end
return false end
function h7:j0()if I({5,6},self.ex)then if self.ex==6 and self.hg.aq<=0 then self:jB()elseif self.hh then self.hh=false
if self.ex==5 then self:hA(6)self.eP=0
self.hf=0 end
self.hf=min(self.hf+2,8)self:ho("spin_dash",true)self:jb(61)else if self.ex==6 then self.hf=self.hf*0.96875 end end end end
function h7:jB()local jC=aY[self.ew]self:hA(4)self.eP=jC*(4+flr(self.hf)*0.25)self:jb(62)end
function h7:j4()if self.hk then self.hk=false else self.eD.aq=self.eD.aq+0.109375 end
if self.ex==3 then self:jD()end
if self.hg.ap~=0 then local jE=self.eD.ap
self.eD.ap=self.eD.ap+self.hg.ap*0.046875
self:jF(jE)self.ew=aZ(self.hg.ap)end
self:jG()if self.eD.aq>32 then self.eD.aq=32 end
self.cm:av(self.eD)local gH=self:jH()if gH.gI then self.eD.ap=0 end
if gH.gJ then self.eD.aq=0 end
if flr(self.cm.ap)<2.5 then self.cm.ap=ceil(2.5)self.eD.ap=max(0,self.eD.ap)end
if gH.gK then self:hD(gH.gC)self:hN(gH.fn)self:hA(1)end end
function h7:jD()if self.hl and not self.hi then self.hl=false
local jI=-2
if self.eD.aq<jI then self.eD.aq=jI end end end
function h7:jG()local jJ=self.eD
if jJ.aq<0 and jJ.aq>-8 and abs(jJ.ap)>=0.25 then jJ.ap=jJ.ap*0.96875 end end
function h7:jF(jE)local jK=max(abs(jE),3)if abs(self.eD.ap)>jK then self.eD.ap=sgn(self.eD.ap)*jK end end
function h7:jH()if self.eD:ar()then return gA.gH(nil,false,false,false,nil)end
local hF
local gI=false
local gJ=false
local gK=false
local fn
if self.eD.ap~=0 then local i6=aZ(self.eD.ap)gI=self:js(self.cm,i6)end
if self.eD.aq>0 then local gB=self:hU(self.cm)local iH=gB.gD
if-7<=iH and iH<0 then local iT=iH*self:hw()self.cm:av(iT)gK=true
hF=gB.gC
fn=gB.fn end elseif self.eD.aq<0 then local jL=self:hY(self.cm)local iL=jL.gD
if iL<0 then assert(jL.fn>0.25 and jL.fn<0.75,"detected ceiling with slope angle expected between 0.25 and 0.75 excluded, got: "..jL.fn.." (we don't check for those bounds in ceiling adherence check so Sonic may adhere to unwanted walls)")local jM=-iL*self:hw()self.cm:av(jM)if jL.fn<=0.25+0.125 or jL.fn>=0.75-0.125 then hF=jL.gC
gK=true
fn=jL.fn else gJ=true end end end
return gA.gH(hF,gI,gJ,gK,fn)end
function h7:j6()local hG=cS.cU
local jN=hG:jO()if jN then self:jP(jN)end end
function h7:jP(jN)if jN.b1==1 then self.eD.aq=-5
self:hA(2)self.hq=true else self.ew=jN.b1/2+1
self.hd=16
local jQ=aY[self.ew]if self:ev()then self.eP=jQ*5 else self.eD.ap=jQ*5 end end
jN:jR()self:jb(56)end
function h7:j7()if self.hF and self.eP>=2 then local hG=cS.cU
local jS=hG:iy(self.hF)local jT=mget(jS.B,jS.aG)if jT==229 then self:jU()end end end
function h7:jU()local jV=min(9.7,self.eP*2.7)self.eD:a3(jV*ao.bz(0x0.16c2))self:hA(2)self.hq=true
self.hc=3 end
function h7:j8()local hG=cS.cU
local jW=hG:jX(self.cm)if jW then hG:jY(jW)end end
function h7:j9()local hG=cS.cU
local jZ=hG:j9(self.cm,self.hb)if jZ then self.hb=jZ end end
function h7:hQ()self:j_()self:k0()end
function h7:j_()if self.hr==1 then self:ho("brake_start")return elseif self.hr==2 then self:ho("brake_reverse")if self.h8.f6 then return else self.hr=0 end end
if self.ex==1 then if self.eP==0 then self:ho("idle")else if self.hp<3 then self:ho("walk",false,max(0.625,self.hp))else self:ho("run",false,self.hp)end end elseif self.ex==2 then if self.hq and self.eD.aq>0 then self.hq=false end
if self.hq then self:ho("spring_jump")else if self.hp<3 then self:ho("walk",false,max(0.625,self.hp))else self:ho("run",false,self.hp)end end elseif self.ex==5 then self:ho("crouch")elseif self.ex==6 then else local k1=self.ex==4 and 1.25 or 0.625
self:ho("spin",false,max(k1,self.hp))end end
local k2={["idle"]=0,["walk"]=0,["walk45"]=1,["brake_start"]=3,["brake_reverse"]=3,["run"]=2,["run45"]=2+1/32,["spin"]=3,["crouch"]=1,["spring_jump"]=0,["spin_dash"]=4}function h7:ho(fb,fc,fd)self.h8:fa(fb,fc,fd)self:hK()local k3
if self.hM then k3=fb.."45"else k3=fb end
local k4=k2[k3]if self.k5~=k4 then self.k5=k4
local k6=0x4b00+k4*0x400
if k4<4 then memcpy(0x1000,k6,0x400)else for B=0,15 do memcpy(0x1000+B*0x40,k6+B*0x28,0x28)end end end end
function h7:k0()local bg=self.hJ
if self.ex==2 and bg~=0 then if bg<0.5 then self:hn(max(0,abs(bg)-1/128))else self.hJ=min(1,abs(bg)+1/128)%1 end end end
function h7:cl()local k7=ao(flr(self.cm.ap),flr(self.cm.aq))local bc=self.ew==1
self.h8:cl(k7,bc,false,self.hL)end
function h7:jb(aL)if stat(19)~=59 then sfx(aL)end end
local k8=a7(cZ)function k8:X()self.camera=ed()self.k9={}end
function k8:ka(kb,ay)return"data_stage"..self.kc.."_"..kb..ay..".p8"end
function k8:kd(ke)return ke+self:io()end
function k8:iy(kf)return kf-self:io()end
function k8:kg()local kh=self.ep.er:aH()self.h7=h7()self.h7:hy(kh)end
function k8:ki(hE,kj,kk)for kl in all(kj)do if(kk==nil or kk(hE,kl))and kl:I(hE)then return true end end
return false end
function k8:iC(hE)return self:ki(hE,self.ep.km,function(hE,kl)return hE~=aM(kl.aQ,kl.kn)end)end
function k8:iB(hE)return self:ki(hE,self.ep.ko,function(hE,kl)return hE~=aM(kl.aS,kl.kn)end)end
function k8:hH(hE)for kl in all(self.ep.km)do if hE==aM(kl.aQ,kl.kn)then return true end end end
function k8:hI(hE)for kl in all(self.ep.ko)do if hE==aM(kl.aS,kl.kn)then return true end end end
function k8:kp(kq)kq=kq or ao.aE()camera(self.camera.cm.ap-64-kq.ap,self.camera.cm.aq-64-kq.aq)end
function k8:kr()local im=self:io()self:kp(ao(8*im.B,8*im.aG))end
function k8:io()return aM(128*self.ks.ap,32*self.ks.aq)end
local kt={{1,12,12,7},{7,1,12,12},{12,7,1,12},{12,12,7,1}}function k8:ku()local kv=0.5
local eH=t()%kv/kv
local kw=#kt
local dQ=min(flr(eH*kw)+1,kw)local A=kt[dQ]y({1,13,12,7},A)end
function k8:kx()self:kr()self:ky()self:kz()end
function k8:ky()w(14)map(0,0,0,0,128,32,64)end
function k8:kz()self:ku()map(0,0,0,0,128,32,16)pal()end
function k8:kA()w(14)self:kr()map(0,0,0,0,128,32,128)local im=self:io()self:kp()for kl in all(self.ep.km)do map(kl.aQ-im.B,kl.kn-im.aG,8*kl.aQ,8*kl.kn,kl.aS-kl.aQ+1,kl.kB-kl.kn+1,64)end
for kf in all(self.k9)do co.cq.cz:cl(kf:aH())local kC=kf+aM(1,0)co.cq.cA:cl(kC:aH())co.cq.cA:cl(kf:aH(),true)end end
local kD={}function kD.kE(aA,kF)kF=kF or 0
local kG,kH=unpack(co.cp[aA])local kI={{kG,kH},{7,kG},{7,7}}y({8,2},kI[kF+1])end
function kD.dS(aA,cm,kF)if aA>=0 then kD.kE(aA,kF)co.cq.cJ:cl(cm)pal()else co.cq.cD:cl(cm)end end
local cJ=a5()function cJ:X(aA,aM)self.aA=aA
self.aM=aM end
function cJ:kJ()local hV=self.aM:aN()if self.aA==8 then hV:av(ao(5,0))end
return hV end
function cJ:kK()local eZ=self.aM:aH()return eZ,eZ+8*ao(1,1)end
function cJ:cl()kD.dS(self.aA,self:kJ())end
local kL=a5()function kL:X(cm,fg)self.cm=cm
self.h8=f4({["once"]=fg})self.h8:fa("once")end
function kL:kM()return self.h8.f6 end
function kL:cW()self.h8:cW()end
function kL:cl()self.h8:cl(self.cm)end
local kN=a7(kL)function kN:X(aA,cm,fg)kL.X(self,cm,fg)self.aA=aA end
function kN:cl()kD.kE(self.aA)self.h8:cl(self.cm)pal()end
local cN=a5()function cN:X(kf)self.kf=kf
self.h8=f4(co.cw.cN)self.h8:fa("goal")end
function cN:cW()self.h8:cW()end
function cN:cl()self.h8:cl(self.kf:aH()+ao(4,0))end
local bU=a5()function bU:X(b1,kf)self.b1=b1
self.kf=kf
self.kO=0 end
function bU:jR()self.kO=0.15 end
function bU:cW()if self.kO>0 then self.kO=self.kO-1/60
if self.kO<=0 then self.kO=0 end end end
function bU:kP()local eZ=self.kf:aH()if self.b1==1 then return eZ+co.cq.bU.cj elseif self.b1==0 then return eZ+ao(2,2)else return eZ+ao(6,2)end end
function bU:kK()local eZ=self.kf:aH()return eZ-8*ao(0,1),eZ+8*ao(2,1)end
function bU:cl()local bd=false
local bg=0
local kQ=self:kP()if self.b1==0 then bg=0.25 elseif self.b1==2 then bd=true
bg=0.25 end
if self.kO>0 then co.cq.cK:cl(kQ,false,bd,bg)else co.cq.bU:cl(kQ,false,bd,bg)end end
local kR=a9()function kR:X(aQ,kn,aS,kB)self.aQ=aQ
self.kn=kn
self.aS=aS
self.kB=kB end
function kR:I(gY)return self.aQ<=gY.B and gY.B<=self.aS and self.kn<=gY.aG and gY.aG<=self.kB end
local kS={[1]={kT="pico island",eQ=430,eX=64,er=aM(5,47),kU=3456,eW={ao(47,11),ao(104,8),ao(384,0),ao(513,15)},ko={kR(222,44,228,54),kR(337,20,343,30),kR(361,28,367,37)},km={kR(229,44,234,54),kR(344,20,349,30),kR(368,28,373,37)}}}local kV={}local function kW(aq,v)line(0,aq,127,aq,v)end
function kV.kX(kY)camera()rectfill(0,0,127,127,1)local kZ=156-0.5*kY.aq
camera(0,-kZ)if kZ>=-31 then kV.k_(kY)end
if kZ<=58 then kV.l0(kY,kZ)end
kV.l1(kY)end
function kV.k_(kY)kW(-1,12)kW(0,7)kW(1,13)local l2={{0,60,140,220},{30,150,240},{10,90,210},{50,130}}local l3={{0,0,-1,0},{0,-1,-1,0},{0,-1,1,0},{0,1,-1,1}}for aG=0,3 do for l4 in all(l2[aG+1])do kV.l5(l4,-8.9-14.7*aG,l3[aG+1],2+0.9*aG,3+3.5*aG)end end
local l6={4,3,6,2,1,5}local l7={0.7,1.5,1.2,1.7,1.1}local l8=0.015
for B=0,21 do local br=l6[B%6+1]local aq=2+br
local l9=l8*min(6,br)/6
local la=flr(l9*kY.ap)kV.lb(la,6*B,aq,l7[B%5+1])end end
function kV.l1(kY)local lc=0.3
local ld=0.42
local le=ld-lc
local lf=0.36
local lg=ld-lf
for aG=0,1 do local l9=lf+lg*aG
local la=flr(l9*kY.ap)kV.lh(la,31+18*(1-aG),19,aG,aG%2==1 and 11 or 3)end
for aG=0,2 do local l9=lc+le*aG/3
local la=flr(l9*kY.ap)kV.li(la,31+8*aG,10,aG,aG%2==0 and 11 or 3)end end
function kV.l0(kY,kZ)fillp(0x5a5a)rectfill(0,50,127,127-kZ,3*0x10+0)fillp()local l9=0.3
local la=flr(l9*kY.ap)local lj={0,1,3}local lk={0,0,2}for B=0,2 do local ll=8*8
local x0=80-la+ll*B
local lm=ll-2*8
x0=(x0+lm)%192-lm
local ln=102
local lo=lk[B+1]rectfill(x0,ln-8,x0+4*8,ln+(5+lo)*8,3)kV.lp(x0-1,ln,lo,-1)kV.lp(x0+4*8,ln,lo,1)kV.lq(x0,ln-8-1,-1)kV.lq(x0,ln+(5+lo)*8,1)local lr=ln+lj[B+1]*8
co.cq.cB:cl(ao(x0,lr))co.cq.cC:cl(ao(x0-24,lr+16))end end
function kV.lp(x0,ln,lo,ls)for br=-8,(5+lo)*8-1 do local aq=ln+br
line(x0+ls*flr(2.5*(1+sin(br/1.7)*sin(br/1.41))),aq,x0,aq,3)end end
function kV.lq(x0,ln,ls)for bq=0,4*8-1 do local ap=x0+bq
line(ap,ln+ls*flr(3.7*(1+sin(bq/1.65)*sin(bq/1.45))),ap,ln,3)end end
function kV.l5(ap,aq,lt,lu,fd)local lv=t()*fd
lw=(ap-lv+100)%300-100
local lx={0,1.5,3,4.5}local ly={0.8,1.4,1.1,0.7}for B=1,4 do circfill(lw+flr(lx[B]*lu),aq+lt[B],ly[B]*lu+1,13)end
for B=1,4 do circfill(lw+flr(lx[B]*lu),aq+lt[B],ly[B]*lu,7)end end
local lz={{1,12},{7,12},{12,1},{12,7},{1,12}}function kV.lb(la,ap,aq,kv)local eH=t()%kv/kv
local kw=#lz
local dQ=min(flr(eH*kw)+1,kw)local lA=lz[dQ]pset((ap-la)%128,aq,lA[1])pset((ap-la+1)%128,aq,lA[2])end
function kV.li(la,aq,lB,fu,lC)for lw=0,127 do local ap=lw+la
local h5=lB+flr((3+0.5*fu)*(1+sin(ap/(1.7+0.2*fu))*sin(ap/1.41)))line(lw,aq,lw,aq-h5,lC)end end
function kV.lh(la,aq,lB,fu,lC)for lw=0,127 do local ap=lw+la
local h5=lB+flr((4.5-0.3*fu)*(1+sin(ap/(41.4-9.1*fu)))+1.8*sin(ap/1.41))line(lw,aq,lw,aq+h5,lC)end end
local lD=a7(k8)lD.type=':stage'function lD:X()k8.X(self)self.kc=1
self.ep=kS[self.kc]self.lE=false
self.lF={}self.lG={}self.lH={}self.lI={}self.lJ={}self.lK={}end
function lD:d4()self:lL()self.camera:en(self.ep)self:lM()self:lN()self:kg()self.camera.eu=self.h7
self.lE=false
self:lO()end
function lD:lN()local lP="data_stage"..self.kc.."_ingame.p8"reload(0x0,0x0,0x2000,lP)reload(0x4b00,0x400,0x1000,"data_stage_sonic.p8")for B=0,15 do reload(0x5b00+B*0x28,0x1400+B*0x40,0x28,"data_stage_sonic.p8")end end
function lD:cW()self:lQ()for jN in all(self.lK)do jN:cW()end
self.h7:cW()self.camera:cW()self:lM()end
function lD:cl()kV.kX(self.camera:eT())self:lR()self:lS()self:lT()end
function lD:lU(kf)add(self.lF,kf)add(self.lG,cJ(#self.lF,kf))local ke=self:iy(kf)local af=mget(ke.B,ke.aG)if mget(ke.B+1,ke.aG)==234 then add(self.lJ,{kf,234})end end
function lD:lV(kf)add(self.k9,kf)end
function lD:lW(kf)self.cN=cN(kf)end
local function lX(b1,kf)return function(self,kf)add(self.lK,bU(b1,kf))end end
lD.lY=lX(1)lD.lZ=lX(0)lD.l_=lX(2)lD.m0={[co.cL]=lD.lU,[236]=lD.lV,[226]=lD.lW,[74]=lD.lY,[202]=lD.lZ,[173]=lD.l_}function lD:m1(m2)return lD.m0[m2]end
function lD:m3()for B=0,128-1 do for aG=0,32-1 do local m4=mget(B,aG)local m5=self:m1(m4)if m5 then local ke=aM(B,aG)local kf=self:kd(ke)m5(self,kf,m4)end end end end
function lD:m6()local m7=ceil(self.ep.eQ/128)local m8=ceil(self.ep.eX/32)return m7,m8 end
function lD:m9(cm)local m7,m8=self:m6()local kb=flr(cm.ap/1024)local ay=flr(cm.aq/256)local ma=8*8
local bq=cm.ap%1024
if bq<ma then if kb>0 then kb=kb-0.5 end elseif bq>1024-ma then if kb<m7-1 then kb=kb+0.5 end end
local br=cm.aq%256
if br<ma then if ay>0 then ay=ay-0.5 end elseif br>256-ma then if ay<m8-1 then ay=ay+0.5 end end
kb=mid(0,kb,m7-1)ay=mid(0,ay,m8-1)return ao(kb,ay)end
function lD:mb(mc,md)local me=0x2000
local mf=0x4300
if mc==2 then me=me+0x40 else mf=mf+0x40 end
reload(0x4300,0x2000,0x800,md)for aG=0,15 do memcpy(me+aG*0x80,mf+aG*0x80,0x40)end
reload(0x4300,0x2800,0x800,md)for aG=16,31 do memcpy(me+aG*0x80,mf+(aG-16)*0x80,0x40)end end
function lD:mg(mh,md)local mi=0x2000
local mj=0x2000
if mh==2 then mi=mi+0x800 else mj=mj+0x800 end
reload(mi,mj,0x800,md)end
function lD:mk(mc,mh,md)local me=0x2000
local ml=0x2000
local mf=0x4300
if mh==2 then me=me+0x800 else ml=ml+0x800 end
if mc==2 then me=me+0x40 else mf=mf+0x40 end
reload(0x4300,ml,0x800,md)for aG=0,15 do memcpy(me+aG*0x80,mf+aG*0x80,0x40)end end
function lD:mm(mn)local mo=flr(mn.ap)local mp=flr(mn.aq)if mn.ap%1==0 and mn.aq%1==0 then reload(0x2000,0x2000,0x1000,self:ka(mo,mp))elseif mn.ap%1==0 and mn.aq%1~=0 then self:mg(1,self:ka(mo,mp))self:mg(2,self:ka(mo,mp+1))elseif mn.ap%1~=0 and mn.aq%1==0 then self:mb(1,self:ka(mo,mp))self:mb(2,self:ka(mo+1,mp))else self:mk(1,1,self:ka(mo,mp))self:mk(1,2,self:ka(mo,mp+1))self:mk(2,1,self:ka(mo+1,mp))self:mk(2,2,self:ka(mo+1,mp+1))end
self.ks=mn end
function lD:lM()local mn=self:m9(self.camera.cm)if self.ks~=mn then self:mm(mn)for mq in all(self.lJ)do local kf,g1=unpack(mq)local ke=self:iy(kf)if ke.B>=0 and ke.B<128 and ke.aG>=0 and ke.aG<32 then mset(ke.B,ke.aG,g1)end end end end
function lD:lL()local m7,m8=self:m6()for kb=0,m7-1 do for ay=0,m8-1 do self:mm(ao(kb,ay))self:m3()end end end
function lD:jO()for jN in all(self.lK)do if jN.b1==1 then local cj=jN:kP()local mr=self.h7:hC()if flr(mr.aq)==cj.aq and cj.ap-8<=mr.ap and mr.ap<cj.ap+9 then return jN end else local ms=jN:kP()+3*aU[jN.b1]local mt=self.h7.cm
if flr(mt.ap)==ms.ap and ms.aq-6<=mt.aq and mt.aq<ms.aq+7 then return jN end end end end
function lD:jX(cm)for jW in all(self.lG)do local mu=cm-jW:kJ()local mv=max(abs(mu.ap),abs(mu.aq))if mv<8 then return jW end end end
function lD:jY(jW)self.lH[jW.aA]=true
local mw=kN(jW.aA,jW:kJ(),co.cw.cx)add(self.lI,mw)del(self.lG,jW)self.dJ:d9(self.mx,self)end
function lD:mx()e0.e1(8,53,2)sfx(59)O(48)self:my()e0.e1(8,53,1)O(16)self:my()end
function lD.mz(mA)return ao(8*(mA.aS+1)+3,8*mA.kn-8),ao(8*(mA.aS+1)+11,8*(mA.kB+1)+8)end
function lD.mB(mC)return ao(8*mC.aQ-11,8*mC.kn-8),ao(8*mC.aQ-3,8*(mC.kB+1)+8)end
function lD:j9(cm,mD)if mD==1 then for kl in all(self.ep.km)do local mE,mF=lD.mz(kl)if mE.ap<=cm.ap and cm.ap<=mF.ap and mE.aq<=cm.aq and cm.aq<=mF.aq then return 2 end end else for kl in all(self.ep.ko)do local mG,mH=lD.mB(kl)if mG.ap<=cm.ap and cm.ap<=mH.ap and mG.aq<=cm.aq and cm.aq<=mH.aq then return 1 end end end end
function lD:lQ()local mI={}for mw in all(self.lI)do mw:cW()if not mw:kM()then add(mI,mw)end end
for mw in all(mI)do del(self.lI,mw)end end
function lD:lS()self:kp()for mw in all(self.lI)do mw:cl()end end
function lD:lR()self:kx()self:mJ()self:mK()self:mL()self:mM()self:kA()end
function lD:mM()self:kp()self.h7:cl()end
function lD:mJ()self:kp()for jW in all(self.lG)do if self.camera:eY(jW:kK())then jW:cl()end end end
function lD:mK()self:kp()for jN in all(self.lK)do if self.camera:eY(jN:kK())then jN:cl()end end end
function lD:mL()if self.cN then self:kp()self.cN:cl()end end
function lD:lT()camera()for B=1,#self.lF do local mN=ao(-4+8*B,3)if self.lH[B]then kD.dS(B,mN)else kD.dS(-1,mN)end end end
function lD:my()reload(0x3420,0x3420,0xc38,"picosonic_ingame.p8")end
function lD:lO()music(0,0,shl(1,0)+shl(1,1)+shl(1,2))end
function lD:mO(mP)if mP then mQ=1000*mP else mQ=0 end
music(-1,mQ)end
local mR=a7(dW)function mR:dL()return{lD()}end
function mR:dP()dW.dP(self)self.mS=dX()menuitem(5,"back to title",function()load('picosonic_titlemenu')end)self:d9(self.mT,self)end
function mR:dR()if dj:dw(4)or dj:dw(5)then self:mU()end end
function mR:dT()self.mS:d_()end
function mR:mU()if not self.mV then self.mV=true
self:d9(self.mW,self)end end
function mR:mW()for B=1,5 do self.mS.dZ=B
O(6)end
printh("load titlemenu!")load('picosonic_titlemenu')end
function mR:mT()yield()local ic=cS.cU.h7
ic.ha=2
O(42)ic.hg=ao(1,0)O(318)ic.hh=true
ic.hi=true
O(4)ic.hi=false
O(10)ic.hg=ao(0,0)O(16)ic.hg=ao(1,0)O(26)ic.hh=true
ic.hi=true
O(14)ic.hi=false
O(90)ic.hh=true
ic.hi=true
O(6)ic.hg=ao(0,0)ic.hi=false
O(6)ic.hg=ao(-1,0)O(4)ic.hg=ao(0,0)O(36)ic.hg=ao(1,0)ic.hh=true
ic.hi=true
O(6)ic.hi=false
O(6)ic.hg=ao(0,0)O(8)ic.hg=ao(1,0)O(12)ic.hg=ao(0,0)O(16)ic.hg=ao(1,0)O(10)ic.hh=true
ic.hi=true
O(10)ic.hg=ao(0,0)ic.hi=false
O(21)ic.hg=ao(-1,0)O(14)ic.hg=ao(0,0)O(16)ic.hg=ao(1,0)O(4)ic.hg=ao(0,0)O(14)ic.hg=ao(0,1)O(14)ic.hh=true
ic.hi=true
O(5)ic.hi=false
O(3)ic.hh=true
ic.hi=true
O(5)ic.hi=false
O(2)ic.hh=true
ic.hi=true
O(5)ic.hi=false
O(2)ic.hh=true
ic.hi=true
O(5)ic.hi=false
O(2)ic.hh=true
ic.hi=true
O(5)ic.hi=false
O(3)ic.hh=true
ic.hi=true
O(4)ic.hi=false
O(4)ic.hh=true
ic.hi=true
O(4)ic.hi=false
O(2)ic.hg=ao(0,0)O(21)ic.hg=ao(1,0)O(94)ic.hg=ao(0,1)O(4)ic.hg=ao(0,0)O(24)self:mU()end
local dJ=mR()function _init()dJ.dO=':stage'dJ:dM()end
function _update60()dJ:cW()end
function _draw()dJ:dS()end

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
000400001e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3401e2401e3401e2401e3301e2301e3301e2301e3301e2201e3201e2201e3201e2101e3101e2101e310
00040000396503d6503f6503f6503d6503b6503965035650326403064030640306403063030630306303063030620306203062030620306203061030610306103061030610306103061030610306103061030610
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400001e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e3501e2501e350
010700001f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c130211301d130211301d130211301d130211301d130
010700000c1300c1300c1300c13518130181350c0000c00016130161301613016135151301513516130161350c0000c000151301513516130161350c0000c00016130161350c0000c00018130181301813018135
01070000221301f130221301f130221301f130221301f130221301f130221301f130221301f130221301f130221301f130221301f130221301f130221301f130211301d130211301d130211301d130211301d130
010700000c1300c1300c1300c13518130181350c1000c10016130161301613016135151301513516130161350c1000c1000a1300a1350c1000c1000a1300a1350c1000c1000a1300a1350b1300b1300b1300b135
010700002113022130211301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f1301c1301f130
0107000024130241352413024135301303013524130241352e1302e13524130241352e1302e13530130301351d1301d1352213022135291302913528130281302813028130281302813028130281350000000000
0107000030140301453014030145301403014530140301450c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0001d1301d1301d1301d1352213022130221302213529130291302913029135
010700001813018135181301813518130181351813018135110001100011000110001100011000110001100011000110001100011000110001100011000110001100011000110001100011000110001100011000
010700001c1301c1301c1301c13500000000001813018130181350000000000000001613016130161301613016130161301613016130161301613016130161301613016130161301613016130161301613500000
010700000c1300c1300c1300c1300c1300c1300c1300c1350c1300c1300c1300c1350c1000c1050c1300c1300c1300c1300c1300c135071300713007130071350c1300c1300c1300c13507130071300713007135
01070000000000000000000000002d1302d1352e1302e13500000000002e130000002e130000002e130000002e1302e13500000000002d1302d1302d1302d1302d1302d1302d1302d13500000000000000000000
010700001c1301c1301c1301c13500000000001813018130181350000000000000001a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a1301a13500000
010700000000000000000000000029130291352b1302b13500000000002b130000002b130000002b130000002b1302b135000000000011130111301113011135161301613016130161351d1301d1301d1301d135
01070000000000000000000000002d1302d1352e1302e13500000000002e130000002e130000002e130000002e1302e135000000000030130301352e1302e1302e1302e1302e1302e13500000000000000000000
01070000000000000000000000002d1302d1352e1302e13500000000002e130000002e130000002e130000002e1302e135000000000030130301352e1302e1302e1302e1302e1302e13528130281352913029135
010700002b1302b1302b1302b13500000000002413024130241350000000000000002e1302e1302e1302e1302e1302e1352e130000002e1302e13500000000002e1302e1302e1302e1352b1302b1302b1302b135
010700002d1302d1302d1302d13500000000002913029130291350000000000000002413024130241302413024130241302413024130241302413024130241302413024130241302413528130281352913029135
010700003c1203c1203c1203c12539120391253a1203a1203a1203a125371203712037120371253c1203c1203c1203c12539120391253a1203a1203a1203a1253712037120371203712500100001000010000105
010700002b1302b1302b1302b13500000000002413024130241350000000000000002e1302e1302e1302e1302e1302e1302e1302e1352e1302e1302e1302e1352e1302e1302e1302e13530130301303013030135
010700002d1302d1302d1302d1302d1302d1302d1302d1302d1302d1302d1302d1302d1302d1302d1302d13500000000000000000000000000000000000000000000000000000000000028130281352913029135
010700002d1302d1302d1302d1302d1302d1352e1302e1302e1302e1302e1302e1353013030130301303013030130301303013030130301303013030130301350000000000000000000000000000000000000000
010700003c1203c1203c1203c12539120391253a1203a1203a1203a12537120371203712500000000000000000000000002113000000221300000024130000002713000000261300000022130000002413000000
01070000000000000000000000001f1301f1301f1301f135241302413024130241352b1302b1302b1302b13529130291302913029135000000000028130281302813500000000000000024130241302413024135
0107000032130000002f130000002b130000002813000000261300000023130000001f130000001c1300000030130000002f130000002b130000002813000000241300000023130000001f130000001c13000000
010700002113021130211302113021130211302113021130211202112021120211202413024130241302413523130231302313023135000000000024130241302413500000000000000026130261302613026135
0107000030130000002d1300000029130000002613000000241300000021130000001d130000001a130000002f130000002d1300000029130000002613000000231300000021130000001d130000001a13000000
010700002813028130281302813028130281302813028130281302813028130281302812028120281202812021130211302113021130211302113021130211302113021130211302113021130211302113021135
0107000010130101301013010130101301013010130101351013010130101301013010130101350c1300c1300c1300c1300c1300c1350c1300c1300c1300c135101301013010130101350c1300c1300c1300c135
01070000291302913029130291350000000000281302813028135000000000000000261302613026130261352313023130231302313500000000002113021130211350000000000000001f1301f1301f1301f135
010700000e1300e1300e1300e1300e1300e1300e1300e1350e1300e1300e1300e1300e1300e1350c1300c1300c1300c135131300c000131301313013130131351313013130131301313511130111301113011135
010700002b1302b1302b1302b1302b1302b1302b1302b1302b1302b1302b1302b1302b1202b1202b1202b12028130281302813028130281302813028130281302813028130281302813021130211302113021135
010700000e1300e1300e1300e1300e1300e1300e1300e1350e1300e1300e1300e1300e1300e1350c1300c1300c1300c135131300c000131301313013130131351313013130131301313512130121301213012135
010700002813028130281302813500000000002813000000000000000000000000001d1301d1351f1301f13521130211302113021130211302113523130231302313023130231302313524130241302413024135
0107000011130111301113011130111301113011130111351113011130111301113011130111350c1300c1300c1300c1300c1300c1350c1300c1300c1300c1351113011130111301113511130111301113011135
010700000e1300e1300e1300e1300e1300e1300e1300e135000000000000000000001d130000001f130000002113021130211302113021130211351f1301f1301f1301f1301f135000001d1301d1301d1301d135
01070000111301113515130151351a1301a1351d1301d1351a1301a1351d1301d135211302113526130261352113021135261302613529130291352d1302d13529130291352d1302d13532130321353513035135
010700001513015130151301513015130151301513015130151301513015130151301513015130151301513511130111301113011130111301113011130111301113011130111301113011130111301113011135
010700001813018130181301813018130181301813018135171301713017130171301713017130171301713518130181301813018130181301813018130181351a1301a1301a1301a1301a1301a1301a1301a135
010700001513015130151301513015130151301513015135131301313013130131301313013130131301313515130151301513015130151301513015130151351713017130171301713017130171301713017135
0107000030100301053010030105301003010530100301050c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0000c0001d1301d1301d1301d1352213022130221302213529130291302913029135
010700001862532605256053260527605266051f62526605186052660500605006051e3230060500605006051862500605006050060500605006051f625006052b6050060500605006051e323286052660500605
010700001862518605256053260527605266051f62526605246052660500605006051e3230060526605006052b60500605006050060500605006051f6250060526605006051e625006051f323006052660500605
01070000303230060530323256053032325605303230060524625006052a6252b6052a6252b6052b6252b60524625006052b625006052b6252b6252b62500605006052b6252b605006052b6252b6050060500605
0107000018625326052560532605276052660526605266051862526605006050060526605006052660500605196350060519635006051960500605196351f6052660500605196350060519635006051f60500605
0107000018625326052560532605276051f6051f63526605186052660500605006051e6351e6051e60500605196350060519635006051963500605196051f6051963500605196350060519635006051f60500605
010700001f6351f6351f63500000000001f6051f6350000000000000001e635000001963500000186350000018635000000000000000186350000000000000001863500000000000000018635186351963500000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010300001354013540145401555016550185501b5601e560235712a56100501005010050100501005010050100501005010050100501005010050100501005010050100501005010050100000000000000000000
01030000144721447215462164621a4621d4522144222432234222342224422244222442225412254122541225412254121640216402164021640216402164021640216402164021640216402164021640216402
01070000285512c5512d5512d5512d5512d5412d5412d5312d5212d5212d5112d5112d5112d5112d5112d5002a5012a5012a5012a5012a5012c5012c5012c5012c5012d5012d5012d5011e5011e5011e5011e501
010400002433024330243002433024330243302433024330243302433024330243302433022300223000830008300083000830008300083000830008300083000830008300083000830008300083000830008300
0110000024755287552b75530755307002d7550000032755327000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010900003f5733f5633f5433f5233f5133f5233f5433f5633f5733f5633f5433f5233f5133f503025030250302503025030250301503025030250302503025030050300503005030050300503005030050300503
0004000027a702ba702da702ea702fa7030a7032a7035a7036a7036a7037a7037a7037a6037a5037a4037a4037a3037a3037a3037a2037a2037a2037a2037a1037a1037a1037a1037a1037a1037a1037a1037a10
0004000034b6538b753ab753bb753bb753bb7532b7529b6526b6522b651eb551bb5519b5516b5515b5513b5511b4510b450fb450eb450db450cb350bb350bb350ab350ab350ab3509b3508b1508b1508b1508b15
0104000022f702af702ef7031f7033f7036f7036f7037f7037f7037f7037f7037f7037f6037f5037f4037f4037f3037f3037f3037f2037f2037f2037f2037f1037f1037f1037f1037f1037f1037f1037f1037f10
__music__
01 08093040
00 0a0b3140
00 0c093040
00 0d0b3140
00 08093040
00 0a0b3140
00 0c093040
00 0e0f3240
00 10113040
00 2f123140
00 13113040
00 14153140
00 10113040
00 2f123140
00 13113040
00 16153340
00 17113040
00 18193140
00 1a113040
00 1b193140
00 17113040
00 18193140
00 1a113040
00 1c1d3440
00 1e1f3040
00 20213140
00 22233040
00 24253140
00 1e1f3040
00 20213140
00 26233040
00 24273140
00 28293040
00 282a3140
00 2b2c3040
02 2d2e3540

