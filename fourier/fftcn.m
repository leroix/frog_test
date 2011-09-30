function w = fftcn(x,varargin)
%FFTCN Nyquist centered discrete Fourier transform.
%	FFTCN(X) is the centered, using the Nyquist theorem, discrete
%	Fourier transform (DFT) of vector X.  For matrices, the FFT
%	operation is applied to each column. For N-D arrays, the FFT
%	operation operates on the first non-singleton dimension.
%	
%	FFTCN(X,N) is the N-point FFT, padded with zeros if X has less
%	than N points and truncated if it has more.
%	
%	FFTCN(X,[],DIM) or FFTCN(X,N,DIM) applies the FFT operation across
%	the dimension DIM.
%
%	See also IFFTCN, NYQUIST, FFTC, IFFTC, FFT, IFFT, FFT2, IFFT2, FFTSHIFT.
%
%	WARNING:  Currently only tested on the first non-singleton dimention.

%	$Revision: 1.1 $ $Date: 2006-11-11 00:15:30 $
%
%	$Log: fftcn.m,v $
%	Revision 1.1  2006-11-11 00:15:30  pablo
%	CVS server re-installation
%	
%	Revision 1.1  2001/08/21 15:13:33  zeekec
%	Added Nyquist FFT functions
%	


w = nyquist(fft(nyquist(x),varargin{:}));
