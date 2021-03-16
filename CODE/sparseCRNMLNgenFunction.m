function [ row ] = sparseCRNMLNgenFunction ( name )

    %%% Matlab function written by Stefano Tognazzi (MATLAB R2019a)
    %%% The input is the base name of the instance, for example "florence" 
    %%% if the instance file containing the multiplex is called
    %%% "florence.edges" 
    
    %%% The output is the ERODE model file that will be used for the
    %%% reduction
    %%% This function implements the translation from the multiplex (input)
    %%% to a PIVP and it does so by directly generating the associated
    %%% Chemical Reaction Network (CRN). 
    

    fname = strcat(name, '.edges'); 
    prefix = strcat( 'crn_' , name ); 
    
    data = readmatrix(fname, 'FileType' , 'text' ); 


    meta_info = max(data);
    temp = size(data(:,1));
    data_length = size(data,1)

    n_layers = meta_info(1)
    n_nodes = max(meta_info(2),meta_info(3));
    n_edges = temp(1)




    filename = strcat(prefix , '._ode');
    fid = fopen(filename, 'w');

    row = ['begin model mod'];
    fprintf(fid, '%s\n' , row);

    row = [ 'begin init'];
    fprintf(fid, '%s\n' , row);

    for i = 1:n_nodes
    row = [ 'x' , num2str(i) , ' = 1' ] ; 
    fprintf(fid, '%s\n' , row);
    end

    for l = 1:n_layers
    row = [ 't' , num2str(l) , ' = 1' ] ; 
    fprintf(fid, '%s\n' , row);
    end

    row = ['end init'];
    fprintf(fid, '%s\n' , row);
    
    row = ['begin partition'];
    fprintf(fid, '%s\n' , row);

    row = ['{']
    for i = 1:n_nodes
        if i < n_nodes    
            row = [ row, 'x' , num2str(i) ,','] ; 
        end
        if i == n_nodes
            row = [ row, 'x' , num2str(i) ] ; 
        end
    end
    row = [row, '},{'];
    for l = 1:n_layers
        if l < n_layers 
            row = [ row , 't' , num2str(l) , ',' ] ; 
        end
        if l == n_layers
            row = [ row , 't' , num2str(l) ];
        end
    end
    
    row = [row, '}']; 
    fprintf(fid, '%s\n' , row);

    row = ['end partition'];
    fprintf(fid, '%s\n' , row);    
    
    
    row = ['begin reactions']; 
    fprintf(fid, '%s\n' , row);

    for i = 1:n_nodes
    row = [ ];

    
    %% Here we filter from the matrix only the things that we need to write the reactions
    filtro = data(:,2) == i ; 

    useful = data(filtro,:);

    n_useful = size(useful,1);

    for k = 1:n_useful
    row = [ 'x', num2str(useful(k,3)) , ' + t' , num2str(useful(k,1)) , ' -> x' , num2str(useful(k,2)) , ' + x', num2str(useful(k,3)) , ' + t' , num2str(useful(k,1)) , ' , ' , num2str(useful(k,4)) ]; 
    fprintf(fid, '%s\n' , row);
    end

    %%%% We do it also in the other direction because it is undirected
    filtro = data(:,3) == i ; 

    useful = data(filtro,:);

    n_useful2 = size(useful,1);

    for k = 1:n_useful2
    row = [ 'x', num2str(useful(k,2)) , ' + t' , num2str(useful(k,1)) , ' -> x' , num2str(useful(k,3)) , ' + x', num2str(useful(k,2)) , ' + t' , num2str(useful(k,1)) ' , ' , num2str(useful(k,4)) ]; 
    fprintf(fid, '%s\n' , row);
    end

    end

    for l = 1:n_layers

    row = [ ];
    
    %%% Here we filter the rows of the matrix that we need to write the
    %%% reactions for the layers
    filtro = data(:,1) == l ; 

    useful = data(filtro,:); 

    n_useful = size(useful,1); 

    for k = 1:n_useful 
    %%%% We have to multiply by 2 so we can implicitly and directly take
    %%%% care of both sides of the undirected edges
    row = [ 'x' , num2str(useful(k,2)) , ' + x' , num2str(useful(k,3)) , ' -> t' , num2str(useful(k,1)) , ' + x' , num2str(useful(k,2)) , ' + x' , num2str(useful(k,3)) , ' , ' , num2str( 2*useful(k,4) ) ] ; 
    fprintf(fid, '%s\n' , row);
    end



    end



    row = ['end reactions']; 
    fprintf(fid, '%s\n' , row);



    row = ['end model'];
    fprintf(fid, '%s\n' , row);

    fclose(fid);   
    
end    
