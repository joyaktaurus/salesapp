import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../my_theme.dart';
import '../utils/my_utils.dart';

class CustomRadioButton<T> extends StatefulWidget {
  CustomRadioButton({
    Key? key,
    required this.buttonLables,
    required this.buttonValues,
    this.buttonTextStyle = const ButtonTextStyle(),
    this.autoWidth = false,
    this.radioButtonValue,
    required this.unSelectedColor,
    this.unSelectedBorderColor,
    double padding = 3,
    double spacing = 0.0,
    required this.selectedColor,
    this.selectedBorderColor,
    this.height = 35,
    this.width = 100,
    this.enableButtonWrap = false,
    this.horizontal = false,
    this.enableShape = false,
    this.elevation = 10,
    this.shapeRadius = 50,
    this.radius = 20,
    this.defaultSelected,
    this.customShape,
    this.absoluteZeroSpacing = false,
    this.margin,
    this.wrapAlignment = WrapAlignment.start,
  })  : assert(buttonLables.length == buttonValues.length,
            "Button values list and button lables list should have same number of eliments "),
        // ignore: unnecessary_null_comparison
        assert(unSelectedColor != null, "Unselected color cannot be null"),
        assert(buttonValues.toSet().length == buttonValues.length,
            "Multiple buttons with same value cannot exist"),
        // assert(buttonLables.toSet().length == buttonLables.length,
        //     "Multiple buttons label wth same value cannot exist"),
        // ignore: unnecessary_null_comparison
        assert(selectedColor != null, "Selected color cannot be null"),
        super(key: key) {
    if (absoluteZeroSpacing) {
      this.padding = 0;
      this.spacing = 0;
    } else {
      this.padding = padding;
      this.spacing = spacing;
    }
  }

  ///Orientation of the Button Group
  final bool horizontal;

  ///Values of button
  final List<T> buttonValues;

  ///This option will make sure that there is no spacing in between buttons
  final bool absoluteZeroSpacing;

  ///Margins around card
  final EdgeInsetsGeometry? margin;

  ///Default value is 35
  final double height;
  late final double padding;

  ///Spacing between buttons
  late final double spacing;

  ///Default selected value
  final T? defaultSelected;

  ///Only applied when in vertical mode
  ///This will use minimum space required
  ///If enables it will ignore [width] field
  final bool autoWidth;

  ///Use this if you want to keep width of all the buttons same
  final double width;

  final List<dynamic> buttonLables;

  ///Styling class for label
  final ButtonTextStyle buttonTextStyle;

  final void Function(T)? radioButtonValue;

  ///Unselected Color of the button
  final Color unSelectedColor;

  ///Selected Color of button
  final Color selectedColor;

  ///Unselected Color of the button border
  final Color? unSelectedBorderColor;

  ///Selected Color of button border
  final Color? selectedBorderColor;

  /// A custom Shape can be applied (will work only if [enableShape] is true)
  final ShapeBorder? customShape;

  ///alignment for button when [enableButtonWrap] is true
  final WrapAlignment wrapAlignment;

  /// This will enable button wrap (will work only if orientation is vertical)
  final bool enableButtonWrap;

  ///if true button will have rounded corners
  ///If you want custom shape you can use [customShape] property
  final bool enableShape;
  final double elevation;

  /// Radius for non-shape radio button
  final double radius;

  /// Radius for shape radio button
  final double shapeRadius;

  @override
  // ignore: library_private_types_in_public_api
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _currentSelectedLabel;

  Color borderColor(index) =>
      (_currentSelectedLabel == widget.buttonLables[index]
          ? widget.selectedBorderColor
          : widget.unSelectedBorderColor) ??
      Theme.of(context).primaryColor;

  @override
  void initState() {
    super.initState();
    if (widget.defaultSelected != null) {
      if (widget.buttonValues.contains(widget.defaultSelected)) {
        int index = widget.buttonValues.indexOf(widget.defaultSelected);
        _currentSelectedLabel = widget.buttonLables[index];
      } else {
        throw Exception("Default Value not found in button value list");
      }
    }
  }

  List<Widget> _buildButtonsColumn() {
    return widget.buttonValues.map((e) {
      int index = widget.buttonValues.indexOf(e);
      return Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Card(
          margin: widget.margin ??
              EdgeInsets.all(widget.absoluteZeroSpacing ? 0 : 4),
          color: _currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor
              : widget.unSelectedColor,
          elevation: widget.elevation,
          shape: widget.enableShape
              ? widget.customShape ??
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.shapeRadius)),
                  )
              : null,
          child: SizedBox(
            height: widget.height,
            child: MaterialButton(
              shape: widget.enableShape
                  ? widget.customShape ??
                      OutlineInputBorder(
                        borderSide:
                            BorderSide(color: borderColor(index), width: 1),
                        borderRadius:
                            BorderRadius.all(Radius.circular(widget.radius)),
                      )
                  : OutlineInputBorder(
                      borderSide:
                          BorderSide(color: borderColor(index), width: 1),
                      borderRadius: BorderRadius.zero,
                    ),
              onPressed: () {
                widget.radioButtonValue!(e);
                setState(() {
                  _currentSelectedLabel = widget.buttonLables[index];
                });
              },
              child: Center(
                child: Text(
                  widget.buttonLables[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: widget.buttonTextStyle.textStyle!.copyWith(
                    color: _currentSelectedLabel == widget.buttonLables[index]
                        ? widget.buttonTextStyle.selectedColor
                        : widget.buttonTextStyle.unSelectedColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildButtonsRow() {
    return widget.buttonValues.map((e) {
      int index = widget.buttonValues.indexOf(e);
      return Card(
        margin:
            widget.margin ?? EdgeInsets.all(widget.absoluteZeroSpacing ? 0 : 4),
        color: _currentSelectedLabel == widget.buttonLables[index]
            ? widget.selectedColor
            : widget.unSelectedColor,
        elevation: widget.elevation,
        shape: widget.enableShape
            ? widget.customShape ??
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.shapeRadius)),
                )
            : null,
        child: Container(
          height: widget.height,
          width: widget.autoWidth ? null : widget.width,
          constraints: const BoxConstraints(maxWidth: 250),
          child: MaterialButton(
            shape: widget.enableShape
                ? widget.customShape ??
                    OutlineInputBorder(
                      borderSide:
                          BorderSide(color: borderColor(index), width: 1),
                      borderRadius:
                          BorderRadius.all(Radius.circular(widget.radius)),
                    )
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor(index), width: 1),
                    borderRadius: BorderRadius.zero,
                  ),
            onPressed: () {
              widget.radioButtonValue!(e);
              setState(() {
                _currentSelectedLabel = widget.buttonLables[index];
              });
            },
            child: Center(
              child: Text(
                widget.buttonLables[index],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: widget.buttonTextStyle.textStyle!.copyWith(
                  color: _currentSelectedLabel == widget.buttonLables[index]
                      ? widget.buttonTextStyle.selectedColor
                      : widget.buttonTextStyle.unSelectedColor,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRadioButtons();
  }

  _buildRadioButtons() {
    if (widget.horizontal) {
      return SizedBox(
        height: widget.height * (widget.buttonLables.length * 1.5) +
            widget.padding * 2 * widget.buttonLables.length,
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.spacing,
            scrollDirection: Axis.vertical,
            children: _buildButtonsColumn(),
          ),
        ),
      );
    }
    if (!widget.horizontal && widget.enableButtonWrap) {
      return Center(
        child: Wrap(
          spacing: widget.spacing,
          direction: Axis.horizontal,
          alignment: widget.wrapAlignment,
          children: _buildButtonsRow(),
        ),
      );
    }
    if (!widget.horizontal && !widget.enableButtonWrap) {
      return SizedBox(
        height: widget.height + widget.padding * 2,
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.spacing,
            scrollDirection: Axis.horizontal,
            children: _buildButtonsRow(),
          ),
        ),
      );
    }
  }
}

class CustomListViewSpacing extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final Axis scrollDirection;
  // ignore: use_key_in_widget_constructors
  const CustomListViewSpacing(
      {required this.children,
      this.spacing = 0.0,
      this.scrollDirection = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      children: children
          .map((c) => Container(
                padding: EdgeInsets.all(spacing),
                child: c,
              ))
          .toList(),
    );
  }
}

class ButtonTextStyle {
  ///Selected color of Text
  final Color selectedColor;

  ///Unselected color of Text
  final Color unSelectedColor;

  /// Color in [TextStyle] will be ignored
  final TextStyle? textStyle;

  const ButtonTextStyle({
    this.selectedColor = Colors.white,
    this.unSelectedColor = Colors.black,
    this.textStyle = const TextStyle(),
  }) : assert(textStyle != null);
}
//======My App Dialogue Custom Background ====

class MADialogueBackground extends StatelessWidget {
  final dynamic dialogue;
  const MADialogueBackground({Key? key, required this.dialogue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: .8,
          image: AssetImage("assets/images/sidebar-bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                transform: const GradientRotation(5.142857142857143),
                begin: Alignment.topLeft,
                colors: [
                  const Color(0XFF481F87).withOpacity(.8),
                  const Color(0XFF8E4741).withOpacity(.8)
                ],
              ),
            ),
          ),
          Center(child: dialogue),
        ],
      ),
    );
  }
}

//====== Common Dialogue Contents ============
class MADialogues {
  Widget inventoryActionBtnContent(
      {required String name,
      required Widget dialogContent,
      double height = 320}) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(12),
            height: height,
            width: Get.width * 0.75,
            child: Material(
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              name.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: MyTheme.regularTextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(),
                          dialogContent
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget commonDialog({
    required String heading,
    required Widget dialogContent,
    double height = 320,
    double headingSize = 15,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(12),
            height: height,
            width: Get.width * 0.75,
            child: Material(
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              heading.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: MyTheme.regularTextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: headingSize,
                              ),
                            ),
                          ),
                          dialogContent
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static dialog(context,
      {String message = '',
      Function? onDismiss,
      Widget? widgetContent,
      Function? stateChangeFn}) async {
    await showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 180),
      context: context,
      pageBuilder: (_, __, ___) {
        return widgetContent!;
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: GestureDetector(
              onTap: () {
                MyUtils.hideKeyboard();
              },
              child: child),
        );
      },
    );
    await onDismiss!();
  }
}
