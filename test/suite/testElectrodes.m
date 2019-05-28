% The PaCER Toolbox: testElectrodes.m
%
% Purpose:
%     - test the Electrodes function (Classe) 
%
% Author:
%     - Loic Marx, May 2019

% save the current path
currentDir = pwd;

% initialize the test
fileDir = fileparts(which(mfilename));
cd(fileDir);

% load the reference data into the test file
refData = load('refData_testElectrodes.mat');

testElectrode = TestElectrodes();

% compare if the structures have been correctly defined  
assert(testElectrodes.obliqueViewRadius() == testElectrodes_ref.obliqueViewRadius())
%assert(testElectrodes_ref.originalEntryPoint() == isnan(NaN(3,1)))
assert(testElectrodes_ref.marker() == 'x')
assert(testElectrodes_ref.diameter()== 4 )
%assert(testElectrodes_ref.lineStyle() == logical('--'))
%assert(testElectrodes_ref.color() == [0.2 1 0.4])
assert(testElectrodes_ref.show2DProjection() == 1)
assert(testElectrodes_ref.currentDepthValue() == 0)
%assert(testElectrodes_ref.intersections() == zeros(2,5)) 
assert(testElectrodes_ref.ELECTRODE_DISTANCE() == 2.0 ) 
assert(testElectrodes_ref.ELECTRODE_RECORDED_INTERSECTION_COLOR() == 'r') 
assert(testElectrodes_ref.ELECTRODE_INTERSECTION_COLOR() == 'g') 
%assert(testElectrodes_ref.ELECTRODE_COLOR() == [0 1 1] ) 
assert(testElectrodes_ref.ELECTRODE_PLOT_EXTENSION_MM() == 15)
assert(testElectrodes_ref.DISPLAY_TARGET_POINTS() == false)
assert(testElectrodes_ref.objectId() == 44)


%get.electrodesEntryPoints(testElectrodes_ref)
%assert(isequal(testElectrodes_ref.obliqueViewRadius, testElectrodes_new.obliqueViewRadius))

