clear; clc;
x = 0.25;
L = 3;
B = 3;

fprintf('Sign\n');
sign_fn(x,L,B);
fprintf('\nOne''s complement\n');
ones_fn(x,L,B);
fprintf('\nTwo''s complement\n');
twos_fn(x,L,B);