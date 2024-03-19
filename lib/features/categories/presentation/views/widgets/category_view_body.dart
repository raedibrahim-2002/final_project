import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/features/room/presentaiton/views/room_view.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key});
  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  var isPressed = false;

  bool _isLogin = false;
  // تحديد ما إذا كان نموذج تسجيل الدخول معروضًا أم لا
  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showModalBottomSheet(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return
        //     Container(
        //       height: 200,
        //       padding: EdgeInsets.all(16.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           ElevatedButton(onPressed: () {}, child: Text('Login')),
        //           ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
        //         ],
        //       ),
        //     );
        //   },
        // );
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return RoomView();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Text(
              "Bed Room",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * .16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/home_3.jpeg",
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
