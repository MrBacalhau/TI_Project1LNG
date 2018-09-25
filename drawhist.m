function [ dados ] = drawhist(inf)
    inf=inf(:); %Transforma a matriz (2d) num array (1d)
    alfabeto = unique(inf);
    if (nargin<1 || nargin >2)
        error('Histograma: Necessarios 2 argumentos.')
    end
    
    dados = histc(inf, alfabeto);
    bar(alfabeto,dados);
    ylabel('Ocorrências');
    xlabel('Alfabeto');

end

