import 'package:app_multiplier/model/modelo_model.dart';
import 'package:flutter/material.dart';

class DropDownModelo extends StatelessWidget {
  const DropDownModelo(
      {super.key,
      this.onSaved,
      this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.icon,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.valueT,
      this.items,
      this.onChanged,
      this.validator});

  final DropDownShape? shape;

  final String? valueT;

  final DropDownPadding? padding;

  final DropDownVariant? variant;

  final DropDownFontStyle? fontStyle;

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final FocusNode? focusNode;

  final Widget? icon;

  final String? hintText;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final List<ModeloElement>? items;

  final Function(String)? onChanged;
  final Function(String)? onSaved;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    return Container(
      width: 400,
      margin: margin,
      child: DropdownButtonFormField(
          iconSize: 14,
          isExpanded: true,
          value: valueT,
          focusNode: focusNode,
          icon: icon,
          style: _setFontStyle(),
          decoration: _buildDecoration(),
          items: items?.map<DropdownMenuItem<ModeloElement>>((ModeloElement value) {
            return DropdownMenuItem<ModeloElement>(
              value: value,
              child: Text(
                value.nome,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (value) {
            var modelosModel = value as ModeloElement;

            onChanged!(modelosModel.codigo.toString());
          },
          onSaved: (value) {
            var nameModeloModel = value as ModeloElement;
            onSaved!(nameModeloModel.nome);
          }),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: const EdgeInsets.all(5),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          4.00,
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return Colors.white;
    }
  }

  _setFilled() {
    switch (variant) {
      default:
        return true;
    }
  }
}

enum DropDownShape {
  roundedBorder12,
}

enum DropDownPadding {
  paddingAll5,
}

enum DropDownVariant {
  fillGray100,
}

enum DropDownFontStyle {
  interRegular16,
}
