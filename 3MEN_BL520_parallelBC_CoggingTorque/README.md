# ANALYSIS COGGING TORQUE OF 3MEN BL520-110 3-PHASE BLDC MOTOR

## FILES STRUCTURE
```
    ROOT+
	|
	+lua	(includes LUA scripts)
	|
	+source	(includes FEM source)
	|
	+out+	(includes FEMM outputs)
	|   |
	|   +ans	(includes FEMM ans files)
	|   |
	|   +images	(includes FEMM ans files bitmap images)
	|   |
	|   +torques.txt	(torqe and flux linkages data versus torque angle)	
	|
	+3MEN_BL520_beta_0.bmp	(image for beta = 0 degree)
	|
	+Animated_3MEN_BL520.gif	(animated image for beta over 180 degree)
	|
	+CoggingTorqueVersusTorqueAngle.png	(graphic cogging torque versus torque angle)
	|
	+hpb_BL150-0 -E.pdf	(Datasheet 3MENBL520-100 BLDC Motor)
	|
	+ReadMe.txt	(this file)
```
## USAGE

It's simple.
```
	First, 	Open FEMM

	Second, Run /lua/gen_ans_files.lua for FEM ans file.
		It's generate FEM ans file over 180 degree in /out/ans folder.

	Third,	Run /lua/calc_torque.lua for obtain torque and flux linkage data in folder /out.
		You can draw graphic what You want using generated torques.txt.

	Fourth,	If You want generate images, You can run /lua/gen_images.lua.
		It's generate images over 180 degree in /out/images folder.
```
If you encounter any problem, You can open a issue here.
____
Copyright © 2021 StarGate, Inc.