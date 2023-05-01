import 'dart:async';

import 'package:app_weather_cubit/constants/constants.dart';
import 'package:app_weather_cubit/cubits/weather/weather_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubitCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSubscription;
  final WeatherCubit weatherCubit;

  ThemeCubitCubit({
    required this.weatherCubit
  }) : super(ThemeState.initial()) {
    weatherSubscription = weatherCubit.stream.listen((WeatherState weatherState) {
      print('WeatherState: $weatherState');

      if (weatherState.weather.temp > kWarmOrNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
}
