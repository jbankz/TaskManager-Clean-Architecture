import 'package:clean_architecture/core/api/task_api.dart';
import 'package:clean_architecture/core/database/hive_database.dart';
import 'package:clean_architecture/core/network/network_service.dart';
import 'package:clean_architecture/views/data/contractImpl/taskimpl.dart';
import 'package:clean_architecture/views/data/sourceImpl/task_source_impl.dart';
import 'package:clean_architecture/views/domain/usecase/task_usecase.dart';
import 'package:clean_architecture/views/presentation/bloc/taskbloc_bloc.dart';
import 'package:get_it/get_it.dart';
import '../network/app_config.dart';

final inject = GetIt.instance;
final hiveManager = HiveManager();

Future<void> initializeCore({required Environment environment}) async {
  AppConfig.environment = environment;
  await _initializeCore();
  _initServices();
  _initProviders();
  _initBloc();
  _initDataSources();
  _initDataContracts();
  _initializeUsecase();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
  await hiveManager.initializeDatabase();
  inject.registerLazySingleton<HiveManager>(() => hiveManager);
}

/// Initialize providers here
void _initProviders() {}

/// Initialize bloc's here
void _initBloc() {
  inject.registerLazySingleton<TaskblocBloc>(() => TaskblocBloc(inject()));
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<TaskSourceContractImpl>(
      () => TaskSourceContractImpl(taskService: inject()));
}

/// Initialize data repositories implementations
void _initDataContracts() {
  inject.registerLazySingleton<TaskContractImpl>(
      () => TaskContractImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  inject.registerLazySingleton<TaskService>(
      () => TaskService(networkService: inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  inject.registerLazySingleton<TaskUseCase>(() => TaskUseCase(inject()));
}
