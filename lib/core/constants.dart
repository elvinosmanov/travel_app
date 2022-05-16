const String appName = 'Travel App';
const double defaultTopPadding = 40;

const categoriesSorts = ['All', 'Popular', 'Recommended', 'Most Viewed', 'Most Rated', 'New Added'];
const categoryNames = [
  'History and Culture',
  'Museum and Art',
  'Accommodation',
  'Shopping',
  'Gastronomy',
  'Nature and Agro'
];
// flutter pub run build_runner build --delete-conflicting-outputs


// final List<String> items = [
//   'Item1',
//   'Item2',
//   'Item3',
//   'Item4',
//   'Item5',
//   'Item6',
//   'Item7',
//   'Item8',
// ];
// String? selectedValue;

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: CustomDropdownButton2(
//         hint: 'Select Item',
//         dropdownItems: items,
//         value: selectedValue,
//         onChanged: (value) {
//           setState(() {
//             selectedValue = value;
//           });
//         },
//       ),
//     ),
//   );
// }