
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';




class SwitchButton extends StatelessWidget {
  final bool? isActive;
  final double? scale;

  const SwitchButton({super.key, this.isActive, this.scale});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
scale:scale?? 0.9,
      child: Switch(
        value: isActive ?? false,
        
        onChanged: (w) {},
        inactiveTrackColor: getTertiary(context),
        trackOutlineColor: WidgetStateColor.transparent,
        inactiveThumbColor:getSecondaryColor(context),
        activeTrackColor:getTertiary(context),
        activeColor: getSecondaryColor(context),

        thumbIcon: MaterialStateProperty.all(const Icon(null)),

      ),
    );
  }
}
//




class CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void toggleSwitch() {
    setState(() => isOn = !isOn);
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: SizedBox(
        width: 42,
        height: 30, // taller to allow thumb to overhang
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Track (thinner than thumb)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 42,
              height: 24,
              decoration: BoxDecoration(
                color: isOn ? getSecondaryColor(context) :getfifth(context),
               // border: Border.all(color:isOn?ktransparent:getSecondaryColor(context)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Thumb
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(2),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color:isOn?getsplashcolor(context) :getSecondaryColor(context),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isOn?getsplashcolor(context) :getSecondaryColor(context),
                    width: 2,
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

class SwitchButton2 extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const SwitchButton2({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isActive),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 25,
        height: 21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: klighblue, width: 2),
          color: Colors.transparent, // transparent fill like your image
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: klighblue, width: 2),
                color: Colors.transparent, // inner knob is transparent
              ),
            ),
          ),
        ),
      ),
    );
  }
}

