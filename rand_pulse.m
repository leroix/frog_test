function [et, ew, tbp_rms] = rand_pulse(tbp, n)
%rand_pulse - returns a random pulse of a given time-bandwidth product
%
% Syntax:  [et, ew, tbp_rms] = rand_pulse(tbp)
%          [et, ew, tbp_rms] = rand_pulse(tbp, n)
%
% Inputs:
%    tbp - Desired time-bandwidth product.
%    n - (OPTIONAL) size of the 1xN array of the pulse. Function can choose
%        and array size automatically.
%
% Outputs:
%    et - complex electric field vs. time
%    ew - complex electric field vs. frequency (FFT of Et)
%    tbp_rms - root mean square time-bandwidth product. TBP +/- 5%
%

% Author: Justin Ratner
% Georgia Institute of Technology
% email address: jtratner@gatech.edu  
% Website: http://frog.gatech.edu
% October 2011; Last revision: 05-Oct-2011
% REQUIREMENTS: calc_tbp.m, fftc.m, ifftc.m

debug = 1;

% choose the best n or take the user's input if available
n1 = 2^ceil(log2(32*(tbp/.5)^1));
if n1 > 16384
    n1 = 16384;
end
if nargin == 1
    n = n1;
end

tbp_rms = inf;
sig_t = 0;
sig_w = inf;
x = linspace(-1,1,n);
width_t = 0.6;
width_w = 0.6;
k = 1;
while abs(tbp_rms - tbp)/tbp > 0.05 || ...
      abs(sig_t - sig_w)/sig_w > 0.05
    envelope_t = exp(-2*log(2)*(x / width_t).^2);
    envelope_w = exp(-2*log(2)*(x / width_w).^2);
    
    et = rand(1, n) .* exp(i*2*pi*rand(1, n));
    et = et .* envelope_t;
    ew = fftc(et) .* envelope_w;
    et = ifftc(ew);
    [tbp_rms, sig_t, sig_w] = calc_tbp(et, ew);
    
    if abs(tbp_rms - tbp)/tbp > 0.10
        factor = 1 + sign(tbp - tbp_rms)*0.08;
        width_t = width_t * factor;
        width_w = width_w * factor;
    end
    
    if abs(sig_t - sig_w)/sig_w > 0.10
        width_t = width_t * (1 + sign(sig_w - sig_t)*0.08);
    end
    
    k = k + 1;
    if k > 1000
        error('Error: could not generate a pulse for the given parameters.')
    end
end

if debug
    fprintf('k = %s \n', num2str(k))
end