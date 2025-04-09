import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_dermascan/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/logout_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_image_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/data/repositories/classification_repository_impl.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/classify_image_use_case.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/bloc/bloc/classify_image_bloc.dart';

void main() async {
  final ClassificationRepositoryImpl classificationRepository =
      ClassificationRepositoryImpl(ClassificationImageDataSource());
  WidgetsFlutterBinding.ensureInitialized();
  await RoutePage.init();
  runApp(
    MyApp(
      classificationRepository: classificationRepository,
      loginUseCase: LoginUseCase(
        authRepository: AuthRepositoryImpl(
          authRemoteDataSource: AuthRemoteDataSource(),
        ),
      ),
      logoutUseCase: LogoutUseCase(
        authRepository: AuthRepositoryImpl(
          authRemoteDataSource: AuthRemoteDataSource(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ClassificationRepositoryImpl classificationRepository;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  const MyApp({
    super.key,
    required this.classificationRepository,
    required this.loginUseCase,
    required this.logoutUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => ClassifyImageBloc(
                ClassifyImageUseCase(classificationRepository),
              ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(loginUseCase, logoutUseCase),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'DermaScan',
        theme: AppTheme.light,
        routerConfig: RoutePage.router,
      ),
    );
  }
}
