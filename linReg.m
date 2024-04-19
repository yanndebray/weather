function y = linReg(X)
    mdl = load("model1.mat");
    model = mdl.model1;
    y = predict(model,X);