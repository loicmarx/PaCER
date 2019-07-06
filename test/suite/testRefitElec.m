% The PaCER Toolbox: testRefitElec.m
%
% Purpose:
%     - test the refitElec function
%
% Author:
%     - Loic Marx, June 2019

global refDataPath
global inputDataPath

% save the current path
currentDir = pwd;

% initialize the test
fileDir = fileparts(which(mfilename));
cd(fileDir);
