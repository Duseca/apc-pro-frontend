import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/toolTip.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';

import 'my_text_widget.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  CustomDropDown(
      {this.label,
      required this.hint,
      required this.items,
      required this.value,
      required this.onChanged,
      this.mBottom,
      this.hasIcon,
      this.hintsize,
      this.iconSize,
      this.hpad,
      this.delay,
      this.bgColor,
      this.hasSwitch,
      this.bordercolor,
      this.iconPad,
      this.radius,
      this.hasShadow = true,
      this.hintColor,
      this.hintWeigth,
      this.iconColor,
      this.borderRadius,
      this.labelSize,
      this.vpad,
      this.borderColor2});

  final List<dynamic> items;
  final String value;
  final ValueChanged<dynamic> onChanged;
  final String hint;
  final String? label;
  final Color? bgColor, bordercolor, hintColor, iconColor, borderColor2;
  final int? delay;
  final FontWeight? hintWeigth;
  final BorderRadius? borderRadius;
  double? mBottom, hintsize, iconSize, vpad, hpad, iconPad, radius, labelSize;
  bool? hasIcon = false, hasSwitch = false, hasShadow;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isOpen = false;
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: widget.label ?? '',
                  size: widget.labelSize ?? 14,
                  color: getSecondaryColor(context),
                  fontFamily: AppFonts.gilroySemiBold,
                  paddingBottom: widget.hasSwitch == true ? 0 : 8,
                ),
              ),
              if (widget.hasSwitch == true)
                SwitchButton(scale: 0.6, isActive: true),
            ],
          ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<dynamic>(
                    value: item,
                    child: MyText(
                      text: item,
                      size: 12,
                      color: getSecondaryColor(context)
                    ),
                  ),
                )
                .toList(),
            value: _selected,
            onChanged: (val) {
              setState(() {
                _selected = val;
                widget.onChanged(val);
              });
            },
            onMenuStateChange: (open) {
              setState(() {
                isOpen = open;
              });
            },
            iconStyleData: const IconStyleData(iconSize: 6),
            isDense: true,
            isExpanded: false,
            customButton: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.hpad ?? 12,
                vertical: widget.vpad ?? 9,
              ),
              decoration: BoxDecoration(
                color: widget.bgColor ?? getfillcolor(context),
                border: Border.all(
                  width: 1,
                  color: _selected == widget.hint
                      ? widget.bordercolor ?? ktransparent
                      : widget.bordercolor ?? ktransparent,
                ),
                borderRadius: widget.borderRadius ??
                    BorderRadius.circular(widget.radius ?? 8),
              ),
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyText(
                      paddingLeft: 1,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      text: _selected == widget.hint ? widget.hint : _selected!,
                      size: widget.hintsize ?? 11,
                      weight: widget.hintWeigth ?? FontWeight.w500,
                      color: _selected == widget.hint
                          ? widget.hintColor ?? getSecondaryColor(context)
                          : getSecondaryColor(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: widget.iconPad ?? 2),
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: isOpen ? 0.5 : 0.0, // ⬆️ when open
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: widget.iconSize ?? 26,
                        color: widget.iconColor ?? getSecondaryColor(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(height: 30),
            dropdownStyleData: DropdownStyleData(
              elevation: 0,
              maxHeight: 300,
              offset: const Offset(0, -5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: getfillcolor(context),
                border: Border.all(color: getSecondaryColor(context).withOpacity(0.5))
              ),
            ),
          ),
        ),
        SizedBox(height: widget.mBottom ?? 15),
      ],
    );
  }
}

//

// ignore: must_be_immutable

class CustomDropdown2 extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final VoidCallback? onInfoTap;
  final bool? hasInfo;
  final Color? hintColor, borderColor, iconColor;
  const CustomDropdown2({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    this.onInfoTap,
    this.hasInfo = true,
    this.hintColor,
    this.borderColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: AppFonts.gilroyRegular,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? kblueBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? ksecondary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  hint,
                  style: TextStyle(
                    color: hintColor ?? kgrey,
                    fontSize: 12,
                    fontFamily: AppFonts.gilroyRegular,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                value: value,
                dropdownColor: getfillcolor(context),
                borderRadius: BorderRadius.circular(8),
                items: items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                              color: hintColor ?? kgrey,
                              fontSize: 12,
                              fontFamily: AppFonts.gilroyMedium),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                icon: Icon(
                    size: 20,
                    Icons.keyboard_arrow_down_rounded,
                    color: iconColor ?? kwhite.withOpacity(0.8)),
              ),
            ),
          ),
          if (hasInfo == true) ...{
            SizedBox(
              width: 2,
            ),
            TooltipIcon()
          }
          // GestureDetector(
          //   onTap: onInfoTap,
          //   child:  Padding(
          //     padding: EdgeInsets.only(left: 8),
          //     child: Image.asset(Assets.imagesQuestionmark,width: 18,height: 18,)
          //   ),
          // ),
        ],
      ),
    );
  }
}

//

class SimpleDropDown extends StatefulWidget {
  const SimpleDropDown({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.marginBottom = 0,
    this.labelSize = 14.0,
    this.hintSize = 14.0,
    this.labelColor,
    this.hintColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 8,
    this.isOptional = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 7, vertical: 16),

    // 🔹 Added params similar toCustomDropDown
    this.textColor,
    this.textSize = 12,
    this.iconColor,
    this.iconSize = 20,
    this.hpad,
    this.vpad,
    this.hasInfo,
  }) : super(key: key);

  final String label;
  final String hint;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;

  final double marginBottom;
  final double labelSize;
  final double hintSize;
  final double? hpad, vpad;

  final Color? labelColor;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final bool? isOptional, hasInfo;
  final EdgeInsets padding;

  final Color? textColor;
  final double textSize;
  final Color? iconColor;
  final double iconSize;

  @override
  _SimpleDropDownState createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  bool get _shouldFloatLabel {
    return _isFocused || widget.value != null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom),
      child: Container(
        // padding: EdgeInsets.symmetric(    horizontal: widget.hpad ?? 12,
        //         vertical: widget.vpad ?? 9,),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? ktransparent,
          border: Border.all(
            color: _isFocused ? kblueBorder : widget.borderColor ?? kblueBorder,
            width: _isFocused ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Floating Label
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: 12,
              top: _shouldFloatLabel ? -8 : 18,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _shouldFloatLabel
                      ? widget.backgroundColor ?? getfillcolor(context)
                      : Colors.transparent,
                ),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: _shouldFloatLabel ? 14 : widget.labelSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.gilroyRegular,
                    color: _isFocused ? kwhite : widget.labelColor ?? kwhite,
                  ),
                ),
              ),
            ),

            // Dropdown
            Padding(
              padding: EdgeInsets.only(top: _shouldFloatLabel ? 0 : 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(widget.hint,
                      style: TextStyle(
                          color: widget.hintColor ?? kgrey,
                          fontSize: 12,
                          fontFamily: AppFonts.gilroyMedium)),
                  items: widget.items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,
                          style: TextStyle(
                              color: widget.hintColor ?? kgrey,
                              fontSize: 12,
                              fontFamily: AppFonts.gilroyMedium)),
                    );
                  }).toList(),
                  value: widget.value,
                  onChanged: widget.onChanged,
                  onMenuStateChange: (isOpen) {
                    setState(() {
                      _isFocused = isOpen;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    padding: widget.padding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      color: Colors.transparent,
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: widget.iconColor ?? kwhite.withOpacity(0.8),
                          size: widget.iconSize,
                        ),
                        if (widget.hasInfo == true) ...{
                          SizedBox(
                            width: 2,
                          ),
                          TooltipIcon()
                        }
                      ],
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    elevation: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kbackground,
                      border: Border.all(
                        color: kblueBorder2.withOpacity(0.5),
                      ),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
