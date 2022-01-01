-- StarGate - Copyright 2010
-- http://erturk.me
-- info@erturk.me

-- Generating Images to Obtain an Animated Images with FEM

-- To obtain images, It is sufficient to run this lua script.
-- Generated images can be found under folder out/images.

-- firstly, rotor element to be rotated should be defined in femm source
-- this example, group number is selected as 8.


source_file = "../source/bldc_motor.fem"	-- source Femm with path
rotor_group = 8				-- rotor element to be rotated
x_rotor = 0				-- x axis center of rotor
y_rotor = 0				-- y axis center of rotor

pole_pair = 4				-- pole pair of machine to be analysed
step_count = 12				-- number of required step

dBeta = 360/(pole_pair/2)/step_count	-- step angle
					-- It is sufficient to ca


open(source_file)			-- open orignal femm source
mi_saveas("../out/temp/temp.fem")	-- save temporay

for n = 0, (step_count - 1) do		-- do repeat

	open("../out/temp/temp.fem")	-- open temporary femm source

	mi_modifycircprop("A",1,0)	-- current in circuit A
	mi_modifycircprop("B",1,0)	-- current in circuit B   
	mi_modifycircprop("C",1,0)	-- current in circuit C
	Beta = n*dBeta;
	
	mi_seteditmode('group')		-- select group mode
	mi_selectgroup(rotor_group)	-- select rotor group to be rotated
	mi_moverotate(x_rotor, y_rotor, -Beta)	-- rotate selected group

    	mi_analyse()			-- do analyse
    
    	mi_loadsolution()		-- load analys

	mo_showdensityplot(1,0,1.5,0,"bmag")	-- show density plot
	mo_hidepoints()				-- hide points

	mo_savebitmap(format("../out/images/beta_%1$d.bmp", Beta*(pole_pair/2))) -- save images

	mo_close()			-- close analyse

end	-- do repeat

remove("../out/temp/temp.fem") -- delete temporary files
remove("../out/temp/temp.ans")

messagebox("!!! Your images are ready in folder out/images !!!")
quit()