function [ histograma ] = drawhist( inf )
    P=P(:); %Transforma a matriz (2d) num array (1d)
    
    if (nargin<2 || nargin >2)
        error('Histograma: Necessarios 2 argumentos.')
    end
    
    dados = histogram(P, alfabeto);
    bar(alfabeto,dados);
    ylabel('Ocorrências');
    xlabel('Alfabeto');

end

