function Round=CreateRound()
    %Number of rounds
    Round.NumRound= 5000;
    % Packet Length from Nodes to CH
   
    % Reference: Li Qing, QingXin Zhu, Mingwen Wang
    %Design of a distributed energy-efficient clustering algorithm for
    %heterogeneous wireless sensor networks
    %Elsevier, Computer communications 29(2006) 2230-2237
    Round.NodeChPkt= 4000;
    % Packet Length from CH to Sink Node
    Round.ChSinkPkt=4000;
end



