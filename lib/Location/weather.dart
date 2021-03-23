import 'networking.dart';
import 'currentLocation.dart';

const apiKey = '2b3f60e52fcc3c8a6d1f2396d84d3f76';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double longitude;
  double latitude;
  var name;

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    print(longitude);
    print(latitude);

    NetworkingHelper networkingHelper = NetworkingHelper(
        '$openWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var locationData = await networkingHelper.getData();
    return locationData;
  }
}
