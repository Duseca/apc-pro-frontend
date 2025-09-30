
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
        inactiveTrackColor: Color(0xff5D5D5D),
        trackOutlineColor: WidgetStateColor.transparent,
        inactiveThumbColor: Color(0xff2A2A2A),
        activeTrackColor:Color(0xff94BFFF) ,
        activeColor: kblueBorder4,

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
              height: 17,
              decoration: BoxDecoration(
                color: isOn ? ksecondary : kwhite,
                border: Border.all(color:isOn?ktransparent:ksecondary),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Thumb
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: kwhite,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ksecondary,
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

