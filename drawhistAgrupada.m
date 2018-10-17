function [ H ] = drawhistAgrupada( inf, show )
    inf=inf(:); %Transforma a matriz (2d) num array (1d)
    alfabeto=unique(inf);
    H=zeros(length(alfabeto),length(alfabeto));
    new_alfa={};
    for i=1:length(inf)/2-1
        a=find(alfabeto==inf(i*2));
        b=find(alfabeto==inf(i*2+1));
        if(H(a,b)==0)
           new_alfa{1,end+1}=inf(i*2);
           new_alfa{2,end}=inf(i*2+1);
        end
        H(a,b)=H(a,b)+1;
    end
    new_H=zeros(1,length(new_alfa));
    for j=1:length(new_alfa)
        a=find(alfabeto==new_alfa{1,j});
        b=find(alfabeto==new_alfa{2,j});
        new_H(j)=H(a,b);
    end
    
    if show
        bar(new_H);
        %xticklabels(new_alfa);
        ylabel('Ocorrências');
        xlabel('Alfabeto');
    end
end

