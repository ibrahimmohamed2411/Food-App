import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(isDark);
  void toggleTheme(bool value) async {
    emit(value);
    final instance = await SharedPreferences.getInstance();
    await instance.setBool('isDark', value);
  }
}
