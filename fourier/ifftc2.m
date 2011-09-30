function R = ifftc2(FT)
% SKEL Serves as an M-file skeleton.
%
%   SKEL() takes no argument, and returns nothing. The version is
%   displayed.
%%% begin skeleton 
	version = '$Id: ifftc2.m,v 1.1 2009-04-16 20:55:53 pam Exp $'; 
%%% end skeleton
%%% Options
perform_optimization = true;
%%% Code starts here
R = fftshift(fft2(ifftshift(FT)));
R = flipud(fliplr(R));