clc;clear all;close all;

t = [0:0.001:1];            %1000Hz sampling , t -> impulse train
sin_4 = sin(2*pi*4*t);      %4Hz sine wave
sin_16 = sin(2*pi*16*t);     %16Hz sine wave
plot(t, sin_4,'r');
hold on;
plot(t, sin_16,'g');

legend({'4Hz @ 1000 Hz f_s', '16Hz @ 1000 Hz f_s'})