import 'dart:async';
import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  final List<String> imageList;
  const PromoSlider({Key? key, required this.imageList}) : super(key: key);

  @override
  _PromoSliderState createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  late final PageController _controller;
  late Timer _timer;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _current = (_current + 1) % widget.imageList.length;
      _controller.animateToPage(
        _current,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.imageList.length,
            onPageChanged: (idx) => setState(() => _current = idx),
            itemBuilder: (_, idx) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imageList[idx],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imageList.length, (idx) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _current == idx ? 12 : 8,
              height: _current == idx ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == idx ? Colors.brown : Colors.grey[400],
              ),
            );
          }),
        ),
      ],
    );
  }
}
