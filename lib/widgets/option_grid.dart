import 'package:flutter/material.dart';
import 'option_card.dart';

class OptionsGrid extends StatelessWidget {
  final List<Map<String, String>> options;
  final String selectedOption;
  final Function(String) onOptionSelect;

  const OptionsGrid({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.5,
        physics: const NeverScrollableScrollPhysics(),
        children: options
            .map((option) => OptionCard(
                  letter: option['letter']!,
                  text: option['text']!,
                  isSelected: selectedOption == option['letter'],
                  onTap: () => onOptionSelect(option['letter']!),
                ))
            .toList(),
      ),
    );
  }
}
