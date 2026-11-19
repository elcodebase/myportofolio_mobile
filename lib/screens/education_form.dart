import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

/// Halaman formulir untuk menambah riwayat pendidikan.
class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _institutionController = TextEditingController();
  final _majorController = TextEditingController();
  final _websiteController = TextEditingController();
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  String _level = 'S1';
  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> _levels = ['SMA/SMK', 'D3', 'S1', 'S2', 'S3'];

  @override
  void dispose() {
    _institutionController.dispose();
    _majorController.dispose();
    _websiteController.dispose();
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  /// Membuka pemilih tanggal dan mengembalikan tanggal yang dipilih (atau null).
  Future<DateTime?> _pickDate(DateTime? initial) {
    return showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
  }

  String? _validateRequiredText(String? value, String label, int maxLength) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return '$label tidak boleh kosong!';
    }
    if (text.length > maxLength) {
      return '$label maksimal $maxLength karakter!';
    }
    return null;
  }

  String? _validateWebsite(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return null; // opsional
    }
    final uri = Uri.tryParse(text);
    final valid =
        uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.contains('.');
    return valid ? null : 'Gunakan URL yang valid, contoh: https://ui.ac.id';
  }

  String? _validateStart(String? value) {
    if (_startDate == null) {
      return 'Tanggal mulai harus dipilih!';
    }
    return null;
  }

  String? _validateEnd(String? value) {
    if (_endDate == null) {
      return 'Tanggal selesai harus dipilih!';
    }
    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
      return 'Tanggal selesai tidak boleh sebelum tanggal mulai!';
    }
    return null;
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _institutionController.clear();
    _majorController.clear();
    _websiteController.clear();
    _startController.clear();
    _endController.clear();
    setState(() {
      _level = 'S1';
      _startDate = null;
      _endDate = null;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final website = _websiteController.text.trim();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pendidikan berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Institusi: ${_institutionController.text.trim()}'),
                Text('Jenjang: $_level'),
                Text('Jurusan: ${_majorController.text.trim()}'),
                Text('Mulai: ${_formatDate(_startDate!)}'),
                Text('Selesai: ${_formatDate(_endDate!)}'),
                Text('Website: ${website.isEmpty ? '-' : website}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                _resetForm();
              },
            ),
          ],
        );
      },
    );
  }

  InputDecoration _decoration(String label, {String? hint, Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      hintText: hint ?? label,
      suffixIcon: suffix,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Education Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _institutionController,
                  decoration: _decoration('Nama Institusi'),
                  validator: (value) =>
                      _validateRequiredText(value, 'Nama institusi', 100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Jenjang'),
                  initialValue: _level,
                  items: _levels
                      .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _level = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _majorController,
                  decoration: _decoration('Jurusan'),
                  validator: (value) =>
                      _validateRequiredText(value, 'Jurusan', 100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startController,
                  readOnly: true,
                  decoration: _decoration(
                    'Tanggal Mulai',
                    suffix: const Icon(Icons.calendar_today),
                  ),
                  validator: _validateStart,
                  onTap: () async {
                    final picked = await _pickDate(_startDate);
                    if (picked != null) {
                      setState(() {
                        _startDate = picked;
                        _startController.text = _formatDate(picked);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endController,
                  readOnly: true,
                  decoration: _decoration(
                    'Tanggal Selesai',
                    suffix: const Icon(Icons.calendar_today),
                  ),
                  validator: _validateEnd,
                  onTap: () async {
                    final picked = await _pickDate(_endDate ?? _startDate);
                    if (picked != null) {
                      setState(() {
                        _endDate = picked;
                        _endController.text = _formatDate(picked);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _websiteController,
                  keyboardType: TextInputType.url,
                  decoration: _decoration(
                    'Website Institusi',
                    hint: 'URL (opsional)',
                  ),
                  validator: _validateWebsite,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(primary),
                    ),
                    onPressed: _save,
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
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
