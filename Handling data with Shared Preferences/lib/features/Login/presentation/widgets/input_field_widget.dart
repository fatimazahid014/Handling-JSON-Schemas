import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder, fabType;
  final IconData prefixIcon;
  final TextInputType inputType;
  final bool hasFab;
  final List<IconData>? fabStates;

  const InputFieldWidget({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.prefixIcon,
    required this.inputType,
    this.fabType = "",
    this.hasFab = false,
    this.fabStates,
  }) : super(key: key);

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool _isHidden = false;

  @override
  void initState() {
    super.initState();

    if (widget.fabType == "password") {
      _isHidden = true;
    }
  }

  IconData? _getIcon() {
    if (widget.fabType == "password") {
      return !_isHidden ? widget.fabStates![0] : widget.fabStates![1];
    }
  }

  Function? _getFabFunction() {
    if (widget.fabType == "password") {
      setState(() {
        _isHidden = !_isHidden;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.hasFab
            ? GestureDetector(onTap: _getFabFunction, child: Icon(_getIcon()))
            : null,
      ),
      obscureText: _isHidden,
    );
  }
}
