import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Color(0xffCAFB09),
      ),
    ),
  );
}
linearProgress() {
  return Container(
    margin: EdgeInsets.zero,
    alignment: Alignment.center,

    child: const LinearProgressIndicator(
      backgroundColor: Colors.black45,
      valueColor: AlwaysStoppedAnimation(
          Color(0xffCAFB09),
      ),
    ),
  );
}