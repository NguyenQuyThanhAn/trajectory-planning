clc; clear;
ur10 = loadrobot('universalUR10');
%add fake pen link
 penLength=0.1;
 penBody = rigidBody('Pen');
 penJoint = rigidBodyJoint('PenLink','fixed');
 T = rotm2tform([0 1 0;0 0 1;1 0 0]) * trvec2tform([0 0.1 0]); %010 001 100
 setFixedTransform(penJoint,T);
 penBody.Joint = penJoint;
 addBody(ur10,penBody,'ee_link');
%add fake pen mesh
addVisual(ur10.Bodies{10},'Mesh','cylinder.stl',trvec2tform([0 0 0.1]) * axang2tform([0 1 0 pi]));
 %Configure the data format and show the robot in the home position
ur10.DataFormat = 'row';
% showdetails(ur10);
%config = [0 -pi/2 0 -pi/2 0 0];
%show(ur10,config);




