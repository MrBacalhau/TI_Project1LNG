file=input('which file?\n','s');
file=strcat('dados\',file);
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

exe=input('Que exercicio?\n', 's');
switch exe
    case '3'
        hist=drawhist(Y, true);
        entropia(hist);
    case '4'
        hist=drawhist(Y, false);
        HL = hufflen(hist);
        array = hist/sum(hist);
        resposta = sum( array .* HL);
        fprintf('Média de bits por símbolo: %f\n',resposta)
    case '5'
            
    case '6'
        
    otherwise
        return
end

