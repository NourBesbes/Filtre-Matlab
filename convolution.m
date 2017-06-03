function convolution = convolution(I,Noy)
[rows,cols]= size(I) ;
[rowsNoy,~]= size(Noy) ;
nbLignesAjout= floor(rowsNoy/2);
imageCadree=zeros(rows+2*nbLignesAjout,cols+2*nbLignesAjout);


for i=1:rows
    for j=1:cols
        imageCadree(i+nbLignesAjout,j+nbLignesAjout)=I(i,j);
    end
end
%filtre
imageFiltree=zeros(rows+2*nbLignesAjout,cols+2*nbLignesAjout);
for i=1+nbLignesAjout:rows+nbLignesAjout
    for j=1+nbLignesAjout:cols+nbLignesAjout
        S=0;
        i2=1;
        
        for k=i-nbLignesAjout:i+nbLignesAjout
            j2=1;
            for p=j-nbLignesAjout:j+nbLignesAjout
                S=S+Noy(i2,j2)*imageCadree(k,p);
               
                j2= j2+1;
            end
            i2= i2+1;
        end
        imageFiltree(i,j)=S;
    end
end
convolution =imageFiltree;

