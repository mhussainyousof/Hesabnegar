import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final double height;
  final List<Widget> children;

  const HeaderWidget({
    super.key,
    required this.children, 
    this.height = 100.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      height: height, 
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.amber,
            Colors.orangeAccent,
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children, 
      ),
    );
  }
}
