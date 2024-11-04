import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BakongKhqrView extends StatefulWidget {
  const BakongKhqrView({
    super.key,
    this.width = 300,
    required this.merchantName,
    required this.amount,
    required this.qrString,
  });

  final double width;
  final String merchantName;
  final String amount;
  final String qrString;

  @override
  State<BakongKhqrView> createState() => _BakongKhqrViewState();
}

class _BakongKhqrViewState extends State<BakongKhqrView> {
  double get _aspecRatio => 20 / 29;
  double get _height => (widget.width / _aspecRatio);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: widget.width - 25,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.width * 0.12 * _aspecRatio),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: widget.width * 0.16 * _aspecRatio,
                  offset: const Offset(0, 0), // Shadow position
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  height: _height * 0.15 * _aspecRatio,
                  width: widget.width,
                  color: const Color.fromRGBO(255, 35, 26, 1),
                  padding: EdgeInsets.all(widget.width * 0.07 * _aspecRatio),
                  child: SvgPicture.asset('packages/flutter_bakong_khqr/assets/khqr/khqr_logo.svg'),
                ),
                Expanded(
                  child: Container(
                    width: widget.width,
                    color: const Color.fromRGBO(255, 35, 26, 1),
                    child: ClipPath(
                      clipper: QrHeaderClipper(aspecRatio: _aspecRatio),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: _height * 0.05 * _aspecRatio,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.width * 0.1 * _aspecRatio,
                              ),
                              child: Text(
                                widget.merchantName,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 0.07 * widget.width * _aspecRatio,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.005 * _aspecRatio,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.width * 0.1 * _aspecRatio,
                              ),
                              child: Row(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RichText(
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: widget.amount,
                                      style: TextStyle(
                                        fontSize: 0.15 * widget.width * _aspecRatio,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widget.width * 0.03 * _aspecRatio,
                                  ),
                                  RichText(
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: "KHR",
                                      style: TextStyle(
                                        fontSize: 0.07 * widget.width * _aspecRatio,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.03 * _aspecRatio,
                            ),
                            CustomPaint(
                              painter: DashedLineHorizontalPainter(
                                aspecRatio: _aspecRatio,
                              ),
                              size: Size(widget.width, 1),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: _height * 0.06 * _aspecRatio),
                                    child: SizedBox(
                                      width: _height * 0.78 * _aspecRatio,
                                      height: _height * 0.78 * _aspecRatio,
                                      child: Stack(
                                        children: [
                                          QrImageView(
                                            padding: const EdgeInsets.all(0),
                                            data: widget.qrString,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// [DashedLineHorizontalPainter] help to draw dashed line
class DashedLineHorizontalPainter extends CustomPainter {
  DashedLineHorizontalPainter({
    required this.aspecRatio,
  });

  final double aspecRatio;

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = size.width * 0.07 * aspecRatio, dashSpace = size.width * 0.04 * aspecRatio, startX = 0;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// [QrHeaderClipper] help to clip header
class QrHeaderClipper extends CustomClipper<Path> {
  QrHeaderClipper({
    required this.aspecRatio,
  });

  final double aspecRatio;

  @override
  Path getClip(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;

    path.lineTo(width - width * 0.13 * aspecRatio, 0);
    path.lineTo(width, height * 0.1 * aspecRatio);
    path.lineTo(height, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
