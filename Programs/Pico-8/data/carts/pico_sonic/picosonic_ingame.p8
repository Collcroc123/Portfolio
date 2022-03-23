pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- pico sonic v6.1 (ingame)
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
local dX={}function dX.dY(a4,dZ,d_)for e0=a4,dZ do dX.e1(e0,d_)end end
function dX.e1(e0,d_)for B=0,31 do dX.e2(e0,B,d_)end end
function dX.e2(e0,e3,d_)local e4=0x3200+68*e0+2*e3+1
local e5=dX.e6(peek(e4),d_)poke(e4,e5)end
function dX.e6(e7,d_)local dX=max(0,band(e7,14)/2-d_)return bor(band(e7,bnot(14)),dX*2)end
local cZ=a5()cZ.type=':undefined'function cZ:X()end
function cZ:d4()end
function cZ:d3()end
function cZ:cW()end
function cZ:cl()end
function cZ:e8()end
local e9=a5()function e9:X()self.cm=ao.aE()self.ea=0
self.eb=2
self.ec=0
self.ed=2
self.ee=0
self.ef=0
self.eg=ao.aE()self.eh=0
self.ei=ao.aE()end
function e9:ej(ek)self.el=ek
self:em(ek.en:aH())self.ea=8 end
function e9:em(eo)self.cm:a3(eo)self.eg.ap=eo.ap
self.eg.aq=eo.aq end
function e9:cW()local ep=false
if self.eq:er()then if self.eb~=self.eq.es then self.eb=self.eq.es
ep=true end end
if ep then self.ec=0 elseif self.ed~=self.eb then self.ec=self.ec+1
if self.ec>=30 then self.ed=self.eb end end
if self.eq.et==5 then if self.ee>=120 then self.ef=min(self.ef+1,44)else self.ee=self.ee+1 end else self.ee=0
self.ef=max(0,self.ef-1)end
if self.eq.et==6 then self.eh=16
self.ei:a3(self.eq.cm)self.eu=self.eq.es elseif self.eh>0 then self.eh=self.eh-1 end
local ev
local ew
local ex
local ey
if self.eh>0 then ev=self.ei
ew=0
ex=true
ey=self.eu else ev=self.eq.cm
ew=self.eq.ez.ap
ex=self.eq:er()ey=self.ed end
local eA=mid(self.eg.ap,ev.ap-4,ev.ap+4)local bq=eA-self.eg.ap
bq=sgn(bq)*min(abs(bq),8)self.eg.ap=self.eg.ap+bq
local eB=8*aY[ey]local eC=3-2.5
local eD=mid(0,1,(abs(ew)-2.5)/eC)local eE=sgn(ew)*eD*32
local eF=eB+eE
local eG=eF-self.ea
eG=sgn(eG)*min(abs(eG),0.5)self.ea=self.ea+eG
self.cm.ap=self.eg.ap+self.ea
local eH=ev.aq+self.eq:eI()-8
local br
if self.eq:er()then local eJ=mid(self.eg.aq,eH- -4-1,eH- -4+1)br=eJ-self.eg.aq
local eK=abs(self.eq.eL)<4 and 3 or 8
br=sgn(br)*min(abs(br),eK)else local eJ=mid(self.eg.aq,eH- -4-16,eH- -4+16)br=eJ-self.eg.aq
br=sgn(br)*min(abs(br),8)end
self.eg.aq=self.eg.aq+br
self.cm.aq=self.eg.aq+self.ef
self.cm.ap=mid(64,self.cm.ap,self.el.eM*8-64)local eN=self:eO(self.cm.ap)self.cm.aq=mid(64,self.cm.aq,eN-64)end
function e9:eP()return ao(flr(self.cm.ap),flr(self.cm.aq))end
function e9:eO(ap)local eQ=0
for eR in all(self.el.eS)do if ap<eR.ap*8 then eQ=eR.aq
break end end
return(self.el.eT-eQ)*8 end
function e9:eU(eV,eW)local eX=self.cm.ap-64
local eY=self.cm.ap+64
local eZ=self.cm.aq-64
local e_=self.cm.aq+64
return eX<eW.ap and eY>eV.ap and eZ<eW.aq and e_>eV.aq end
local f0=a5()function f0:X(f1)self.f1=f1
self.f2=false
self.f3=0
self.f4=1
self.f5=0 end
function f0:f6(f7,f8,f9)f9=f9 or 1
self.f3=f9
if self.fa~=f7 or f8 then self.f2=true
self.fa=f7
self.f4=1
self.f5=0 end end
function f0:fb()self.f2=false
self.fa=nil
self.f4=1
self.f5=0 end
function f0:cW()if self.f2 then local fc=self.f1[self.fa]self.f5=self.f5+self.f3
while self.f5>=fc.cc do if self.f4<#fc.cb then self.f4=self.f4+1
self.f5=self.f5-fc.cc else if fc.cd==1 then self.f2=false
self.f4=1
self.f5=0 elseif fc.cd==2 then self.f2=false
self.f4=#fc.cb
self.f5=0 elseif fc.cd==3 then self:fb()else self.f4=1
self.f5=self.f5-fc.cc end end end end end
function f0:cl(cm,bc,bd,bg)if self.fa then local fc=self.f1[self.fa]local fd=fc.cb[self.f4]fd:cl(cm,bc,bd,bg)end end
local fe={}local ff=a9()function ff:X(fg,fh,fi,fj,fk,fl,fm)self.fg=fg
self.fh=fh
self.fi=fi
self.fj=fj
self.fk=fk
self.fl=fl
self.fm=fm end
function ff:fn(fo)return self.fh[fo+1]end
function ff:fp(fq)return self.fi[fq+1]end
local function fr(fs)for ay in all(fs)do if ay~=0 and ay~=8 then return false end end
return true end
function ff:ft()return fr(self.fh)end
function ff:fu()return fr(self.fi)end
function ff:fv()if self.fm then return false end
local fw
for ay in all(self.fh)do if ay~=0 then if fw then if ay~=fw then return false end else fw=ay end end end
return true end
function ff.fx(fj)local fy=fj<0.25 or fj>=0.75
local fk=fy and 2 or 1
local fl=fj<0.5 and 2 or 1
return fk,fl end
function ff.fz(fA,fj,fm)local fk,fl=ff.fx(fj)local fg=aI.aK(fA)return ff(fg,ff.fB(fg,fk),ff.fC(fg,fl),fj,fk,fl,fm)end
local function eC(a4,dZ,dQ)dQ=dQ or 1
return function(K,fD)local fE=fD+dQ
if dQ>0 and fE<=dZ or dQ<0 and fE>=dZ or dQ==0 then return fE end end,nil,a4-dQ end
function ff.fF(fG,fH,bq,br,fk,fl,fI)local fJ=sget(fG+bq,fH+br)if fJ~=0 then return fI(bq,br,fk,fl)end end
function ff.fK(bq,br,fk,fl)if fk==2 then return 8-br else return br+1 end end
function ff.fL(bq,br,fk,fl)if fl==2 then return 8-bq else return bq+1 end end
function ff.fB(fM,fk)local fs={}local fN=fM:aH()local fO=fk==2 and{eC(0,8-1)}or{eC(8-1,0,-1)}for bq=0,8-1 do for br in unpack(fO)do fP=ff.fF(fN.ap,fN.aq,bq,br,fk,nil,ff.fK)if fP then break end end
if not fP then fP=0 end
add(fs,fP)end
return fs end
function ff.fC(fM,fl)local fs={}local fN=fM:aH()local fQ=fl==2 and{eC(0,8-1)}or{eC(8-1,0,-1)}for br=0,8-1 do for bq in unpack(fQ)do fR=ff.fF(fN.ap,fN.aq,bq,br,nil,fl,ff.fL)if fR then break end end
if not fR then fR=0 end
add(fs,fR)end
return fs end
local fS={}local fT=C({[1]={8,2},[2]={8,0},[3]={8,2},[4]={8,0},[5]={8,2},[6]={8,0},[7]={8,2},[8]={8,-2},[9]={8,-2},[10]={8,-2},[11]={8,-2},[12]={8,3},[13]={8,3},[14]={8,-3},[15]={8,-3},[16]={8,8},[17]={8,5},[18]={8,3},[19]={8,-3},[20]={8,-5},[21]={8,-8},[38]={4,-8},[22]={3,-8},[39]={-3,-8},[23]={-4,-8},[32]={-8,8},[33]={-8,5},[34]={-8,3},[35]={-8,-3},[36]={-8,-5},[37]={-8,-8},[24]={-4,8},[40]={-3,8},[25]={3,8},[41]={4,8},[44]={4,-8},[28]={4,-8},[26]={8,-0.0625},[29]={8,0},[30]={0,-8},[31]={0,8},[42]={8,-4},[43]={8,-4},[45]={8,0}},function(fU)return atan2(fU[1],fU[2])end)local fV={[7]=true,[8]=true,[13]=true,[14]=true,[18]=true,[19]=true,[34]=true,[35]=true}local fW={[35]=29,[36]=29,[218]=29,[219]=29,[235]=29,[48]=29,[64]=29,[80]=29,[83]=29,[84]=29,[182]=44,[166]=28,[124]=29,[125]=29,[49]=1,[50]=2,[51]=3,[52]=4,[53]=5,[54]=6,[55]=7,[56]=8,[57]=9,[58]=10,[59]=11,[60]=12,[61]=13,[62]=14,[63]=15,[65]=29,[66]=29,[67]=29,[68]=29,[69]=29,[70]=29,[71]=29,[72]=29,[73]=29,[85]=29,[86]=29,[87]=29,[88]=29,[89]=29,[160]=45,[161]=45,[213]=45,[214]=45,[164]=13,[94]=29,[95]=29,[110]=29,[111]=29,[74]=26,[75]=2,[202]=30,[173]=31,[176]=4,[177]=4,[192]=29,[193]=29,[208]=29,[209]=29,[162]=29,[163]=29,[178]=29,[179]=29,[194]=29,[195]=29,[210]=29,[211]=29,[96]=16,[97]=17,[98]=18,[99]=19,[100]=20,[101]=21,[118]=38,[102]=22,[119]=39,[103]=23,[112]=32,[113]=33,[114]=34,[115]=35,[116]=36,[117]=37,[104]=24,[120]=40,[105]=25,[121]=41,[240]=8,[241]=9,[242]=10,[243]=11,[244]=29,[245]=32,[228]=19,[229]=20}local fX={}for fY,fA in pairs(fW)do fX[fY]=ff.fz(fA,fT[fA],fV[fA])end
fS.fZ=function(fY)return fX[fY]end
local f_=C({g0={{12,8},{2,2},{10,8},14},g1={{0,8},{2,2},{8,8},14},g2={{2,8},{2,2},{8,8},14},g3={{4,8},{2,2},{9,8},14},g4={{6,8},{2,2},{8,8},14},g5={{8,8},{2,2},{8,8},14},g6={{10,8},{2,2},{8,8},14},g7={{10,8},{2,2},{9,8},14},g8={{12,8},{2,2},{9,8},14},g9={{14,8},{2,2},{11,8},14},ga={{14,8},{2,3},{9,8},14},gb={{0,8},{2,2},{8,8},14},gc={{2,8},{2,2},{8,8},14},gd={{4,8},{2,2},{8,8},14},ge={{6,8},{2,2},{8,8},14},gf={{0,8},{2,2},{6,6},14},gg={{2,8},{2,2},{6,6},14},gh={{4,8},{2,2},{6,6},14},gi={{6,8},{2,2},{6,6},14},gj={{8,8},{2,2},{6,6},14},gk={{12,8},{2,2},{7,10},14},gl={{14,8},{2,2},{7,10},14},gm={{0,8},{2,2},{3,10},14},gn={{2,8},{2,2},{3,10},14},go={{4,8},{2,2},{3,10},14},gp={{6,8},{2,2},{3,10},14},gq={{8,8},{2,2},{3,10},14}},function(gr)return cg(aI(gr[1][1],gr[1][2]),aF(gr[2][1],gr[2][2]),ao(gr[3][1],gr[3][2]),gr[4])end)local gs=C({["idle"]={{f_.g0},1,2},["walk"]={{f_.g1,f_.g2,f_.g3,f_.g4,f_.g5,f_.g6},10,4},["brake_start"]={{f_.g7,f_.g8},10,2},["brake_reverse"]={{f_.g9},15,2},["run"]={{f_.gb,f_.gc,f_.gd,f_.ge},5,4},["spin"]={{f_.gf,f_.gg,f_.gf,f_.gh,f_.gf,f_.gi,f_.gf,f_.gj},5,4},["crouch"]={{f_.gk,f_.gl},6,2},["spring_jump"]={{f_.ga},1,2},["spin_dash"]={{f_.gm,f_.gn,f_.gm,f_.go,f_.gm,f_.gp,f_.gm,f_.gq},1,4}},function(gr)return ca(gr[1],gr[2],gr[3])end)local gt={gu=f_,gv=gs}local gw={}local gx=a9()gw.gx=gx
function gx:X(gy,gz,fj)self.gy=gy
self.gz=gz
self.fj=fj end
local gA=a9()gw.gA=gA
function gA:X(gy,cm,fj,gB,gC)self.gy=gy
self.cm=cm
self.fj=fj
self.gB=gB
self.gC=gC end
local gD=a9()gw.gD=gD
function gD:X(gy,gE,gF,gG,fj)self.gy=gy
self.gE=gE
self.gF=gF
self.gG=gG
self.fj=fj end
function gD:gH(b1)if b1==0 or b1==2 then return self.gE elseif b1==1 then return self.gF else return self.gG end end
local gI={}function gI.gJ(bg)if not bg or bg>=0.875 or bg<=0.125 then return 3 elseif bg<0.375 then return 2 elseif bg<=0.625 then return 1 else return 0 end end
function gI.gK(gL)return 0.25*(3-gL)%4 end
function gI.gM(gN,gL)return gL%2==0 and gN.aq or gN.ap end
function gI.gO(gN,gL)return gL%2==1 and gN.aq or gN.ap end
function gI.gP(gN,H,gL)if gL%2==0 then gN.aq=H else gN.ap=H end end
function gI.gQ(gR,gS,gL)if gL<2 then return gS-gR else return gR-gS end end
function gI.gT(gU,gL)return gI.gO(gU:aN()+4*aU[gL],gL)end
function gI.gV(gW,gX,gL,gY)if gW.B>=0 and gW.B<128 and gW.aG>=0 and gW.aG<32 then local gZ=mget(gW.B,gW.aG)local g_=fget(gZ,0)if g_ then local h0=fS.fZ(gZ)if h0 then local ft=h0:ft()local fu=h0:fu()local fv=h0:fv()if gL%2==1 then local h1=h0:fn(gX)if h0.fk==2 and gL==1 or h0.fk==1 and gL==3 then if gY and not ft then return 0 end
if h1>0 then return 8,gI.gK(gL)end elseif fv then if h1>0 then return h1,gI.gK(gL)end else if h1>0 or h0.fm and gI.gJ(h0.fj)==gL then return h1,h0.fj end end else local h2=h0:fp(gX)if h0.fl==2 and gL==0 or h0.fl==1 and gL==2 then if gY and not fu then return 0 end
if h2>0 then return 8,gI.gK(gL)end elseif fv then if h2>0 then return h2,gI.gK(gL)end else if h2>0 or h0.fm and gI.gJ(h0.fj)==gL then return h2,h0.fj end end end end end end
return 0 end
local h3=a5()function h3:X()self.h4=f0(gt.gv)self:h5()end
function h3:h5()self.h6=1
self.et=1
self.gL=3
self.es=2
self.h7=1
self.h8=0
self.cm=ao(-1,-1)self.eL=0
self.h9=0
self.ez=ao.aE()self.fj=0
self.ha=0
self.hb=0
self.hc=ao.aE()self.hd=false
self.he=false
self.hf=false
self.hg=false
self.hh=false
self.hi=0
self:hj(0)self:hk("idle")self.hl=0
self.hm=false
self.hn=0 end
function h3:er()return I({1,4,5,6},self.et)end
function h3:ho()return I({3,4,5,6},self.et)end
function h3:eI()return self:ho()and 6 or 8 end
function h3:hp()return self:ho()and 12 or 16 end
function h3:hq(hr)return(self.gL-aY[hr])%4 end
function h3:hs()return aU[self.gL]end
function h3:ht(ay)return ay:bA(gI.gK(self.gL))end
function h3:hu(cm)self:h5()self:hv(cm)end
function h3:hv(cm)self.cm=cm
self:hw(2)self:hx()end
function h3:hy()return self.cm+self:eI()*self:hs()end
function h3:hz(hA)if self.hB~=hA then self.hB=hA
local hC=cS.cU
if hC:hD(hA)then self.h7=1 elseif hC:hE(hA)then self.h7=2 end end end
function h3:hj(bg)self.hF=bg
self:hG()end
function h3:hG()local hH=0
local hI=false
if self.h4.fa=="idle"then hH=flr(4*self.hF+0.5)/4 elseif I({"walk","run"},self.h4.fa)then hH=flr(8*self.hF+0.5)/8
if hH%0.25~=0 then hI=true
local bc=self.es==1
hH=hH+(bc and 1 or-1)*0.125 end end
self.hH=hH%1
self.hI=hI end
function h3:hJ(bg,hK)self.fj=bg
if hK then self:hj(0)elseif bg then self:hj(bg)end
self.gL=gI.gJ(bg)end
function h3:cW()self:hL()self:hM()self:hN()self.h4:cW()end
function h3:hL()if self.h6==1 then local hO=ao.aE()if not self:er()or self.h9<=0 then if dj:du(0)then hO:av(ao(-1,0))elseif dj:du(1)then hO:av(ao(1,0))end end
if self.h9>0 then self.h9=self.h9-1 end
if dj:du(2)then hO:av(ao(0,-1))elseif dj:du(3)then hO:av(ao(0,1))end
self.hc=hO
local hP=dj:du(4)self.hd=hP and dj:dw(4)self.he=hP end end
function h3:hQ()self.h6=2
self.hc=ao(1,0)self.hd=false
self.he=false end
function h3:hM()self:hR()self:hS()end
function h3:hT(hU)return self:hV(self.hW,hU)end
function h3:hX(hU)return self:hV(self.hY,hU)end
function h3:hV(hZ,hU)local h_=1/0
local i0=nil
for B=1,2 do local i1=self:i2(hU,B)local i3=hZ(self,i1)local gz=i3.gz
if gz<h_ or gz==h_ and self:i4()==B then h_=gz
i0=i3 end end
return gw.gx(i0.gy,h_,i0.fj)end
function h3:i4()if self:er()then if self.eL~=0 then return aZ(self.eL)end else if self.ez.ap~=0 then return aZ(self.ez.ap)end end
return self.es end
function h3:i2(hU,i5)local ap=hU.ap
local aq=hU.aq
if self.gL%2==1 then ap=flr(ap)else aq=flr(aq)end
local i6=ao(ap,aq)+self:eI()*self:hs()local i7=self:ht(2.5*aX[i5])i7=ao(flr(i7.ap),flr(i7.aq))return i6+i7 end
function h3:i8(hU)local ap=hU.ap
local aq=hU.aq
if self.gL%2==0 then ap=flr(ap)else aq=flr(aq)end
local i9=ao(ap,aq)if self.fj==0 then return i9+(self:eI()-6)*self:hs()else return i9:a0()end end
local function ia(ib,ic,id,ie,ig,ih,ii,ij,ik)local hC=cS.cU
local il=hC:im()local io=aU[ic]local i1=ig+ih*io
local ip=ao.aO(i1+id*io)local iq=ao.aO(i1+ie*io)local ir=ip:aH()local is=aF(io.ap,io.aq)local gX=gI.gM(i1-ir,ic)local it=ip:a0()while true do local iu,fj
local iv=false
local iw=hC:ix(it)local iy=mget(iw.B,iw.aG)local iz=fget(iy,1)local bS=fget(iy,2)if ib.h8>0 and iy==229 or not bS and(ib.h7==1 and hC:iA(it)or ib.h7==2 and hC:iB(it))or iz and ic~=3 then iv=true end
if iv then iu,fj=0 else local gY=ik and ip==it
iu,fj=gI.gV(it-il,gX,ic,gY)end
if fj then local iC=gI.gT(it,ic)local iD=gI.gQ(iC,gI.gO(i1,ic),ic)-iu
local de=ii(it,iD,fj)if de then return de end end
if it==iq then local de=ij()return de end
it=it+is end end
local function iE()return gw.gx(nil,4+1,nil)end
local function iF(gy,iG,fj)if iG<-7 then return iE()elseif iG<=4 then return gw.gx(gy,iG,fj)end end
function h3:hW(i1)return ia(self,self.gL,-(7+1),4,i1,0,iF,iE)end
local function iH()return gw.gx(nil,4+1,nil)end
local function iI(iJ,iK,fj)if iK<=0 then return gw.gx(iJ,iK,fj)else return nil end end
function h3:hY(i1)local iL=self:hp()return ia(self,b0(self.gL),7+1-iL,0,i1,iL,iI,iH,true)end
local function iM()return gw.gx(nil,ceil(2.5)+1,nil)end
local function iN(iJ,iO,fj)if iO<ceil(2.5)then return gw.gx(iJ,iO,fj)else return iM()end end
function h3:iP(i1,iQ)return ia(self,self:hq(iQ),0,ceil(2.5),i1,0,iN,iM)end
function h3:hx()local i3=self:hT(self.cm)local iG,iR=i3.gz,i3.fj
if-7<=iG and iG<=0 then local iS=iG*self:hs()self.cm:av(iS)self:hz(i3.gy)self:hJ(iR)if not self:er()then self:hw(1)end end end
function h3:hw(iT)local iU=self:er()local iV=self:ho()self.et=iT
if iV~=self:ho()then local iW=self:ht(ao(0,8-6))local iX=iV and-1 or 1
self.cm:av(iX*iW)end
if iT==2 then self.hB=nil
self:hJ(nil)self.eL=0
self.hf=false elseif iT==3 then self.hB=nil
self:hJ(nil,true)self.eL=0
self.hf=false
self.hm=false elseif iT==1 then if not iU then self.eL=self.ez:aC(ao.bz(self.fj))self.ez:a3(self:iY())self.hg=false
self.hh=false
self.hm=false end elseif iT==4 then if not iU then self.hg=false
self.hh=false
self.hm=false end end
if iT~=1 and iT~=2 then self.hn=0 end
if iT~=2 then self.hi=0 end end
function h3:hR()if self.h8>0 then self.h8=self.h8-1 end end
function h3:hS()if self:er()or self.hi>0 then if self.hi>0 then end
self:iZ()self:i_()end
if self.hi>0 then self.hi=self.hi-1 end
if I({1,5},self.et)then self:j0()elseif self.et==4 then self:j1()end
if self:er()then self:j2()else self:j3()end
if self:er()or self.hi>0 then if self.hi>0 then end
self:j4()end
self:j5()self:j6()self:j7()self:j8()end
function h3:j0()if self:j9()then if abs(self.eL)>=0.5 then self:hw(4)self:ja(57)elseif self.et~=5 then self:hw(5)end elseif self.et~=1 then self:hw(1)end end
function h3:j1()if abs(self.eL)<0.25 then self:hw(1)end end
function h3:j2()self:jb()local gA=self:jc()if gA.gB then self.eL=0 end
if flr(gA.cm.ap)<2.5 then gA.cm.ap=ceil(2.5)self.eL=max(-0.1,self.eL)end
if self.eL~=0 then self.hl=abs(self.eL)else self.hl=0 end
self.ez:a3(self:iY())self.cm:a3(gA.cm)local jd=gA.gC
if not jd and self.gL~=3 and abs(self.eL)<1.25 then if self.fj>=0.25 and self.fj<=0.75 then jd=true end
self.h9=30 end
if jd then local je
if cS.cU.dJ.jf()then self.hi=6
self.ha=self.fj end
if I({1,5},self.et)then je=2 else je=3 end
self:hw(je)else self:hz(gA.gy)self:hJ(gA.fj)end end
function h3:jb()if I({1,5},self.et)then local jg=self.eL
self:jh()self:ji()self:jj(jg)elseif self.et==4 then self:jh()self:jk()end end
function h3:jh()local jl=false
self.eL=self.eL+0.0625*sin(self.fj)end
function h3:ji()local jm=self.eL
if self.hc.ap~=0 then if self.eL==0 or sgn(self.eL)==sgn(self.hc.ap)then jm=self.eL+self.hc.ap*0.0234375
self.es=aZ(self.hc.ap)if self.hn==1 then self.hn=0 end else jm=self.eL+self.hc.ap*0.25
local jn=jm==0 or sgn(jm)==sgn(self.hc.ap)if jn then if abs(jm)>0.0234375 then jm=sgn(jm)*0.0234375 end
self.es=aZ(self.hc.ap)if self.hn==1 then self.hn=2 end elseif self.gL==3 and abs(self.eL)>=2 then self.es=aZ(self.eL)self.hn=1
self:ja(58)end end else if self.eL~=0 then jm=sgn(self.eL)*max(0,abs(self.eL)-0.0234375)end
if self.hn==1 and not self.h4.f2 then self.hn=0 end end
self.eL=jm end
function h3:jk()local jo=0.01171875
if self.eL~=0 and self.hc.ap~=0 then if sgn(self.eL)~=sgn(self.hc.ap)then jo=jo+0.0625 else self.es=aZ(self.hc.ap)end end
self.eL=sgn(self.eL)*max(0,abs(self.eL)-jo)end
function h3:jj(jg)local jp=max(abs(jg),3)if abs(self.eL)>jp then self.eL=sgn(self.eL)*jp end end
function h3:iY()return self.eL*ao.bz(self.fj)end
function h3:jc()if self.eL==0 then return gw.gA(self.hB:a0(),self.cm:a0(),self.fj,false,false)end
local gC=false
local jq=self.gL
local i5=aZ(self.eL)local jr=self.cm+self:iY()local gB=self:js(jr,i5)local i3=self:hT(jr)local iG=i3.gz
local iS=iG*self:hs()if iG<0 then if-iG<=7 then jr:av(iS)end elseif iG>=0 then if iG<=4 then local jt=bv(i3.fj,self.fj)if aY[i5]*jt>0.125 then gC=true else jr:av(iS)end else gC=true end end
local ju=not gC and i3.gy or nil
if gB and jq~=gI.gJ(i3.fj)then self:hz(ju)gB=self:js(jr,i5)end
local jv=gw.gA(ju,jr,i3.fj,gB,gC)return jv end
function h3:js(jr,i5)local ig=self:i8(jr)local jw=self:iP(ig,i5)if jw.gy then if-6<=jw.gz and jw.gz<ceil(2.5)then local iO=jw.gz-ceil(2.5)local jx=aU[self:hq(i5)]local jy=iO*jx
jr:av(jy)return true end end
return false end
function h3:j9()return self.hc.ap==0 and self.hc.aq>0 end
function h3:j4()if self.hd then self.hd=false
self.hf=true end end
function h3:iZ()if self.hf then self.hf=false
local jz=self.hi>0 and self.ha or self.fj
local jA=3.25*ao.bz(jz):bF()self.ez:av(jA)self:hw(3)self.hg=true
self.hh=true
self:ja(55)return true end
return false end
function h3:i_()if I({5,6},self.et)then if self.et==6 and self.hc.aq<=0 then self:jB()elseif self.hd then self.hd=false
if self.et==5 then self:hw(6)self.eL=0
self.hb=0 end
self.hb=min(self.hb+2,8)self:hk("spin_dash",true)self:ja(61)else if self.et==6 then self.hb=self.hb*0.96875 end end end end
function h3:jB()local jC=aY[self.es]self:hw(4)self.eL=jC*(4+flr(self.hb)*0.25)self:ja(62)end
function h3:j3()if self.hg then self.hg=false else self.ez.aq=self.ez.aq+0.109375 end
if self.et==3 then self:jD()end
if self.hc.ap~=0 then local jE=self.ez.ap
self.ez.ap=self.ez.ap+self.hc.ap*0.046875
self:jF(jE)self.es=aZ(self.hc.ap)end
self:jG()if self.ez.aq>32 then self.ez.aq=32 end
self.cm:av(self.ez)local gD=self:jH()if gD.gE then self.ez.ap=0 end
if gD.gF then self.ez.aq=0 end
if flr(self.cm.ap)<2.5 then self.cm.ap=ceil(2.5)self.ez.ap=max(0,self.ez.ap)end
if gD.gG then self:hz(gD.gy)self:hJ(gD.fj)self:hw(1)end end
function h3:jD()if self.hh and not self.he then self.hh=false
local jI=-2
if self.ez.aq<jI then self.ez.aq=jI end end end
function h3:jG()local jJ=self.ez
if jJ.aq<0 and jJ.aq>-8 and abs(jJ.ap)>=0.25 then jJ.ap=jJ.ap*0.96875 end end
function h3:jF(jE)local jK=max(abs(jE),3)if abs(self.ez.ap)>jK then self.ez.ap=sgn(self.ez.ap)*jK end end
function h3:jH()if self.ez:ar()then return gw.gD(nil,false,false,false,nil)end
local hB
local gE=false
local gF=false
local gG=false
local fj
if self.ez.ap~=0 then local i5=aZ(self.ez.ap)gE=self:js(self.cm,i5)end
if self.ez.aq>0 then local gx=self:hT(self.cm)local iG=gx.gz
if-7<=iG and iG<0 then local iS=iG*self:hs()self.cm:av(iS)gG=true
hB=gx.gy
fj=gx.fj end elseif self.ez.aq<0 then local jL=self:hX(self.cm)local iK=jL.gz
if iK<0 then assert(jL.fj>0.25 and jL.fj<0.75,"detected ceiling with slope angle expected between 0.25 and 0.75 excluded, got: "..jL.fj.." (we don't check for those bounds in ceiling adherence check so Sonic may adhere to unwanted walls)")local jM=-iK*self:hs()self.cm:av(jM)if jL.fj<=0.25+0.125 or jL.fj>=0.75-0.125 then hB=jL.gy
gG=true
fj=jL.fj else gF=true end end end
return gw.gD(hB,gE,gF,gG,fj)end
function h3:j5()local hC=cS.cU
local jN=hC:jO()if jN then self:jP(jN)end end
function h3:jP(jN)if jN.b1==1 then self.ez.aq=-5
self:hw(2)self.hm=true else self.es=jN.b1/2+1
self.h9=16
local jQ=aY[self.es]if self:er()then self.eL=jQ*5 else self.ez.ap=jQ*5 end end
jN:jR()self:ja(56)end
function h3:j6()if self.hB and self.eL>=2 then local hC=cS.cU
local jS=hC:ix(self.hB)local jT=mget(jS.B,jS.aG)if jT==229 then self:jU()end end end
function h3:jU()local jV=min(9.7,self.eL*2.7)self.ez:a3(jV*ao.bz(0x0.16c2))self:hw(2)self.hm=true
self.h8=3 end
function h3:j7()local hC=cS.cU
local jW=hC:jX(self.cm)if jW then hC:jY(jW)end end
function h3:j8()local hC=cS.cU
local jZ=hC:j8(self.cm,self.h7)if jZ then self.h7=jZ end end
function h3:hN()self:j_()self:k0()end
function h3:j_()if self.hn==1 then self:hk("brake_start")return elseif self.hn==2 then self:hk("brake_reverse")if self.h4.f2 then return else self.hn=0 end end
if self.et==1 then if self.eL==0 then self:hk("idle")else if self.hl<3 then self:hk("walk",false,max(0.625,self.hl))else self:hk("run",false,self.hl)end end elseif self.et==2 then if self.hm and self.ez.aq>0 then self.hm=false end
if self.hm then self:hk("spring_jump")else if self.hl<3 then self:hk("walk",false,max(0.625,self.hl))else self:hk("run",false,self.hl)end end elseif self.et==5 then self:hk("crouch")elseif self.et==6 then else local k1=self.et==4 and 1.25 or 0.625
self:hk("spin",false,max(k1,self.hl))end end
local k2={["idle"]=0,["walk"]=0,["walk45"]=1,["brake_start"]=3,["brake_reverse"]=3,["run"]=2,["run45"]=2+1/32,["spin"]=3,["crouch"]=1,["spring_jump"]=0,["spin_dash"]=4}function h3:hk(f7,f8,f9)self.h4:f6(f7,f8,f9)self:hG()local k3
if self.hI then k3=f7 .."45"else k3=f7 end
local k4=k2[k3]if self.k5~=k4 then self.k5=k4
local k6=0x4b00+k4*0x400
if k4<4 then memcpy(0x1000,k6,0x400)else for B=0,15 do memcpy(0x1000+B*0x40,k6+B*0x28,0x28)end end end end
function h3:k0()local bg=self.hF
if self.et==2 and bg~=0 then if bg<0.5 then self:hj(max(0,abs(bg)-1/128))else self.hF=min(1,abs(bg)+1/128)%1 end end end
function h3:cl()local k7=ao(flr(self.cm.ap),flr(self.cm.aq))local bc=self.es==1
self.h4:cl(k7,bc,false,self.hH)end
function h3:ja(aL)if stat(19)~=59 then sfx(aL)end end
local k8=a7(cZ)function k8:X()self.camera=e9()self.k9={}end
function k8:ka(kb,ay)return"data_stage"..self.kc.."_"..kb..ay..".p8"end
function k8:kd(ke)return ke+self:im()end
function k8:ix(kf)return kf-self:im()end
function k8:kg()local kh=self.el.en:aH()self.h3=h3()self.h3:hu(kh)end
function k8:ki(hA,kj,kk)for kl in all(kj)do if(kk==nil or kk(hA,kl))and kl:I(hA)then return true end end
return false end
function k8:iB(hA)return self:ki(hA,self.el.km,function(hA,kl)return hA~=aM(kl.aQ,kl.kn)end)end
function k8:iA(hA)return self:ki(hA,self.el.ko,function(hA,kl)return hA~=aM(kl.aS,kl.kn)end)end
function k8:hD(hA)for kl in all(self.el.km)do if hA==aM(kl.aQ,kl.kn)then return true end end end
function k8:hE(hA)for kl in all(self.el.ko)do if hA==aM(kl.aS,kl.kn)then return true end end end
function k8:kp(kq)kq=kq or ao.aE()camera(self.camera.cm.ap-64-kq.ap,self.camera.cm.aq-64-kq.aq)end
function k8:kr()local il=self:im()self:kp(ao(8*il.B,8*il.aG))end
function k8:im()return aM(128*self.ks.ap,32*self.ks.aq)end
local kt={{1,12,12,7},{7,1,12,12},{12,7,1,12},{12,12,7,1}}function k8:ku()local kv=0.5
local eD=t()%kv/kv
local kw=#kt
local dQ=min(flr(eD*kw)+1,kw)local A=kt[dQ]y({1,13,12,7},A)end
function k8:kx()self:kr()self:ky()self:kz()end
function k8:ky()w(14)map(0,0,0,0,128,32,64)end
function k8:kz()self:ku()map(0,0,0,0,128,32,16)pal()end
function k8:kA()w(14)self:kr()map(0,0,0,0,128,32,128)local il=self:im()self:kp()for kl in all(self.el.km)do map(kl.aQ-il.B,kl.kn-il.aG,8*kl.aQ,8*kl.kn,kl.aS-kl.aQ+1,kl.kB-kl.kn+1,64)end
for kf in all(self.k9)do co.cq.cz:cl(kf:aH())local kC=kf+aM(1,0)co.cq.cA:cl(kC:aH())co.cq.cA:cl(kf:aH(),true)end end
local kD={}function kD.kE(aA,kF)kF=kF or 0
local kG,kH=unpack(co.cp[aA])local kI={{kG,kH},{7,kG},{7,7}}y({8,2},kI[kF+1])end
function kD.dS(aA,cm,kF)if aA>=0 then kD.kE(aA,kF)co.cq.cJ:cl(cm)pal()else co.cq.cD:cl(cm)end end
local cJ=a5()function cJ:X(aA,aM)self.aA=aA
self.aM=aM end
function cJ:kJ()local hU=self.aM:aN()if self.aA==8 then hU:av(ao(5,0))end
return hU end
function cJ:kK()local eV=self.aM:aH()return eV,eV+8*ao(1,1)end
function cJ:cl()kD.dS(self.aA,self:kJ())end
local kL=a5()function kL:X(cm,fc)self.cm=cm
self.h4=f0({["once"]=fc})self.h4:f6("once")end
function kL:kM()return self.h4.f2 end
function kL:cW()self.h4:cW()end
function kL:cl()self.h4:cl(self.cm)end
local kN=a7(kL)function kN:X(aA,cm,fc)kL.X(self,cm,fc)self.aA=aA end
function kN:cl()kD.kE(self.aA)self.h4:cl(self.cm)pal()end
local cN=a5()function cN:X(kf)self.kf=kf
self.h4=f0(co.cw.cN)self.h4:f6("goal")end
function cN:cW()self.h4:cW()end
function cN:cl()self.h4:cl(self.kf:aH()+ao(4,0))end
local bU=a5()function bU:X(b1,kf)self.b1=b1
self.kf=kf
self.kO=0 end
function bU:jR()self.kO=0.15 end
function bU:cW()if self.kO>0 then self.kO=self.kO-1/60
if self.kO<=0 then self.kO=0 end end end
function bU:kP()local eV=self.kf:aH()if self.b1==1 then return eV+co.cq.bU.cj elseif self.b1==0 then return eV+ao(2,2)else return eV+ao(6,2)end end
function bU:kK()local eV=self.kf:aH()return eV-8*ao(0,1),eV+8*ao(2,1)end
function bU:cl()local bd=false
local bg=0
local kQ=self:kP()if self.b1==0 then bg=0.25 elseif self.b1==2 then bd=true
bg=0.25 end
if self.kO>0 then co.cq.cK:cl(kQ,false,bd,bg)else co.cq.bU:cl(kQ,false,bd,bg)end end
local kR=a9()function kR:X(aQ,kn,aS,kB)self.aQ=aQ
self.kn=kn
self.aS=aS
self.kB=kB end
function kR:I(gU)return self.aQ<=gU.B and gU.B<=self.aS and self.kn<=gU.aG and gU.aG<=self.kB end
local kS={[1]={kT="pico island",eM=430,eT=64,en=aM(5,47),kU=3456,eS={ao(47,11),ao(104,8),ao(384,0),ao(513,15)},ko={kR(222,44,228,54),kR(337,20,343,30),kR(361,28,367,37)},km={kR(229,44,234,54),kR(344,20,349,30),kR(368,28,373,37)}}}local kV={}local function kW(aq,v)line(0,aq,127,aq,v)end
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
function kV.l5(ap,aq,lt,lu,f9)local lv=t()*f9
lw=(ap-lv+100)%300-100
local lx={0,1.5,3,4.5}local ly={0.8,1.4,1.1,0.7}for B=1,4 do circfill(lw+flr(lx[B]*lu),aq+lt[B],ly[B]*lu+1,13)end
for B=1,4 do circfill(lw+flr(lx[B]*lu),aq+lt[B],ly[B]*lu,7)end end
local lz={{1,12},{7,12},{12,1},{12,7},{1,12}}function kV.lb(la,ap,aq,kv)local eD=t()%kv/kv
local kw=#lz
local dQ=min(flr(eD*kw)+1,kw)local lA=lz[dQ]pset((ap-la)%128,aq,lA[1])pset((ap-la+1)%128,aq,lA[2])end
function kV.li(la,aq,lB,fq,lC)for lw=0,127 do local ap=lw+la
local h1=lB+flr((3+0.5*fq)*(1+sin(ap/(1.7+0.2*fq))*sin(ap/1.41)))line(lw,aq,lw,aq-h1,lC)end end
function kV.lh(la,aq,lB,fq,lC)for lw=0,127 do local ap=lw+la
local h1=lB+flr((4.5-0.3*fq)*(1+sin(ap/(41.4-9.1*fq)))+1.8*sin(ap/1.41))line(lw,aq,lw,aq+h1,lC)end end
local lD=a7(k8)lD.type=':stage'function lD:X()k8.X(self)self.kc=1
self.el=kS[self.kc]self.lE=false
self.lF={}self.lG={}self.lH={}self.lI={}self.lJ={}self.lK={}end
function lD:d4()self:lL()self:lM()self.camera:ej(self.el)self:lN()self:lO()self:kg()self.camera.eq=self.h3
self.lE=false
self:lP()end
function lD:lO()local lQ="data_stage"..self.kc.."_ingame.p8"reload(0x0,0x0,0x2000,lQ)reload(0x4b00,0x400,0x1000,"data_stage_sonic.p8")for B=0,15 do reload(0x5b00+B*0x28,0x1400+B*0x40,0x28,"data_stage_sonic.p8")end end
function lD:cW()self:lR()for jN in all(self.lK)do jN:cW()end
self.h3:cW()self:lS()if self.cN then self.cN:cW()end
self.camera:cW()self:lN()end
function lD:cl()kV.kX(self.camera:eP())self:lT()self:lU()self:lV()end
function lD:lW(kf)add(self.lF,kf)add(self.lG,cJ(#self.lF,kf))local ke=self:ix(kf)local af=mget(ke.B,ke.aG)if mget(ke.B+1,ke.aG)==234 then add(self.lJ,{kf,234})end end
function lD:lX(kf)add(self.k9,kf)end
function lD:lY(kf)self.cN=cN(kf)end
local function lZ(b1,kf)return function(self,kf)add(self.lK,bU(b1,kf))end end
lD.l_=lZ(1)lD.m0=lZ(0)lD.m1=lZ(2)lD.m2={[co.cL]=lD.lW,[236]=lD.lX,[226]=lD.lY,[74]=lD.l_,[202]=lD.m0,[173]=lD.m1}function lD:m3(m4)return lD.m2[m4]end
function lD:m5()for B=0,128-1 do for aG=0,32-1 do local m6=mget(B,aG)local m7=self:m3(m6)if m7 then local ke=aM(B,aG)local kf=self:kd(ke)m7(self,kf,m6)end end end end
function lD:m8()local m9=ceil(self.el.eM/128)local ma=ceil(self.el.eT/32)return m9,ma end
function lD:mb(cm)local m9,ma=self:m8()local kb=flr(cm.ap/1024)local ay=flr(cm.aq/256)local mc=8*8
local bq=cm.ap%1024
if bq<mc then if kb>0 then kb=kb-0.5 end elseif bq>1024-mc then if kb<m9-1 then kb=kb+0.5 end end
local br=cm.aq%256
if br<mc then if ay>0 then ay=ay-0.5 end elseif br>256-mc then if ay<ma-1 then ay=ay+0.5 end end
kb=mid(0,kb,m9-1)ay=mid(0,ay,ma-1)return ao(kb,ay)end
function lD:md(me,mf)local mg=0x2000
local mh=0x4300
if me==2 then mg=mg+0x40 else mh=mh+0x40 end
reload(0x4300,0x2000,0x800,mf)for aG=0,15 do memcpy(mg+aG*0x80,mh+aG*0x80,0x40)end
reload(0x4300,0x2800,0x800,mf)for aG=16,31 do memcpy(mg+aG*0x80,mh+(aG-16)*0x80,0x40)end end
function lD:mi(mj,mf)local mk=0x2000
local ml=0x2000
if mj==2 then mk=mk+0x800 else ml=ml+0x800 end
reload(mk,ml,0x800,mf)end
function lD:mm(me,mj,mf)local mg=0x2000
local mn=0x2000
local mh=0x4300
if mj==2 then mg=mg+0x800 else mn=mn+0x800 end
if me==2 then mg=mg+0x40 else mh=mh+0x40 end
reload(0x4300,mn,0x800,mf)for aG=0,15 do memcpy(mg+aG*0x80,mh+aG*0x80,0x40)end end
function lD:mo(mp)local mq=flr(mp.ap)local mr=flr(mp.aq)if mp.ap%1==0 and mp.aq%1==0 then reload(0x2000,0x2000,0x1000,self:ka(mq,mr))elseif mp.ap%1==0 and mp.aq%1~=0 then self:mi(1,self:ka(mq,mr))self:mi(2,self:ka(mq,mr+1))elseif mp.ap%1~=0 and mp.aq%1==0 then self:md(1,self:ka(mq,mr))self:md(2,self:ka(mq+1,mr))else self:mm(1,1,self:ka(mq,mr))self:mm(1,2,self:ka(mq,mr+1))self:mm(2,1,self:ka(mq+1,mr))self:mm(2,2,self:ka(mq+1,mr+1))end
self.ks=mp end
function lD:lN()local mp=self:mb(self.camera.cm)if self.ks~=mp then self:mo(mp)for ms in all(self.lJ)do local kf,fY=unpack(ms)local ke=self:ix(kf)if ke.B>=0 and ke.B<128 and ke.aG>=0 and ke.aG<32 then mset(ke.B,ke.aG,fY)end end end end
function lD:lL()local m9,ma=self:m8()for kb=0,m9-1 do for ay=0,ma-1 do self:mo(ao(kb,ay))self:m5()end end end
function lD:jO()for jN in all(self.lK)do if jN.b1==1 then local cj=jN:kP()local mt=self.h3:hy()if flr(mt.aq)==cj.aq and cj.ap-8<=mt.ap and mt.ap<cj.ap+9 then return jN end else local mu=jN:kP()+3*aU[jN.b1]local mv=self.h3.cm
if flr(mv.ap)==mu.ap and mu.aq-6<=mv.aq and mv.aq<mu.aq+7 then return jN end end end end
function lD:jX(cm)for jW in all(self.lG)do local mw=cm-jW:kJ()local mx=max(abs(mw.ap),abs(mw.aq))if mx<8 then return jW end end end
function lD:jY(jW)self.lH[jW.aA]=true
local my=kN(jW.aA,jW:kJ(),co.cw.cx)add(self.lI,my)del(self.lG,jW)self.dJ:d9(self.mz,self)end
function lD:mz()dX.dY(8,53,2)sfx(59)O(48)self:mA()dX.dY(8,53,1)O(16)self:mA()end
function lD.mB(mC)return ao(8*(mC.aS+1)+3,8*mC.kn-8),ao(8*(mC.aS+1)+11,8*(mC.kB+1)+8)end
function lD.mD(mE)return ao(8*mE.aQ-11,8*mE.kn-8),ao(8*mE.aQ-3,8*(mE.kB+1)+8)end
function lD:j8(cm,mF)if mF==1 then for kl in all(self.el.km)do local mG,mH=lD.mB(kl)if mG.ap<=cm.ap and cm.ap<=mH.ap and mG.aq<=cm.aq and cm.aq<=mH.aq then return 2 end end else for kl in all(self.el.ko)do local mI,mJ=lD.mD(kl)if mI.ap<=cm.ap and cm.ap<=mJ.ap and mI.aq<=cm.aq and cm.aq<=mJ.aq then return 1 end end end end
function lD:lS()if not self.lE and self.cN and self.h3.cm.ap>=self.cN.kf:aN().ap then self.lE=true
self.dJ:d9(lD.mK,self)end end
function lD:mK()self.h3:hQ()self:mL()O(120)self.cN.h4:f6("sonic")self:mM(1.0)self.dJ:dU(1.0)self:mN()load('picosonic_stage_clear')end
function lD:lM()local mO=peek(24063)poke(24063,0)for B=8,1,-1 do if band(mO,shl(1,B-1))~=0 then self.lH[B]=true
del(self.lG,self.lG[B])end end end
function lD:mN()local mP=0
for B=1,8 do if self.lH[B]then mP=mP+shl(1,B-1)end end
poke(24063,mP)end
function lD:mL()self.cN.h4:f6("rotating")sfx(60)end
function lD:lR()local mQ={}for my in all(self.lI)do my:cW()if not my:kM()then add(mQ,my)end end
for my in all(mQ)do del(self.lI,my)end end
function lD:lU()self:kp()for my in all(self.lI)do my:cl()end end
function lD:lT()self:kx()self:mR()self:mS()self:mT()self:mU()self:kA()end
function lD:mU()self:kp()self.h3:cl()end
function lD:mR()self:kp()for jW in all(self.lG)do if self.camera:eU(jW:kK())then jW:cl()end end end
function lD:mS()self:kp()for jN in all(self.lK)do if self.camera:eU(jN:kK())then jN:cl()end end end
function lD:mT()if self.cN then self:kp()self.cN:cl()end end
function lD:lV()camera()for B=1,#self.lF do local mV=ao(-4+8*B,3)if self.lH[B]then kD.dS(B,mV)else kD.dS(-1,mV)end end end
function lD:mA()reload(0x3420,0x3420,0xc38,"picosonic_ingame.p8")end
function lD:lP()music(0,0,shl(1,0)+shl(1,1)+shl(1,2))end
function lD:mM(mW)if mW then mX=1000*mW else mX=0 end
music(-1,mX)end
local mY=a7(dW)function mY:dL()return{lD()}end
local mZ
function mY.jf()return mZ end
local m_
local function n0(an)if an==1 or an==2 then mZ=not mZ
m_()return true end end
m_=function()menuitem(1,"late jump: <"..(mZ and" on"or"off")..">",n0)end
function mY:dP()dW.dP(self)mZ=true
m_()menuitem(3,"warp to start",function()cS.cU:mN()load('picosonic_ingame')end)menuitem(4,"retry from zero",function()load('picosonic_ingame')end)menuitem(5,"back to title",function()load('picosonic_titlemenu')end)end
local dJ=mY()function _init()dJ.dO=':stage'dJ:dM()end
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

