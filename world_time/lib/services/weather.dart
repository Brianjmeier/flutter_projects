import 'package:weather/weather.dart';

class WorldWeather extends WeatherFactory {
  WorldWeather._()
      : super('c5e98dccc3fa486eb685e3eab0834f2b', language: Language.SPANISH);

  static final WorldWeather _worldWeather = WorldWeather._();

  factory WorldWeather() => _worldWeather;

  Future<Weather> getWeatherData(String location) async =>
      this.currentWeatherByCityName(location);
}
