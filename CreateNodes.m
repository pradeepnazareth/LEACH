function Nodes = CreateNodes(Network, NumNodes)
    for i=1:NumNodes
        
        % Set X Co-ordinates for nodes
        Nodes.node(i).x=rand * Network.Field.Length;
        Nodes.nodeLoc(i,1) = Nodes.node(i).x;
    
        % Set y Coordinates for nodes
        Nodes.node(i).y=rand * Network.Field.Width;
        Nodes.nodeLoc(i,2) = Nodes.node(i).y;
    
        % Set All Nodes are normal nodes initially
        Nodes.node(i).Type= 'N';
    
        %Initial Energy level assigned
        Nodes.node(i).Energy =Network.Energy.InitEnergy;
    
        % Cluster head of ith node, initially no cluster head
        Nodes.node(i).CH = -1;
    
        % Initially all nodes are alive
        Nodes.dead(i) = 0;
    end
    %Number of dead nodes(initially)
    Nodes.NumDead = 0;
    % Total Number of nodes
    Nodes.NumNodes=NumNodes;
    
end

