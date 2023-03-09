import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class PageNavButton extends StatelessWidget {
  final String label;
  final String desc;
  final VoidCallback onPressed;

  const PageNavButton({Key? key, required this.label, required this.desc, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          side: const BorderSide(width: 2, color: Colors.white30),
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(med))),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: paddingAllXL,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white38,
                    Colors.black45,
                    Colors.black,
                    Colors.black45,
                    Colors.white38,
                  ],
                ),
                borderRadius: radiusM,
              ),
              child: Text(
                label,
                style: const TextStyle(fontFamily: 'Audiowide', color: Colors.white),
              ),
            ),
            boxL,
            Text(desc, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
