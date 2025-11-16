import 'package:farm_plan_app/components/FarmPlanAppBar.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Controllers for numeric inputs
  final TextEditingController _areaController = TextEditingController();

  // Selected values for dropdowns
  String? _selectedLocation;
  String? _selectedCrop;
  String? _selectedSoil;
  String? _selectedGoal;

  // Dropdown options
  final List<String> _locations = [
    "Attica",
    "Larissa",
    "Evros",
    "Magnesia",
    "Central Athens",
    "Piraeus",
    "East Attica",
    "Euboea",
    "Phthiotis",
    "Boeotia",
    "Phocis",
    "Evrytania",
    "Achaea",
    "Messenia",
    "Corinthia",
    "Arcadia",
    "Laconia",
    "Thessaloniki",
    "Kavala",
    "Imathia",
    "Chalkidiki",
    "Kozani",
    "Florina",
    "Ioannina",
    "Aetolia-Acarnania",
    "Corfu",
    "Zakynthos",
    "Heraklion",
    "Chania",
    "Rethymno",
    "Lasithi",
    "Rhodes",
    "Kos",
    "Samos",
    "Syros",
    "Naxos",
  ];

  final List<String> _crops = [
    "Wheat",
    "Barley",
    "Corn",
    "Olive",
    "Grapes",
    "Tomato",
    "Potato",
    "Cotton",
    "Rice",
    "Sunflower",
  ];

  final List<String> _soilTypes = [
    "Sandy",
    "Loamy",
    "Clay",
    "Silty",
    "Peaty",
    "Chalky",
    "Saline",
  ];

  @override
  void dispose() {
    _areaController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_areaController.text.isEmpty ||
        double.tryParse(_areaController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid numeric area.")),
      );
      return;
    }

    print("Location: $_selectedLocation");
    print("Area: ${_areaController.text} km²");
    print("Crop: $_selectedCrop");
    print("Soil Type: $_selectedSoil");
    print("Goal: $_selectedGoal");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Farm info submitted!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const FarmPlanAppBar(), body: InputListView());
  }

  ListView InputListView() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Location dropdown
        InputDropdown(
          label: "Location",
          icon: Icons.location_on,
          value: _selectedLocation,
          items: _locations,
          onChanged: (value) {
            setState(() {
              _selectedLocation = value;
            });
          },
        ),
        // Area numeric input
        InputFieldNumeric(
          controller: _areaController,
          label: "Area (km²)",
          icon: Icons.map,
          keyboardType: TextInputType.number,
        ),
        // Crop dropdown
        InputDropdown(
          label: "Crop",
          icon: Icons.grass,
          value: _selectedCrop,
          items: _crops,
          onChanged: (value) {
            setState(() {
              _selectedCrop = value;
            });
          },
        ),
        // Soil type dropdown
        InputDropdown(
          label: "Soil Type",
          icon: Icons.terrain,
          value: _selectedSoil,
          items: _soilTypes,
          onChanged: (value) {
            setState(() {
              _selectedSoil = value;
            });
          },
        ),

        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _submitForm,
            child: const Text("Submit", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  // Styled numeric TextField
  Widget InputField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.green[700])
              : null,
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          filled: true,
          fillColor: Colors.green[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Styled Dropdown field
  Widget InputDropdown({
    required String label,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.green[700])
              : null,
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          filled: true,
          fillColor: Colors.green[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            hint: Text("Select $label"),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

Widget InputFieldNumeric({
  required TextEditingController controller,
  required String label,
  IconData? icon,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: Colors.green[700]) : null,
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Colors.green[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
