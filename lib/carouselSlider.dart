import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  // List of containers to display
  List<Container> _containers = [
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.orange),
    Container(color: Colors.purple),
    Container(color: Colors.red),
  ];

  // Index of the currently selected container
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Display the two side containers
        Positioned(
          left: 20,
          top: 50,
          bottom: 50,
          child: Transform.scale(
            scale: 0.8,
            child: _containers[(_currentIndex - 1) % _containers.length],
          ),
        ),
        Positioned(
          right: 20,
          top: 50,
          bottom: 50,
          child: Transform.scale(
            scale: 0.8,
            child: _containers[(_currentIndex + 1) % _containers.length],
          ),
        ),
        // Display the front container
        Center(
          child: Transform.scale(
            scale: 1.2,
            child: _containers[_currentIndex],
          ),
        ),
        // Display the page indicator
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ),
        // Handle the swipe gestures
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              setState(() {
                _currentIndex = (_currentIndex - 1) % _containers.length;
              });
            } else if (details.primaryVelocity! < 0) {
              setState(() {
                _currentIndex = (_currentIndex + 1) % _containers.length;
              });
            }
          },
        ),
      ],
    );
  }

  // Build the page indicator dots
  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _containers.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == i ? Colors.white : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
