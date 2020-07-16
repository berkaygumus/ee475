pulse = zeros(500,500);
pulse(245:255,240:260) = 1;
figure;
subplot(2,2,1);
imshow(pulse);
subplot(2,2,2);
F = fft2(pulse);
Flog=fftshift(log(1+abs(F)));   
imshow(Flog);