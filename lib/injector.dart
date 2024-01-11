import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ko/core/api_provider.dart';
import 'package:ko/core/connection_checker.dart';
import 'package:ko/core/hive_service.dart';
import 'package:ko/data/remote/data_source/app_Data_Source.dart';
import 'package:ko/domain/repositories/app_repositoryImpl.dart';
import 'package:ko/domain/usecase/auth/LoginUseCase.dart';
import 'package:ko/domain/usecase/cart/cartSaveUseCase.dart';
import 'package:ko/domain/usecase/kot/kotItemsUseCase.dart';
import 'package:ko/domain/usecase/memberOrGuest/locateCounterUseCase.dart';
import 'package:ko/domain/usecase/memberOrGuest/locateWaitersUseCase.dart';
import 'package:ko/domain/usecase/memberOrGuest/validateMemberUseCase.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/memeber_provider.dart';


import 'data/repository/app_repository.dart';

final sl = GetIt.instance;

Future<void> setUp() async {
//core
  sl.registerLazySingleton<ApiProvider>(() => ApiProvider());
  sl.registerLazySingleton<HiveService>(() => HiveService());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(sl()));
  //data source
  sl.registerLazySingleton<AppDataSource>(() => AppDataSourceImpl(sl()));
  //repository
  sl.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(sl()));
  //usecase
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<LocateCounterUseCase>(
      () => LocateCounterUseCase(sl()));
  sl.registerLazySingleton<LocateWaiterUseCase>(
      () => LocateWaiterUseCase(sl()));
  sl.registerLazySingleton<ValidateMemberUseCase>(
      () => ValidateMemberUseCase(sl()));
  sl.registerLazySingleton<KotItemsUseCase>(() => KotItemsUseCase(sl()));
  sl.registerLazySingleton<CartSaveUseCase>(() => CartSaveUseCase(sl()));
  sl.registerLazySingleton<MemberGuestProvider>(() => MemberGuestProvider(sl(), sl(), sl()));
}
