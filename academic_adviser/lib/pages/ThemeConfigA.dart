import 'package:flutter/material.dart';

class ThemeConfig extends InheritedWidget{
  bool theme = false;
   late Color primaryColor;
   late List<Color> primaryGradientColor;
   late Color backgroundColor;
   late Color backgroundTextColor;
   late double opacity;
   late Color signinTextColor;
   late Color signinCardColor;
   late Color servicesTitleColor;
   late Color foregroundStudentsListColor;
   late Color headerListColor;
   late Color headerTextColor;
   late Color studentsListCardColor;
   late Color studentListButton;

ThemeConfig({required Widget child}) : super(child: child){
    orginalTheme();
  }
  ThemeConfig.orginalTheme({required Widget child}) : super(child: child){
    orginalTheme();
  }
  ThemeConfig.acadimicTheme({required Widget child}) : super(child: child){
      acadimicTheme();
    }

  orginalTheme() {
    theme = false;
    primaryColor = Color.fromARGB(255, 114, 72, 185);
    primaryGradientColor = [
      Color.fromARGB(255, 96, 220, 220),
      Color.fromARGB(255, 114, 72, 185),
    ];
    backgroundColor = Colors.white;
    backgroundTextColor = Colors.white;
    opacity = 1;
    signinTextColor = Color.fromARGB(255, 212, 232, 242);
    signinCardColor = Color.fromARGB(255, 212, 232, 242);
    servicesTitleColor = Color.fromARGB(255, 231, 248, 249);
    foregroundStudentsListColor = Color.fromARGB(255, 227, 225, 225);
    headerListColor = Colors.white;
    headerTextColor = Color.fromARGB(255, 74, 73, 73);
    studentsListCardColor = Colors.white;
    studentListButton = Color.fromARGB(255, 113, 99, 192);
  }
  acadimicTheme() {
    theme = true;
    primaryColor = Color.fromARGB(255, 29,47,85);
    primaryGradientColor = List.generate(2, (index) => Color.fromARGB(255,29,47,85));
    backgroundColor = Color.fromARGB(255, 227, 225, 225);
    backgroundTextColor = Color.fromARGB(255, 112, 112, 112);
    opacity = 0;
    signinTextColor = Colors.white;
    signinCardColor = Color.fromARGB(255,29,47,85);
    servicesTitleColor = Color.fromARGB(216, 0, 0, 0);
    foregroundStudentsListColor = Colors.white;
    headerListColor = Color.fromARGB(255, 29,47,85);
    headerTextColor = Colors.white;
    studentsListCardColor = Color.fromARGB(255, 228, 228, 228);
    studentListButton = Color.fromARGB(255, 29,47,85);
  }
  @override
    bool updateShouldNotify(ThemeConfig oldWidget) {
      return this.primaryColor != oldWidget.primaryColor;
    }

     static ThemeConfig? of(BuildContext context) {
       return context.dependOnInheritedWidgetOfExactType<ThemeConfig>();
     }
}