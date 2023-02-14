import 'package:dartz/dartz.dart';
import 'package:movieapp/data/data_resources/language_local_data_source.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSourse dataSourse;

  AppRepositoryImpl(this.dataSourse);
  @override
  Future<Either<AppError, String>> getPrefferedLangauge() async {
    try {
      final response = await dataSourse.getPrefferedLangauge();
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLangauge(String language) async {
    try {
      final response = await dataSourse.updateLangauge(language);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
