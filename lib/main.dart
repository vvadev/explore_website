import 'package:auto_size_text/auto_size_text.dart';
import 'package:explore_website/carousel_block.dart';
import 'package:explore_website/responcive_widget.dart';
import 'package:explore_website/web_footer.dart';
import 'package:explore_website/web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _isHovering = [false, false, false, false];
  final List _titles = ['Sign Up', 'Login', 'Discover', 'Contact Us'];
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.60
        ? _scrollPosition / (screenSize.height * 0.60)
        : 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  const Color.fromARGB(255, 2, 0, 36).withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'EXPLORE',
                style: GoogleFonts.getFont(
                  'Comfortaa',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: Container(
                color:
                    const Color.fromARGB(255, 2, 0, 36).withOpacity(_opacity),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'EXPLORE',
                        style: GoogleFonts.getFont('Comfortaa',
                            color: Colors.white, fontSize: 18),
                        children: const [
                          TextSpan(
                            text: ' by VVA Dev',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onHover: ((value) {
                              setState(() {
                                _isHovering[0] = value;
                              });
                            }),
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _titles[2],
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    color: _isHovering[0]
                                        ? const Color.fromARGB(
                                            255, 188, 193, 255)
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[0],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onHover: ((value) {
                              setState(() {
                                _isHovering[1] = value;
                              });
                            }),
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _titles[3],
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    color: _isHovering[0]
                                        ? const Color.fromARGB(
                                            255, 188, 193, 255)
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[1],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onHover: ((value) {
                        setState(() {
                          _isHovering[2] = value;
                        });
                      }),
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _titles[0],
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: _isHovering[0]
                                  ? const Color.fromARGB(255, 188, 193, 255)
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    InkWell(
                      onHover: ((value) {
                        setState(() {
                          _isHovering[3] = value;
                        });
                      }),
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _titles[1],
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: _isHovering[0]
                                  ? const Color.fromARGB(255, 188, 193, 255)
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              backgroundColor: const Color.fromARGB(255, 2, 0, 36),
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        color: Colors.white,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        _titles[index],
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
            )
          : null,
      body: WebScrollbar(
        color: const Color.fromARGB(255, 2, 0, 36),
        backgroundColor: const Color.fromARGB(255, 2, 0, 36).withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.6,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/back3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.25,
                      ),
                      child: Text(
                        'EXPLORE',
                        style: GoogleFonts.getFont('Comfortaa',
                            color: Colors.white,
                            fontSize: screenSize.width / 11),
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: 1,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height * 0.55,
                          left: screenSize.width / 5,
                          right: screenSize.width / 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          height: screenSize.height / 10,
                          width: screenSize.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: screenSize.width * 0.6 / 5,
                                child: Center(
                                  child: AutoSizeText(
                                    'Destination',
                                    minFontSize: 8,
                                    maxLines: 1,
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: Colors.black26,
                                width: 1,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.6 / 5,
                                child: Center(
                                  child: AutoSizeText(
                                    'Dates',
                                    minFontSize: 8,
                                    maxLines: 1,
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: Colors.black26,
                                width: 1,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.6 / 5,
                                child: Center(
                                  child: AutoSizeText(
                                    'People',
                                    minFontSize: 8,
                                    maxLines: 1,
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: Colors.black26,
                                width: 1,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.6 / 5,
                                child: Center(
                                  child: AutoSizeText(
                                    'Experience',
                                    minFontSize: 8,
                                    maxLines: 1,
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width / 13),
                width: screenSize.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Featured',
                          style: GoogleFonts.getFont(
                            'Comfortaa',
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Unique wildlife tours & destinations',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: screenSize.width / 6,
                              width: screenSize.width / 3.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/exploring.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                'Trekking',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: screenSize.width / 6,
                              width: screenSize.width / 3.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/animal.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                'Animals',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: screenSize.width / 6,
                              width: screenSize.width / 3.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/photograper.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                'Photography',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 52),
              const CarouselBlock(),
              const SizedBox(height: 32),
              const WebFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
