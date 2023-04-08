import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';

class AppRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double radioSize;
  final double iconSize;
  final bool showIcon;
  final Widget icon;

  const AppRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.radioSize = 10,
    this.iconSize = 13,
    this.showIcon = true,
    this.icon = const Icon(
      Icons.check,
      color: Colors.white,
    ),
  }) : super(key: key);

  final int durationInMilliseconds = 200;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: durationInMilliseconds),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? blue : Colors.white,
            width: 3,
          ),
        ),
        child: isSelected
            ? AnimatedContainer(
                duration: Duration(milliseconds: durationInMilliseconds),
                decoration: const BoxDecoration(
                  color: blue,
                  shape: BoxShape.circle,
                ),
                height: radioSize,
                width: radioSize,
              )
            : SizedBox(
                height: radioSize,
                width: radioSize,
              ),
      ),
    );
  }
}

class AppGroupRadio<T> extends StatelessWidget {
  final T groupValue;
  final List<T> items;
  final ValueChanged<T> onChanged;
  final double itemToItemSpace;
  final double radioToTextSpace;
  final bool reversed;
  final Axis direction;
  final double radioSize;
  final double iconSize;
  final bool showIcon;
  final Widget icon;
  final TextStyle textStyle;

  const AppGroupRadio({
    Key? key,
    required this.groupValue,
    required this.onChanged,
    required this.items,
    this.itemToItemSpace = 10,
    this.radioToTextSpace = 8,
    this.reversed = false,
    this.direction = Axis.vertical,
    this.radioSize = 15,
    this.iconSize = 13,
    this.showIcon = true,
    this.icon = const Icon(
      Icons.check,
      color: Colors.white,
    ),
    this.textStyle = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  }) : super(key: key);

  List<Widget> get _vertical => this.items.map(
        (item) {
          return GestureDetector(
            onTap: () => onChanged(item),
            behavior: HitTestBehavior.translucent,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: itemToItemSpace / 2),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  AppRadioButton(
                    value: item,
                    groupValue: this.groupValue,
                    onChanged: this.onChanged,
                    showIcon: showIcon,
                    icon: icon,
                    iconSize: iconSize,
                    radioSize: radioSize,
                  ),
                  SizedBox(width: radioToTextSpace),
                  Text(
                    item.toString(),
                    style: textStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ).toList();

  List<Widget> get _verticalReversed => this.items.map(
        (item) {
          return GestureDetector(
            onTap: () => onChanged(item),
            behavior: HitTestBehavior.translucent,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: itemToItemSpace / 2),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    item.toString(),
                    style: textStyle,
                  ),
                  SizedBox(width: radioToTextSpace),
                  const Spacer(),
                  AppRadioButton(
                    value: item,
                    groupValue: this.groupValue,
                    onChanged: this.onChanged,
                    showIcon: showIcon,
                    icon: icon,
                    iconSize: iconSize,
                    radioSize: radioSize,
                  ),
                ],
              ),
            ),
          );
        },
      ).toList();

  @override
  Widget build(BuildContext context) {
    return this.direction == Axis.vertical
        ? Column(
            children: !reversed ? _vertical : _verticalReversed,
          )
        : SizedBox(
            height: 25,
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              separatorBuilder: (context, index) => SizedBox(width: itemToItemSpace),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onChanged(this.items[index]),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        AppRadioButton(
                          value: this.items[index],
                          groupValue: this.groupValue,
                          onChanged: this.onChanged,
                          showIcon: showIcon,
                          icon: icon,
                          iconSize: iconSize,
                          radioSize: radioSize,
                        ),
                        SizedBox(width: radioToTextSpace),
                        Text(
                          items[index].toString(),
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
