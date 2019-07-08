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

% input argument 
inputs = load('input_refitElec.mat');

% load the reference data
refData = load('refData_testRefitElec.mat');

% setup tolerance value for comparison
tol = 10-6; 

% generate the new output (only three inputs argument)
[refitReZeroedElecMod_new, filteredIntensity_new, skelScaleMm_new] = refitElec(inputs.initialPoly, inputs.pointCloudWorld, inputs.voxelValues);

% compare the reference data with the generated output 
for k=1:length(filteredIntensity_new)
    assert(norm(filteredIntensity_new(k) - refData.filteredIntensity_ref(k)) < tol);
end

for k=1:length(skelScaleMm_new)
    assert(norm(skelScaleMm_new(k) - refData.skelScaleMm_ref(k)) < tol);
end
