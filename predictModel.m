function y = linReg(X)

    mdl = load("model1.mat");
    model = mdl.model1;
    y = predict(model,X);

    % Deployed version
    % X = (1:36)';
    % base_url = "http://aba7232f34aab4d96b54441d5284b371-1219692550.us-east-1.elb.amazonaws.com:9910";
    % 
    % % Define the headers
    % options = weboptions('ContentType', 'json', 'MediaType', 'application/json');
    % 
    % % Create the data payload
    % % data = struct('nargout', 1, 'rhs', X);
    % data = mps.json.encoderequest({X});
    % 
    % % Send the POST request
    % response = webwrite(base_url + "/model1/linReg", data, options);

end