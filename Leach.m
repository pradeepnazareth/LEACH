function [Nodes, CH] = Leach(ClusterModel,ClusterRound)


Network=ClusterModel.Network;
Nodes=ClusterModel.Nodes;

p=ClusterModel.p;
n=Nodes.NumNodes;
NoCluster =ClusterModel.NumCluster;
TotalCH = 0;
r=ClusterRound;


%After every 1/p rounds, every nodes is eligible to become CH
if(mod(r,NoCluster)==0)
    for i=1:n
        Nodes.node(i).g=0;
    end
end
%Alter the status of sensor Nodes to either 'D' or 'N'
%Energy = 0 then status is dead 'D'
%else Normal 'N'

Nodes.node(1).Energy=0;
for i=1:n
    if  (Nodes.node(i).Energy <= 0)
        Nodes.node(i).Type='D'; %Change the status of node from 'N' To 'D'
        Nodes.dead(i)=1; %dead(i)=1 means node(i) is dead
    else
        Nodes.node(i).Type='N';
    end
end
Nodes.NumDead=sum(Nodes.dead); %count number of dead nodes


%%%%% Core Logic of LEACH Algorithm To select CH %%%%%%%%%%%%%
for i=1:n
    %disp(i);
    RandomNumber=rand;
    Tn=(p/(1-p*(mod(r,round(1/p)))));
    
   % Following condition should be satisfied to select as CH
    if ((Nodes.node(i).Energy) > 0 )
        if (RandomNumber < Tn) 
            if ((Nodes.node(i).g)<=0)
                Nodes.node(i).Type= 'H';
                TotalCH=TotalCH +1;     
                CH.no(TotalCH) = i; %  store node number no
                Nodes.node(i).g = round(1/p)-1;
                HxLoc = Nodes.node(i).x;
                HyLoc=  Nodes.node(i).y;
                CH.Location(TotalCH,1)=HxLoc;
                CH.Location(TotalCH,2)=HyLoc;
                CH.distancetoBS(TotalCH) = sqrt ...
              ((HxLoc - Network.Sink.x )^2 + (HyLoc - Network.Sink.y )^2);
                
            end
        end
    end
end
            
      CH.TotalCH = TotalCH;              
        
    
end
        
    








        









