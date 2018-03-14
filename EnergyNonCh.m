function ClusterModel = EnergyNonCh(ClusterModel,Round)

Nodes=ClusterModel.Nodes;
Network=ClusterModel.Network;
CH= ClusterModel.CH;
n= Nodes.NumNodes;

d0=sqrt(Network.Energy.FreeSpace/Network.Energy.MultiPath);

% Energy Parameters
EMP=Network.Energy.MultiPath;
EFS=Network.Energy.FreeSpace;
ETX=Network.Energy.TxEnergy;
ERX=Network.Energy.RxEnergy;
EDA=Network.Energy.AggEnergy;
ChSinkPkt=Round.ChSinkPkt;
NodeChPkt=Round.ChSinkPkt;


%Find the alive nodes
AliveNodes=find(~Nodes.dead);
% Find the nearest CH for each living node
 


for i=1:n % index 'i' for normal node
    mindistancetoCH = 999;
    if (strcmp(Nodes.node(i).Type,'N') ...
        && (Nodes.node(i).Energy > 0))
        if (CH.TotalCH >1)
            for j=1:(CH.TotalCH) % Index 'j' for CHs
        
                distancetoCH = sqrt( (Nodes.node(i).x - CH.Location(j,1))...
                    ^2 + (Nodes.node(i).y-CH.Location(j,2))^2);
                    if(distancetoCH < mindistancetoCH)
                        mindistancetoCH = distancetoCH; %Nearest distance to CH found for node i
                        Nodes.node(i).CH= CH.no(j);  %The associated CH for node i
                    end
            end
                    
                        if (mindistancetoCH < d0 )   
                           Nodes.node(i).Energy = Nodes.node(i).Energy ...
                             - NodeChPkt * ETX + EFS * NodeChPkt * (mindistancetoCH ^ 2);
                        else
                            
                             Nodes.node(i).Energy = Nodes.node(i).Energy ...
                             - NodeChPkt * ETX + EMP * NodeChPkt  * (mindistancetoCH ^ 4);
                        end
        
  
        end
    end
    
end
ClusterModel.Nodes=Nodes;
end

