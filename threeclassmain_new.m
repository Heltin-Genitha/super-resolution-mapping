% clc;
% clear all;
% close all;

% kk=1;
ee=cputime;

%Super resolved map for Class 1
outmap=soil;
[m2,n2,o2]=size(outmap);
b11=zeros(m2,n2,3);
for r=1:m2
    for s=1:n2
        if outmap(r,s)==1
             b11(r,s,1)=255;%red
             b11(r,s,2)=0;
             b11(r,s,3)=0;
        end
    end
end
figure,imshow(b11);


%Super resolved map for Class 2
outmap=veg;
for r=1:m2
    for s=1:n2
if outmap(r,s)==1
    outmap(r,s)=outmap(r,s)+1;
end
    end
end


for r=1:m2
    for s=1:n2
        if (outmap(r,s)==2) 
            if (b11(r,s,1)==0 && b11(r,s,2)==255 && b11(r,s,3)==0)                           
                 b11(r,s,1)=255;%white
                 b11(r,s,2)=255;
                 b11(r,s,3)=255;
            else
                b11(r,s,1)=0;%green
                b11(r,s,2)=255;
                b11(r,s,3)=0;
            end
        end
    end
end
figure,imshow(b11);

%Resolving the white pixels
c1=0;
c2=0;
for r=1:m2
    for s=1:n2
         if(((r-1)>0) && ((s-1)>0)&& ((r+1)<=m2) && ((s+1)<=n2) )
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r+1
                    for l=s-1:s+1                    
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=0;
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;                    
                else            
                    b11(r,s,1)=0;%pink
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
            c1=0;
            c2=0;
            end
         elseif(((r-1)<1) && ((s-1)<1))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r:r+1
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%pink
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
            c1=0;
            c2=0;
            end
         elseif(((r+1)>m2) && ((s-1)<1))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
            c1=0;
            c2=0;
            end
         elseif(((r-1)<1) && ((s+1)>n2))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r:r+1
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
            c1=0;
            c2=0;
            end
         elseif(((r+1)>m2) && ((s+1)>n2))
             if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                 for k=r-1:r
                     for l=s-1:s
                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                         end
                     end
                 end
                 if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                 end                  
                c1=0;
                c2=0;
             end
         elseif((s-1)<1)
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r+1
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
                c1=0;
                c2=0;
            end
         elseif( (s+1)>n2)
             if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r+1
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
                c1=0;
                c2=0;
             end
         elseif( (r-1)<1 )
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r:r+1
                    for l=s-1:s +1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
                c1=0;
                c2=0;
            end
         elseif( (r+1)>m2 )
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r
                    for l=s-1:s +1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        end
                    end
                end
                if c1>=c2 
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                    
                else            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;
                end                  
                c1=0;
                c2=0;
            end         
         end         
    end
end
figure,imshow(b11);
% imsave;
% %Resolving the Black pixels
% c1=0;
% c2=0;
% for r=1:m2
%     for s=1:n2
%          if(((r-1)>0) && ((s-1)>0)&& ((r+1)<=m2) && ((s+1)<=n2) )
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r-1:r+1
%                     for l=s-1:s+1                    
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%             c1=0;
%             c2=0;
%             end
%          elseif(((r-1)<1) && ((s-1)<1))
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r:r+1
%                     for l=s:s+1
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%             c1=0;
%             c2=0;
%             end
%          elseif(((r+1)>m2) && ((s-1)<1))
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r-1:r
%                     for l=s:s+1
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%             c1=0;
%             c2=0;
%             end
%          elseif(((r-1)<1) && ((s+1)>n2))
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r:r+1
%                     for l=s-1:s
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%             c1=0;
%             c2=0;
%             end
%          elseif(((r+1)>m2) && ((s+1)>n2))
%              if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                  for k=r-1:r
%                      for l=s-1:s
%                          if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                  end                  
%                 c1=0;
%                 c2=0;
%              end
%          elseif((s-1)<1)
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r-1:r+1
%                     for l=s:s+1
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%                 c1=0;
%                 c2=0;
%             end
%          elseif( (s+1)>n2)
%              if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r-1:r+1
%                     for l=s-1:s
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%                 c1=0;
%                 c2=0;
%              end
%          elseif( (r-1)<1 )
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r:r+1
%                     for l=s-1:s +1
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%                 c1=0;
%                 c2=0;
%             end
%          elseif( (r+1)>m2 )
%             if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
%                 for k=r-1:r
%                     for l=s-1:s +1
%                         if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
%                             c1=c1+1;
%                         elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
%                             c2=c2+1;
%                         end
%                     end
%                 end
%                 if c1>=c2 
%                     b11(r,s,1)=255;
%                     b11(r,s,2)=0;
%                     b11(r,s,3)=0;                    
%                 else            
%                     b11(r,s,1)=0;%green
%                     b11(r,s,2)=255;
%                     b11(r,s,3)=0;
%                 end                  
%                 c1=0;
%                 c2=0;
%             end         
%          end         
%     end
% end
% figure,imshow(b11);
% % % imsave;




%Super resolved map for Class 3
outmap=water;
for r=1:m2
    for s=1:n2
if outmap(r,s)==1
    outmap(r,s)=outmap(r,s)+2;
end
    end
end



for r=1:m2
    for s=1:n2
         if outmap(r,s)==3 
            if (((b11(r,s,1)==255) && (b11(r,s,2)==0) && (b11(r,s,3)==0))|| ... 
                ((b11(r,s,1)==0) && (b11(r,s,2)==255) && (b11(r,s,3)==0)))
                b11(r,s,1)=255;%white
                b11(r,s,2)=255;
                b11(r,s,3)=255;
            else
                b11(r,s,1)=0;%blue
                b11(r,s,2)=0;
                b11(r,s,3)=255;
               
            end
         end
    end
end

figure,imshow(b11);
% imsave;



%Resolving white pixels
c1=0;
c2=0;
c3=0;
for r=1:m2
    for s=1:n2
        if(((r-1)>0) && ((s-1)>0)&& ((r+1)<=m2) && ((s+1)<=n2) )
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r+1
                    for l=s-1:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;             
                elseif c2>=c3            
                    b11(r,s,1)=0;%pink
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
            elseif(((r-1)<1) && ((s-1)<1))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r:r+1
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        elseif(((r+1)>m2) && ((s-1)<1))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        elseif(((r-1)<1) && ((s+1)>n2))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r:r+1
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
             elseif(((r+1)>m2) && ((s+1)>n2))
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
            elseif((s-1)<1)
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r+1
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
            elseif( (s+1)>n2)
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r+1
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
             elseif( (r-1)<1 )
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r:r+1
                    for l=s-1:s +1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
           elseif( (r+1)>m2 )
            if ((b11(r,s,1)==255) && (b11(r,s,2)==255) && (b11(r,s,3)==255))
                for k=r-1:r
                    for l=s-1:s +1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        end
    end
end

figure,imshow(b11);
% imsave;

%Resolving black pixels
c1=0;
c2=0;
c3=0;
for r=1:m2
    for s=1:n2
        if(((r-1)>0) && ((s-1)>0)&& ((r+1)<=m2) && ((s+1)<=n2) )
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r-1:r+1
                    for l=s-1:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        elseif(((r-1)<1) && ((s-1)<1))
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r:s+1
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        elseif(((r+1)>m2) && ((s-1)<1))
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r-1:r
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        elseif(((r-1)<1) && ((s+1)>n2))
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r:r+1
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
        elseif(((r+1)>m2) && ((s+1)>n2))
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r-1:r
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
           c1=0;
           c2=0;
           c3=0;
            end
        elseif((s-1)<1)
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r-1:r+1
                    for l=s:s+1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
       elseif( (s+1)>n2)
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r-1:r+1
                    for l=s-1:s
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255; 
                end
           c1=0;
           c2=0;
           c3=0;
            end
        elseif( (r-1)<1 )
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r:r+1
                    for l=s-1:s +1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
            c1=0;
            c2=0;
            c3=0;
            end
       elseif( (r+1)>m2 )
            if ((b11(r,s,1)==0) && (b11(r,s,2)==0) && (b11(r,s,3)==0))
                for k=r-1:r
                    for l=s-1:s +1
                        if ((b11(k,l,1)==255) && (b11(k,l,2)==0) && (b11(k,l,3)==0))
                            c1=c1+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==255) && (b11(k,l,3)==0))
                            c2=c2+1;
                        elseif ((b11(k,l,1)==0) && (b11(k,l,2)==0) && (b11(k,l,3)==255))
                            c3=c3+1;
                        end
                    end
                end
                if c1>=c2 && c1>=c3 %red
                    b11(r,s,1)=255;
                    b11(r,s,2)=0;
                    b11(r,s,3)=0;                      
                elseif c2>=c3            
                    b11(r,s,1)=0;%green
                    b11(r,s,2)=255;
                    b11(r,s,3)=0;             
                else            
                    b11(r,s,1)=0;%blue
                    b11(r,s,2)=0;
                    b11(r,s,3)=255;             
                end
           c1=0;
           c2=0;
           c3=0;
            end
        end
    end
end
 figure,imshow(uint8(b11));
%  imsave;

elapsedtime=cputime-ee;
disp(elapsedtime);


