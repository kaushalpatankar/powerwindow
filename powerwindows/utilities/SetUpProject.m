function SetUpProject()
% SetUpProject  Configure the environment for this project
%   Set up the environment for the current project. This function is set to
%   Run at Startup.

%   Copyright 2013 The MathWorks, Inc.

% Use Simulink Project API to get the current project:
p = slproject.getCurrentProject;

projectRoot = p.RootFolder;

% Set the location of slprj to be the "work" folder of the current project:
myCacheFolder = fullfile(projectRoot, 'work');
if ~exist(myCacheFolder, 'dir')
    mkdir(myCacheFolder)
end
Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
   'CodeGenFolder', myCacheFolder);

% Set the path for this project:
folders = ProjectPaths();
for jj=1:numel(folders)
    addpath( fullfile(projectRoot, folders{jj}) );
end
