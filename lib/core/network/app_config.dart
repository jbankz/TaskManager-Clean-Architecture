enum Environment { development, staging, qa, production }

class AppConfig {
  static Environment environment = Environment.staging;
  static const String stagingURL = "http://192.168.43.131:3000/api/v1/";
  static const String productionURL = "";

  static final coreBaseUrl =
      environment == Environment.production ? productionURL : stagingURL;
}
