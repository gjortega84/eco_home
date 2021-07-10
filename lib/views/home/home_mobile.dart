part of home_view;

class _HomeMobile extends StatefulWidget {
  final HomeViewModel viewModel;
  _HomeMobile(this.viewModel);

  @override
  __HomeMobileState createState() => __HomeMobileState();
}

class __HomeMobileState extends State<_HomeMobile> {
  PageController _pageController;

  int _currentPage = 6;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.38,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        body: _body(responsive),
        bottomNavigationBar: BottomAppBar(
          notchMargin: responsive.widthPercent(0.025),
          shape: CircularNotchedRectangle(),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              _getActionButton(FontAwesomeIcons.history),
              _getActionButton(FontAwesomeIcons.chartPie),
              SizedBox(width: responsive.widthPercent(0.2)),
              _getActionButton(FontAwesomeIcons.wallet),
              _getActionButton(FontAwesomeIcons.hammer),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {}));
  }

  Widget _getActionButton(IconData iconData) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Icon(iconData),
      ),
      onTap: () {},
    );
  }

  Widget _body(Responsive responsive) {
    return SafeArea(
      child: Column(
        children: [
          _selector(responsive),
          _total(responsive),
          _graph(responsive),
          Container(
            height: responsive.heightPercent(0.02),
            color: Colors.green.withOpacity(0.15),
          ),
          _list(responsive),
        ],
      ),
    );
  }

  Widget _selector([Responsive responsive]) {
    return SizedBox.fromSize(
      size: Size.fromHeight(
        responsive.heightPercent(0.05),
      ),
      child: PageView(
        controller: _pageController,
        onPageChanged: (newPage){
          setState(() {
            _currentPage = newPage;
          });
        },
        children: [
          _getPage(
            'Enero',
            0,
            responsive,
          ),
          _getPage(
            'Febrero',
            1,
            responsive,
          ),
          _getPage(
            'Marzo',
            2,
            responsive,
          ),
          _getPage(
            'Abril',
            3,
            responsive,
          ),
          _getPage(
            'Mayo',
            4,
            responsive,
          ),
          _getPage(
            'Junio',
            5,
            responsive,
          ),
          _getPage(
            'Julio',
            6,
            responsive,
          ),
          _getPage(
            'Agosto',
            7,
            responsive,
          ),
          _getPage(
            'Septiembre',
            8,
            responsive,
          ),
          _getPage(
            'Octubre',
            9,
            responsive,
          ),
          _getPage(
            'Noviembre',
            10,
            responsive,
          ),
          _getPage(
            'Diciembre',
            11,
            responsive,
          ),
        ],
      ),
    );
  }

  Widget _total([Responsive responsive]) {
    return Column(
      children: [
        Text(
          'Gastos del mes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: responsive.widthPercent(0.05),
            color: Colors.green,
          ),
        ),
        Text(
          '\$57250,50',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: responsive.widthPercent(0.1),
          ),
        ),
      ],
    );
  }

  Widget _graph([Responsive responsive]) {
    return Container(
      height: 250,
      child: GraphWidget(),
    );
  }

  Widget _list([Responsive responsive]) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => _item(
              FontAwesomeIcons.shoppingCart, 'Compras', 20, 50000, responsive),
          separatorBuilder: (BuildContext context, int index) => Container(
                color: Colors.green.withOpacity(0.2),
                height: responsive.heightPercent(0.005),
              ),
          itemCount: 15),
    );
  }

  Widget _item(IconData icon, String title, double percentOfTotal, double value,
      [Responsive responsive]) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.green,
        size: responsive.heightPercent(0.045),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: responsive.heightPercent(0.03),
        ),
      ),
      subtitle: Text(
        '$percentOfTotal % del mensual',
        style: TextStyle(
          color: Colors.lightGreen,
          fontSize: responsive.heightPercent(0.022),
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          borderRadius: BorderRadius.circular(
            responsive.widthPercent(0.03),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '\$$value',
            style: TextStyle(
              fontSize: responsive.heightPercent(0.022),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPage(String month, int position, [Responsive responsive]) {
    var _alignment;
    var _fontWeight;
    var _colorFont;
    if (position == _currentPage) {
      _alignment = Alignment.center;
      _fontWeight =  FontWeight.bold;
      _colorFont=Colors.black;
    } else if (position > _currentPage) {
      _fontWeight =  FontWeight.normal;        
      _alignment = Alignment.centerRight;
      _colorFont= Colors.black.withOpacity(0.2);
    } else {
      _fontWeight =  FontWeight.normal;        
      _alignment = Alignment.centerLeft;
      _colorFont= Colors.black.withOpacity(0.2);
    }
    return Align(
      alignment: _alignment,
      child: Text(
        month,
        style: TextStyle(
          fontSize: responsive.heightPercent(0.03),
          fontWeight: _fontWeight,
          color: _colorFont,

        ),
      ),
    );
  }
}
