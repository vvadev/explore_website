import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 250,
      color: Color.fromARGB(255, 25, 25, 53),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0,
                  color: Color(0xFF277AC2),
                ),
              ),
            ),
            height: 90,
            child: Stack(
              children: [
                WaveBackground(
                  waves: 1,
                  waveAmplitude: 100,
                  color: Color.fromARGB(255, 42, 127, 197).withOpacity(0.4),
                  duration: 4000,
                ),
                WaveBackground(
                  waves: 1,
                  waveAmplitude: 52,
                  color: Colors.blue.withOpacity(0.4),
                  duration: 2500,
                ),
                WaveBackground(
                  waves: 1,
                  waveAmplitude: 20,
                  color: Color.fromARGB(255, 50, 154, 238).withOpacity(0.4),
                  duration: 3000,
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF277AC2),
              border: Border.all(width: 0, color: const Color(0xFF277AC2)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          child: Image.asset('assets/vk.png'),
                        )),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          child: Image.asset('assets/discord.png'),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Text(
                          'Home',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          'Team',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          'Contact',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Text(
                  '©2022 VVA Dev | All Rights Reserved',
                  style: GoogleFonts.getFont(
                    'Comfortaa',
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveBackground extends StatefulWidget {
  final int waves;
  final double waveAmplitude;
  final Color color;
  final int duration;
  const WaveBackground({
    Key? key,
    required this.waves,
    required this.waveAmplitude,
    required this.color,
    required this.duration,
  }) : super(key: key);

  @override
  State<WaveBackground> createState() =>
      _WaveBackgroundState(waves, waveAmplitude, color, duration);
}

class _WaveBackgroundState extends State<WaveBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final int waves;
  final double waveAmplitude;
  final Color color;
  final int duration;

  _WaveBackgroundState(
      this.waves, this.waveAmplitude, this.color, this.duration);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? widget) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: WavePainter(
            controller: _controller,
            waves: waves,
            waveAmplitude: waveAmplitude,
            color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }
}

class WavePainter extends CustomPainter {
  late final Animation<double> position;
  final Animation<double> controller;
  final Color color;

  /// Number of waves to paint.
  final int waves;

  /// How high the wave should be.
  final double waveAmplitude;
  int get waveSegments => 2 * waves - 1;

  WavePainter({
    required this.controller,
    required this.waves,
    required this.waveAmplitude,
    required this.color,
  }) {
    position = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.linear))
        .animate(controller);
  }

  void drawWave(Path path, int wave, size) {
    double waveWidth = size.width / waveSegments;
    double waveMinHeight = size.height / 2;

    double x1 = wave * waveWidth + waveWidth / 2;
    // Minimum and maximum height points of the waves.
    double y1 = waveMinHeight + (wave.isOdd ? waveAmplitude : -waveAmplitude);

    double x2 = x1 + waveWidth / 2;
    double y2 = waveMinHeight;

    path.quadraticBezierTo(x1, y1, x2, y2);
    if (wave <= waveSegments) {
      drawWave(path, wave + 1, size);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw the waves
    Path path = Path()..moveTo(0, size.height / 2);
    drawWave(path, 0, size);

    // Draw lines to the bottom corners of the size/screen with account for one extra wave.
    double waveWidth = (size.width / waveSegments) * 2;
    path
      ..lineTo(size.width + waveWidth, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    // Animate sideways one wave length, so it repeats cleanly.
    Path shiftedPath = path.shift(Offset(-position.value * waveWidth, 0));

    canvas.drawPath(shiftedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
