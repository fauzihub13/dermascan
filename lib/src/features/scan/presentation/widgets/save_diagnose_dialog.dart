import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/drop_down_form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_label.dart';

class SaveDiagnoseDialog extends StatefulWidget {
  final TextEditingController labelController;
  final VoidCallback onPressed;
  final ValueChanged onChanged;

  const SaveDiagnoseDialog({
    super.key,
    required this.labelController,
    required this.onPressed,
    required this.onChanged

  });

  @override
  State<SaveDiagnoseDialog> createState() => _SaveDiagnoseDialogState();
}

class _SaveDiagnoseDialogState extends State<SaveDiagnoseDialog> {
  final formKey = GlobalKey<FormState>();

  final List<Map<String, String>> priorityList = [
    {'value': 'tidak_bahaya', 'label': 'Tidak Bahaya'},
    {'value': 'rendah', 'label': 'Rendah'},
    {'value': 'sedang', 'label': 'Sedang'},
    {'value': 'bahaya', 'label': 'Bahaya'},
  ];

  String priority = '';

  @override
  void dispose() {
    super.dispose();
    widget.labelController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Wrap(
            spacing: 0,
            runSpacing: 0,
            children: [
              Form(
                key: formKey,
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Simpan Hasil Diagnosa',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: FontSize.standardUp2,
                          fontWeight: FontWeight.w700,
                          color: DefaultColors.darkBlue,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FormLabel(label: 'Label'),
                    ),
                    FormInput(
                      controller: widget.labelController,
                      hintText: 'Contoh: tangan kanan',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Label tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FormLabel(label: 'Urgensi'),
                    ),

                    DropDownFormInput(
                      items: priorityList,
                      hintText: 'Pilih tingkat urgensi',
                      onChanged: widget.onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Urgensi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomButton.filled(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          widget.onPressed();
                        }
                      },
                      label: 'Simpan',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
