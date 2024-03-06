import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../style_utils.dart';


class GenericField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final void Function(String)? onSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final Function()? onTap;
  final String? labeltext;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isProfile;
  final bool obscureText;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? isFilled;
  final Color? fillColor;
  final Color colorStyle;
  final double borderRaduis;
  final BoxShadow? boxShadow;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final bool? enabled;
  final AutovalidateMode? autoValidateMode;

  const GenericField({
    super.key,
    this.onSaved,
    this.controller,
    this.validation,
    this.labeltext,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
    this.focusNode,
    this.keyboardType,
    this.isFilled = true,
    this.readOnly = false,
    this.isProfile = false,
    this.autoFocus = false,
    this.maxLines = 1,
    this.colorStyle = lightGrey,
    this.borderRaduis = 10,
    this.obscureText = false,
    this.onChanged,
    this.hintStyle,
    this.onTap,
    this.boxShadow,
    this.enabled,
    this.autoValidateMode,
    this.suffixConstraints, this.fillColor, this.contentPadding,
  });

  @override
  State<GenericField> createState() => _GenericFieldState();
}

class _GenericFieldState extends State<GenericField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: widget.colorStyle),
          borderRadius: BorderRadius.circular(widget.borderRaduis),
          boxShadow: [
            widget.boxShadow ??
                const BoxShadow(
                    blurRadius: 62,
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(153, 171, 198, 0.18))
          ]),
      //height: 55.h,
      child: TextFormField(
        focusNode: widget.focusNode,
        // textInputAction: TextInputAction.done,
        autofocus: widget.autoFocus!,
        onFieldSubmitted: widget.onSubmitted,
        onSaved: widget.onSaved,
        readOnly: widget.readOnly,
        controller: widget.controller,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        autovalidateMode: widget.autoValidateMode,
        autocorrect: true,
        validator: widget.validation,
        obscureText: widget.obscureText,
        onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
        style: const TextStyle(
          color: black,
          fontSize: 16,
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        decoration: InputDecoration(
          filled: widget.isFilled,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          labelText: widget.labeltext,
          fillColor: widget.fillColor ?? Colors.white,
          contentPadding: widget.contentPadding,
          suffixIconConstraints: widget.suffixConstraints,
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xff343434)),
          hintStyle: widget.hintStyle ??
              TextStyles.textViewRegular12
                  .copyWith(color: const Color.fromRGBO(13, 1, 64, 0.6)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isFilled == true
                    ? Colors.transparent
                    : widget.colorStyle,
              ),
              borderRadius: BorderRadius.circular(widget.borderRaduis)),

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isFilled == true
                    ? Colors.transparent
                    : widget.colorStyle,
              ),
              borderRadius: BorderRadius.circular(widget.borderRaduis)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.isFilled == true
                      ? Colors.transparent
                      : widget.colorStyle),
              borderRadius: BorderRadius.circular(widget.borderRaduis)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: primary,
              ),
              borderRadius: BorderRadius.circular(widget.borderRaduis)),
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black, width: 1.0),
          // ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black, width: 1.0),
          // ),
        ),
      ),
    );
  }
}
