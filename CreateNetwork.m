function Network = CreateNetwork(Length, Width, Sink_x, Sink_y)
    Field.Type = 'Rect';
    %Length of the field
    Field.Length = Length;       
  
    %Width of field
    Field.Width = Width;     
   
    % Sink coordinates
    Sink.x = Sink_x;
    Sink.y = Sink_y;
    
    %Initial Energy
    Energy.InitEnergy = 0.5; 
     
    % Tranmitter energy
    Energy.TxEnergy = 50 * (10 ^ (-12)); 
    %Receiver energy
    Energy.RxEnergy = 50 *  (10 ^ (-12)); 
     
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
               
              
               



