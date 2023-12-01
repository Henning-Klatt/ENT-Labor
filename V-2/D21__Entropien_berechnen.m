clc;
clear all;

% Die Berechnungen / Funktionsaufrufe für 5 verscheidene Quellen:

pvec = [ 0.1 0.2 0.3 0.4 ]
H = entropy(pvec)


pvec = [ .5 .5 ]
H = entropy(pvec)

pvec = [0.25 0.25 0.25 0.25]
H = entropy(pvec)

pvec = [0 0.25 0.25 0.5]
H = entropy(pvec)

pvec = [0 1/3 1/3 1/3]
H = entropy(pvec)

pvec = [0 0 0 1]
H = entropy(pvec)
