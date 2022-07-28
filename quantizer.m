function signal = quantizer( signal,min,max,levels )  
 scalingFactor = (max-min)/levels;
 signal = signal/ scalingFactor;
 signal = round(signal);
 signal = signal * scalingFactor;

end