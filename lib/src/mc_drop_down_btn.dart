import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class McDropDownBtn<T> extends StatelessWidget {
  final String title;
  final T? model;
  final List<T> list;
  final bool isSearch;
  final Color color;
  final double radius;
  final EdgeInsets? closedHeaderPadding;
  final SingleSelectController<T>? controller;
  final void Function(T?)? onChange;

  const McDropDownBtn({
    super.key,
    required this.title,
    required this.list,
    this.onChange,
    this.isSearch = true,
    this.radius = 15,
    this.controller,
    this.closedHeaderPadding =
        const EdgeInsets.only(bottom: 15, top: 15, left: 25, right: 25),
    this.color = Colors.white,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return isSearch
        ? CustomDropdown<T>.search(
            closedHeaderPadding: closedHeaderPadding,
            hintText: title,
            items: list,
            decoration: CustomDropdownDecoration(
                closedFillColor: color,
                closedBorderRadius: BorderRadius.circular(radius)),
            initialItem: model,
            controller: controller,
            excludeSelected: false,
            onChanged: onChange,
          )
        : CustomDropdown<T>.new(
            closedHeaderPadding: closedHeaderPadding,
            hintText: title,
            items: list,
            decoration: CustomDropdownDecoration(
                closedFillColor: color,
                closedBorderRadius: BorderRadius.circular(radius)),
            initialItem: model,
            controller: controller,
            excludeSelected: false,
            onChanged: onChange,
          );
  }
}
