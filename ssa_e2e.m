function varargout=ssa_e2e(x, L, c_ind)
	% This function is used for signal seperating via SSA;
	% x is the original signal;
	% L is the length of sliding windows
	% c_ind is the selected components for signal reconstruction.
	% code begins.
	
	% reform signal to matrix;
	X = serial_to_mat(x, L);
	[U, V, sev] = ssa_decompose(X);
	[Vt, rca] = ssa_group(U, V, c_ind);
	y = ssa_reconstr(Vt, rca, x, L);
	varargout={y};
end