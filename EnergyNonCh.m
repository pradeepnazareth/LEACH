function ClusterModel = EnergyNonCh(ClusterModel,Round)

Nodes=ClusterModel.Node;
Network=ClusterModel.Network;
CH= ClusterModel.CH;

d0=sqrt(Network.Energy.FreeSpace/Network.Energy.MultiPath);

% Energy Parameters
EMP=Network.Energy.MultiPath;
EFS=Network.Energy.FreeSpace;
ETX=Network.Energy.TxEnergy;
ERX=Network.Energy.RxEnergy;
EDA=Network.Energy.AggEnergy;
PacketSize=Round.ChSinkPkt;

%Find the alive nodes
AliveNodes=find(~Nodes.dead);
% Find the nearest CH for each living node
for i=AliveNodes
if (strcmp(Nodes.node(i),'N') ...
        && (Nodes.node(i).Energy > 0))
    Location = [Nodes.node(i).x,Nodes.node(y)];
end
end
    
    
    
    














end

