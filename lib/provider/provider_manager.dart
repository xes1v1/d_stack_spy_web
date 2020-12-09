import 'package:dstack_spy_web/provider/node_provider.dart';

class ProviderManager {
  static ProviderManager _instance;

  NodeProvider _nodeProvider;

  static ProviderManager getInstance() {
    if (_instance == null) {
      _instance = ProviderManager._();
    }
    return _instance;
  }

  ProviderManager._() {
    _nodeProvider = NodeProvider();
  }

  NodeProvider get nodeProvider => _nodeProvider;
}
