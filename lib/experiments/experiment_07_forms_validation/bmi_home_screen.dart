import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../experiment_02_widgets_layouts/bmi_header.dart';
import '../experiment_03_responsive_ui/responsive_bmi_layout.dart';
import '../experiment_04_navigation/app_routes.dart';
import '../experiment_04_navigation/bmi_result_screen.dart';
import '../experiment_05_state_management/bmi_provider.dart';
import '../experiment_06_custom_widgets_themes/reusable_widgets.dart';
import '../experiment_08_animations/animated_result_panel.dart';
import '../experiment_09_rest_api/bmi_api_service.dart';

class BmiHomeScreen extends StatefulWidget {
  const BmiHomeScreen({super.key});

  @override
  State<BmiHomeScreen> createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showApiMessage = false;
  String? _apiMessage;

  void _calculate() {
    if (!_formKey.currentState!.validate()) return;
    final bmiState = context.read<BmiProvider>();
    bmiState.calculate();
    final bmi = bmiState.bmi!;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BmiResultScreen(
          bmi: bmi,
          heightCm: bmiState.heightCm,
        ),
      ),
    );
  }

  Future<void> _loadApiDemo() async {
    setState(() {
      _showApiMessage = true;
      _apiMessage = 'Loading sample data from the REST API...';
    });
    try {
      final post = await BmiApiService.fetchDemoPost();
      if (!mounted) return;
      setState(() {
        _apiMessage = 'REST API sample (not medical advice): ${post['title']}';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _apiMessage = 'API request failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Flutter Lab'),
        actions: [
          IconButton(
            tooltip: 'About',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.about),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: ResponsiveBmiLayout(
        child: Consumer<BmiProvider>(
          builder: (context, state, _) {
            return Form(
              key: _formKey,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const BmiHeader(),
                      const SizedBox(height: 22),
                      NumberInputCard(
                        title: 'Height',
                        value: state.heightCm,
                        unit: 'cm',
                        min: 100,
                        max: 220,
                        onChanged: state.updateHeight,
                      ),
                      NumberInputCard(
                        title: 'Weight',
                        value: state.weightKg,
                        unit: 'kg',
                        min: 25,
                        max: 200,
                        onChanged: state.updateWeight,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const ValueKey('height-validation'),
                        initialValue: state.heightCm.toStringAsFixed(0),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          labelText: 'Height in cm (manual entry)',
                          prefixIcon: Icon(Icons.height),
                        ),
                        validator: (value) {
                          final number = double.tryParse(value ?? '');
                          if (number == null || number < 100 || number > 220) {
                            return 'Enter a height between 100 and 220 cm.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final parsed = double.tryParse(value);
                          if (parsed != null && parsed >= 100 && parsed <= 220) {
                            state.updateHeight(parsed);
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        key: const ValueKey('weight-validation'),
                        initialValue: state.weightKg.toStringAsFixed(0),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          labelText: 'Weight in kg (manual entry)',
                          prefixIcon: Icon(Icons.monitor_weight_outlined),
                        ),
                        validator: (value) {
                          final number = double.tryParse(value ?? '');
                          if (number == null || number <= 0 || number > 300) {
                            return 'Enter a weight greater than 0 and at most 300 kg.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final parsed = double.tryParse(value);
                          if (parsed != null && parsed > 0 && parsed <= 300) {
                            state.updateWeight(parsed);
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      FilledButton.icon(
                        onPressed: _calculate,
                        icon: const Icon(Icons.calculate_outlined),
                        label: const Text('Calculate BMI'),
                      ),
                      if (state.bmi != null) ...[
                        const SizedBox(height: 16),
                        AnimatedResultPanel(bmi: state.bmi!),
                        OutlinedButton.icon(
                          onPressed: _loadApiDemo,
                          icon: const Icon(Icons.cloud_upload_outlined),
                          label: const Text('Fetch sample REST API data'),
                        ),
                      ],
                      if (_showApiMessage && _apiMessage != null) ...[
                        const SizedBox(height: 8),
                        Text(_apiMessage!, key: const ValueKey('api-message')),
                      ],
                      const SizedBox(height: 18),
                      const Text(
                        'Educational use only. Adult BMI categories are not intended for children or teenagers. BMI is not a diagnosis.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
