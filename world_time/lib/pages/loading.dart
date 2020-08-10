import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/weather.dart';
import 'package:world_time/services/weather.dart';
import 'package:world_time/services/weather_icons.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  final String location, flag, url;

  Loading({this.location, this.flag, this.url});

  @override
  _LoadingState createState() =>
      _LoadingState(location: location, flag: flag, url: url);
}

class _LoadingState extends State<Loading> {
  String location, flag, url;
  _LoadingState({this.location, this.flag, this.url});

  void setup() async {
    WorldTime timeData = WorldTime(location: location, flag: flag, url: url);
    await timeData.getTime();

    // get weather data.
    WorldWeather worldWeather = WorldWeather();
    Weather weatherData = await worldWeather.getWeatherData(location);

    // choose icon accordingly.
    int code = weatherData.weatherConditionCode;
    IconData weatherIcon;
    if (code < 300) {
      weatherIcon = WeatherIcons.cloud_flash;
    } else if (code < 500) {
      weatherIcon = WeatherIcons.drizzle;
    } else if (code < 600) {
      weatherIcon = WeatherIcons.rain;
    } else if (code < 701) {
      weatherIcon = WeatherIcons.snow;
    } else if (code == 800) {
      weatherIcon =
          timeData.isDaytime ? WeatherIcons.sun_filled : WeatherIcons.moon;
    } else if (code < 803) {
      weatherIcon = WeatherIcons.cloud_sun;
    } else {
      weatherIcon = WeatherIcons.cloud;
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': timeData.location,
      'flag': timeData.flag,
      'time': timeData.time,
      'isDaytime': timeData.isDaytime,
      'weatherDescription': weatherData.weatherDescription,
      'temperature': weatherData.temperature,
      'feelsLike': weatherData.tempFeelsLike,
      'weatherIcon': weatherIcon,
    });
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
