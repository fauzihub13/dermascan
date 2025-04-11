import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/helper/auth_local_helper.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_dermascan/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/logout_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/register_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_dermascan/src/features/profile/data/datasources/profile_datasources.dart';
import 'package:flutter_dermascan/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_dermascan/src/features/profile/domain/usecases/change_password_use_case.dart';
import 'package:flutter_dermascan/src/features/profile/domain/usecases/update_profile_use_case.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_image_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/data/repositories/classification_repository_impl.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/classify_image_use_case.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/save_classify_result_use_case.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/bloc/classify/classify_bloc.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/bloc/classify_image/classify_image_bloc.dart';
import 'package:flutter_dermascan/src/shared/data/repositories/local_auth_repository_impl.dart';
import 'package:flutter_dermascan/src/shared/domain/usecases/get_local_auth_use_case.dart';
import 'package:flutter_dermascan/src/shared/domain/usecases/save_local_auth_use_case.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/bloc/local_auth_bloc.dart';

void main() async {
  final ClassificationRepositoryImpl classificationRepository =
      ClassificationRepositoryImpl(
        ClassificationImageDataSource(),
        ClassificationDataSource(),
      );
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
      registerUseCase: RegisterUseCase(
        authRepository: AuthRepositoryImpl(
          authRemoteDataSource: AuthRemoteDataSource(),
        ),
      ),
      updateProfileUseCase: UpdateProfileUseCase(
        profileRepository: ProfileRepositoryImpl(
          profileDatasources: ProfileDatasources(),
        ),
      ),
      changePasswordUseCase: ChangePasswordUseCase(
        profileRepository: ProfileRepositoryImpl(
          profileDatasources: ProfileDatasources(),
        ),
      ),
      getLocalAuthUseCase: GetLocalAuthUseCase(
        localAuthRepository: LocalAuthRepositoryImpl(
          authLocalHelper: AuthLocalHelper(),
        ),
      ),
      saveLocalAuthUseCase: SaveLocalAuthUseCase(
        localAuthRepository: LocalAuthRepositoryImpl(
          authLocalHelper: AuthLocalHelper(),
        ),
      ),
      saveClassifyResultUseCase: SaveClassifyResultUseCase(
        classificationRepository: classificationRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ClassificationRepositoryImpl classificationRepository;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final GetLocalAuthUseCase getLocalAuthUseCase;
  final SaveLocalAuthUseCase saveLocalAuthUseCase;
  final SaveClassifyResultUseCase saveClassifyResultUseCase;
  const MyApp({
    super.key,
    required this.classificationRepository,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
    required this.updateProfileUseCase,
    required this.changePasswordUseCase,
    required this.getLocalAuthUseCase,
    required this.saveLocalAuthUseCase,
    required this.saveClassifyResultUseCase,
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
          create:
              (context) =>
                  AuthBloc(loginUseCase, logoutUseCase, registerUseCase),
        ),
        BlocProvider(
          create:
              (context) =>
                  ProfileBloc(updateProfileUseCase, changePasswordUseCase),
        ),
        BlocProvider(
          create:
              (context) =>
                  LocalAuthBloc(getLocalAuthUseCase, saveLocalAuthUseCase),
        ),
        BlocProvider(
          create: (context) => ClassifyBloc(saveClassifyResultUseCase),
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
