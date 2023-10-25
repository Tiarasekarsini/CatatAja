import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:catataja/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
          accent: Color.fromARGB(255, 123, 17, 10),
          backButton: false,
          locale: 'id',
          firstDate: DateTime.now().subtract(Duration(days: 140)),
          lastDate: DateTime.now(),
          onDateChanged: (value) => print(value)),
      body: HomePage(),
    );
  }
}
