function w = ifftcn(x,varargin)
%IFFTCN Nyquist centered inverse discrete Fourier transform.
%	IFFTCN(X) is the centered, using the Nyquist theorem,
%	inverse discrete Fourier transform of X.
%
%	IFFTCN(X,N) is the N-point inverse transform.
% 
%	IFFTNC(X,[],DIM) or IFFTCN(X,N,DIM) is the inverse discrete Fourier
%	transform of X across the dimension DIM.
%
%	See also FFTCN, NYQUIST, FFTC, IFFTC, FFT, IFFT, FFT2, IFFT2, FFTSHIFT.
%
%	WARNING:  Currently only tested on the first non-singleton dimention.

%	$Revision: 1.1 $ $Date: 2006-11-11 00:15:30 $
%
%	$Log: ifftcn.m,v $
%	Revision 1.1  2006-11-11 00:15:30  pablo
%	CVS server re-installation
%	
%	Revision 1.1  2001/08/21 15:13:33  zeekec
%	Added Nyquist FFT functions
%	


w = nyquist(ifft(nyquist(x),varargin{:}));
