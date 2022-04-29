import 'package:flutter/material.dart';

class CustomStack extends StatefulWidget {
  final Widget? child;
  final String image;

  const CustomStack({
    Key? key,
    this.child,
    required this.image,
  }) : super(key: key);

  @override
  State<CustomStack> createState() => _CustomStackState();
}

class _CustomStackState extends State<CustomStack> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          //tamanho total do totalpega o
          height: size.height,
          width: size.width,
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          child: widget.child,
          padding: EdgeInsets.only(
            top: mediaQuery.padding.top,
            left: 16,
            right: 16,
          ),
        ),
      ],
    );
  }
}
