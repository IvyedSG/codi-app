import 'package:flutter/material.dart';

class AllPromosScreen extends StatefulWidget {
  const AllPromosScreen({super.key});

  @override
  State<AllPromosScreen> createState() => _AllPromosScreenState();
}

class _AllPromosScreenState extends State<AllPromosScreen> with SingleTickerProviderStateMixin {
  // Nombres de las pestañas actualizados para ser más concisos
  final List<String> _filters = ["Todas", "Recibos", "Tiendas", "Filtrar"];
  
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _filters.length, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Catálogo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Green receipt counter moved to app header
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1C6734).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.eco_outlined,
                  size: 16,
                  color: Color(0xFF1C6734),
                ),
                SizedBox(width: 4),
                Text(
                  '7 recibos',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C6734),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs rediseñados sin línea negra
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(22),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.black,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent, // Elimina la línea divisoria
              indicatorPadding: EdgeInsets.zero,
              tabs: _filters.map((String filter) {
                return Tab(
                  text: filter,
                );
              }).toList(),
            ),
          ),
          // Contenido de los tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAllPromosTab(),
                _buildGreenReceiptsTab(),
                _buildByStoreTab(),
                _buildFilterTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAllPromosTab() {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: const Color(0xFFEEF6F6), // Fondo sólido
      child: SafeArea(
        top: false, // No necesitamos SafeArea en la parte superior
        bottom: true,
        child: GridView.count(
          padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPadding + 16),
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildPromoGridItem(
              'Descuento 20%',
              'En todas las frutas y verduras',
              Icons.shopping_bag_outlined,
              'Tottus',
              '01 Jun - 15 Jun',
            ),
            _buildPromoGridItem(
              'Eco bolsa gratis',
              'Por compras con recibos verdes',
              Icons.eco_outlined,
              'Plaza Vea',
              '01 Jun - 30 Jun',
            ),
            _buildPromoGridItem(
              '2x1 en productos',
              'Seleccionados con etiqueta verde',
              Icons.local_offer_outlined,
              'Wong',
              'Todos los martes',
            ),
            _buildPromoGridItem(
              'Descuento en café',
              'Con tu taza reutilizable',
              Icons.coffee,
              'Eco Café',
              'Permanente',
            ),
            _buildPromoGridItem(
              '15% adicional',
              'En todos los productos orgánicos',
              Icons.recycling_outlined,
              'Metro',
              '01 Jun - 07 Jun',
            ),
            _buildPromoGridItem(
              'Productos gratis',
              'Con 5 recibos verdes',
              Icons.card_giftcard_outlined,
              'Varias tiendas',
              'Hasta agotar stock',
            ),
            _buildPromoGridItem(
              'Descuento fijo',
              'S/10 en tu próxima compra',
              Icons.money_off_outlined,
              'Vivanda',
              '01 Jun - 30 Jun',
            ),
            _buildPromoGridItem(
              'Bolsa ecológica',
              'Por 2 recibos verdes',
              Icons.shopping_bag_outlined,
              'Todas las tiendas',
              'Hasta agotar stock',
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildGreenReceiptsTab() {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: const Color(0xFFEEF6F6), // Fondo sólido
      child: SafeArea(
        top: false, // No necesitamos SafeArea en la parte superior
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPadding + 16),
          children: [
            _buildPromoHeader('¿Qué puedo conseguir con mis recibos?'),
            const SizedBox(height: 16),

            // Categorías de canje
            _buildCategoriesRow(),
            const SizedBox(height: 24),

            // Lista organizada por cantidad de recibos
            _buildPromoHeader('Con 1-3 recibos'),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '1 Recibo Verde',
              'Descuento de S/10 en tu próxima compra',
              Icons.money_off_outlined,
            ),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '2 Recibos Verdes',
              'Bolsa ecológica reutilizable',
              Icons.shopping_bag_outlined,
            ),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '3 Recibos Verdes',
              'Descuento de 15% en productos orgánicos',
              Icons.savings_outlined,
            ),

            const SizedBox(height: 24),
            _buildPromoHeader('Con 4-7 recibos'),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '5 Recibos Verdes',
              'Productos orgánicos gratis',
              Icons.eco_outlined,
            ),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '7 Recibos Verdes',
              'Kit de productos biodegradables',
              Icons.inventory_2_outlined,
            ),

            const SizedBox(height: 24),
            _buildPromoHeader('Con 8+ recibos'),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '8 Recibos Verdes',
              'Vale de descuento de S/50 en cualquier tienda',
              Icons.credit_card_outlined,
            ),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '10 Recibos Verdes',
              'Kit completo de productos eco-amigables',
              Icons.card_giftcard_outlined,
            ),
            const SizedBox(height: 12),
            _buildGreenReceiptPromoCard(
              '15 Recibos Verdes',
              'Talleres gratuitos de ecología y sostenibilidad',
              Icons.school_outlined,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildByStoreTab() {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: const Color(0xFFEEF6F6),
      child: SafeArea(
        top: false, // No necesitamos SafeArea en la parte superior
        bottom: true, // Fondo sólido
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPadding + 16),
          children: [
            // Tiendas destacadas con imagen más grande
            _buildPromoHeader('Tiendas destacadas'),
            const SizedBox(height: 16),
            _buildFeaturedStoresList(),
            const SizedBox(height: 24),

            // Supermercados
            _buildPromoHeader("Supermercados"),
            const SizedBox(height: 12),
            _buildDetailedStoreCard(
              'Tottus',
              'Descuentos exclusivos en productos orgánicos y sostenibles',
              'assets/images/tottus_logo.png',
              '8 promociones disponibles',
            ),
            const SizedBox(height: 12),
            _buildDetailedStoreCard(
              'Metro',
              '10% de descuento en productos eco-amigables y canjes exclusivos',
              'assets/images/metro_logo.png',
              '5 promociones disponibles',
            ),
            const SizedBox(height: 12),
            _buildDetailedStoreCard(
              'Plaza Vea',
              'Miércoles verde: 15% en productos orgánicos y bolsas reutilizables de regalo',
              'assets/images/plazavea_logo.png',
              '6 promociones disponibles',
            ),
            const SizedBox(height: 12),
            _buildDetailedStoreCard(
              'Wong',
              'Productos ecológicos con descuentos especiales y promociones 2x1',
              'assets/images/wong_logo.png',
              '4 promociones disponibles',
            ),
            const SizedBox(height: 12),
            _buildDetailedStoreCard(
              'Vivanda',
              'Ofertas en productos bio y descuentos para usuarios con recibos verdes',
              'assets/images/vivanda_png.png',
              '3 promociones disponibles',
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFilterTab() {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SafeArea(
      bottom: false, // Gestionaremos el padding inferior manualmente
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPadding + 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filtrar promociones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // Filtros por tipo de promoción
            _buildFilterSection('Tipo de promoción', [
              'Descuento',
              'Producto gratis',
              '2x1',
              'Vale de compra',
              'Talleres',
            ]),
            const SizedBox(height: 20),

            // Filtros por cantidad de recibos
            _buildFilterSection('Cantidad de recibos necesarios', [
              '1-3 recibos',
              '4-7 recibos',
              '8-15 recibos',
              'Sin recibos',
            ]),
            const SizedBox(height: 20),

            // Filtros por establecimiento
            _buildFilterSection('Establecimiento', [
              'Supermercados',
              'Tiendas Eco',
              'Cafeterías',
              'Otros',
            ]),
            const SizedBox(height: 20),

            // Filtros por vigencia
            _buildFilterSection('Vigencia', [
              'Esta semana',
              'Este mes',
              'Permanentes',
            ]),
            const Spacer(),

            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Limpiar filtros',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Aplicar filtros',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // Widgets específicos para cada sección
  
  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) => _buildFilterChip(option)).toList(),
        ),
      ],
    );
  }
  
  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      selected: false,
      onSelected: (bool selected) {},
      backgroundColor: Colors.white,
      selectedColor: const Color(0xFF9AE1B7),
      checkmarkColor: const Color(0xFF1C6734),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    );
  }
  
  Widget _buildCategoriesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryButton(Icons.shopping_bag_outlined, 'Productos'),
        _buildCategoryButton(Icons.fastfood_outlined, 'Comida'),
        _buildCategoryButton(Icons.money_off_outlined, 'Descuentos'),
        _buildCategoryButton(Icons.card_giftcard_outlined, 'Kits'),
      ],
    );
  }
  
  Widget _buildCategoryButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF9AE1B7).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1C6734),
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  
  Widget _buildFeaturedStoresList() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFeaturedStoreItem(
            'Tottus', 
            'assets/images/tottus_logo.png',
            '8 promos'
          ),
          SizedBox(width: 12),
          _buildFeaturedStoreItem(
            'Plaza Vea', 
            'assets/images/plazavea_logo.png',
            '6 promos'
          ),
          SizedBox(width: 12),
          _buildFeaturedStoreItem(
            'Metro', 
            'assets/images/metro_logo.png',
            '5 promos'
          ),
          SizedBox(width: 12),
          _buildFeaturedStoreItem(
            'Wong', 
            'assets/images/wong_logo.png',
            '4 promos'
          ),
          SizedBox(width: 12),
          _buildFeaturedStoreItem(
            'Vivanda', 
            'assets/images/vivanda_png.png',
            '3 promos'
          ),
        ],
      ),
    );
  }
  
  Widget _buildFeaturedStoreItem(String name, String logoPath, String promoCount) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              logoPath,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2),
          Text(
            promoCount,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPromoHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
  
  Widget _buildPromoGridItem(String title, String description, IconData icon, String store, String validity) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Parte superior con icono
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF9AE1B7).withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: const Color(0xFF1C6734),
              ),
            ),
          ),
          // Contenido
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.store,
                      size: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(width: 4),
                    Text(
                      store,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(width: 4),
                    Text(
                      validity,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDetailedStoreCard(String storeName, String description, String logoPath, String promoCount) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Logo de la tienda
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    logoPath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                // Nombre y contador
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9AE1B7).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          promoCount,
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF1C6734),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Descripción
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            // Botón de ver promociones
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: const Color(0xFF1C6734)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Ver todas las promociones',
                  style: TextStyle(
                    color: const Color(0xFF1C6734),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildGreenReceiptPromoCard(String receipts, String description, IconData icon) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Contenedor del icono con fondo verde
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 24,
                  color: const Color(0xFF1C6734),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        receipts,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.eco_outlined,
                        size: 16,
                        color: const Color(0xFF1C6734),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Botón de canjear
            SizedBox(
              width: 80,
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9AE1B7),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Canjear',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}