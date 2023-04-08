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
        onTap: () {
          if (!value) {
            GlobalFunction.showAlert<bool>(
                context: context,
                title: AppLocalizations.of(context)!.shareYourContact,
                desc: AppLocalizations.of(context)!.shareYourContactDesc,
                onConfirm: () {
                  Navigator.of(context).pop(true);
                }).then((value) {
              if (value == null) return;
              onChanged(value);
            });
            return;
          }
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
                onChanged: (value) {
                  if (!this.value) {
                    GlobalFunction.showAlert<bool>(
                        context: context,
                        title: AppLocalizations.of(context)!.shareYourContact,
                        desc: AppLocalizations.of(context)!.shareYourContactDesc,
                        onConfirm: () {
                          Navigator.of(context).pop(true);
                        }).then((value) {
                      if (value == null) return;
                      onChanged(value);
                    });
                    return;
                  }
                  onChanged(value);
                },
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
