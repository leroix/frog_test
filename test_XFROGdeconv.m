%
% Test deconvolution method for solving XPG FROG
%
clear all;
pulse_tbp       = 5;
gate_tbp        = .5;

[et ew tbp_rms] = rand_pulse(pulse_tbp);
[etg ewg tbp_rmsg] = rand_pulse(gate_tbp);
esig = calcEsig(et, abs(etg).^2);
esigw = fftc(esig);
isig = abs(esig).^2;

