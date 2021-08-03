import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/boleto/component/texto_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'listar_espacos_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListarEspacosPage extends StatefulWidget {
  final String title;
  const ListarEspacosPage({Key key, this.title = "Listar Espaços"})
      : super(key: key);

  @override
  _ListarEspacosPageState createState() => _ListarEspacosPageState();
}

class _ListarEspacosPageState
    extends ModularState<ListarEspacosPage, ListarEspacosController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  excluirEspaco(idEspaco) async {
    final r = await controller.excluirEspaco(idEspaco);
    if (r.status == Status.success) {
      Modular.navigator.pop(true);
      UIHelper.showInSnackBar(r.message, _scaffoldKey);
    } else {
      UIHelper.showInSnackBar(r.message, _scaffoldKey);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CustomAlertDialog.error(context, r.error.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarCustom(
          context,
          center: false,
          actions: [
            TextButton(
              onPressed: () => Modular.navigator
                  .pushNamed(RouteName.cadastro_espaco, arguments: null)
                  .then((value) => controller.init()),
              child: Text('ADICIONAR', style: AppTextTheme.textActionButton),
            )
          ],
          title: Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Observer(builder: (_) {
          switch (controller.espacos.status) {
            case Status.success:
              return controller.espacos.data.length > 0
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.espacos.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Dismissible(
                                    key: Key(controller.espacos.data[index].id
                                        .toString()),
                                    background: Container(
                                      color: AppColorScheme.tagRed2,
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColorScheme.white,
                                      ),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        '${controller.espacos.data[index].descricao}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF8A8A8A)),
                                      ),
                                      trailing: Icon(Icons.arrow_right),
                                      leading: Container(
                                        padding: EdgeInsets.only(top: 9),
                                        child: Icon(
                                          FlutterIcons.square_faw,
                                          size: 50.h,
                                          color: AppColorScheme.primaryColor,
                                        ),
                                      ),
                                      onTap: () => Modular.navigator.pushNamed(
                                          RouteName.cadastro_espaco,
                                          arguments: controller
                                              .espacos.data[index].id),
                                    ),
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                              "Atenção",
                                              style: TextStyle(
                                                color: AppColorScheme
                                                    .feedbackWarningDefault2,
                                              ),
                                            ),
                                            content: const Text(
                                                "Deseja realmente excluir este espaço?"),
                                            actions: [
                                              FlatButton(
                                                onPressed: () => excluirEspaco(
                                                    controller.espacos
                                                        .data[index].id),
                                                child: const Text(
                                                  "Sim",
                                                  style: TextStyle(
                                                    color: AppColorScheme
                                                        .feedbackDangerBase,
                                                  ),
                                                ),
                                              ),
                                              FlatButton(
                                                onPressed: () => Modular
                                                    .navigator
                                                    .pop(false),
                                                child: const Text("Não"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FlutterIcons.exclamation_triangle_faw,
                            size: 70,
                            color: AppColorScheme.primaryColor,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text('Não há espaços cadastrados'),
                        ],
                      ),
                    );
              break;
            case Status.failed:
              return Center(
                child: PageError(
                  messageError: 'Erro ao carregar os espaços',
                  onPressed: controller.init,
                ),
              );
              break;
            default:
              return Center(child: CircularProgressCustom());
          }
        }));
  }
}
