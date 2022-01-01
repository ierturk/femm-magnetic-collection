outfile = "../out/torques.txt"
fid=openfile(outfile,"w")
write(fid, "\nTorque and Flux Linkages of Each Phase Windage vs. Torque Angle\n\n")
write(fid, "\nAngle[deg]\tTorque[Nm]\t\tFlux A[Wb]\t\tFlux B[Wb]\t\tFlux C[Wb]\n")
closefile(fid)



for n=0,12 do

	open(format("../out/ans/beta_%1$d.ans",15*n))

	mo_seteditmode("area")
	mo_groupselectblock(8)
	Te = mo_blockintegral(22)


	v1, v2, phi_a = mo_getcircuitproperties("A")
	v1, v2, phi_b = mo_getcircuitproperties("B")
	v1, v2, phi_c = mo_getcircuitproperties("C")

	fid=openfile(outfile,"a")
	write(fid, 15*n, ",\t\t", 2*Te, ",\t", phi_a, ",\t", phi_b, ",\t", phi_c, "\n")
	closefile(fid)

	mo_close()

end
