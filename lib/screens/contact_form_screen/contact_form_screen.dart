import 'package:darurat/data/model/model.dart';
import 'package:darurat/provider/provider.dart';
import 'package:darurat/screens/widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:darurat/utils/utils.dart';
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
  bool _isUpdate = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late EmergencyContactProvider _emergencyContactProvider;

  @override
  void initState() {
    super.initState();
    _emergencyContactProvider = Provider.of<EmergencyContactProvider>(context, listen: false);
    _isUpdate = widget.emergencyContact != null;
    if (_isUpdate) {
      _nameController.text = widget.emergencyContact!.name;
      _numberController.text = widget.emergencyContact!.number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalFunction.unFocus(context);
      },
      child: Scaffold(
        appBar: AppAppBar(
          title: widget.title,
          trailing: Consumer<EmergencyContactProvider>(
            builder: (context, emergencyContactProvider, child) {
              return AppBarIcon(
                Images.iconSubmit,
                child: emergencyContactProvider.isLoading
                    ? const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: blue,
                            strokeWidth: 2.5,
                          ),
                        ),
                      )
                    : null,
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

                    if (_isUpdate) {
                      EmergencyContact userEmergencyContact = widget.emergencyContact!.copyWith(
                        name: _name,
                        number: _number,
                        updatedTime: DateTime.now(),
                      );
                      await _emergencyContactProvider.updateUserEmergencyContact(userEmergencyContact);
                      await _emergencyContactProvider.getData();
                      Navigator.of(context).pop();
                      return;
                    }

                    await _emergencyContactProvider.insertUserEmergencyContact(emergencyContact, _isShared);
                    await _emergencyContactProvider.getData();
                    Navigator.of(context).pop();
                  }
                },
                tooltip: AppLocalizations.of(context)!.save,
                color: blue,
                leftPadding: 8,
                rightPadding: 16,
              );
            },
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
                  !_isUpdate
                      ? Column(
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
                          ],
                        )
                      : Container(),
                  AppTextFormField(
                    controller: _nameController,
                    labelText: AppLocalizations.of(context)!.name,
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    controller: _numberController,
                    labelText: AppLocalizations.of(context)!.number,
                    textInputType: TextInputType.number,
                    maxLength: 13,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                  !_isUpdate
                      ? _CheckBox(
                          value: _isShared,
                          onChanged: (bool? value) {
                            setState(() {
                              _isShared = value ?? false;
                            });
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
