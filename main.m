clc;
clear all;
close all;


NumNodes=100; % Set Number of nodes
p=0.05; % Percentage of cluster heads
Length=200; %Create network field  with length i.e x-axis
Width=200; %Create network field  with width i.e. y-axis
Sink_x=100; % Sink location x-axis
Sink_y=100; % Sink location y-axis

%Assign values to Field/Sink and Energy parameters
Network = CreateNetwork(Length,Width, Sink_x, Sink_y);
%Create nodes & initialize parameters
Nodes = CreateNodes(Network, NumNodes);
Round=CreateRound(); %Number of Rounds


%for r=1:Round.NumRound
for r=1:40
    
   
    ClusterModel=CreateCluster(Network,Nodes,r, p);
    [Nodes,CH] = Leach(ClusterModel,r);
    ClusterModel.Nodes= Nodes;
    ClusterModel.CH=CH;       
    ClusterModel=EnergyCh(ClusterModel,Round);
    ClusterModel=EnergyNonCh(ClusterModel,Round); 
    
    Nodes=ClusterModel.Nodes;
    
end


