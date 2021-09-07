function varargout = ssa_decompose(X)
	% This function is used to conduct singular value decomposing on the
	% reformed matrix.
	% X is the matrix to be decomposed.
	S = X*X';
	[U, autoval] = eig(S);
	[d, i] = sort(diag(autoval), 'descend');
	sev = sum(d);
	U = U(:,i);
	V = (X')*U;
	varargout = {U, V, sev};
end