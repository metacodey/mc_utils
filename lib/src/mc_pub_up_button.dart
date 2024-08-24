import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class McPopUpMenChat extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget child;
  final ShapeBorder? shape;
  final Color? color;
  final PopupMenuPosition? position;
  final Offset? offset;
  final Function()? onCanceled;
  final dynamic initialValue;
  final double? elevation;
  final bool enabled;
  final Widget? icon;
  final Color? iconColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final bool useRootNavigator;
  final BoxConstraints? constraints;
  final Clip clipBehavior = Clip.none;
  final RouteSettings? routeSettings;
  final AnimationStyle? popUpAnimationStyle;
  final Function()? onOpened;
  final Function(dynamic)? onSelected;
  final EdgeInsetsGeometry padding = const EdgeInsets.all(8.0);
  final ButtonStyle? style;
  final Color? shadowColor;
  final double? splashRadius;
  final double? iconSize;
  const McPopUpMenChat({
    Key? key,
    required this.menuList,
    required this.child,
    this.shape,
    this.color,
    this.offset,
    this.position,
    this.onCanceled,
    this.elevation,
    this.surfaceTintColor,
    this.semanticLabel,
    this.useRootNavigator = false,
    this.routeSettings,
    this.popUpAnimationStyle,
    this.initialValue,
    this.constraints,
    this.enabled = true,
    this.icon,
    this.iconColor,
    this.onOpened,
    this.onSelected,
    this.style,
    this.shadowColor,
    this.splashRadius,
    this.iconSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onCanceled: onCanceled,
        constraints: constraints,
        enabled: enabled,
        icon: icon,
        iconColor: iconColor,
        iconSize: iconSize,
        initialValue: initialValue,
        onOpened: onOpened,
        onSelected: onSelected,
        padding: padding,
        routeSettings: routeSettings,
        style: style,
        popUpAnimationStyle: popUpAnimationStyle,
        useRootNavigator: useRootNavigator,
        elevation: elevation,
        shadowColor: shadowColor,
        splashRadius: splashRadius,
        clipBehavior: clipBehavior,
        surfaceTintColor: surfaceTintColor,
        position: position ?? PopupMenuPosition.under,
        offset: offset ?? const Offset(-0, 10),
        color: color ?? Theme.of(context).colorScheme.background,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
        itemBuilder: ((context) => menuList),
        child: child);
  }
}
