import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../../util/screen_util.dart';



String url1 = 'https://flutterchina.club/';
String url2 = 'http://flutterall.com/';
bool _closed = false;
bool _isShow = true;
///提供链接到一个唯一webview的单例实例，以便您可以从应用程序的任何位置控制webview
final _webviewReference = FlutterWebviewPlugin();

///市集 市集使用两个webView代替，因为豆瓣中 这个就是WebView

class ShopPage extends StatelessWidget{

  void setShowState(bool isShow){
    _isShow = isShow;
    if(!isShow){
      _closed = true;
      _webviewReference.hide();
      _webviewReference.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebViewPageWidget();
  }

}

class WebViewPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewPageWidgetState();
  }

}

class WebViewPageWidgetState extends State<WebViewPageWidget> with SingleTickerProviderStateMixin {

  var list = ['豆芽豆品', '豆芽时间'];

  int selectIndex = 0;
  Color selectColor,unSelectColor;
  TextStyle selectStyle,unSelectStyle;
  TabController tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _webviewReference.close();
    tabController = new TabController(length: list.length, vsync: this);
    selectColor = Colors.green;
    unSelectColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18);
    unSelectStyle = TextStyle(fontSize: 18);
    _webviewReference.onUrlChanged.listen((String url){
      if(url != url || url != url){

      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
    _webviewReference.close();
    _webviewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(!_isShow){
      return Container();
    }
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TabBar(
                      tabs: list.map((item) => Text(item)).toList(),
                      isScrollable: false,
                      controller: tabController,
                      indicatorColor: selectColor,
                      labelColor: selectColor,
                      labelStyle: selectStyle,
                      unselectedLabelColor: unSelectColor,
                      unselectedLabelStyle: unSelectStyle,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (selectIndex){
                          this.selectIndex = selectIndex;
                          _webviewReference.reloadUrl(selectIndex == 0 ? url1:url2);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
            Expanded(
              child: WebViewPage(selectIndex == 0 ? url1 : url2),
            )
          ],
        ),
      ),
    );
  }
}

class WebViewPage extends StatefulWidget{

  final String url;

  WebViewPage(this.url,{Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewPageState();
  }

}

class WebViewPageState extends State<WebViewPage> {

  Rect rect;
  bool needFullScreen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _webviewReference.close();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _webviewReference.close();
    _webviewReference.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _WebviewPlaceholde(onRectChanged: (Rect value){
      if(rect == null || _closed ){
        if(rect != value){
          rect = value;
        }
        _webviewReference.launch(widget.url,withJavascript: true,
            withLocalStorage: true,scrollBar: true,rect: getRect());
      }else{
        if(rect != value){
          rect = value;
        }
        _webviewReference.reloadUrl(widget.url);
      }
    },child: const  Center(child: const CircularProgressIndicator(),),);
  }

  getRect(){
    if(needFullScreen){
      return null;
    }else {
      return Rect.fromLTRB(0.0, ScreenUtil.padTopH() + 60.0, ScreenUtil.screenW(),
          ScreenUtil.screenH() - 60.0);
    }
  }


}

/*
* SingleChildRenderObjectWidget是RenderObjectWidgets的一个子类，
* 用于限制只能有一个子节点。它只提供child的存储，而不提供实际的更新逻辑。
*
* */
class _WebviewPlaceholde extends SingleChildRenderObjectWidget{

  final ValueChanged<Rect> onRectChanged;

  const _WebviewPlaceholde({
    Key key, @required this.onRectChanged,
    Widget child
}) : super(key : key,child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return _WebviewPlaceholderRender(
      onRectChanged:onRectChanged
    );
  }

  @override
  void updateRenderObject(BuildContext context, _WebviewPlaceholderRender renderObject) {
    // TODO: implement updateRenderObject
    renderObject
      ..onRectChange = onRectChanged;

  }
}

/*
* 可用自定义 绘制widget
* */
class _WebviewPlaceholderRender extends RenderProxyBox{

  ValueChanged<Rect> _callback;
  Rect _rect;




  _WebviewPlaceholderRender({
    RenderBox child,ValueChanged<Rect> onRectChanged
}) : _callback = onRectChanged ,super(child);

  Rect get rect => _rect;

  set onRectChange(ValueChanged<Rect> callback){
    if(callback != _callback){
      _callback = callback;
      notifyRect();
    }
  }

  void notifyRect(){
    if(_callback != null && rect != null){
      _callback(_rect);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    super.paint(context, offset);
    final rect = offset & size;
    if(_rect != rect){
      _rect = rect;
      notifyRect();
    }
  }

}












