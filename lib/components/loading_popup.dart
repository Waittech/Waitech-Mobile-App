import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


void loadingPopUp() {
  Grock.dialog(
    builder: (_) {
      return Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Color(0xff696cff),

          size: 110,
        ),);
    },
  );
}
