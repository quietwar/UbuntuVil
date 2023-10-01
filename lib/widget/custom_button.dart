import 'package:flutter/material.dart';
import 'package:ubuntu_villages/widget/loader.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function() onPressed;
  final bool loading;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.amber
      ),
      child: MaterialButton(
        onPressed: loading? null : onPressed,
        child: loading ? Loader(scale: 1,key: key,) : Text(text),
      ),
    );
  }
}
