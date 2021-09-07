function varargout=ssa_reconstr(Vt, rca, x, L)
	% This function is used for reconstructing temporal signals from
	% grouped components which are computed in decomposition and grouping;
	% Vt and rca are grouped component;
	% x is the original signal whose length is required.
	% L is the length of sliding window.
	% code begins
	
	% get length of the original signal
	N = length(x);
	% initiating result
	y = zeros(N, 1);
	% computing the number of windows
	K = N - L + 1;
	Lp = min(L, K);
	Kp = max(L, K);
	
	% recontruction begins
	for k = 0 : Lp - 2
		for m = 1 : k+1
			y(k+1)=y(k+1)+(1/(k+1))*rca(m, k-m+2);
		end
	end
	
	for k = Lp-1:Kp-1
		for m = 1 : Lp
			y(k+1)=y(k+1)+(1/(Lp))*rca(m, k-m+2);
		end
	end
	
	for k=Kp:N-1
		for m=k-Kp+2:N-Kp+1
			y(k+1)=y(k+1)+(1/(N-k))*rca(m,k-m+2);
		end
	end
	
	varargout={y};
	
end