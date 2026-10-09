import React from 'react';
import {
  Search,
  MapPin,
  Sprout,
  Maximize2,
  DollarSign,
  CheckSquare,
  Square,
  RotateCcw,
  Sparkles
} from 'lucide-react';

export default function MarketplaceFilterSidebar({
  searchQuery,
  setSearchQuery,
  selectedLocation,
  setSelectedLocation,
  selectedCrop,
  setSelectedCrop,
  areaMin,
  setAreaMin,
  areaMax,
  setAreaMax,
  priceMax,
  setPriceMax,
  facilities,
  toggleFacility,
  availableCrops,
  locations,
  onResetFilters,
  hasActiveFilters
}) {
  return (
    <aside className="bg-white rounded-2xl border border-brand-border p-5 shadow-sm space-y-5 text-brand-dark">
      {/* Title */}
      <div>
        <h3 className="font-heading font-black text-base text-brand-dark tracking-tight">
          Tìm kiếm khu vực canh tác
        </h3>
        <p className="text-[11px] text-brand-muted mt-0.5">
          Khám phá và lọc các thửa đất VietGAP theo nhu cầu
        </p>
      </div>

      {/* 1. Search by keyword */}
      <div className="relative">
        <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-stone-400" />
        <input
          type="text"
          placeholder="Tìm theo tên vườn, địa điểm, loại cây..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="w-full pl-9 pr-3.5 py-2.5 text-xs bg-brand-cream/50 rounded-xl border border-brand-border focus:outline-none focus:ring-2 focus:ring-brand-green/20 focus:bg-white text-brand-dark placeholder-stone-400 transition-all font-medium"
        />
      </div>

      {/* 2. Location Selector */}
      <div className="space-y-1.5">
        <label className="text-xs font-bold text-brand-dark flex items-center gap-1.5">
          <MapPin className="w-3.5 h-3.5 text-brand-green" />
          <span>Địa điểm</span>
        </label>
        <select
          value={selectedLocation}
          onChange={(e) => setSelectedLocation(e.target.value)}
          className="w-full text-xs bg-brand-cream/40 border border-brand-border rounded-xl px-3 py-2.5 text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-green/20 font-medium cursor-pointer"
        >
          <option value="ALL">Tất cả khu vực</option>
          {locations.map((loc) => (
            <option key={loc.id} value={loc.id}>
              {loc.name} ({loc.province})
            </option>
          ))}
        </select>
      </div>

      {/* 3. Crop Selector */}
      <div className="space-y-1.5">
        <label className="text-xs font-bold text-brand-dark flex items-center gap-1.5">
          <Sprout className="w-3.5 h-3.5 text-brand-green" />
          <span>Loại cây trồng</span>
        </label>
        <select
          value={selectedCrop}
          onChange={(e) => setSelectedCrop(e.target.value)}
          className="w-full text-xs bg-brand-cream/40 border border-brand-border rounded-xl px-3 py-2.5 text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-green/20 font-medium cursor-pointer"
        >
          {availableCrops.map((crop, idx) => (
            <option key={idx} value={idx === 0 ? 'ALL' : crop}>
              {crop}
            </option>
          ))}
        </select>
      </div>

      {/* 4. Area Range (m²) */}
      <div className="space-y-1.5">
        <label className="text-xs font-bold text-brand-dark flex items-center gap-1.5">
          <Maximize2 className="w-3.5 h-3.5 text-brand-green" />
          <span>Diện tích</span>
        </label>
        <div className="grid grid-cols-2 gap-2">
          <div className="relative">
            <span className="text-[10px] text-stone-400 absolute left-2.5 top-1/2 -translate-y-1/2">Từ</span>
            <input
              type="number"
              placeholder="50 m²"
              value={areaMin}
              onChange={(e) => setAreaMin(e.target.value)}
              className="w-full pl-8 pr-2.5 py-2 text-xs bg-brand-cream/40 border border-brand-border rounded-xl focus:outline-none focus:ring-2 focus:ring-brand-green/20 font-medium"
            />
          </div>
          <div className="relative">
            <span className="text-[10px] text-stone-400 absolute left-2.5 top-1/2 -translate-y-1/2">Đến</span>
            <input
              type="number"
              placeholder="5.000 m²"
              value={areaMax}
              onChange={(e) => setAreaMax(e.target.value)}
              className="w-full pl-9 pr-2.5 py-2 text-xs bg-brand-cream/40 border border-brand-border rounded-xl focus:outline-none focus:ring-2 focus:ring-brand-green/20 font-medium"
            />
          </div>
        </div>
      </div>

      {/* 5. Rental Price Slider */}
      <div className="space-y-2 pt-1">
        <div className="flex items-center justify-between text-xs">
          <label className="font-bold text-brand-dark flex items-center gap-1.5">
            <DollarSign className="w-3.5 h-3.5 text-brand-green" />
            <span>Giá thuê (VNĐ/tháng)</span>
          </label>
          <span className="font-bold text-brand-green text-[11px]">
            {priceMax >= 10000000 ? '10.000.000+ đ' : `${Number(priceMax).toLocaleString('vi-VN')} đ`}
          </span>
        </div>
        <input
          type="range"
          min="500000"
          max="10000000"
          step="200000"
          value={priceMax}
          onChange={(e) => setPriceMax(Number(e.target.value))}
          className="w-full h-1.5 bg-stone-200 rounded-lg appearance-none cursor-pointer accent-[#294C38]"
        />
        <div className="flex justify-between text-[10px] text-stone-400 font-medium">
          <span>0 đ</span>
          <span>10.000.000+ đ</span>
        </div>
      </div>

      {/* 6. Facilities Checkboxes */}
      <div className="space-y-2.5 pt-1 border-t border-brand-border/60">
        <label className="text-xs font-bold text-brand-dark block">
          Tiện ích
        </label>
        <div className="space-y-2 text-xs">
          {[
            { id: 'irrigation', label: 'Có hệ thống tưới', icon: '💧' },
            { id: 'iot', label: 'Có cảm biến IoT', icon: '📡' },
            { id: 'waterSource', label: 'Gần nguồn nước', icon: '🌊' },
            { id: 'organicSoil', label: 'Đất hữu cơ', icon: '🍃' },
            { id: 'techSupport', label: 'Hỗ trợ kỹ thuật', icon: '🛠' }
          ].map((item) => {
            const isChecked = Boolean(facilities[item.id]);
            return (
              <label
                key={item.id}
                onClick={() => toggleFacility(item.id)}
                className="flex items-center gap-2 cursor-pointer select-none text-stone-700 hover:text-brand-dark transition-colors"
              >
                <span className="text-brand-green">
                  {isChecked ? (
                    <CheckSquare className="w-4 h-4 fill-emerald-600 text-white" />
                  ) : (
                    <Square className="w-4 h-4 text-stone-300" />
                  )}
                </span>
                <span className="text-sm mr-0.5">{item.icon}</span>
                <span className="text-xs font-medium">{item.label}</span>
              </label>
            );
          })}
        </div>
      </div>

      {/* 7. Action Button */}
      <div className="pt-2 space-y-2">
        <button
          type="button"
          className="w-full py-2.5 px-4 rounded-xl bg-[#294C38] hover:bg-[#203c2c] text-white text-xs font-bold tracking-wide uppercase flex items-center justify-center gap-2 shadow-sm transition-all active:scale-[0.98] cursor-pointer"
        >
          <Search className="w-3.5 h-3.5" />
          <span>Tìm kiếm</span>
        </button>

        {hasActiveFilters && (
          <button
            type="button"
            onClick={onResetFilters}
            className="w-full py-2 text-center text-xs text-rose-600 hover:underline font-bold flex items-center justify-center gap-1.5 cursor-pointer"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            <span>Xóa tất cả bộ lọc</span>
          </button>
        )}
      </div>
    </aside>
  );
}
