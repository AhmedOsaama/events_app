// import 'package:flutter/material.dart';
//
// import '../../../../../core/app_colors.dart';
// import '../../../../../core/style_utils.dart';
// import '../../../../../core/validator.dart';
// import '../../../../../core/widgets/generic_text_field.dart';
//
// class LoginForm extends StatelessWidget {
//   String email;
//   String password;
//   Function(String) saveEmail;
//   Function(String) savePassword;
//   LoginForm({Key? key, required this.password, required this.email}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Email",
//           style: TextStyles.textViewBold12.copyWith(color: gunmetal),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         GenericField(
//           hintText: "Brandonelouis@gmail.com",
//           validation: (value) => Validator.email(value),
//           onSaved: (value) {
//             email = value!;
//           },
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(
//           "Password",
//           style: TextStyles.textViewBold12.copyWith(color: gunmetal),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         GenericField(
//           hintText: "password",
//           obscureText: true,
//           validation: (value) => Validator.password(value),
//           onSaved: (value) {
//             password = value!;
//           },
//         ),
//       ],
//     );
//   }
// }
