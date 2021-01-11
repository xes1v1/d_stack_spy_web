import 'package:dstack_spy_web/provider/image_provider.dart';
import 'package:dstack_spy_web/provider/node_provider.dart';
import 'package:dstack_spy_web/provider/pageinfo_provider.dart';

class ProviderManager {
  static ProviderManager _instance;

  NodeProvider _nodeProvider;
  SnapShotProvider _imageProvider;
  PageInfoProvider _pageInfoProvider;

  static ProviderManager getInstance() {
    if (_instance == null) {
      _instance = ProviderManager._();
    }
    return _instance;
  }

  ProviderManager._() {
    _nodeProvider = NodeProvider();
    _imageProvider = SnapShotProvider();
    _pageInfoProvider = PageInfoProvider();
  }

  NodeProvider get nodeProvider => _nodeProvider;

  SnapShotProvider get imageProvider => _imageProvider;

  PageInfoProvider get pageInfoProvider => _pageInfoProvider;
}
