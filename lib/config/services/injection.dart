import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_cashier/config/services/injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(asExtension: false)
GetIt configureDependencies() => init(getIt);
