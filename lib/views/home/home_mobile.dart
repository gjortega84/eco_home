part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Resposive resposive = Resposive.of(context);
    return Scaffold(
      body: _body(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _getActionButton(FontAwesomeIcons.history, resposive),
            _getActionButton(FontAwesomeIcons.chartPie, resposive),
            SizedBox(width: resposive.widthPercent(0.1)),
            _getActionButton(FontAwesomeIcons.wallet, resposive),
            _getActionButton(FontAwesomeIcons.hammer, resposive),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }

  Widget _getActionButton(IconData iconData, Resposive responsive) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: Icon(iconData),
      ),
      onTap: () {},
    );
  }

  Widget _body() {
    return SafeArea(
        child: Column(children: [_selector(), _total(), _graph(), _list()]));
  }

  Widget _selector() {
    return Container();
  }

  Widget _total() {
    return Column(
      children: [
        Text('data'),
        Text('data'),
      ],
    );
  }

  Widget _graph() {
    return Container();
  }

  Widget _list() {
    return Container();
  }
}
