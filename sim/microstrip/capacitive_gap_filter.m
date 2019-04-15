%
% Tutorials / MSL_NotchFilter
%
% Describtion at:
% http://openems.de/index.php/Tutorial:_Microstrip_Notch_Filter
%
% Tested with
%  - Matlab 2011a / Octave 4.0
%  - openEMS v0.0.33
%
% (C) 2011-2015 Thorsten Liebig <thorsten.liebig@gmx.de>

close all
clear
clc

%% setup the simulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
physical_constants;
unit = 1e-6; % specify everything in um
Substrate_x = 60000;
Substrate_y = 20000;

%MSL_length = 50000;
MSL_width = 933;
substrate_thickness = 500;
substrate_epr = 4.5;
stub_length = 12e3;
f_max = 5e9;


centergap = 1400;
outergap = 308;
resonant_elem = 19930;


%% setup FDTD parameters & excitation function %%%%%%%%%%%%%%%%%%%%%%%%%%%%
FDTD = InitFDTD();
FDTD = SetGaussExcite( FDTD, f_max/2, f_max/2 );
BC   = {'PML_8' 'PML_8' 'MUR' 'MUR' 'PEC' 'MUR'};
FDTD = SetBoundaryCond( FDTD, BC );

%% setup CSXCAD geometry & mesh %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CSX = InitCSX();
resolution = c0/(f_max*sqrt(substrate_epr))/unit / 30; % resolution of lambda/50
%mesh.x = SmoothMeshLines( [0 MSL_width/2+[2*resolution/3 -resolution/3]/4], resolution/4, 1.5 ,0 );
%mesh.x = SmoothMeshLines( [-MSL_length mesh.x MSL_length], resolution, 1.5 ,0 );
%mesh.x = SmoothMeshLines([-MSL_width MSL_width], resolution/4, 1.5,
%0);
%mesh.x11 = SmoothMeshLines( [0 MSL_width/2+[2*resolution/3
%-resolution/3]/4], resolution/4, 1.5 ,0 );
mesh.x11 = SmoothMeshLines( [-(centergap/2 + resonant_elem + outergap)+[2*resolution/3 -resolution/3]/8], resolution/8, 1.5 ,0 );
mesh.x12 = SmoothMeshLines( [-(centergap/2 + resonant_elem)+[-2*resolution/3 resolution/3]/8], resolution/8, 1.5 ,0 );

mesh.x1 = SmoothMeshLines([-(centergap/2 + resonant_elem + outergap*2) mesh.x11 mesh.x12 -(centergap/2 + resonant_elem - outergap)], resolution/4, 1.5 ,0 );

mesh.x2 = SmoothMeshLines( [0 centergap/2+[2*resolution/3 -resolution/3]/4], resolution/4, 1.5 ,0 );
mesh.x2 = SmoothMeshLines([-centergap -mesh.x2 mesh.x2 centergap], resolution/4, 1.5 ,0 );

mesh.x31 = SmoothMeshLines( [(centergap/2 + resonant_elem)+[2*resolution/3 -resolution/3]/8], resolution/8, 1.5 ,0 );
mesh.x32 = SmoothMeshLines( [(centergap/2 + resonant_elem +outergap)+[-2*resolution/3 resolution/3]/8], resolution/8, 1.5 ,0 );
mesh.x3 = SmoothMeshLines([(centergap/2 + resonant_elem - outergap) mesh.x31 mesh.x32 (centergap/2 + resonant_elem + outergap*2)], resolution/4, 1.5 ,0 );

mesh.x = SmoothMeshLines([-Substrate_x mesh.x1 mesh.x2 mesh.x3 Substrate_x], resolution, 1.5 ,0 );

mesh.y = SmoothMeshLines( [0 MSL_width/2+[-resolution/3 +resolution/3*2]/4], resolution/4, 1.5 ,0 );
mesh.y = SmoothMeshLines([-MSL_width -mesh.y mesh.y MSL_width], resolution/4, 1.5 ,0 );
mesh.y = SmoothMeshLines([-Substrate_y/2 mesh.y Substrate_y/2], resolution, 1.5 ,0 );


%mesh.y = SmoothMeshLines( [0 MSL_width/2+[-resolution/3 +resolution/3*2]/4], resolution/4 , 1.5 ,0);
%mesh.y = SmoothMeshLines( [-15*MSL_width -mesh.y mesh.y stub_length+[-resolution/3 +resolution/3*2]/4 15*MSL_width+stub_length], resolution, 1.3 ,0);
mesh.z = SmoothMeshLines( [linspace(0,substrate_thickness,5) 10*substrate_thickness], resolution, 1.5 ,0 );
CSX = DefineRectGrid( CSX, unit, mesh );

%% substrate
CSX = AddMaterial( CSX, 'RO4350B' );
CSX = SetMaterialProperty( CSX, 'RO4350B', 'Epsilon', substrate_epr );
start = [mesh.x(1),   mesh.y(1),   0];
stop  = [mesh.x(end), mesh.y(end), substrate_thickness];
CSX = AddBox( CSX, 'RO4350B', 0, start, stop );

%% MSL port
CSX = AddMetal( CSX, 'PEC' );
portstart = [ mesh.x(1), -MSL_width/2, substrate_thickness];
portstop  = [ -(centergap/2 + resonant_elem + outergap),  MSL_width/2, 0];
%[CSX,port{1}] = AddMSLPort( CSX, 999, 1, 'PEC', portstart, portstop,
%0, [0 0 -1], 'ExcitePort', true, 'FeedShift', 10*resolution,
%'MeasPlaneShift',  Substrate_x/3);
[CSX,port{1}] = AddMSLPort( CSX, 999, 1, 'PEC', portstart, portstop, 0, [0 0 -1], 'ExcitePort', true, 'FeedShift', 10*resolution);

portstart = [mesh.x(end), -MSL_width/2, substrate_thickness];
portstop  = [(centergap/2 + resonant_elem + outergap)          ,  MSL_width/2, 0];
[CSX,port{2}] = AddMSLPort( CSX, 999, 2, 'PEC', portstart, portstop, 0, [0 0 -1] );

%% Filter-stub

%% resonant element 1
start = [-(centergap/2 + resonant_elem),  -MSL_width/2, substrate_thickness];
stop = [-(centergap/2),  MSL_width/2, substrate_thickness];
CSX = AddBox( CSX, 'PEC', 999, start, stop );


%% resonant element 2
start = [(centergap/2),  -MSL_width/2, substrate_thickness];
stop = [(centergap/2 + resonant_elem),  MSL_width/2, substrate_thickness];
CSX = AddBox( CSX, 'PEC', 999, start, stop );
 
%% write/show/run the openEMS compatible xml-file
Sim_Path = 'tmp';
Sim_CSX = 'msl.xml';

[status, message, messageid] = rmdir( Sim_Path, 's' ); % clear previous directory
[status, message, messageid] = mkdir( Sim_Path ); % create empty simulation folder

WriteOpenEMS( [Sim_Path '/' Sim_CSX], FDTD, CSX );
CSXGeomPlot( [Sim_Path '/' Sim_CSX] );
pause;
RunOpenEMS( Sim_Path, Sim_CSX );

%% post-processing
close all
f = linspace( 1e6, f_max, 1601 );
port = calcPort( port, Sim_Path, f, 'RefImpedance', 50);

s11 = port{1}.uf.ref./ port{1}.uf.inc;
s21 = port{2}.uf.ref./ port{1}.uf.inc;

plot(f/1e9,20*log10(abs(s11)),'k-','LineWidth',2);
hold on;
grid on;
plot(f/1e9,20*log10(abs(s21)),'r--','LineWidth',2);
legend('S_{11}','S_{21}');
ylabel('S-Parameter (dB)','FontSize',12);
xlabel('frequency (GHz) \rightarrow','FontSize',12);
ylim([-40 2]);

