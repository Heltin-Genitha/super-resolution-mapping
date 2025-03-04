 clc;
 close all
 clear all
function [outmap1,m2,n2]=simmap1()
[filename, pathname]=uigetfile('*.*','Select a image');
  if isequal(filename,0) || isequal(pathname,0)
    fn='d:\hel\nf\New Folder1\hel\hel\imageblur2.bmp';
  else
    fn = fullfile(pathname, filename);
  end


a=imread(fn);
imshow(a);
[m1,n1,o1]=size(a);
mapsize=input('Enter size of the mapping window :');
m2=m1*mapsize;
n2=n1*mapsize;

outmap=zeros(m2,n2);
goal1matrix=zeros(m2,n2);
goal2matrix=zeros(m2,n2);
inmatrix=zeros(m2,n2);
energymatrix=zeros(m2,n2);
inmatrix=zeros(mapsize,mapsize);
outmapp11=zeros(m2,n2);
 
a=double(a);

%find class proportions for each pixel and store in b matrix
for i=1:m1
    for j=1:n1
    temp=a(i,j); 
   
    b(i,j)=(temp/255)*100;
    b(i,j)=round(b(i,j));
    end
end
 figure
 imshow(b);

%neural network initialisation in outmap matrix
for ii=1:m1
        for jj=1:n1
        x=(b(ii,jj) /100)*(mapsize*mapsize);
        x=round(x);
                         
        y=(mapsize*mapsize)-x;
               %network initialisation
         if(x==(mapsize*mapsize)) 
                for n = 1:(mapsize*mapsize)
                inmatrix(n) = 0.55;
                end
         else
                   d=magic(mapsize);
                for n = 1:x
                   inmatrix(d(n)) = 0.55;
                end
                for n = x+1:(mapsize*mapsize)
                    inmatrix(d(n))=0.45;
                end
        end
            
               
               
            % mapping neuron output to required map
            for k=1:mapsize
                for l=1:mapsize
                     outmapp1((mapsize*ii)-(mapsize-k),(mapsize*jj)-(mapsize-l))= 255 *( floor( (  1+ tanh(inmatrix(k,l)-0.5))));
                  outmap((mapsize*ii)-(mapsize-k),(mapsize*jj)-(mapsize-l))=  floor( (  1+ tanh(inmatrix(k,l)-0.5)  ));
                outmap((mapsize*ii)-(mapsize-k),(mapsize*jj)-(mapsize-l))=inmatrix(k,l);
                end
            end
        end
end
 figure
 imshow(outmapp1);

counter=0;

 % iteration begins

while counter<=10       
for i=1:m2
    
    for j=1:n2
        
        if(((i-1)>0) && ((j-1)>0) && ((i+1)<=m2) && ((j+1)<=n2) )
            temp1=0.0;
            for k=i-1:i+1
                for l=j-1:j+1
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/8;
            
    
        elseif(((i-1)<1) && ((j-1)<1))
            temp1=0.0;
            for k=i:i+1
                for l=j:j+1
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/3;
            
        elseif(((i+1)>m2) && ((j-1)<1))
            temp1=0.0;
            for k=i-1:i
                for l=j:j+1
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/3;
            
            
        elseif(((i-1)<1) && ((j+1)>n2))
            temp1=0.0;
            for k=i:i+1
                for l=j-1:j
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/3;
            
        
        elseif(((i+1)>m2) && ((j+1)>n2))
            temp1=0.0;
            for k=i-1:i
                for l=j-1:j
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/3;
            
        
        elseif((j-1)<1)
            temp1=0.0;
            for k=i-1:i+1
                for l=j:j+1
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/5;
            
        
        elseif( (j+1)>n2)
            temp1=0.0;
            for k=i-1:i+1
                for l=j-1:j
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/5;
            
            
        elseif( (i-1)<1 )
            temp1=0.0;
            for k=i:i+1
                for l=j-1:j +1
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/5;
            
            
        
        elseif( (i+1)>m2 )
            temp1=0.0;
            for k=i-1:i
                for l=j-1:j +1
                    temp1=temp1+outmap(k,l);
                end
            end
            temp1=(temp1-outmap(i,j))/5;
            
        end
        goal1matrix(i,j) = (floor(1+tanh(temp1-0.5)))*(outmap(i,j)-1.0);
        goal2matrix(i,j) = (1-floor(tanh(temp1-0.5)))*outmap(i,j);
        energymatrix(i,j)=goal1matrix(i,j)+goal2matrix(i,j);
    end
end


ape=zeros(m1,n1);
temp2=0;

%area proportion constraint for each pixel
for f=1:m2
    for g=1:n2
        if ((mod(f,mapsize) == 0) && (mod(g,mapsize) == 0))
            
        temp2=0;
            for ff = f-(mapsize-1) : f
            for gg = g-(mapsize-1):g
                
                temp2=temp2+ (mapsize-1) * floor( (  1+ tanh(outmap(ff,gg)-0.5)  ));
               
            end
            end
                
                ape((f/mapsize),(g/mapsize))=temp2;
        end     
 end
 end
 
prop=b-ape;
        
%energy
for f=1:m2
    for g=1:n2
        if ((mod(f,mapsize) == 0) && (mod(g,mapsize) == 0))
            
            for ff = f-(mapsize-1) : f
            for gg = g-(mapsize-1):g
                
        energymatrix(ff,gg)=energymatrix(ff,gg)+ (prop(f/mapsize,g/mapsize)/(mapsize*mapsize));
               
            end
            end
                
        end
               
    end
 end


for f=1:m2
    for g=1:n2
        
        if(energymatrix(f,g)<0)
            outmap(f,g)=outmap(f,g)+0.05;
        end
        if(energymatrix(f,g)>0)
            outmap(f,g)=outmap(f,g)-0.05;
        end
        outmap1(f,g)= 255 *(floor((1+ tanh(outmap(f,g)-0.5))));
    end
end
  figure
 imshow(outmap1);
 
counter=counter+1;
end
figure,imshow(uint16(outmap1));
 imsave
