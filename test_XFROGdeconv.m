%
% Test deconvolution method for solving XPG FROG
%
clear all;
pulse_tbp       = 2;
gate_tbp        = .6;
debug           = 0;
deconv_method   = 3;

[et ew tbp_rms] = rand_pulse(pulse_tbp,2048);
n = length(et);
[etg ewg tbp_rmsg] = rand_pulse(gate_tbp, n);
gate = abs(etg).^2;
esig = calcEsig(et, gate);
esigw = fftc(esig);
isig = abs(esigw).^2;

if debug
    imagesc(isig)
    figure;plot(1:n, quickscale(abs(et).^2), 1:n, quickscale(abs(etg).^2))
end

mt = quickscale(sum(isig));
mw = quickscale(sum(isig,2)');
switch deconv_method
    case 1
        max_iter = 10000;
        psft = abs(gate(end:-1:1)).^2;
        psfw = abs(fftc(gate)).^2;
        itr = deconvlucy(mt, psft(end:-1:1), max_iter);
        swr = deconvlucy(mw, psfw, max_iter);
    case 2
        mt_ft = quickscale(fftc(mt));
        mw_ft = quickscale(fftc(mw));
        ht = quickscale(abs(gate(end:-1:1)).^2);
        hw = quickscale(abs(fftc(gate(end:-1:1))).^2);
        ht_ft = quickscale(fftc(ht)) + eps;
        hw_ft = quickscale(fftc(hw)) + eps;
        
        itr = ifftc( mt_ft ./ ht_ft );
        swr = ifftc( mw_ft ./ hw_ft );
    case 3
        max_iter = 30000;
        mt_ft = quickscale(fftc(mt));
        ht = quickscale(abs(gate(end:-1:1)).^2);
        ht_ft = quickscale(fftc(ht)) + eps;
        itr = ifftc( mt_ft ./ ht_ft );
        
        psfw = abs(fftc(gate)).^2;
        %swr = deconvlucy(mw, psfw, max_iter);
        swr = deconvreg(mw, psfw);
end

subplot(121)
plot(1:n, quickscale(abs(et).^2), 1:n, quickscale(itr))
subplot(122)
plot(1:n, quickscale(abs(ew).^2), 1:n, quickscale(swr))