import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../themes/appcolors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onPressed,
    this.onchanged,
    this.passwordfield,
    this.showSuffixicon,
    this.controller,
    this.inputFormatters,
    this.suffix,
    this.validator,
    this.inputType,
    this.lines,
    this.onTap,
    this.readOnly,
    this.prefix,
    required this.label,
    this.enable,
    this.autofillHints,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool? showSuffixicon;
  final bool? enable;
  final Function? onPressed;
  final Function? onTap;
  final Function(String)? onchanged;
  final bool? passwordfield;
  final Widget? suffix;
  final Function(String)? validator;
  final TextInputType? inputType;
  final int? lines;
  final Widget? prefix;
  final bool? readOnly;
  final Widget? label;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showpassword = true;
  late bool showPrefixIcon;

  @override
  void initState() {
    showPrefixIcon = widget.showSuffixicon ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        enabled: widget.enable,
        autofillHints: widget.autofillHints,
        inputFormatters: widget.inputFormatters,
        onChanged: (value) {
          if (widget.onchanged != null) {
            widget.onchanged!(value);
          }
        },
        controller: widget.controller,
        validator: widget.validator == null
            ? null
            : (val) => widget.validator!(val ?? ""),
        obscureText: widget.passwordfield == true ? showpassword : false,
        keyboardType: widget.inputType ?? TextInputType.text,
        maxLines: widget.passwordfield == true ? 1 : widget.lines,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          filled: true,
          label: widget.label,
          labelStyle: const TextStyle(),
          fillColor: AppColors.white,
          prefixIcon: showPrefixIcon ? widget.prefix : null,
          suffixIcon: widget.passwordfield == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showpassword = !showpassword;
                    });
                  },
                  icon: showpassword
                      ? const Icon(
                          FontAwesomeIcons.eyeSlash,
                          size: 20,
                        )
                      : const Icon(Icons.remove_red_eye))
              : widget.suffix,
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.grey)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.grey)),
        ),
      ),
    );
  }
}
