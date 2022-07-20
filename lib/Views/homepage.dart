import 'package:flutter/material.dart';
import 'package:weather_app/models.dart';
import 'package:weather_app/services.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _textcontroller = TextEditingController();
  final _dataservices = dataServices();
 late WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          if (_response != null)
          Column(
            children: [
              Image.network(_response.iconUrl),
              Text(
                    '${_response.tempInfo.temperature}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(_response.weatherInfo.Description),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: 150,
            ),
          ),
          TextField(
            controller: _textcontroller,
            decoration: InputDecoration(labelText: 'City'),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () async {
                final response =
                    await _dataservices.getWeather(_textcontroller.text);
                setState(() => _response = response);
              },
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    );
  }
}
