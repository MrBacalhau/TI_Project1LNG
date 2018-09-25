file='dados\homer.bmp';
[filepath,name,ext] = fileparts(file);

if(ext == '.txt')
    id = fopen(file);
    Y = fread(id);
    fclose(id);
elseif(ext == '.wav')
    [Y, fs]= audioread(file);
    inf= audioinfo(file);
elseif(ext== '.bmp')
    Y=imread(file);
    inf=imfinfo(file);
end
    
    hist=drawhist(Y);
    %disp('Entropia de %s: %f\n', name, entropia(hist));

