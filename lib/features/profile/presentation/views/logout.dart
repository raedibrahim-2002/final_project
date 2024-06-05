// import 'package:flutter/material.dart';
// import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/login_view.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyPage extends StatelessWidget {
//   final String fcmToken; // استلم التوكن من الصفحة السابقة أو من مصدر آخر

//   MyPage({required this.fcmToken});

//   Future<void> _logout(BuildContext context) async {
//     final String logoutUrl = 'https://student.valuxapps.com/api/logout';
//     final response = await http.post(
//       Uri.parse(logoutUrl),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'fcm_token': fcmToken,
//       }),
//     );

//     final responseData = jsonDecode(response.body);

//     if (responseData['status']) {
//       // إذا كانت عملية تسجيل الخروج ناجحة، قم بإزالة التوكن من التخزين المحلي
//       // تأكد من إزالة التوكن حسب طريقة التخزين المستخدمة في التطبيق
//       // على سبيل المثال، إذا كنت تستخدم shared_preferences:
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       // await prefs.remove('token');

//       // ثم انتقل إلى شاشة SplashView
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     } else {
//       // التعامل مع حالة الفشل، مثل عرض رسالة خطأ
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(responseData['message'])),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//       ),
//       body: Center(
//         child: MaterialButton(
//           onPressed: () {
//             _logout(context);
//           },
//           child: Text(
//             "log out",
//             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//           ),
//           color: Colors.blue, // يمكنك تغيير اللون حسب تصميمك
//         ),
//       ),
//     );
//   }
// }
