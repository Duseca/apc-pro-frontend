
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
        inactiveTrackColor: kgrey,
        trackOutlineColor: WidgetStateColor.transparent,
        inactiveThumbColor: kwhite,
        activeColor: kwhite,
        activeTrackColor: ksecondary,
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
      child: Transform.scale(
        scale: 0.8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Gradient background for the track
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: kborder.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isActive
                        ? [
                            Color.fromARGB(255, 96, 102, 102),
                            Color.fromARGB(255, 233, 232, 232)
                          ]
                        : [
                            Color.fromARGB(255, 219, 225, 225),
                            Color.fromARGB(255, 255, 255, 255)
                          ],
                  ).createShader(bounds);
                },
                child: Container(
                  height: 28, // Approximate track height
                  width: 49, // Approximate track width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Actual Switch to display thumb without border color
            Theme(
              data: Theme.of(context).copyWith(
                switchTheme: SwitchThemeData(
                  trackOutlineColor:
                      MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              child: Switch(
                value: isActive,
                onChanged: onChanged,
                activeColor: ksecondary, // Thumb color when active
                inactiveThumbColor: kwhite,
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
