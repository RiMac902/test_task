import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Color _backgroundColor;
  static const int _maxRGBValue = 256;

  @override
  void initState() {
    super.initState();
    _backgroundColor = CupertinoColors.activeBlue;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorAnimation = ColorTween(
      begin: _backgroundColor,
      end: _getRandomColor(),
    ).animate(_animationController);

    _animationController.addListener(_updateBackgroundColor);
  }

  Color _getRandomColor() {
    final random = Random();

    return Color.fromRGBO(
      random.nextInt(_maxRGBValue),
      random.nextInt(_maxRGBValue),
      random.nextInt(_maxRGBValue),
      1,
    );
  }

  void _updateBackgroundColor() {
    setState(() {
      _backgroundColor = _colorAnimation.value!;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startChangingColors() {
    _colorAnimation = ColorTween(
      begin: _backgroundColor,
      end: _getRandomColor(),
    ).animate(_animationController);

    _animationController.forward(from: 0);
  }

  void _stopChangingColors(LongPressEndDetails details) {
    _animationController.stop();
  }

  void _handleTap() {
    setState(() {
      _backgroundColor = _getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onLongPress: _startChangingColors,
      onLongPressEnd: _stopChangingColors,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text(
            'Hello there',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
