class NotificationData {
  final int id;
  final String title;
  final String description;
  bool? isRead;

  NotificationData({
    required this.id,
    required this.title,
    required this.description,
    required this.isRead,
  });
}

// crate 5 data notificaion random promo
List<NotificationData> allNotif = [
  NotificationData(
    id: 1,
    title: 'Promo Akhir Tahun',
    description: 'Diskon 50% untuk semua produk',
    isRead: false,
  ),
  NotificationData(
    id: 2,
    title: 'Baru Erigo Work Shirt 2022',
    description: 'Kualitas terbaik dengan harga terjangkau',
    isRead: false,
  ),
  NotificationData(
    id: 3,
    title: 'Promo Akhir spesial untuk kamu',
    description: 'Beli 2 dapat 1 gratis',
    isRead: false,
  ),
];
