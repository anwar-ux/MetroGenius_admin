import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;

  const AnimatedButton({super.key, required this.text});

  @override
  AnimatedButtonState createState() => AnimatedButtonState(text: text);
}

class AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;

  AnimatedButtonState({required this.text});

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
            _controller.forward();
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
            _controller.reverse();
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 224,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isHovered ? Colors.lightBlue : Colors.transparent,
                  width: 2,
                ),
                color: Colors.blue[800],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    width: 192,
                    height: 192,
                    top: _isHovered ? -68 : 112,
                    left: _isHovered ? -68 : 112,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    width: 160,
                    height: 160,
                    top: _isHovered ? -48 : 96,
                    left: _isHovered ? -48 : 96,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    width: 128,
                    height: 128,
                    top: _isHovered ? -32 : 80,
                    left: _isHovered ? -32 : 80,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    width: 96,
                    height: 96,
                    top: _isHovered ? -16 : 64,
                    left: _isHovered ? -16 : 64,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[600],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    width: 64,
                    height: 64,
                    top: _isHovered ? 0 : 48,
                    left: _isHovered ? 0 : 48,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[500],
                      ),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
