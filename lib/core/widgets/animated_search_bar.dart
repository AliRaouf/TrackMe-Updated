import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar(
      {super.key,
      required this.textController,
      required this.onSubmitted,
      required this.width,
      required this.expanded});
  final TextEditingController textController;
  final dynamic Function(String) onSubmitted;
  final double width;
  final bool expanded;
  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
      autoFocus: widget.expanded,
      width: widget.width,
      textController: widget.textController,
      onSuffixTap: () {
        setState(() {
          widget.textController.clear();
        });
      },
      onSubmitted: widget.onSubmitted,
    );
  }
}
