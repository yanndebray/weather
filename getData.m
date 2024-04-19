function response = getData()
apiKey ="b1b15e88fa797225412429c1c50c122a1";
% Define the location for which you want the weather forecast
cityName = "Muenchen"; 
countryCode = "DE";

% Create the URL for the API call
url = sprintf("http://samples.openweathermap.org/data/2.5/forecast?q=%s,%s&appid=%s", cityName, countryCode, apiKey);

% Send the web request to the OpenWeatherMap API
response = webread(url);
end