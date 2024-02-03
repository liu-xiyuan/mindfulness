import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:mindfulness/router/app_router.dart';
import 'package:mindfulness/services/xbox_input_service.dart';
import 'package:mindfulness/styles/app_theme.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 初始化插件

  await Get.putAsync(() => XboxInputService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
      title: 'Mindfuless',
      color: Colors.black,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const HomePage();
      },
    );
  }
}
