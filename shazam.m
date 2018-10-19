function [ valores ] = shazam( Y, Yquery, passo, alphabeto )
        infmut=[];
        histquery=histc(Yquery, alphabeto);
        Pquery=histquery/sum(histquery);
    for i=1: passo:abs(length(Y)-length(Yquery))
        Ysearch=Y(i:i+length(Yquery));
        histsearch=histc(Ysearch, alphabeto);
        Psearch=histsearch/sum(histsearch);
        %PaPb=Pquery.*Psearch;
        %PaPb(PaPb == 0) = 1;
        eqCount=zeros(length(alphabeto),length(alphabeto));
        for j=1:length(Yquery)
            %if(Ysearch(j)==Yquery(j))
            a=find(alphabeto==Ysearch(j));
            b=find(alphabeto==Yquery(j));
            eqCount(a,b)=eqCount(a,b)+1;
            %end
        end
        probconj=eqCount./sum(sum(eqCount));
        probconj=nonzeros(probconj);
        infmut(end+1)=entropia6(Pquery)+entropia6(Psearch)-entropia6(probconj);
        valores = infmut;
        
        %infmut(end+1)=probconj.*log2(probconj./PaPb);
    end
    disp (infmut);

end

