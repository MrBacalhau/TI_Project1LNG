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
        histAgr=drawhistAgrupada(Y, true);
        entropia(histAgr);
    case '6a'
        passo=1;
        Y=[6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4 3 2 2 7 3 5 2 7 4 9 9 6];
        Q=[2 6 4 10 5 9 5 8 0 8];
        alphabeto=[0:10];
        shazam(Y, Q, passo, alphabeto );
    case '6b'
        alphabeto=unique(Y);
        query=input('which query file?\n','s');
        query=strcat('dados\',query);
        [Yquery, fsquery]= audioread(query);
        %passo=input('what is the step?\n','s');
        %passo=str2num(passo);
        %passo=length(Yquery)*passo;
        %passo=round(passo);
        passo = 0.25*length(Yquery);
        [valores]=shazam(Yquery, Y, passo, alphabeto);
        figure(1);
        plot(valores);
    case '6c'
        alphabeto = unique(Y);
        query=input('which query file?\n','s');
        query=strcat('dados\',query);
        [Yquery, fsquery]= audioread(query);
        passo = 0.25*length(Yquery);
        [valores]=shazam(Y, Yquery, passo, alphabeto);
        figure(1);
        plot(valores);
        
    otherwise
        return
end

