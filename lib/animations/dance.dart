import 'package:flutter/material.dart';

class Dance extends StatefulWidget {
  const Dance({required this.child,
    required this.animate,
    required this.delay,
    Key? key}) : super(key: key);

  final Widget child;
  final bool animate;
  final int delay;

  @override
  State<Dance> createState() => _DanceState();
}

class _DanceState extends State<Dance> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
        vsync: this);
    animation = TweenSequence<Offset>(
      [
        TweenSequenceItem(tween: Tween(begin: Offset(0,0), end: Offset(0,-0.80)), weight: 15),
        TweenSequenceItem(tween: Tween(begin: Offset(0,-0.80), end: Offset(0,0)), weight: 10),
        TweenSequenceItem(tween: Tween(begin: Offset(0,0), end: Offset(0,-0.30)), weight: 12),
        TweenSequenceItem(tween: Tween(begin: Offset(0,-0.30), end: Offset(0,0)), weight: 8),
      ]
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutSine));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Dance oldWidget) {
    if (widget.animate) {
      Future.delayed(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          controller.forward();
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: animation,
      child: widget.child,
    );
  }
}
