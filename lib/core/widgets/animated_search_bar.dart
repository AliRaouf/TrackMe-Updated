import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar(
      {super.key, required this.textController, required this.onSubmitted});
  final TextEditingController textController;
  final dynamic Function(String) onSubmitted;
  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
      width: MediaQuery.sizeOf(context).width * 0.9,
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
