function [theta_i] = angle_plane(n_hat,beta_i)
% Find incident angle between plane and beta
theta_i = acos(dot(n_hat,beta_i)/(norm(n_hat)*norm(beta_i)));
end