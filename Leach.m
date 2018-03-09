function [outputArg1,outputArg2] = Leach(ClusterModel,ClusterRound)

Network=ClusterModel.Network;
Nodes=ClusterModel.Nodes;

p=ClusterModel.p;
n=ClusterModel.Nodes.NumNodes;
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
for i=1:n
    if  (Nodes.node(i).Energy==0)
        Nodes.node(i).Type='D'; %Change the status of node from 'N' To 'D'
        Nodes.dead(i)=1; %dead(i)=1 means node(i) is dead
    else
        Nodes.node(i).Type='N';
    end
end
Nodes.NumDead=sum(Nodes.dead); %count number of dead nodes


%%%%% Begining of finding Cluster head%%%%%%%%%%%%%
AliveNodes = find(~Nodes.dead);
for i=1:1:AliveNodes
    disp(i);
    RandomNumber=rand;
    Tn=(1/(1-p*(mod(r,(1/p)))));
   % Following condition should satisfy to select as CH
    if( (Nodes.node(i).Energy >0) && (RandomNumber < Tn) && ...
        ((Nodes.node(i).g)<=0))
                Nodes.node(i).Type= 'K';
                TotalCH=TotalCH +1;
    end
end
        
    
r=1;







        







end

