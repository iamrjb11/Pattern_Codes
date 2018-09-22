clc;
clear;

%Take input from file
fileID = fopen('input.txt','r');
formatSpec = '%d';
A = fscanf(fileID,formatSpec);

num=A(1);
A_index=2;
ar = zeros(num,2);
for i=1:num
    %take = input('','s');
    %take2=strsplit(take,' ');
    for j=1:2
        ar(i,j)=A(A_index);
        A_index=A_index+1;
    end
    plot( ar(i,1),ar(i,2),'r*' );
    hold on;
end


%disp('My Points');
%For sort according to y
for i=1:(num-1)
    %disp('(x,y) : ');
    %disp(ar(i,j));
    for j=(i+1):num
        if ar(i,2) > ar(j,2)
            %x part
            temp = ar(i,1);
            ar(i,1)=ar(j,1);
            ar(j,1) = temp;
            %y part
            temp = ar(i,2);
            ar(i,2)=ar(j,2);
            ar(j,2) = temp;
        end
    end
        
   
end
%disp(ar);
%For big

for i=1:num-1
    %d=sprintf("Rajib Khan");
    %disp(d);
    %for x same and y different( no need slope value)
    value_count=1;
    result_point = zeros(value_count,2);
    result_point_index=1;
    result_point(result_point_index,1)=ar(i,1); % x value
    result_point(result_point_index,2)=ar(i,2); % y value
    for j=i+1:num
        if ar(i,1)==ar(j,1)
            value_count=value_count+1;
            result_point_index=result_point_index+1;
            result_point(result_point_index,1)=ar(j,1); % x value
            result_point(result_point_index,2)=ar(j,2); % y value
        end
        
    end
        
    if value_count >= 4
        plot(result_point(:,1), result_point(:,2), 'g-', 'LineWidth', 2);
        hold on;
        %disp("Cool");
        for j=1:value_count
            show = sprintf("(%d,%d) ",result_point(j,1),result_point(j,2));
            disp(show);
            
        end
        disp("---------------------");
    end
    % end point
    %For slope part
    slopeV =zeros(num,3); % for reset
   
    count_slope =0;
    for j=i+1:num
        sum=ar(j,1)-ar(i,1);
        if sum ~= 0
            count_slope=count_slope+1;
            slopeV(count_slope,1)=ar(j,1); % Save x value
            slopeV(count_slope,2)=ar(j,2); % Save y value
            slopeV(count_slope,3)=(ar(j,2)-ar(i,2))/(ar(j,1)-ar(i,1));
        end
        
        
    end
    %disp('------ SlopeV ------');
    %disp(slopeV);
    
    newSlopeV = zeros(1); % remove duplicate 
    newS_index=1;
    newSlopeV(newS_index)=slopeV(1,3);
    for j=2:count_slope
        check=1;
        for k=1:newS_index
            if (slopeV(j,3)== newSlopeV(k))
                check=0;
                
                break;
            end
        end
        if check==1
            
            newS_index=newS_index+1;
            newSlopeV(newS_index)=slopeV(j,3);
        end
    end
    %disp('+++ newSlopeV means remove duplicate +++++');
    %disp(newSlopeV);
    
    for j=1:newS_index
       value_count=1;
       for k=1:count_slope
           if newSlopeV(j)==slopeV(k,3)
               value_count=value_count+1;
     
           end
       end
        result_point = zeros(value_count,2);
        result_point_index=1;
        result_point(result_point_index,1)=ar(i,1); % x value
        result_point(result_point_index,2)=ar(i,2); % y value
       if value_count >=4
           show = sprintf("(%d,%d) ",result_point(result_point_index,1),result_point(result_point_index,2));
           disp(show);
           for k=1:count_slope
               if newSlopeV(j)==slopeV(k,3)
                   %value_count=value_count+1;
                   result_point_index=result_point_index+1;
                   result_point(result_point_index,1)=slopeV(k,1); % x value
                   result_point(result_point_index,2)=slopeV(k,2); % y value
                   show = sprintf("(%d,%d) ",result_point(result_point_index,1),result_point(result_point_index,2));
                   disp(show);
               end
               
       
           end
           
           disp("------------------------");
           %disp('Cool');
           %disp(result_point(:,1));
           %[a,b]=size(result_point);
           %disp(a);
           
           plot(result_point(:,1), result_point(:,2), 'g-', 'LineWidth', 2);
           hold on;
       end
    end

    %for i=1:num
     %   disp('(x,y) : ');
      %  for j=1:2
       %     disp(ar(i,j));
        %end
        %plot( ar(i,1),ar(i,2),'r*' );
    %end
end
