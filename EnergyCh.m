function ClusterModel = EnergyCh(ClusterModel,Round)

ClusterHead=ClusterModel.CH;
Nodes= ClusterModel.Nodes;
Network=ClusterModel.Network;

d0=sqrt(Network.Energy.FreeSpace/Network.Energy.MultiPath);
NoCh=length(ClusterHead.no);


% Energy parameters 

EMP=Network.Energy.MultiPath;
EFS=Network.Energy.FreeSpace;
ETX=Network.Energy.TxEnergy;
ERX=Network.Energy.RxEnergy;
EDA=Network.Energy.AggEnergy;
PacketSize=Round.ChSinkPkt;

for i=1:NoCh
    ChNo=ClusterHead.no(i);

    distance = ClusterHead.distancetoBS(i);
    Energy=Nodes.node(ChNo).Energy;
    % Energy consumed by CH during data transmission to BS
    if (distance >d0)
    Nodes.node(ChNo).Energy=Energy -((ETX+EDA) * PacketSize + ...
    EMP * PacketSize * (distance ^ 4));
    else
    Nodes.node(ChNo).Energy=Energy -((ETX+EDA) * PacketSize + ...
    EFS * PacketSize * (distance ^ 2));
    end
% Energy consumed by CH in receivinh data from cluster member
Nodes.node(ChNo).Energy = Nodes.node(ChNo).Energy - ...
PacketSize*ERX *round(Nodes.NumNodes/ClusterModel.NumCluster);
end
ClusterModel.Nodes=Nodes;
end







