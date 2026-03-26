import 'package:get_it/get_it.dart';
import 'package:test_color/core/services/clipboard_service.dart';
import 'package:test_color/core/services/clipboard_service_impl.dart';
import 'package:test_color/features/random_background/domain/repositories/color_repository.dart';
import 'package:test_color/features/random_background/domain/repositories/color_repository_impl.dart';
import 'package:test_color/features/random_background/domain/usecases/change_bg_color_use_case.dart';
import 'package:test_color/features/random_background/presentation/bloc/random_color_cubit.dart';

final getIt = GetIt.instance;

class InjectionContainer {
  void init() {
    getIt.registerLazySingleton<ColorRepository>(ColorRepositoryImpl.new);

    getIt.registerLazySingleton(
      () => ChangeBgColorUseCase(getIt.get<ColorRepository>()),
    );
    getIt.registerLazySingleton<ClipboardService>(
      ClipboardServiceImpl.new,
    );

    getIt.registerFactory(
      () => RandomColorCubit(
        getIt.get<ChangeBgColorUseCase>(),
        getIt.get<ClipboardService>(),
      ),
    );
  }
}
