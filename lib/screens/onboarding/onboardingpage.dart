// // ignore_for_file: unused_field, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// import '../homepage/homepage.dart';

// class OnBoardingPage extends StatefulWidget {
//   @override
//   _OnBoardingPageState createState() => _OnBoardingPageState();
// }

// class _OnBoardingPageState extends State<OnBoardingPage> {
//   int _gender = 0;

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> _key = GlobalKey<FormState>();
//     var _name;
//     String _gender1 = '';
//     var _height;
//     var _weight;
//     final namecon = TextEditingController();
//     final heightcon = TextEditingController();
//     final weightcon = TextEditingController();

//     return SafeArea(
//       child: Scaffold(
//         body: Material(
//           child: Container(
//             child: IntroductionScreen(
//               globalBackgroundColor: Colors.blue[100],
//               showSkipButton: true,
//               showNextButton: true,
//               showDoneButton: false,
//               next: Text('Next'),
//               skip: Text('Skip'),
//               dotsDecorator: DotsDecorator(
//                 activeColor: Colors.blue,
//                 activeSize: Size(20, 10),
//                 activeShape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24)),
//               ),
//               pages: [
//                 PageViewModel(
//                   title: 'Greetings',
//                   body: 'Ewan ko',
//                   decoration: getpaggedec(),
//                 ),
//                 // PageViewModel(
//                 //   title: "Create Profile",
//                 //   bodyWidget: Form(
//                 //     key: _key,
//                 //     child: Column(
//                 //       crossAxisAlignment: CrossAxisAlignment.stretch,
//                 //       children: [],
//                 //     ),
//                 //   ),
//                 //   decoration: getpaggedec(),
//                 // ),
//                 PageViewModel(
//                   title: "Create Profile",
//                   bodyWidget: Form(
//                     key: _key,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Container(
//                           height: 100,
//                           child: TextFormField(
//                             controller: namecon,
//                             textCapitalization: TextCapitalization.words,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: 'Name',
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Enter Name';
//                               }
//                               String pattern =
//                                   r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
//                               RegExp regexp = RegExp(pattern);
//                               if (regexp.hasMatch(value)) {
//                                 return 'Format not Correct';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Container(
//                           height: 100,
//                           child: TextFormField(
//                             controller: heightcon,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: 'Height ',
//                               helperText: 'cm',
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Enter Height';
//                               }
//                               String pattern =
//                                   // r'^([1-9]|[01][0-9][0-9]|20[0-0])$';
//                                   r'^(?:(?:[1-9]?[0-9]|1[0-9]{2})(?:\.[0-9]{1,4})?|200(?:\.0{1,4})?)$';
//                               RegExp regexp = RegExp(pattern);
//                               if (!regexp.hasMatch(value)) {
//                                 return '1-200 and no decimal';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                         Container(
//                           height: 100,
//                           child: TextFormField(
//                             controller: weightcon,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: 'Weight',
//                               helperText: 'kg',
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Enter Weight';
//                               }
//                               String pattern =
//                                   // r'^([1-9]|[01][0-9][0-9]|20[0-0])$';
//                                   r'^(?:(?:[1-9]?[0-9]|1[0-9]{2})(?:\.[0-9]{1,4})?|200(?:\.0{1,4})?)$';
//                               RegExp regexp = RegExp(pattern);
//                               if (!regexp.hasMatch(value)) {
//                                 return '1-200 and no decimal';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   decoration: getpaggedec(),
//                   footer: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Container(
//                         child: TextButton(
//                           onPressed: () {
//                             if (_key.currentState!.validate()) {
//                               Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(builder: (_) => HomePage()),
//                               );
//                               _name = namecon.text;
//                               _height = heightcon.text;
//                               _weight = weightcon.text;

//                               // _gender1 = _gender;
//                               print(_name);
//                               print(_height);
//                               print(_weight);
//                             }
//                           },
//                           child: Text('Create',
//                               style: TextStyle(
//                                   fontSize: 30, color: Colors.blue[300])),
//                           style: ButtonStyle(
//                             padding: MaterialStateProperty.all<EdgeInsets>(
//                                 EdgeInsets.all(15)),
//                             // foregroundColor:
//                             //     MaterialStateProperty.all<Color>(Colors.blue),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(50.0),
//                                     side: BorderSide(color: Colors.blue))),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildImage(String path) => Center(
//           child: Image.asset(
//         path,
//         width: 350.0,
//       ));

//   PageDecoration getpaggedec() => PageDecoration(
//       titleTextStyle: TextStyle(
//         fontSize: 30,
//         fontWeight: FontWeight.w500,
//       ),
//       bodyAlignment: Alignment.center,
//       bodyTextStyle: TextStyle(fontSize: 20));
// }
