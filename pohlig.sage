def pohligHellmanPGH(p,g,h):
  #g must be small
	F=IntegerModRing(p)
	g=F(g)
	h=F(h)
	G=[]
	H=[]
	X=[]
	c=[]
	N=factor(p-1)
	for i in range(0,len(N)):
		G.append(g^((p-1)/(N[i][0]^N[i][1])))
		H.append(h^((p-1)/(N[i][0]^N[i][1])))
		X.append(log(H[i],G[i]))
		c.append((X[i],(N[i][0]^N[i][1])))
		
	print "G=",G,"\n","H=",H,"\n","X=",X

	#Using Chinese Remainder
	c.reverse()
	
	for i in range(len(c)):
		if len(c) < 2:
			break
		t1=c.pop()
		t2=c.pop()
		r=crt(t1[0],t2[0],t1[1],t2[1])
		m=t1[1]*t2[1]
		c.append((r,m))
	
	print "(x,p-1) =",c[0]
end

