/**
 * MARKETPLACE GIS & PLOTS DEMO DATA MODULE
 * 
 * Contains identified demo GeoJSON geometry and plot attributes for Farmely Marketplace,
 * featuring Trang trại Happy Valley (Huyện Quế Phong, Nghệ An) matching the GIS reference design.
 * 
 * Status types:
 * - AVAILABLE   : 'Đang trống' (Xanh lá - #10B981)
 * - RENTED      : 'Đã thuê'    (Cam/Vàng  - #F59E0B)
 * - MAINTENANCE : 'Bảo trì'    (Xám       - #64748B)
 * - UPCOMING    : 'Sắp có'     (Xanh dương- #3B82F6)
 */

export const GIS_STATUSES = {
  AVAILABLE: {
    key: 'AVAILABLE',
    label: 'Đang trống',
    badgeClass: 'bg-emerald-100 text-emerald-800 border-emerald-300',
    color: '#10B981',
    fillColor: 'rgba(16, 185, 129, 0.45)',
    hoverFillColor: 'rgba(16, 185, 129, 0.70)',
    strokeColor: '#34D399',
    iconText: '🌱'
  },
  RENTED: {
    key: 'RENTED',
    label: 'Đã thuê',
    badgeClass: 'bg-amber-100 text-amber-900 border-amber-300',
    color: '#F59E0B',
    fillColor: 'rgba(245, 158, 11, 0.50)',
    hoverFillColor: 'rgba(245, 158, 11, 0.75)',
    strokeColor: '#FBBF24',
    iconText: '🌾'
  },
  MAINTENANCE: {
    key: 'MAINTENANCE',
    label: 'Bảo trì',
    badgeClass: 'bg-slate-100 text-slate-800 border-slate-300',
    color: '#64748B',
    fillColor: 'rgba(100, 116, 139, 0.50)',
    hoverFillColor: 'rgba(100, 116, 139, 0.75)',
    strokeColor: '#94A3B8',
    iconText: '🔧'
  },
  UPCOMING: {
    key: 'UPCOMING',
    label: 'Sắp có',
    badgeClass: 'bg-sky-100 text-sky-800 border-sky-300',
    color: '#3B82F6',
    fillColor: 'rgba(59, 130, 246, 0.50)',
    hoverFillColor: 'rgba(59, 130, 246, 0.75)',
    strokeColor: '#60A5FA',
    iconText: '⏳'
  }
};

export const FARMS_GIS_DATA = [
  {
    id: 'FARM-HV-01',
    name: 'Trang trại Happy Valley',
    location: 'Huyện Quế Phong, Nghệ An',
    province: 'Nghệ An',
    totalPlots: 16,
    activePlots: 9,
    aerialImage: '/images/happy_valley_aerial.jpg',
    mapBounds: { width: 1000, height: 620 },
    center: [500, 310]
  },
  {
    id: 'FARM-CC-01',
    name: 'Nông Trại Củ Chi Eco Farm',
    location: 'Xã An Phú, Củ Chi, TP. Hồ Chí Minh',
    province: 'TP. Hồ Chí Minh',
    totalPlots: 18,
    activePlots: 12,
    aerialImage: '/images/Mucangchai3.jpg',
    mapBounds: { width: 1000, height: 620 },
    center: [500, 310]
  },
  {
    id: 'FARM-MC-02',
    name: 'Khu Nông Nghiệp Đô Thị Long Phước',
    location: 'Phường Long Phước, TP. Thủ Đức',
    province: 'TP. Hồ Chí Minh',
    totalPlots: 12,
    activePlots: 8,
    aerialImage: '/images/moc-chau-2811.jpg',
    mapBounds: { width: 1000, height: 620 },
    center: [500, 310]
  }
];

export const MARKETPLACE_PLOTS_GIS = [
  {
    id: 'PLT-HV-01',
    code: 'Plot P-01',
    label: 'P-01',
    name: 'Thửa Ruộng Bậc Thang P-01',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 100,
    areaFormatted: '100 m²',
    rentalPrice: 1200000,
    rentalPriceFormatted: '1.200.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Rau xanh (Xà lách)',
    imageUrl: 'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80',
      '/images/moc-chau-2811.jpg'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông Nam',
      ph: '6.2 – 6.8',
      temp: '18 – 28°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Xà lách', icon: '🥬', type: 'leafy' },
      { name: 'Cải bó xôi', icon: '🥦', type: 'leafy' },
      { name: 'Rau muống', icon: '🌿', type: 'leafy' },
      { name: 'Húng quế', icon: '🍃', type: 'herb' }
    ],
    polygon: [[340, 235], [410, 245], [425, 290], [365, 305], [325, 270]],
    centroid: [373, 270]
  },
  {
    id: 'PLT-HV-02',
    code: 'Plot P-02',
    label: 'P-02',
    name: 'Thửa Đất Bờ Suối P-02',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 150,
    areaFormatted: '150 m²',
    rentalPrice: 1800000,
    rentalPriceFormatted: '1.800.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'RENTED',
    crop: 'Cà chua',
    imageUrl: 'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80',
      '/images/happy_valley_aerial.jpg'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Nam',
      ph: '6.5 – 7.0',
      temp: '20 – 30°C',
      season: 'Xuân – Thu'
    },
    compatibleCrops: [
      { name: 'Cà chua bi', icon: '🍅', type: 'fruit' },
      { name: 'Dưa leo', icon: '🥒', type: 'fruit' },
      { name: 'Ớt ngọt', icon: '🌶', type: 'fruit' }
    ],
    polygon: [[350, 160], [425, 175], [415, 230], [340, 225], [315, 185]],
    centroid: [370, 195]
  },
  {
    id: 'PLT-HV-03',
    code: 'Plot P-03',
    label: 'P-03',
    name: 'Thửa Đất Thung Lũng P-03',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 120,
    areaFormatted: '120 m²',
    rentalPrice: 1400000,
    rentalPriceFormatted: '1.400.000 đ/tháng',
    unitPrice: '11.600 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Rau cải',
    imageUrl: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: false
    },
    specs: {
      orientation: 'Đông',
      ph: '6.0 – 6.5',
      temp: '17 – 26°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Cải ngọt', icon: '🥬', type: 'leafy' },
      { name: 'Cải thìa', icon: '🥦', type: 'leafy' },
      { name: 'Xà lách', icon: '🥗', type: 'leafy' }
    ],
    polygon: [[430, 175], [495, 200], [505, 255], [430, 265], [425, 225]],
    centroid: [460, 225]
  },
  {
    id: 'PLT-HV-04',
    code: 'Plot P-04',
    label: 'P-04',
    name: 'Thửa Đất Quả Mọng P-04',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 200,
    areaFormatted: '200 m²',
    rentalPrice: 2500000,
    rentalPriceFormatted: '2.500.000 đ/tháng',
    unitPrice: '12.500 đ/m²/tháng',
    status: 'UPCOMING',
    crop: 'Dâu tây',
    imageUrl: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80',
      '/images/Mucangchai3.jpg'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông Nam',
      ph: '5.8 – 6.5',
      temp: '16 – 24°C',
      season: 'Thu – Đông'
    },
    compatibleCrops: [
      { name: 'Dâu tây F1', icon: '🍓', type: 'fruit' },
      { name: 'Cà chua cherry', icon: '🍅', type: 'fruit' }
    ],
    polygon: [[500, 160], [575, 185], [565, 245], [505, 240], [495, 195]],
    centroid: [530, 205]
  },
  {
    id: 'PLT-HV-05',
    code: 'Plot P-05',
    label: 'P-05',
    name: 'Thửa Đất Nắng Sớm P-05',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 90,
    areaFormatted: '90 m²',
    rentalPrice: 1100000,
    rentalPriceFormatted: '1.100.000 đ/tháng',
    unitPrice: '12.200 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Rau dền đỏ',
    imageUrl: 'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: false
    },
    specs: {
      orientation: 'Đông',
      ph: '6.2 – 6.8',
      temp: '22 – 32°C',
      season: 'Hè – Thu'
    },
    compatibleCrops: [
      { name: 'Rau dền', icon: '🥬', type: 'leafy' },
      { name: 'Mồng tơi', icon: '🌿', type: 'leafy' }
    ],
    polygon: [[300, 275], [360, 300], [350, 355], [285, 340], [280, 300]],
    centroid: [320, 315]
  },
  {
    id: 'PLT-HV-06',
    code: 'Plot P-06',
    label: 'P-06',
    name: 'Thửa Đất Trung Tâm P-06',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 110,
    areaFormatted: '110 m²',
    rentalPrice: 1350000,
    rentalPriceFormatted: '1.350.000 đ/tháng',
    unitPrice: '12.200 đ/m²/tháng',
    status: 'RENTED',
    crop: 'Đậu cove',
    imageUrl: 'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Nam',
      ph: '6.5 – 7.0',
      temp: '18 – 28°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Đậu cove', icon: '🫘', type: 'pod' },
      { name: 'Đậu đũa', icon: '🌱', type: 'pod' }
    ],
    polygon: [[455, 200], [510, 210], [505, 260], [450, 250]],
    centroid: [480, 230]
  },
  {
    id: 'PLT-HV-07',
    code: 'Plot P-07',
    label: 'P-07',
    name: 'Thửa Đất Cây Thảo Mộc P-07',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 95,
    areaFormatted: '95 m²',
    rentalPrice: 1150000,
    rentalPriceFormatted: '1.150.000 đ/tháng',
    unitPrice: '12.100 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Húng quế & Bạc hà',
    imageUrl: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: false,
      waterSource: true,
      organicSoil: true,
      techSupport: false
    },
    specs: {
      orientation: 'Tây Nam',
      ph: '6.0 – 6.8',
      temp: '20 – 30°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Bạc hà', icon: '🍃', type: 'herb' },
      { name: 'Húng quế', icon: '🌿', type: 'herb' }
    ],
    polygon: [[425, 270], [460, 275], [455, 330], [410, 340], [370, 310]],
    centroid: [420, 305]
  },
  {
    id: 'PLT-HV-08',
    code: 'Plot P-08',
    label: 'P-08',
    name: 'Thửa Đất Nghỉ Phục Hồi P-08',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 160,
    areaFormatted: '160 m²',
    rentalPrice: 1900000,
    rentalPriceFormatted: '1.900.000 đ/tháng',
    unitPrice: '11.800 đ/m²/tháng',
    status: 'MAINTENANCE',
    crop: 'Đang luân canh cải tạo',
    imageUrl: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông',
      ph: '6.4 – 6.9',
      temp: '19 – 29°C',
      season: 'Đang ủ vi sinh 4 ngày'
    },
    compatibleCrops: [
      { name: 'Đậu xanh cải tạo đất', icon: '🌱', type: 'cover' }
    ],
    polygon: [[455, 285], [500, 290], [505, 345], [455, 345], [445, 315]],
    centroid: [475, 320]
  },
  {
    id: 'PLT-HV-09',
    code: 'Plot P-09',
    label: 'P-09',
    name: 'Thửa Đất Bờ Đông P-09',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 140,
    areaFormatted: '140 m²',
    rentalPrice: 1650000,
    rentalPriceFormatted: '1.650.000 đ/tháng',
    unitPrice: '11.700 đ/m²/tháng',
    status: 'RENTED',
    crop: 'Cà rốt hữu cơ',
    imageUrl: 'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông Nam',
      ph: '6.2 – 6.7',
      temp: '18 – 27°C',
      season: 'Thu – Đông'
    },
    compatibleCrops: [
      { name: 'Cà rốt', icon: '🥕', type: 'root' },
      { name: 'Củ dền', icon: '🍠', type: 'root' }
    ],
    polygon: [[365, 315], [435, 325], [425, 380], [355, 375]],
    centroid: [395, 350]
  },
  {
    id: 'PLT-HV-10',
    code: 'Plot P-10',
    label: 'P-10',
    name: 'Thửa Đất Vườn Rau Xanh P-10',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 125,
    areaFormatted: '125 m²',
    rentalPrice: 1500000,
    rentalPriceFormatted: '1.500.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Bắp cải tí hon',
    imageUrl: 'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông',
      ph: '6.3 – 6.8',
      temp: '17 – 25°C',
      season: 'Mát mẻ quanh năm'
    },
    compatibleCrops: [
      { name: 'Bắp cải tí hon', icon: '🥬', type: 'leafy' },
      { name: 'Xúp lơ baby', icon: '🥦', type: 'flower' }
    ],
    polygon: [[510, 255], [560, 270], [550, 325], [500, 320]],
    centroid: [530, 290]
  },
  {
    id: 'PLT-HV-11',
    code: 'Plot P-11',
    label: 'P-11',
    name: 'Thửa Đất Sườn Đồi P-11',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 175,
    areaFormatted: '175 m²',
    rentalPrice: 2100000,
    rentalPriceFormatted: '2.100.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'RENTED',
    crop: 'Ớt chuông Sweet Pepper',
    imageUrl: 'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Nam',
      ph: '6.2 – 6.6',
      temp: '20 – 30°C',
      season: 'Xuân – Hè'
    },
    compatibleCrops: [
      { name: 'Ớt chuông', icon: '🫑', type: 'fruit' },
      { name: 'Cà tím', icon: '🍆', type: 'fruit' }
    ],
    polygon: [[530, 210], [600, 240], [610, 300], [545, 290]],
    centroid: [570, 260]
  },
  {
    id: 'PLT-HV-12',
    code: 'Plot P-12',
    label: 'P-12',
    name: 'Thửa Đất Rãnh Tưới Tự Động P-12',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 130,
    areaFormatted: '130 m²',
    rentalPrice: 1550000,
    rentalPriceFormatted: '1.550.000 đ/tháng',
    unitPrice: '11.900 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Xà lách Romaine VietGAP',
    imageUrl: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông Nam',
      ph: '6.3 – 6.8',
      temp: '18 – 28°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Xà lách Romaine', icon: '🥬', type: 'leafy' },
      { name: 'Rau cần tây', icon: '🌿', type: 'leafy' }
    ],
    polygon: [[430, 355], [485, 360], [490, 410], [425, 415]],
    centroid: [460, 385]
  },
  {
    id: 'PLT-HV-13',
    code: 'Plot P-13',
    label: 'P-13',
    name: 'Thửa Đất Mở Rộng P-13',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 145,
    areaFormatted: '145 m²',
    rentalPrice: 1750000,
    rentalPriceFormatted: '1.750.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Cải cầu vồng',
    imageUrl: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: false
    },
    specs: {
      orientation: 'Đông',
      ph: '6.1 – 6.7',
      temp: '19 – 29°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Cải cầu vồng', icon: '🥬', type: 'leafy' },
      { name: 'Bó xôi', icon: '🥦', type: 'leafy' }
    ],
    polygon: [[575, 310], [630, 330], [615, 390], [560, 365]],
    centroid: [595, 350]
  },
  {
    id: 'PLT-HV-14',
    code: 'Plot P-14',
    label: 'P-14',
    name: 'Thửa Đất Đất Đỏ Ba Zan P-14',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 115,
    areaFormatted: '115 m²',
    rentalPrice: 1380000,
    rentalPriceFormatted: '1.380.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'RENTED',
    crop: 'Bí ngòi xanh',
    imageUrl: 'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Nam',
      ph: '6.5 – 7.1',
      temp: '22 – 32°C',
      season: 'Hè – Thu'
    },
    compatibleCrops: [
      { name: 'Bí ngòi', icon: '🥒', type: 'fruit' },
      { name: 'Dưa hấu tí hon', icon: '🍉', type: 'fruit' }
    ],
    polygon: [[500, 330], [560, 340], [555, 400], [505, 395]],
    centroid: [530, 365]
  },
  {
    id: 'PLT-HV-15',
    code: 'Plot P-15',
    label: 'P-15',
    name: 'Thửa Đất Bờ Kênh Xanh P-15',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 105,
    areaFormatted: '105 m²',
    rentalPrice: 1260000,
    rentalPriceFormatted: '1.260.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Cải bẹ dưa muối',
    imageUrl: 'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1592417817098-8f3d6910985c?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: false
    },
    specs: {
      orientation: 'Đông',
      ph: '6.2 – 6.6',
      temp: '19 – 28°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Cải bẹ xanh', icon: '🥬', type: 'leafy' },
      { name: 'Rau dền', icon: '🌿', type: 'leafy' }
    ],
    polygon: [[425, 395], [495, 410], [490, 455], [420, 445]],
    centroid: [455, 425]
  },
  {
    id: 'PLT-HV-16',
    code: 'Plot P-16',
    label: 'P-16',
    name: 'Thửa Đất Nắng Ấm Hạ Vực P-16',
    farmId: 'FARM-HV-01',
    farmName: 'Trang trại Happy Valley',
    farmLocation: 'Huyện Quế Phong, Nghệ An',
    area: 135,
    areaFormatted: '135 m²',
    rentalPrice: 1620000,
    rentalPriceFormatted: '1.620.000 đ/tháng',
    unitPrice: '12.000 đ/m²/tháng',
    status: 'AVAILABLE',
    crop: 'Cà chua mọng mật',
    imageUrl: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1000&q=80'
    ],
    facilities: {
      irrigation: true,
      iot: true,
      waterSource: true,
      organicSoil: true,
      techSupport: true
    },
    specs: {
      orientation: 'Đông Nam',
      ph: '6.4 – 6.9',
      temp: '18 – 28°C',
      season: 'Quanh năm'
    },
    compatibleCrops: [
      { name: 'Cà chua mật', icon: '🍅', type: 'fruit' },
      { name: 'Dưa leo bao tử', icon: '🥒', type: 'fruit' }
    ],
    polygon: [[540, 380], [595, 400], [585, 460], [530, 440]],
    centroid: [560, 420]
  }
];

export const ALL_CROPS_FILTER_OPTIONS = [
  'Tất cả loại cây',
  'Rau xanh (Xà lách)',
  'Cà chua',
  'Rau cải',
  'Dâu tây',
  'Ớt chuông',
  'Rau dền',
  'Thảo mộc'
];
