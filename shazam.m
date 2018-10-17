function [  ] = shazam( Y, Yquery, passo, alphabeto )
        infmut=[];
        histquery=histc(Yquery, alphabeto);
        Pquery=histquery/sum(histquery);
    for i=1: passo:length(Y)-length(Yquery)
        Ysearch=Y(i:i+length(Yquery));
        histsearch=histc(Ysearch, alphabeto);
        Psearch=histsearch/sum(histsearch);
        PaPb=Pquery.*Psearch;
        PaPb(PaPb == 0) = 1;
        eqCount=zeros(1,length(alphabeto));
        for j=1:length(Yquery)
            if(Ysearch(j)==Yquery(j))
                a=find(alphabeto==Y(j));
                eqCount(a)=eqCount(a)+1;
            end
        end
        eqCount(eqCount==0)=1;
        probconj=eqCount/(sum(eqCount));
        infmut(end+1)=sum(probconj.*log2(probconj./PaPb));
    end
    disp (infmut);

end

