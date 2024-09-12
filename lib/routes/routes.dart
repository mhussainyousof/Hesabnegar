import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:me/pages/auth/delet_pass.dart';
import 'package:me/pages/home/home_screen.dart';
import 'package:me/pages/auth/login_screen.dart';
import 'package:me/pages/auth/set_password.dart';
import '../pages/describe_app/about_page.dart';
import '../pages/books/books_screen.dart';
import '../pages/info_screen/info_screen.dart';
import '../pages/setting/setting.dart';
import '../pages/splash/splash_screen.dart';
import '../pages/add_edit_transaction/transaction_screen.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: '/homescreen', page: () => HomeScreen()),
        GetPage(name: '/infoscreen', page: () => const InfoScreen()),
        GetPage(name: '/transactionscreen', page: () =>  TransactionScreen()),
        GetPage(name: '/setpasswordscreen', page:()=> const SetPasswordPage()),
        GetPage(name: '/settingscreen', page: ()=>  Setting()),
        GetPage(name: '/loginscreen', page: ()=> LoginPage()),
        GetPage(name: '/deletscreen', page: ()=> DeletPage()),
        GetPage(name: '/aboutscreen', page: ()=> const AboutScreen()),
        GetPage(name: '/booksscreen', page: ()=> const BooksScreen()),
        GetPage(name: '/SplashScreen', page: ()=> const SplashScreen()),
      ];
}
