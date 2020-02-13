import 'package:nama_in/random.dart';

Map<String, List<String>> categoryMap = {
  'food' : [
    // Food
    'makan', 'lapar', 'kenyang', 'nyam', 'kunyah',
    'nasi', 'mie', 'ayam', 'martabak', 'burger', 'pizza',
    'nasipadang', 'gudeg', 'warteg', 'restoran',

    // Beverage
    'minum', 'haus', 'segar', 'glek', 'teguk',
    'kopi', 'teh', 'boba', 'bubbletea', 'greentea',
    'matcha', 'taro', 'redvelvet',

    // Desert
    'coklat', 'kue', 'brownies', 'roti',

    // Neutral
    'jajan', 'ngemil',
  ],

  'ecommerce' : [
    // Noun
    'toko', 'warung', 'kelontong', 'mall',

    // Verb
    'dagang', 'jual', 'beli', 'niaga', 'bisnis',

    // Adjective
    'hedon', 'hemat', 'untung', 'cuan',
  ],

  'agriculture' : [
    // Place
    'sawah', 'kebun', 'tanah', 'terasering', 'petak',
    'gunung', 'bukit',

    // Product
    'sembako', 'rempah', 'buah', 'sayur', 'daun',
    'beras', 'gandum',

    // Tool
    'cangkul', 'sabit', 'arit', 'caping', 'traktor',

    // Subject
    'petani', 'tani', 'kerbau',

    // Verb
    'tanam', 'panen', 'bajak',

    // Adjective
    'segar', 'hijau',
  ],

  'finance' : [
    // noun
    'uang', 'duit', 'dana', 'pitih', 'reksadana', 'emas', 'tabungan', 'simpanan', 'profit',
    // verb
    'pinjam', 'kredit', 'kasbon', 'utang', 'bayar', 'investasi', 'nabung', 'simpan', 'gadai',
    // adjective
    'pemat', 'untung', 'kaya', 'tajir', 'sultan', 'miskin', 'bokek',
    // place
    'bank', 'pegadaian', 'rentenir', 'bankir',
  ],

  'media' : [
    // noun
    'berita', 'komedi', 'hiburan', 'film', 'sinema', 'musik', 'lagu', 'podcast', 'video', 'acara', 'layar',
    'koran', 'kabar', 'tv', 'tayangan', 'channel',
    'kreasi', 'inovasi', 'karya'

    // verb
    'baca', 'dengar', 'simak', 'pantau', 'tulis', 'cuit', 'bicara', 'ngobrol', 'tonton', 'tayang', 'mengudara', 'percaya', 'ketawa', 'ngakak', 'bahagia', 'pikir', 'nalar', 'logika',
    // adjective
    'terkini', 'hangat', 'viral', 'kreatif', 'inovatif', 'tren', 'lucu', 'bacot', 'bawel',
    // subject
    'artis', 'selebritis', 'aktor', 'aktris', 'musisi', 'kreator', 'produser', 'sineas', 'penonton'
  ],

  'social' : [
    // noun
    'donasi', 'zakat', 'amal',
    // verb
    'bantu', 'tolong', 'bagi', 'sumbang', 'gotongroyong', 'derma', 'sedekah',
    // adjective
    'baik', 'dermawan', 'bisa'
    // subject
    'donatur', 'donor',
  ],

  'health' : [
    // place
    'rumahsakit', 'puskesmas', 
    // noun
    'stetoskop', 'suntik', 'obat', 'resep', 'jasputih',
    // verb
    'berobat', 'konsul', 'konsultasi',
    // adjective
    'sehat', 'sembuh', 'rawat',
    // subject
    'dokter', 'bidan', 'perawat', 'suster', 'bruder', 'spesialis',
  ],

  'education' : [
    // place
    'kelas', 'sekolah', 'kursus', 'les', 'akademi'
    // noun
    'buku', 'pensil', 'pelatihan', 'skill',
    // verb
    'belajar', 'mengajar', 'ajar', 'bimbing',
    // adjective
    'privat', 'pintar', 'cerdas', 'jenius', 'jago', 'ahli', 'mampu'
    // subject
    'guru', 'pengajar', 'dosen', 'ustadz', 'pelajar', 'murid', 'siswa', 'mahasiswa', 'santri',
  ],

  'transportation' : [
    // place
    'jalan', 'aspal',
    // noun
    'mobil', 'motor', 'travel', 'van', 'sepeda', 'ojek', 'taksi',
    'kemudi', 'roda', 'setir', 'helm',
    // verb
    'bonceng', 'numpang', 'bareng', 'naik', 'pergi', 'berangkat',
    // adjective
    'sampai', 'cepat', 'kilat',
    // subject
    'kendara',
  ],
};

String getWordByCategory(String categoryName) {  
  String lowerCaseCategoryName = categoryName.toLowerCase();
  if (categoryMap.containsKey(lowerCaseCategoryName))
    return randomString(categoryMap[lowerCaseCategoryName]);
  else
    throw Exception(categoryName + ' not found in categoryMap!');
}