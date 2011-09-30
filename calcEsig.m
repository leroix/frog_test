function Esig = calcEsig(p,g)
%CALCESIG - Calculates the FROG signal field from the pulse and gate functions
%
% Syntax:  Esig = function_name(p,g)
%
% Inputs:
%    p - The complex pulse field vs. time. The pulse that we are measuring.
%    g - The complex gate function vs. time. This will be the pulse itself
% 		 for SHG FROG.
%
% Outputs:
%    Esig - This is the signal field that results from the nonlinear interaction
%			of the pulse and the gate. It is a function of time and delay.
%

% Author: Justin Ratner
% Georgia Institute of Technology
% email address: jtratner@gatech.edu  
% Website: http://frog.gatech.edu
% September 2011; Last revision: 29-Sept-2011

N = length(p);
if N != length(g)
	error('The pulse field vector and the gate field vector must have the same dimensions.')
end

P = diag(p);

c = [g(end) g(1:end-1)];
r = g(end:-1:1);
G = toeplitz(c, r);
G = rot90(G);
nShift = round(N/2);
G = circshift(G, [0, nShift]);

Esig = P * G;

