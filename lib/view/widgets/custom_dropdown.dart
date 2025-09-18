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
      required this.selectedValue,
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
  final String selectedValue;
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
    _selected = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [MoveEffect()],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.label != null)
            Row(
              children: [
                Expanded(
                  child: MyText(
                    text: widget.label ?? '',
                    size: widget.labelSize ?? 12,
                    color: kheading,
                    fontFamily: AppFonts.gilroyMedium,
                    paddingBottom: widget.hasSwitch == true ? 0 : 8,
                  ),
                ),
                if (widget.hasSwitch == true)
                  SwitchButton(scale: 0.6, isActive: true),
              ],
            ),
          Container(
            decoration: BoxDecoration(
              boxShadow: widget.hasShadow == true
                  ? [
                      BoxShadow(
                        color: kgrey.withOpacity(0.08),
                        spreadRadius: 0.5,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                items: widget.items
                    .map(
                      (item) => DropdownMenuItem<dynamic>(
                        value: item,
                        child: MyText(
                          text: item,
                          size: 12,
                          color: kheading,
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
                    color: widget.bgColor ?? kwhite,
                    border: Border.all(
                      color: _selected == widget.hint
                          ? widget.bordercolor ?? kborder
                          : widget.borderColor2 ?? ksecondary,
                      width: 1,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(widget.radius ?? 8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        paddingLeft: 1,
                        text:
                            _selected == widget.hint ? widget.hint : _selected!,
                        size: widget.hintsize ?? 11,
                        weight: widget.hintWeigth ?? FontWeight.w500,
                        color: _selected == widget.hint
                            ? widget.hintColor ?? kgrey
                            : ksecondary,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: widget.iconPad ?? 2),
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: isOpen ? 0.5 : 0.0, // ⬆️ when open
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: widget.iconSize ?? 26,
                            color: widget.iconColor ?? kheading,
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
                    color: kwhite,
                    border: Border.all(color: kborder.withOpacity(0.3)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: widget.mBottom ?? 15),
        ],
      ),
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
  const CustomDropdown2({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    this.onInfoTap, this.hasInfo=true,
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
          borderSide: const BorderSide(color: kblueBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ksecondary),
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
                    color: kgrey,
                    fontSize: 12,
                    fontFamily: AppFonts.gilroyRegular,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                value: value,
                 dropdownColor: kbackground,
                items: items
                
                
                    .map(
                      (e) => DropdownMenuItem(
                        
                        value: e,
                        child: Text(
                          e,
                          style:  TextStyle(color: kgrey,fontSize: 12,fontFamily: AppFonts.gilroyBold),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                icon: Icon(
                  size: 20,
                  Icons.keyboard_arrow_down_rounded,
                  color: kwhite.withOpacity(0.8)
                ),
                
              ),
              
            ),
          ),
          if(hasInfo==true)...{
          SizedBox(width: 2,),
          TooltipIcon()}
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
