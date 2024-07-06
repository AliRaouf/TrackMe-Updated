import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainFeatureButton extends StatelessWidget {
  const MainFeatureButton(
      {super.key,
      required this.color,
      required this.text,
      required this.image,
      this.onTap});
  final Color color;
  final String text;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.18,
        child: AspectRatio(
            aspectRatio: 1.1 / 1,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    image,
                    height: 80,
                    width: 80,
                    // ignore: deprecated_member_use
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(height: 8),
                  Text(text, style: Theme.of(context).textTheme.titleSmall)
                ],
              ),
            )),
      ),
    );
  }
}
