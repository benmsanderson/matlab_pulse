mdl = arima(2,0,0); % 2 the lag order
EstMdl = estimate(mdl,r); % y is your data
y = simulate(EstMdl,500);
