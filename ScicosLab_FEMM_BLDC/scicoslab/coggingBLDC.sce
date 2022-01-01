// StarGate - Copyright 2010
// http://erturk.me
// info@erturk.me

clear;

disp('Roters1b: Simulation of a Tapered Plunger Magnet');
disp('StarGate-TR - Copyright 2010');
disp('http://www.stargate-tr.com');
disp('ierturk@stargate-tr.com');

exec('..\scicosFEMMlab\ScicosFemmLab.sci',-1);
openfemm;

dBeta = 7.5;
Te = 0;
Theta = 0;

for i=0:12,

    opendocument('../source/bldc_motor.fem');
    mi_saveas('../out/ans/temp.fem');

    mi_modifycircprop("A",1,0);
    mi_modifycircprop("B",1,0);   
    mi_modifycircprop("C",1,0);
	
	Beta = -i*dBeta;
	
	Theta(i+1) = Beta;

	mi_seteditmode('group');
	mi_selectgroup(8);
	mi_moverotate(0, 0, Beta);
    mi_analyse();
    
    mi_loadsolution;
    mo_seteditmode('area');
	mo_groupselectblock(8);

	Te(i+1) = mo_blockintegral(22);

    mo_clearblock();
	mo_showdensityplot(1,0,1.5,0,'bmag');
	mo_hidepoints();

	mo_hidecontourplot();
	mo_savebitmap(sprintf('../out/images/Beta_%1d.bmp',15*i));
	mo_close();
	
    mi_close();

end;

plot(-Theta, Te)
xlabel('Torque Angle [deg.]');
ylabel('Torque [N.m]');
title('Torque Versus Torque Angle');
xgrid;

closefemm;

//clear;
