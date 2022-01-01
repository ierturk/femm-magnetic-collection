dBeta = pi/24

rotor_radius = 15.75
magnet_width = 2.50
rotor_stack_radius = rotor_radius - magnet_width
rot_mag_radius = rotor_radius - magnet_width/2


open("../source/bldc_3men_parallel.fem")
mi_saveas("../source/temp.fem")

for n=0,12 do

	open("../source/temp.fem")

	beta = -n*dBeta

	x1 = rotor_radius*cos(3*pi/4 + beta)
	y1 = rotor_radius*sin(3*pi/4 + beta)

	x2 = rotor_stack_radius*cos(3*pi/4 + beta)
	y2 = rotor_stack_radius*sin(3*pi/4 + beta)

	mi_addnode(x1, y1)
	mi_addnode(x2, y2)
	mi_addsegment(x1, y1, x2, y2)


	if (abs(beta) < pi/4) then

		mi_clearselected()
		mi_selectsegment(x1, y1)
		mi_copyrotate(0, 0, -90, 1, 1)

		x1 = rot_mag_radius*cos(7*pi/8 + beta/2)
		y1 = rot_mag_radius*sin(7*pi/8 + beta/2)
		mi_addblocklabel(x1, y1)
		mi_clearselected()
		mi_selectlabel(x1, y1)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (pi + beta)*180/pi, 8, 0)		
		mi_clearselected()

		x2 = rot_mag_radius*cos(pi/2 + beta)
		y2 = rot_mag_radius*sin(pi/2 + beta)
		mi_addblocklabel(x2, y2)
		mi_clearselected()
		mi_selectlabel(x2, y2)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (-pi/2 + beta)*180/pi, 8, 0)		
		mi_clearselected()

		x3 = rot_mag_radius*cos(pi/8 + beta/2)
		y3 = rot_mag_radius*sin(pi/8 + beta/2)
		mi_addblocklabel(x3, y3)
		mi_clearselected()
		mi_selectlabel(x3, y3)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", beta*180/pi, 8, 0)		
		mi_clearselected()

	elseif (abs(beta) > pi/4) then

		mi_clearselected()
		mi_selectsegment(x1, y1)
		mi_copyrotate(0, 0, 90, 1, 1)

		x1 = rot_mag_radius*cos(3*pi/8 + beta/2)
		y1 = rot_mag_radius*sin(3*pi/8 + beta/2)
		mi_addblocklabel(x1, y1)
		mi_clearselected()
		mi_selectlabel(x1, y1)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (3*pi/2 + beta)*180/pi, 8, 0)		
		mi_clearselected()

		x2 = rot_mag_radius*cos(pi + beta)
		y2 = rot_mag_radius*sin(pi + beta)
		mi_addblocklabel(x2, y2)
		mi_clearselected()
		mi_selectlabel(x2, y2)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (pi + beta)*180/pi, 8, 0)		
		mi_clearselected()

		x3 = rot_mag_radius*cos(-7*pi/8 + beta/2)
		y3 = rot_mag_radius*sin(-7*pi/8 + beta/2)
		mi_addblocklabel(x3, y3)
		mi_clearselected()
		mi_selectlabel(x3, y3)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (pi/2 + beta)*180/pi, 8, 0)		
		mi_clearselected()

	elseif (abs(beta) == pi/4) then

		x1 = rot_mag_radius*cos(3*pi/4)
		y1 = rot_mag_radius*sin(3*pi/4)
		mi_addblocklabel(x1, y1)
		mi_clearselected()
		mi_selectlabel(x1, y1)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (3*pi/4)*180/pi, 8, 0)		
		mi_clearselected()

		x2 = rot_mag_radius*cos(pi/4)
		y2 = rot_mag_radius*sin(pi/4)
		mi_addblocklabel(x2, y2)
		mi_clearselected()
		mi_selectlabel(x2, y2)
		mi_setblockprop("3MEN NdFeB Magnet", 0, 0.25, "", (-3*pi/4)*180/pi, 8, 0)		
		mi_clearselected()

	end


	mi_saveas(format("../out/ans/beta_%1$d.fem",15*n))

	mi_analyse()

	mi_close()

	remove(format("../out/ans/beta_%1$d.fem",15*n))

end

