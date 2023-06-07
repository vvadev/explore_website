import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_website/responcive_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselBlock extends StatefulWidget {
  const CarouselBlock({Key? key}) : super(key: key);

  @override
  _CarouselBlockState createState() => _CarouselBlockState();
}

class _CarouselBlockState extends State<CarouselBlock> {
  final List<String> images = [
    'assets/asia.jpg',
    'assets/afrika.jpg',
    'assets/europ.jpg',
    'assets/amerika.jpg',
    'assets/australia.jpg',
    'assets/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  int _current = 0;

  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    return Column(
      children: [
        Center(
          child: Text(
            'Destinations diviersity',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              'Comfortaa',
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 18 / 8,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    for (int i = 0; i < imageSliders.length; i++) {
                      if (i == index) {
                        _isSelected[i] = true;
                      } else {
                        _isSelected[i] = false;
                      }
                    }
                  });
                },
              ),
              carouselController: _controller,
            ),
            Center(
              child: Text(
                places[_current],
                style: GoogleFonts.getFont(
                  'Comfortaa',
                  letterSpacing: 8,
                  fontSize: screenSize.width / 25,
                  color: Colors.white,
                ),
              ),
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? Container()
                : Positioned(
                    bottom: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: GoogleFonts.getFont(
                                            'Montserrat',
                                            color: _isHovering[i]
                                                ? const Color.fromARGB(
                                                    255, 94, 94, 94)
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
