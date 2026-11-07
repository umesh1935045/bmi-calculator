import 'package:flutter/material.dart';

import 'bmi_form_validators.dart';

/// Collects personal details and measurements before BMI calculation.
class BmiInputForm extends StatefulWidget {
  const BmiInputForm({
    super.key,
    required this.onSubmit,
  });

  /// Called with validated form values when the user submits the form.
  final ValueChanged<Map<String, String>> onSubmit;

  @override
  State<BmiInputForm> createState() => _BmiInputFormState();
}

class _BmiInputFormState extends State<BmiInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String? _gender;
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _submitForm() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit({
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'phone': _phoneController.text.trim(),
      'gender': _gender!,
      'heightCm': _heightController.text.trim(),
      'weightKg': _weightController.text.trim(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your details were submitted successfully')),
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _heightController.clear();
    _weightController.clear();

    setState(() {
      _gender = null;
      _acceptedTerms = false;
    });
  }

  InputDecoration _decoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Personal details', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: _decoration('Full name', Icons.person_outline),
            validator: (value) =>
                BmiFormValidators.requiredText(value, fieldName: 'Name'),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: _decoration('Email address', Icons.email_outlined),
            validator: BmiFormValidators.email,
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: _decoration('10-digit phone number', Icons.phone_outlined),
            validator: BmiFormValidators.phone,
          ),
          const SizedBox(height: 14),
          DropdownButtonFormField<String>(
            initialValue: _gender,
            decoration: _decoration('Gender', Icons.people_outline),
            items: const [
              DropdownMenuItem(value: 'Male', child: Text('Male')),
              DropdownMenuItem(value: 'Female', child: Text('Female')),
              DropdownMenuItem(value: 'Other', child: Text('Other')),
              DropdownMenuItem(
                value: 'Prefer not to say',
                child: Text('Prefer not to say'),
              ),
            ],
            onChanged: (value) => setState(() => _gender = value),
            validator: (value) =>
                value == null ? 'Please select an option' : null,
          ),
          const SizedBox(height: 24),
          Text('BMI measurements', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextFormField(
            controller: _heightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: _decoration('Height (cm)', Icons.height),
            validator: BmiFormValidators.height,
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: _decoration('Weight (kg)', Icons.monitor_weight_outlined),
            validator: BmiFormValidators.weight,
          ),
          const SizedBox(height: 12),
          FormField<bool>(
            initialValue: _acceptedTerms,
            validator: (value) =>
                value == true ? null : 'Please accept the declaration to continue',
            builder: (field) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _acceptedTerms,
                  title: const Text('I confirm that the details entered are correct.'),
                  onChanged: (value) {
                    setState(() => _acceptedTerms = value ?? false);
                    field.didChange(value ?? false);
                  },
                ),
                if (field.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      field.errorText!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _submitForm,
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Submit details'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: _resetForm,
            child: const Text('Reset form'),
          ),
        ],
      ),
    );
  }
}
