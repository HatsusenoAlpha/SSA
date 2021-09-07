function varargout = serial_to_mat(x, L)
	% This function is to reform a time-serial signal to matrix for
	% singularity spectral analysis.
	% x is the temperal domain signal.
	% L is the length of sliding window.
	% code begins.
	
	% compute dimensions of matrix;
	% for L is already available as the number of lines,
	M = L;
	% The number of columns needs to be computed.
	N = length(x) - M + 1;
	
	% pre-allocating results;
	mat = zeros(M, N);
	
	% fill the matrix with temperal signal
	for i = 0 : N -1
		mat(: , i+1 ) = x(1+i: L+i);
	end
	varargout = {mat};
end