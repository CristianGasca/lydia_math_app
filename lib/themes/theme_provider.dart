import 'package:flutter/material.dart';
import 'package:lydia_math_app/themes/modo_diurno.dart';
import 'package:lydia_math_app/themes/modo_nocturno.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData =ModoDiurno;
  
  ThemeData get themeData => _themeData;
  
  bool get isDarkMode => _themeData == ModoNocturno;
  
  set themeData(ThemeData themeData) {
  
    _themeData =themeData;
  
    notifyListeners();
  }
 
  void toggleTheme(){
    
    if(_themeData == ModoDiurno){
    
      themeData = ModoNocturno;
    }
    else{
      themeData = ModoDiurno;
    }
  }
}