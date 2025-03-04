function addd()
b1=soil;
figure,imshow(b1);
b2=veg;
figure,imshow(b2);
b3=water;
figure,imshow(b3);
% b4=imread('F:\Pondi\Landsat\fi\road.tif');
% figure,imshow(b4);
% b5=imread('d:\fcm\supervised\m5.jpg');
% figure,imshow(b5);

[m n]=size(b1);
I11=zeros(m,n);
for r=1:1:m
    for c=1:1:n
        if ((b1(r,c)==255)) 
            if (I11(r,c)==0)
                I11(r,c)=1;
          else
             I11(r,c)=6;
            end
        end
        if ((b2(r,c)==255)) 
            if (I11(r,c)==0)
                I11(r,c)=2;
%             else
%                 I11(r,c)=6;
            end
        end
       if ((b3(r,c)==255)) 
            if (I11(r,c)==0)
               I11(r,c)=3;
          else
                 I11(r,c)=6;
            end
      end
         if ((b4(r,c)==255)) 
             if (I11(r,c)==0)
                 I11(r,c)=4;
             else
                 I11(r,c)=6;
             end
         end
         if ((b5(r,c)==255)) 
             if (I11(r,c)==0)
                 I11(r,c)=5;
             else
                 I11(r,c)=6;
             end
         end
    end
end
for r=1:1:m
    for c=1:1:n
        if I11(r,c)==1
             b(r,c,1)=255;%red
             b(r,c,2)=0;
             b(r,c,3)=0;
        end
        if I11(r,c)==2
             b(r,c,1)=0;
             b(r,c,2)=255;%green
             b(r,c,3)=0;
        end
        if I11(r,c)==3
            b(r,c,1)=0;
            b(r,c,2)=0;
            b(r,c,3)=255;%blue
        end
         if I11(r,c)==4
              b(r,c,1)=255;
             b(r,c,2)=255;
              b(r,c,3)=255;%white
         end
         if I11(r,c)==5%pink
             b(r,c,1)=85;
             b(r,c,2)=0;
             b(r,c,3)=155;
         end
         if ((I11(r,c)==6)||(I11(r,c)==0))%black
             b(r,c,1)=0;
             b(r,c,2)=0;
             b(r,c,3)=0;
         end

     end
end
figure,imshow(uint8(b));imsave;


