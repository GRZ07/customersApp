import 'package:flutter/material.dart';

import '../../../../../theme/customers_theme.dart';
import '../../../widgets/auth_button.dart';

class RegistrationExtraInfoScreen extends StatelessWidget {
  const RegistrationExtraInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات المستخدم'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الصورة الشخصية',
                style: CustomersTheme.textStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Image Upload Section
              SizedBox(
                width: double.infinity,
                height: 300, // Set a fixed height for the image container
                child: AspectRatio(
                  aspectRatio: 1, // Set aspect ratio as needed
                  child: CircleAvatar(
                    backgroundColor: CustomersTheme.colors.fieldFillColor,
                    child: Icon(
                      Icons.camera_alt,
                      size: 100,
                      color: CustomersTheme.colors.displayTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'العنوان',
                style: CustomersTheme.textStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration:
                    CustomersInputDecoration.primary(label: "ادخل العنوان"),
              ),
              const SizedBox(height: 24),
              Text(
                'العملة المستخدمة',
                style: CustomersTheme.textStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Currency Selection Section
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'اختر عملة الشراء',
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'USD',
                    child: Text(
                      'دولار',
                      style: CustomersTheme.textStyles.fieldContent,
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'SAR',
                    child: Text(
                      'ريال سعودي',
                      style: CustomersTheme.textStyles.fieldContent,
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'YER',
                    child: Text(
                      'ريال يمني',
                      style: CustomersTheme.textStyles.fieldContent,
                    ),
                  ),
                ],
                onChanged: (value) {
                  // Handle currency selection here
                },
              ),
              const SizedBox(height: 24),
              // Save Button
              AuthButton(
                onClick: () {
                  // Implement save functionality here
                },
                child: Text(
                  'حفظ',
                  style: CustomersTheme.textStyles.dialogButtonText.copyWith(
                    fontSize: 16, // Adjust button text size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
