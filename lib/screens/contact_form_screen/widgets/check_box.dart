part of 'package:darurat/screens/contact_form_screen/contact_form_screen.dart';


class _CheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: (){
          onChanged(!value);
        },
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: value,
                // visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                activeColor: blue,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              AppLocalizations.of(context)!.shareYourContact,
              style: Poppins.regular.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
