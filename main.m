clc;
clear all;
close all;

% Set Number of nodes
NumNodes=200; 
p=0.10;

%Create network with length-width=200
Length=200;
Width=200;
Sink_x=100;
Sink_y=100;

Network = CreateNetwork(Length,Width, Sink_x, Sink_y);


