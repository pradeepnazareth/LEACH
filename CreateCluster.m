function ClusterModel= CreateCluster(Network, Nodes, ClusterRound, p_NumCluster)
ClusterModel.Network=Network;
ClusterModel.Nodes=Nodes;
%ClusterModel.ClusterAlg=ClusterAlg;
ClusterModel.ClusterRound= ClusterRound;
% Find the number of clusters
%Suppose % of Cluster is 5% i.e.0.05
% Then there should be (1/0.05)= 20 Clusters
p=p_NumCluster;
NumCluster=1/p_NumCluster;

ClusterModel.p=p;
ClusterModel.NumCluster=NumCluster;
%[Nodes,CH] = Leach(ClusterModel,ClusterRound);

%ClusterModel.Nodes= Nodes;
%ClusterModel.CH=CH;




end

 
