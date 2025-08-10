import 'package:flutter/cupertino.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SwitchCupertinoCustom extends StatelessWidget {
  const SwitchCupertinoCustom(
      {super.key, required this.switchState, required this.onChanged});

  final bool switchState;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: switchState,
      onChanged: onChanged,
      thumbColor: context.colorPalette.scaffoldBackground,
      activeTrackColor: context.colorPalette.text,
      inactiveTrackColor: context.colorPalette.text.withAlpha(33),
    );
  }
}
