%Function to initialize parameters corresponding to Field/Energy/Sink
%location
function Network = CreateNetwork(Length, Width, Sink_x, Sink_y)
    Field.Type = 'Rect';
    %Length of the field
    Field.Length = Length;       
  
    %Width of field
    Field.Width = Width;     
   
    % Sink coordinates
    Sink.x = Sink_x;
    Sink.y = Sink_y;
    
    % Following Values are Referred from:
    % Li Qing, QingXin Zhu, Mingwen Wang
    %Design of a distributed energy-efficient clustering algorithm for
    %heterogeneous wireless sensor networks
    %Elsevier, Computer communications 29(2006) 2230-2237
    
    %Initial Energy 
    Energy.InitEnergy = 0.5; 
     
    % Tranmitter energy
    Energy.TxEnergy = 5 * (10 ^ (-9)); 
    %Receiver energy
    Energy.RxEnergy = 5 *  (10 ^ (-9)); 
     
    %Free Space energy
    Energy.FreeSpace = 10*(10 ^ (-12));
    %Multipath Loss
    Energy.MultiPath = 0.0013*(10 ^ (-12));
    
    %Data Aggregation energy
    Energy.AggEnergy = 5*(10 ^ (-9));
   

    Network = struct('Field',   Field, ...
                     'Sink',   Sink, ...
                     'Energy', Energy);
end
               
              
               



