function commit_merges(dbToken, outputFile,serviceLocation)
    % commit_merges - this commits the local redis merge table to OCP
    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% © [2014] The Johns Hopkins University / Applied Physics Laboratory All Rights Reserved. Contact the JHU/APL Office of Technology Transfer for any additional rights.  www.jhuapl.edu/ott
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%    http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% Setup OCP interface
    oo = OCP();  
    
    if exist('serviceLocation','var')
        oo.setServerLocation(serviceLocation);
    end
    
    oo.setAnnoToken(dbToken);
    
    
    %% Consolidate redis merge table
    m = BatchMergeTool();
    m.consolidate();
    
    %% Write csv file
    m.write_csv(outputFile);
    
    %% Push file to OCP    
    % TBD    
    
end

