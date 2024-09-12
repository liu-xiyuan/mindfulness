import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:mindfulness/controller/petal_animation_controller.dart';
import 'package:mindfulness/router/app_router.dart';
import 'package:mindfulness/services/xbox_input_service.dart';
import 'package:mindfulness/styles/app_theme.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 初始化插件

  // await Get.putAsync(() => XboxInputService().init());
  doWhenWindowReady(() {
    const initialSize = Size(1280, 800);
    // appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    // appWindow.show();
  });
  Get.put(PetalAnimationController());
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
