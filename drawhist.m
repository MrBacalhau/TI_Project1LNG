function [ dados ] = drawhist(inf, show)
    inf=inf(:); %Transforma a matriz (2d) num array (1d)
    alfabeto = unique(inf);
    dados = histc(inf, alfabeto);
    if show
        bar(alfabeto,dados);
        ylabel('Ocorrências');
        xlabel('Alfabeto');
    end
end

