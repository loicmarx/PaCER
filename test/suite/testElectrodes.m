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

% generate new outputs
testElectrodes_new = TestElectrodes();



