import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Map<String, dynamic> weatherData = {
    'main': {
      'temp': 33,
      'temp_max': 38,
      'temp_min': 20,
    },
    'weather': [
      {'description': 'sunny'}
    ],
    'name': 'Sohag'
  };

  String getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  Widget buildFlutterIcon() {
    return Icon(
      Icons.wb_sunny,
      size: 80,
      color: Color(0xFFFFD700),
    );
  }

  Widget buildCustomSunIcon() {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < 8; i++)
            Transform.rotate(
              angle: i * 3.14159 / 4,
              child: Container(
                width: 4,
                height: 25,
                margin: EdgeInsets.only(bottom: 45),
                decoration: BoxDecoration(
                  color: Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFD700),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFFFD700).withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmojiIcon() {
    return Text(
      '☀️',
      style: TextStyle(fontSize: 80),
    );
  }

  Widget buildAnimatedIcon() {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.rotate(
          angle: value * 2 * 3.14159,
          child: Icon(
            Icons.wb_sunny,
            size: 80,
            color: Color(0xFFFFD700),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF4A90E2),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            getCurrentTime(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Icon(Icons.wifi, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Icon(Icons.bluetooth, color: Colors.white, size: 18),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Icon(Icons.battery_full, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'DEBUG',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF4A90E2),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherData['name'],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'updated at ${getCurrentTime()}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildFlutterIcon(),
                        
                        SizedBox(width: 25),
                        Text(
                          '${weatherData['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Maxtemp: ${weatherData['main']['temp_max']}°C',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Mintemp: ${weatherData['main']['temp_min']}°C',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Sunny',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}