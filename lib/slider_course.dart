import 'package:flutter/material.dart';

class CarouselSliderWithButtons extends StatefulWidget {
  final List<Widget> items;

  CarouselSliderWithButtons({
    required this.items,
  });

  @override
  _CarouselSliderWithButtonsState createState() =>
      _CarouselSliderWithButtonsState();
}

class _CarouselSliderWithButtonsState extends State<CarouselSliderWithButtons> {
  final PageController _pageController = PageController(viewportFraction: 1);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: widget.items[index],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white.withOpacity(0.7),
              ),
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.7),
              ),
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
