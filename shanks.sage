def shanksPGH(p,g,h):
	F=IntegerModRing(p)
	g=F(g)
	h=F(h)
	N=g.multiplicative_order()
	n=1+floor(sqrt(N))
	list1=[]
	list2=[]

	for j in range(1,n+1):
	  list1.append(g^j)
	  list2.append(h*(g^(-n))^j)

	print "list1:",list1,"\n\n------------\n\nlist2:",list2
	
	for k in list1:
	  for m in list2:
	    if(k==m):
				print "list1 :",list1.index(k)+1
				print "list2 :",list2.index(m)+1
				a=F(list1.index(k)+1)
				b=F(list2.index(m)+1)
				x=F(a+b*n)
				print "x =",x
				if g^x == h:
					print "CHECKING OK"
				else:
					print "BAD!!"
					
				return
end