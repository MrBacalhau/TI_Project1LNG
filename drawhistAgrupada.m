function [entro_agrupada ] = drawhistAgrupada( info, alfabeto )
info=info(:);
aux=zeros(length(alfabeto),length(alfabeto));
[X,Y] = meshgrid(alfabeto); 
matrizagrupada = [X(:) Y(:)];
if mod(length(info),2)~=0    %torna qualquer matriz numa matriz de nmr de elementos par
     info(length(info))=[];   
end
info = reshape(info,2,length(info)/2);
aux=aux(:);
for i=1:1:length(info)
     for j=1:1:length(matrizagrupada)
            if(info(1,i)==matrizagrupada(j,1) && info(2,i)==matrizagrupada(j,2))
                aux(j,1) = aux(j,1) +1;
                break;
            end
     end
end
bar(aux);
entro_agrupada=(entropia(aux)/2);
end
