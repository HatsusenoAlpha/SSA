function varargout=ssa_group(U, V, c_ind)
	% This function is used for grouping components from singular value
	% decomposition of reformed matrix;
	% U and V are the results from SVD of X.
	% c_ind is the index of selected components.
	% code begins.
	
	Vt = V';
	rca = U(:, c_ind) * Vt(c_ind, :);
	varargout = {Vt, rca};
end