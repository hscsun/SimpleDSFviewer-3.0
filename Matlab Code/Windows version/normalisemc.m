function [smsorts,smFDs]=normalisemc(sorts,number)
%smooth data
for smi=1:97
    hsorts=[];
    hsorts=sorts(1:find(sorts(:,smi)==max(sorts(:,smi))),smi);
    
    if length(hsorts)==1
        hsorts=min(sorts(:,smi));
    end
    
    smsorts(:,smi)=(sorts(:,smi)-min(hsorts))/(max(sorts(:,smi))-min(hsorts));
    
end

  for i=1:1:number
     if i==1
         for j=1:96
     smFD(i,j) = (smsorts((i+1),j)-smsorts(i,j))*2;
         end
     elseif i==number
         for j=1:96
     smFD(i,j) = (smsorts(i,j)-smsorts((i-1),j))*2;
         end    
     else
         for j=1:96
     smFD(i,j) = smsorts((i+1),j)-smsorts((i-1),j);
         end
     end
     smsorts(i,97)=0;
     smFD(i,97)=0;
  end
 smFDs=smFD(1:number,:);
% smFDs=smoFD(smFDs);