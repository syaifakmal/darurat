import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/provider/data_provider.dart';
import 'package:darurat/screens/widgets/app_bar_icon.dart';
import 'package:darurat/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:darurat/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'package:darurat/screens/contact_form_screen/widgets/check_box.dart';

class ContactFormScreen extends StatefulWidget {
  final String title;
  final EmergencyContact? emergencyContact;

  const ContactFormScreen({
    Key? key,
    required this.title,
    this.emergencyContact,
  }) : super(key: key);

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  bool _isShared = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late EmergencyContactProvider _emergencyContactProvider;

  @override
  void initState() {
    super.initState();
    _emergencyContactProvider = Provider.of<EmergencyContactProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalFunction.unFocus(context);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarIcon(
                Images.iconClose,
                onTap: () => Navigator.of(context).pop(),
                tooltip: 'Back',
                leftPadding: 16,
                rightPadding: 8,
              ),
              Text(
                widget.title,
                style: Poppins.medium.copyWith(fontSize: 18),
              ),
              const Spacer(),
              AppBarIcon(
                Images.iconSubmit,
                onTap: () async {
                  GlobalFunction.unFocus(context);
                  if (_formKey.currentState!.validate()) {
                    String _name = _nameController.text.trim();
                    String _number = _numberController.text.trim();

                    EmergencyContact emergencyContact = EmergencyContact(
                      name: _name,
                      number: _number,
                      type: 'user emergency contact',
                      createdTime: DateTime.now(),
                    );

                    if (_isShared) {
                      try {
                        _emergencyContactProvider.shareContact(emergencyContact);
                      } catch (e) {
                        rethrow;
                      }
                    }
                    await _emergencyContactProvider.insertUserEmergencyContact(emergencyContact);
                    await _emergencyContactProvider.getData();
                    Navigator.of(context).pop();
                  }
                },
                tooltip: 'Save',
                color: blue,
                leftPadding: 8,
                rightPadding: 16,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.addYourOwnContact,
                    style: Poppins.medium.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    AppLocalizations.of(context)!.addYourOwnContactDesc,
                    style: Poppins.regular.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    controller: _nameController,
                    labelText: AppLocalizations.of(context)!.name,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _numberController,
                    labelText: AppLocalizations.of(context)!.number,
                    textInputType: TextInputType.number,
                    maxLength: 13,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                  _CheckBox(
                    value: _isShared,
                    onChanged: (bool? value) {
                      setState(() {
                        _isShared = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
