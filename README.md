
# <span style="color:rgb(213,80,0)">Weather analysis</span>

2024-01-03

# Prepare data
```matlab
apiKey ="b1b15e88fa797225412429c1c50c122a1";

% Define the location for which you want the weather forecast
cityName = "Muenchen"; 
countryCode = "DE";

% Create the URL for the API call
url = sprintf("http://samples.openweathermap.org/data/2.5/forecast?q=%s,%s&appid=%s", cityName, countryCode, apiKey);

% Send the web request to the OpenWeatherMap API
response = webread(url);

% Assuming "response" is the struct obtained from the OpenWeatherMap API
data = parseForecast(response.list);
data = struct2table(data)
```
| |date|temperature|weather|clouds|wind|details|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|16-Feb-2017 12:00:00|286.6700|'Clear'|0|1.8100|'clear sky'|
|2|16-Feb-2017 15:00:00|285.6600|'Clear'|0|1.5900|'clear sky'|
|3|16-Feb-2017 18:00:00|277.0500|'Clear'|0|1.4100|'clear sky'|
|4|16-Feb-2017 21:00:00|272.7800|'Clear'|0|2.2400|'clear sky'|
|5|17-Feb-2017 00:00:00|273.3410|'Clouds'|76|3.5900|'broken clouds'|
|6|17-Feb-2017 03:00:00|275.5680|'Rain'|76|3.7700|'light rain'|
|7|17-Feb-2017 06:00:00|276.4780|'Rain'|92|3.8100|'moderate rain'|
|8|17-Feb-2017 09:00:00|276.6700|'Rain'|64|2.6000|'light rain'|
|9|17-Feb-2017 12:00:00|278.2530|'Rain'|92|3.1700|'light rain'|
|10|17-Feb-2017 15:00:00|276.4550|'Rain'|92|3.2100|'light rain'|
|11|17-Feb-2017 18:00:00|275.6390|'Rain'|88|3.1700|'light rain'|
|12|17-Feb-2017 21:00:00|275.4590|'Rain'|88|3.7100|'light rain'|
|13|18-Feb-2017 00:00:00|275.0350|'Rain'|92|3.5600|'light rain'|
|14|18-Feb-2017 03:00:00|274.9650|'Rain'|88|2.6600|'light rain'|

# Modeling
```matlab
n = 3;
X = (1:36);
y = data.temperature;
p = polyfit(X,y,n);
y1 = polyval(p,X);
plot(X,y,X,y1)
```

<center><img src="README_media/figure_0.png" width="516" alt="figure_0.png"></center>

# Helper function
```matlab
function forecastData = parseForecast(responseList)
    % Initialize an array of structs to hold the parsed forecast data
    forecastData = struct("date", {}, "temperature", {}, "weather", {}, "clouds", {}, "wind", {}, "details", {});

    % Loop through each entry in the responseList cell array
    for i = 1:length(responseList)
        % Get the current forecast struct
        forecastStruct = responseList{i};

        % Extract the date and time of the forecast
        forecastData(i).date = datetime(forecastStruct.dt, "ConvertFrom", "posixtime");

        % Extract main forecast data like temperature
        forecastData(i).temperature = forecastStruct.main.temp;

        % Extract weather conditions
        forecastData(i).weather = forecastStruct.weather(1).main;

        % Extract cloud data
        forecastData(i).clouds = forecastStruct.clouds.all;

        % Extract wind data
        forecastData(i).wind = forecastStruct.wind.speed;

        % Extract additional details if needed
        forecastData(i).details = forecastStruct.weather(1).description;
    end
end
```
