import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_image_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/data/repositories/classification_repository_impl.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/classify_image_use_case.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/bloc/bloc/classify_image_bloc.dart';

void main() {
  final ClassificationRepositoryImpl classificationRepository =
      ClassificationRepositoryImpl(ClassificationImageDataSource());

  runApp(MyApp(classificationRepository: classificationRepository));
}

class MyApp extends StatelessWidget {
  final ClassificationRepositoryImpl classificationRepository;
  const MyApp({super.key, required this.classificationRepository});

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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'DermaScan',
        theme: AppTheme.light,
        routerConfig: RoutePage().router,
      ),
    );
  }
}
