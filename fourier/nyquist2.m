function y = nyquist2(n)
%NYQUIST2 Half the nyquist frequency.
%	NYQUIST2(N) Where N is a scalar.  Returns an array of length
%	N, with an amplitude of one at half of the nyquist frequency.
%
%	NUQUIST(Y) Where Y is a vector.  Returns Y times half of the nyquist
%	frequency.

%	v1.0, 6/22/01, Erik Zeek, <zeekec@mad.scientist.com>
%	v1.1, 6/25/01, Erik Zeek, <zeekec@mad.scientist.com>
%		Vectorized.
%
%	$Revision: 1.1 $ $Date: 2006-11-11 00:15:30 $
%
%	$Log: nyquist2.m,v $
%	Revision 1.1  2006-11-11 00:15:30  pablo
%	CVS server re-installation
%	
%	Revision 1.2  2001/07/10 01:10:00  zeekec
%	Library cleanup.  Added, deleted, and moved files.
%	
%

error(nargchk(1,1,nargin))

if length(n) == 1
	y = ones(1,n);
else
	y = n;
end

y(2:2:length(y)) = 0;

y(3:4:length(y)) = -y(3:4:length(y));
