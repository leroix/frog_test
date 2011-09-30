function FT = fftc2(A)
% SKEL Serves as an M-file skeleton.
%
%   SKEL() takes no argument, and returns nothing. The version is
%   displayed.
%%% begin skeleton 
	version = '$Id: fftc2.m,v 1.1 2009-04-16 20:55:53 pam Exp $'; 
%%% end skeleton
%%% Options
perform_optimization = true;
%%% Code starts here
FT = fftshift(fft2(ifftshift(A)));