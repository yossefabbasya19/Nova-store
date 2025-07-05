import 'package:ecommerce_app/features/main_layout/home/data/data_source/home_api_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repo/home_repo_imple.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/view_model/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeCubit>(
      HomeCubit(HomeRepoImple(dataSource: HomeApiDataSource())));
}
