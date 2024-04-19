function forecastData = parseForecast(responseList)
    forecastData = struct("date", {}, ...
                "temperature", {} ...
        );
        % , "weather", {}, "clouds", {}, "wind", {}, "details", {});

    % Loop through each entry in the responseList cell array
    for i = 1:length(responseList)
        % Get the current forecast struct
        forecastStruct = responseList{i};

        % Extract the date and time of the forecast
        forecastData(i).date = datetime(forecastStruct.dt, "ConvertFrom", "posixtime");

        % Extract main forecast data like temperature
        forecastData(i).temperature = forecastStruct.main.temp - 273.15;

        % % Extract weather conditions
        % app.forecastData(i).weather = forecastStruct.weather(1).main;
        % 
        % % Extract cloud data
        % app.forecastData(i).clouds = forecastStruct.clouds.all;
        % 
        % % Extract wind data
        % app.forecastData(i).wind = forecastStruct.wind.speed;
        % 
        % % Extract additional details if needed
        % app.forecastData(i).details = forecastStruct.weather(1).description;
    end
end