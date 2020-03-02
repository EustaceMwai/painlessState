import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:painless_state/weather/weather_event.dart';
import 'package:painless_state/weather/weather_state.dart';
import '../model/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // TODO: implement mapEventToState
    if(event is GetWeather){
      //output state from async
      yield WeatherLoading();
      final weather = await _fetchWeatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);


    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName){

    return Future.delayed(Duration(seconds : 1),
        (){
      return Weather(
        cityName: cityName,
        //Temp b2n 20 to 30
        temperature: 20 + Random().nextInt(15) + Random().nextDouble(),

      );
        }
    );
  }

}
