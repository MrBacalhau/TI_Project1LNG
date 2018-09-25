file='dados\english.txt';
[filepath,name,ext] = fileparts(file);

if(ext == '.txt')
    id = fopen(file);
    inf = fread(id);
    fclose(id);
elseif(ext == '.wav')
    [id, fs]= audioread(file);
    inf= audioinfo(file);
elseif(ext== '.bmp')
    id=imageread(file);
    inf=imageinfo(file);
end
    
    %hist=drawhist(id, inf);
    %disp('Entropia de %s: %f\n', name, entropia(hist));