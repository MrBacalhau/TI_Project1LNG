file='dados\song01.wav';
[filepath,name,ext] = fileparts(file);

if(ext == '.txt')
    id = fopen(file);
    inf = fread(id);
elseif(ext == '.wav')
    [id, fs]= audioread(file);
    inf= audioinfo(file);
elseif(ext== '.bmp')
   % id=
    %inf=
end
    
    %hist=drawhist(id, inf);
    %disp('Entropia de %s: %f\n', name, entropia(hist));