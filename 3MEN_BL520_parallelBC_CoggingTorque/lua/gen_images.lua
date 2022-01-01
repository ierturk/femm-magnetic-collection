
for n=0,12 do


	open(format("../out/ans/beta_%1$d.ans",15*n))

	mo_showdensityplot(1,0,1.5,0,"bmag")
	mo_hidepoints()

--	mo_hidecontourplot()
--	mo_showvectorplot(2,5)
	mo_savebitmap(format("../out/images/beta_%1$d.bmp",15*n))

	mo_close()

end
