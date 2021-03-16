%%% Matlab script written by Stefano Tognazzi (MATLAB R2019a)
%%% This script creates an ERODE file that can be used to compute both
%%% exact and approximate role assignment for epsilon 1 to 25 for all the
%%% multiplex files .edges in the same folder


files = dir(fullfile('.','*.edges'));
[n,inutile] = size(files);

experimentPrefix = "experiments";

filename = strcat(experimentPrefix , '.ode');
fid = fopen(filename, 'w');

for i = 1:n
    fname = files(i).name;
    disp(i);
    disp(fname);
    C = strsplit(fname,'.');
    baseName = char(C(1));
    disp(baseName);
    
    sparseCRNMLNgenFunction( baseName ); 
    
    
    row = ['begin model mod' , num2str(i) ];
    fprintf(fid, '%s\n' , row);
    
    row = [ 'load(fileIn="crn_' , baseName , '._ode")' ];
    fprintf(fid, '%s\n' , row);
    
    row = [ 'reduceBE(prePartition=USER,reducedFile="red_' , baseName , '")' ];
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=1,prePartition=USER,matlabScript="', baseName , '1",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=2,prePartition=USER,matlabScript="', baseName , '2",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=3,prePartition=USER,matlabScript="', baseName , '3",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=4,prePartition=USER,matlabScript="', baseName , '4",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=5,prePartition=USER,matlabScript="', baseName , '5",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=6,prePartition=USER,matlabScript="', baseName , '6",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=7,prePartition=USER,matlabScript="', baseName , '7",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=8,prePartition=USER,matlabScript="', baseName , '8",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=9,prePartition=USER,matlabScript="', baseName , '9",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=10,prePartition=USER,matlabScript="', baseName , '10",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=11,prePartition=USER,matlabScript="', baseName , '11",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=12,prePartition=USER,matlabScript="', baseName , '12",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=13,prePartition=USER,matlabScript="', baseName , '13",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=14,prePartition=USER,matlabScript="', baseName , '14",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=15,prePartition=USER,matlabScript="', baseName , '15",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=16,prePartition=USER,matlabScript="', baseName , '16",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=17,prePartition=USER,matlabScript="', baseName , '17",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=18,prePartition=USER,matlabScript="', baseName , '18",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=19,prePartition=USER,matlabScript="', baseName , '19",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=20,prePartition=USER,matlabScript="', baseName , '20",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=21,prePartition=USER,matlabScript="', baseName , '21",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=22,prePartition=USER,matlabScript="', baseName , '22",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=23,prePartition=USER,matlabScript="', baseName , '23",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=24,prePartition=USER,matlabScript="', baseName , '24",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = [ 'approximateBDE(epsilon=25,prePartition=USER,matlabScript="', baseName , '25",paramsToPerturb=ALL)' ];  
    fprintf(fid, '%s\n' , row);
    
    row = ['end model' ];
    fprintf(fid, '%s\n' , row);
end