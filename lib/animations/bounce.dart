import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  const Bounce({required this.child,
    required this.animate,
    Key? key}) : super(key: key);

  final Widget child;
  final bool animate;


  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;
  
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
        vsync: this);

    animation = TweenSequence<double>(
     [
       TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.30), weight: 1),
       TweenSequenceItem(tween: Tween(begin: 1.30, end: 1.0), weight: 1),
     ]
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Bounce oldWidget) {
    if(widget.animate){
      animationController.reset();
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: animation,
      child: widget.child,
    );
  }
}
