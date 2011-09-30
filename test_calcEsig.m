clear all
N = [16,32,64,128,256,512,1024,2048,4096];
cpu_times = zeros(1,length(N));
k = 1;
for n = N
    t = linspace(-1,1,n);
    et = exp(-2*log(2)*(t/.1).^2);
    tic;
    calcEsig(et,et);
    cpu_times(k) = toc;
    k = k+1;
    fprintf('Array size %s \n\r', num2str(n))
end
