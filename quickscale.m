function vecout = quickscale(vecin)
%quickscale - scales the data, so the maximum is 1
%
% Syntax:  vecout = quickscale(vecin)
%
% Inputs:
%    vecin - input array to be scaled
%
% Outputs:
%    vecout - output array that has been scaled
%

% Author: Justin Ratner
% Georgia Institute of Technology
% email address: jtratner@gatech.edu  
% Website: http://frog.gatech.edu
% October 2011; Last revision: 08-Oct-2011
% REQUIREMENTS:

sz = size(vecin);
vec_tmp = vecin(:);
max_val = max(vec_tmp);
vec_tmp = vec_tmp ./ max_val;

vecout = reshape(vec_tmp, sz);