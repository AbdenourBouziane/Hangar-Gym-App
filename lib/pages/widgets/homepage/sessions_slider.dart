import 'package:flutter/material.dart';

class StaticSlider extends StatefulWidget {
  final double value;
  final int divisions;
  final ValueChanged<double> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const StaticSlider({
    super.key,
    required this.value,
    required this.divisions,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _StaticSliderState createState() => _StaticSliderState();
}

class _StaticSliderState extends State<StaticSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.value,
      min: 0,
      max: widget.divisions.toDouble(),
      onChanged: widget.onChanged,
      divisions: widget.divisions,
      label: widget.value.toStringAsFixed(2),
      inactiveColor: widget.activeColor,
      activeColor: widget.activeColor,
    );
  }
}
