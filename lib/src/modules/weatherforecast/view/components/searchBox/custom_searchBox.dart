import 'package:flutter/material.dart';

import '../textformfield/cusotm_textFormField.dart';

class CustomSearchBox extends StatelessWidget {
  final void Function()? onPressed;
  final void Function(String) onChanged;
  const CustomSearchBox({
    Key? key,
    required this.onPressed,
    required this.size,
    required this.onChanged,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      // posicao do conjuto text e icon no centro
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // vai pegar do conjunto do text e icone 10% da largura da tela
          width: size.width * 0.7,
          child: CustomTextFormField(
            onChanged: onChanged,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
