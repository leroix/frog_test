function [tbp_rms, sig_t, sig_w] = calc_tbp(et, ew)
%calc_tbp - calculates the root mean square time-bandwidth product of Et
%
% Syntax:  [tbp_rms, sig_t, sig_w] = calc_tbp(et, ew)
%
% Inputs:
%    et - complex electric field vs. time
%    ew - complex electric field vs. frequency
%
% Outputs:
%    tbp_rms - root mean square time-bandwidth product of Et
%    sig_t - normalized standard deviation of the electric field in time
%    sig_w - normalized standard deviation of the electric field in
%            frequency
%

% Author: Justin Ratner
% Georgia Institute of Technology
% email address: jtratner@gatech.edu  
% Website: http://frog.gatech.edu
% October 2011; Last revision: 05-Oct-2011

n = length(et);
t = linspace(-n/2, n/2, n);
w = linspace(-pi, pi, n);
intensity_t = abs(et).^2;
intensity_t = intensity_t / trapz(intensity_t);
intensity_w = abs(ew).^2;
intensity_w = intensity_w / (trapz(intensity_w)*2*pi/n);

mean_t = trapz(t .* intensity_t);
mean_w = trapz(w .* intensity_w) * 2*pi/n;
mean_t2 = trapz(t.^2 .* intensity_t);
mean_w2 = trapz(w.^2 .* intensity_w) * 2*pi/n;

t_var = mean_t2 - mean_t^2;
w_var = mean_w2 - mean_w^2;

tbp_rms = sqrt(t_var) * sqrt(w_var);
sig_t = sqrt(t_var) / n;
sig_w = sqrt(w_var) / (2*pi);