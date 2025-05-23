import 'package:flutter/material.dart';
import '../widgets/green_receipt_promo_card.dart';
import '../widgets/promo_grid_item.dart';
import '../widgets/detailed_store_card.dart';
import '../widgets/categories_row.dart';
import '../widgets/featured_store_item.dart';
import '../widgets/filter_chip_widget.dart';


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

    // Obtenemos los valores de la zona segura inferior
    final bottomPadding = MediaQuery.of(context).padding.bottom;

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
                Icon(Icons.eco_outlined, size: 16, color: Color(0xFF1C6734)),
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
      // Usamos SafeArea para respetar las zonas seguras del dispositivo
      body: SafeArea(
        bottom: false, // Gestionaremos el padding inferior manualmente
        child: Column(
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
                tabs:
                    _filters.map((String filter) {
                      return Tab(text: filter);
                    }).toList(),
              ),
            ),
            // Contenido de los tabs
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildSafeScrollView(_buildAllPromosTab(), bottomPadding),
                  _buildSafeScrollView(_buildGreenReceiptsTab(), bottomPadding),
                  _buildSafeScrollView(_buildByStoreTab(), bottomPadding),
                  _buildFilterTabWithSafeArea(bottomPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Nuevo método para envolver los tabs con scroll en contenedores seguros
  Widget _buildSafeScrollView(Widget content, double bottomPadding) {
    return Container(
      color: const Color(0xFFEEF6F6),
      child: Padding(
        // Añadimos padding inferior para evitar que el contenido quede bajo los controles del sistema
        padding: EdgeInsets.only(
          bottom: bottomPadding > 0 ? bottomPadding : 16,
        ),
        child: content,
      ),
    );
  }
  
  // La pestaña "Todas" con promociones en formato grid
  Widget _buildAllPromosTab() {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        PromoGridItem(
          'Descuento 20%', 
          'En todas las frutas y verduras', 
          Icons.shopping_bag_outlined,
          'Tottus',
          '01 Jun - 15 Jun'
        ),
        PromoGridItem(
          'Eco bolsa gratis', 
          'Por compras con recibos verdes', 
          Icons.eco_outlined,
          'Plaza Vea',
          '01 Jun - 30 Jun'
        ),
        PromoGridItem(
          '2x1 en productos', 
          'Seleccionados con etiqueta verde', 
          Icons.local_offer_outlined,
          'Wong',
          'Todos los martes'
        ),
        PromoGridItem(
          'Descuento en café', 
          'Con tu taza reutilizable', 
          Icons.coffee,
          'Eco Café',
          'Permanente'
        ),
        PromoGridItem(
          '15% adicional', 
          'En todos los productos orgánicos', 
          Icons.recycling_outlined,
          'Metro',
          '01 Jun - 07 Jun'
        ),
        PromoGridItem(
          'Productos gratis', 
          'Con 5 recibos verdes', 
          Icons.card_giftcard_outlined,
          'Varias tiendas',
          'Hasta agotar stock'
        ),
        PromoGridItem(
          'Descuento fijo', 
          'S/10 en tu próxima compra', 
          Icons.money_off_outlined,
          'Vivanda',
          '01 Jun - 30 Jun'
        ),
        PromoGridItem(
          'Bolsa ecológica', 
          'Por 2 recibos verdes', 
          Icons.shopping_bag_outlined,
          'Todas las tiendas',
          'Hasta agotar stock'
        ),
      ],
    );
  }
  
  // Pestaña "Recibos" (antes "Recibos verdes")
  Widget _buildGreenReceiptsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildPromoHeader('¿Qué puedo conseguir con mis recibos?'),
        const SizedBox(height: 16),
        
        // Categorías de canje
        CategoriesRow(),
        const SizedBox(height: 24),
        
        // Lista organizada por cantidad de recibos
        _buildPromoHeader('Con 1-3 recibos'),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '1 Recibo Verde',
          'Descuento de S/10 en tu próxima compra',
          Icons.money_off_outlined,
        ),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '2 Recibos Verdes',
          'Bolsa ecológica reutilizable',
          Icons.shopping_bag_outlined,
        ),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '3 Recibos Verdes',
          'Descuento de 15% en productos orgánicos',
          Icons.savings_outlined,
        ),
        
        const SizedBox(height: 24),
        _buildPromoHeader('Con 4-7 recibos'),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '5 Recibos Verdes',
          'Productos orgánicos gratis',
          Icons.eco_outlined,
        ),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '7 Recibos Verdes',
          'Kit de productos biodegradables',
          Icons.inventory_2_outlined,
        ),
        
        const SizedBox(height: 24),
        _buildPromoHeader('Con 8+ recibos'),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '8 Recibos Verdes',
          'Vale de descuento de S/50 en cualquier tienda',
          Icons.credit_card_outlined,
        ),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '10 Recibos Verdes',
          'Kit completo de productos eco-amigables',
          Icons.card_giftcard_outlined,
        ),
        const SizedBox(height: 12),
        GreenReceiptPromoCard(
          '15 Recibos Verdes',
          'Talleres gratuitos de ecología y sostenibilidad',
          Icons.school_outlined,
        ),
      ],
    );
  }

  // Vista "Tiendas" (antes "Por tienda")
  Widget _buildByStoreTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Tiendas destacadas con imagen más grande
        _buildPromoHeader('Tiendas destacadas'),
        const SizedBox(height: 16),
        _buildFeaturedStoresList(),
        const SizedBox(height: 24),
        
        // Supermercados
        _buildPromoHeader("Supermercados"),
        const SizedBox(height: 12),
        DetailedStoreCard(
          'Tottus',
          'Descuentos exclusivos en productos orgánicos y sostenibles',
          'assets/images/tottus_logo.png',
          '8 promociones disponibles',
        ),
        const SizedBox(height: 12),
        DetailedStoreCard(
          'Metro',
          '10% de descuento en productos eco-amigables y canjes exclusivos',
          'assets/images/metro_logo.png',
          '5 promociones disponibles',
        ),
        const SizedBox(height: 12),
        DetailedStoreCard(
          'Plaza Vea',
          'Miércoles verde: 15% en productos orgánicos y bolsas reutilizables de regalo',
          'assets/images/plazavea_logo.png',
          '6 promociones disponibles',
        ),
        const SizedBox(height: 12),
        DetailedStoreCard(
          'Wong',
          'Productos ecológicos con descuentos especiales y promociones 2x1',
          'assets/images/wong_logo.png',
          '4 promociones disponibles',
        ),
        const SizedBox(height: 12),
        DetailedStoreCard(
          'Vivanda',
          'Ofertas en productos bio y descuentos para usuarios con recibos verdes',
          'assets/images/vivanda_png.png',
          '3 promociones disponibles',
        ),
      ],
    );
  }
  
  // Versión modificada del tab de filtros para respetar el área segura
  // ...existing code...

  Widget _buildFilterTabWithSafeArea(double bottomPadding) {
    return Container(
      color: const Color(0xFFEEF6F6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Filtrar promociones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // Wrap con Expanded pero con flex menor para que ocupe menos espacio
            Expanded(
              flex: 1, // Valor estándar
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    // Agregamos un espacio adicional al final para separación
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),

            // Contenedor fijo para botones con más espacio respecto a la barra inferior
            Container(
              width: double.infinity,
              // Elevamos los botones con más padding respecto a la barra de navegación
              margin: EdgeInsets.only(
                bottom: bottomPadding > 0 ? bottomPadding + 16 : 30,
              ),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }

  // ...existing code...
  
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
          children: options.map((option) => FilterChipWidget(option)).toList(),
        ),
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
          FeaturedStoreItem(
            'Tottus', 
            'assets/images/tottus_logo.png',
            '8 promos'
          ),
          SizedBox(width: 12),
          FeaturedStoreItem(
            'Plaza Vea', 
            'assets/images/plazavea_logo.png',
            '6 promos'
          ),
          SizedBox(width: 12),
          FeaturedStoreItem(
            'Metro', 
            'assets/images/metro_logo.png',
            '5 promos'
          ),
          SizedBox(width: 12),
          FeaturedStoreItem(
            'Wong', 
            'assets/images/wong_logo.png',
            '4 promos'
          ),
          SizedBox(width: 12),
          FeaturedStoreItem(
            'Vivanda', 
            'assets/images/vivanda_png.png',
            '3 promos'
          ),
        ],
      ),
    );
  }
}