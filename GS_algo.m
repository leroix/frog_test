function phiw = gs_algo(It, Sw)

At = center(quickscale(sqrt(It)),'max');
Aw = center(quickscale(sqrt(Sw)),'max');
N = length(At);
err = ones(1,N);

Et = ifftc(Aw);
for k = 1:400
    Et = At .* Et./abs(Et);
    Ew = fftc(Et);
    Ew = Aw .* Ew./abs(Ew);
    Et = ifftc(Ew);
    
    At_curr = center(quickscale(abs(Et)),'max');
    curr_err = sqrt(trapz((At-At_curr).^2)/N);
    if curr_err < min(err)
        phiw_best = angle(Ew);
    end
    err(k) = curr_err;
    
    if 1
        plot(err)
    end
end

phiw = phiw_best;