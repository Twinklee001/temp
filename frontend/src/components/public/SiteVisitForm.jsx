import React, { useState, useEffect } from 'react';
import { Calendar, PhoneCall, CheckCircle2, MapPin } from 'lucide-react';
import { useAuthStore } from '../../stores/authStore';
import { plotsData } from '../../data/plots';
import { landsData } from '../../data/lands';
import Button from '../common/Button';
import Input from '../common/Input';
import Select from '../common/Select';
import Modal from '../common/Modal';

export default function SiteVisitForm({ preselectedPlotId, onSuccess }) {
  const { user, isAuthenticated } = useAuthStore();

  // Form State
  const [visitorName, setVisitorName] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');
  const [emailAddress, setEmailAddress] = useState('');
  const [visitDate, setVisitDate] = useState('');
  const [selectedFarm, setSelectedFarm] = useState('');
  const [notes, setNotes] = useState('');

  // Validation State
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [showSuccessModal, setShowSuccessModal] = useState(false);

  // Prepopulate if authenticated
  useEffect(() => {
    if (isAuthenticated && user) {
      if (user.fullName) setVisitorName(user.fullName);
      if (user.phone) setPhoneNumber(user.phone);
      if (user.email) setEmailAddress(user.email);
    }
  }, [isAuthenticated, user]);

  // Find preselected plot if provided
  const selectedPlotObj = preselectedPlotId
    ? plotsData.find((p) => p.id === preselectedPlotId)
    : null;

  // Set default min date (tomorrow)
  const tomorrow = new Date();
  tomorrow.setDate(tomorrow.getDate() + 1);
  const minDateStr = tomorrow.toISOString().split('T')[0];

  // Max date (30 days ahead)
  const maxDate = new Date();
  maxDate.setDate(maxDate.getDate() + 30);
  const maxDateStr = maxDate.toISOString().split('T')[0];

  const validate = () => {
    const errs = {};
    if (!visitorName.trim()) {
      errs.name = 'Vui lòng nhập họ và tên của bạn.';
    } else if (visitorName.trim().length < 2 || visitorName.trim().length > 100) {
      errs.name = 'Họ tên phải từ 2 đến 100 ký tự.';
    }

    const phoneRegex = /^0[0-9]{9}$/;
    if (!phoneNumber.trim()) {
      errs.phone = 'Vui lòng nhập số điện thoại để chúng tôi liên hệ xác nhận.';
    } else if (!phoneRegex.test(phoneNumber.trim())) {
      errs.phone = 'Số điện thoại phải gồm 10 chữ số và bắt đầu bằng số 0.';
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (emailAddress.trim() && !emailRegex.test(emailAddress.trim())) {
      errs.email = 'Email không hợp lệ (ví dụ: ten@domain.com).';
    }

    if (notes.length > 500) {
      errs.notes = 'Ghi chú không được vượt quá 500 ký tự.';
    }

    setErrors(errs);
    return Object.keys(errs).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!validate()) return;

    setIsSubmitting(true);
    // Simulate API request
    setTimeout(() => {
      setIsSubmitting(false);
      setShowSuccessModal(true);
      if (onSuccess) onSuccess();
    }, 600);
  };

  return (
    <div className="bg-white rounded-2xl p-6 sm:p-8 border border-brand-border shadow-sm">
      <div className="mb-6">
        <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-brand-cream text-brand-green border border-brand-border mb-2">
          <PhoneCall className="w-3.5 h-3.5" />
          <span>Hỗ Trợ Đặt Lịch & Tư Vấn</span>
        </div>
        <h2 className="font-heading text-2xl font-bold text-brand-dark">
          Đăng Ký Tham Quan Nông Trại
        </h2>
        <p className="text-xs sm:text-sm text-brand-muted mt-1 leading-relaxed">
          Bạn chỉ cần để lại thông tin liên hệ. Chuyên viên Farmely sẽ chủ động gọi điện lại để tư vấn, xác nhận lịch hẹn và hỗ trợ đón tiếp bạn chu đáo nhất.
        </p>
      </div>

      <form onSubmit={handleSubmit} className="space-y-4">
        {/* Preselected Plot Badge (if coming from a specific plot page) */}
        {selectedPlotObj && (
          <div className="p-3.5 rounded-xl bg-brand-cream/70 border border-brand-border flex items-center gap-2.5 text-xs text-brand-dark">
            <MapPin className="w-4 h-4 text-brand-green shrink-0" />
            <div>
              <span>Thửa đất bạn đang quan tâm: </span>
              <strong className="text-brand-green font-bold">{selectedPlotObj.name}</strong>
              <span className="text-stone-500"> ({selectedPlotObj.landName})</span>
            </div>
          </div>
        )}

        {/* Contact Info: Name & Phone */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <Input
            label="Họ và tên người liên hệ"
            required
            placeholder="Ví dụ: Nguyễn Thu Hà"
            value={visitorName}
            onChange={(e) => setVisitorName(e.target.value)}
            error={errors.name}
          />

          <Input
            label="Số điện thoại liên hệ"
            required
            placeholder="Ví dụ: 0901234567"
            value={phoneNumber}
            onChange={(e) => setPhoneNumber(e.target.value)}
            error={errors.phone}
          />
        </div>

        {/* Optional Email & Preferred Date */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <Input
            label="Địa chỉ email (Tùy chọn)"
            type="email"
            placeholder="email@example.com"
            value={emailAddress}
            onChange={(e) => setEmailAddress(e.target.value)}
            error={errors.email}
          />

          <div>
            <label className="block text-xs font-bold text-brand-dark uppercase tracking-wider mb-1.5">
              Ngày dự kiến tham quan (Tùy chọn)
            </label>
            <input
              type="date"
              min={minDateStr}
              max={maxDateStr}
              value={visitDate}
              onChange={(e) => setVisitDate(e.target.value)}
              className="w-full rounded-xl border border-brand-border bg-white px-3.5 py-2.5 text-sm text-brand-dark transition-all focus:outline-none focus:ring-2 focus:ring-brand-green/20"
            />
            <p className="mt-1 text-[11px] text-brand-muted">Hoặc để trống, nhân viên sẽ hẹn ngày phù hợp khi gọi lại</p>
          </div>
        </div>

        {/* Farm of Interest (only if not preselected from a specific plot) */}
        {!selectedPlotObj && (
          <Select
            label="Khu vực nông trại quan tâm (Tùy chọn)"
            value={selectedFarm}
            onChange={(e) => setSelectedFarm(e.target.value)}
            options={[
              { value: '', label: '-- Chọn khu vực nông trại (hoặc để nhân viên tư vấn) --' },
              ...landsData.map((l) => ({
                value: l.name,
                label: `${l.name} (${l.location})`
              }))
            ]}
          />
        )}

        {/* Notes */}
        <div>
          <label className="block text-xs font-bold text-brand-dark uppercase tracking-wider mb-1.5">
            Ghi chú / Yêu cầu tư vấn (Tùy chọn)
          </label>
          <textarea
            rows={3}
            value={notes}
            onChange={(e) => setNotes(e.target.value)}
            placeholder="Ví dụ: Đi cùng gia đình 3 người, muốn xem hệ thống tưới nước tự động, tiện nhận cuộc gọi sau 17h..."
            className="w-full rounded-xl border border-brand-border bg-white px-3.5 py-2.5 text-sm text-brand-dark transition-all focus:outline-none focus:ring-2 focus:ring-brand-green/20"
          />
          {errors.notes && <p className="mt-1 text-xs text-rose-600 font-medium">{errors.notes}</p>}
        </div>

        <div className="pt-2">
          <Button
            type="submit"
            variant="primary"
            size="lg"
            className="w-full uppercase tracking-wider font-extrabold"
            loading={isSubmitting}
          >
            GỬI THÔNG TIN ĐẶT LỊCH THAM QUAN
          </Button>
          <p className="text-center text-[11px] text-brand-muted mt-2">
            Nhân viên Farmely sẽ liên hệ lại với bạn trong vòng 2 giờ làm việc để xác nhận.
          </p>
        </div>
      </form>

      {/* Success Modal */}
      <Modal
        isOpen={showSuccessModal}
        onClose={() => setShowSuccessModal(false)}
        title="Gửi Yêu Cầu Thành Công!"
      >
        <div className="text-center py-4 space-y-4">
          <div className="w-16 h-16 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto">
            <CheckCircle2 className="w-10 h-10" />
          </div>
          <div>
            <h4 className="font-heading text-lg font-bold text-brand-dark">
              Đã Nhận Thông Tin Đặt Lịch!
            </h4>
            <p className="text-sm text-stone-600 mt-2">
              Chuyên viên Farmely sẽ gọi điện lại cho bạn qua số điện thoại <strong>{phoneNumber}</strong> trong vòng <strong>2 giờ</strong> làm việc để tư vấn và chốt lịch tham quan cụ thể.
            </p>
          </div>
          <div className="p-3.5 rounded-xl bg-brand-cream text-left text-xs space-y-1.5 border border-brand-border">
            <p><strong>Khách hàng:</strong> {visitorName}</p>
            <p><strong>Số điện thoại:</strong> {phoneNumber}</p>
            {emailAddress && <p><strong>Email:</strong> {emailAddress}</p>}
            {visitDate && <p><strong>Ngày dự kiến:</strong> {visitDate}</p>}
            {selectedPlotObj && <p><strong>Thửa đất quan tâm:</strong> {selectedPlotObj.name} ({selectedPlotObj.landName})</p>}
            {selectedFarm && !selectedPlotObj && <p><strong>Khu vực quan tâm:</strong> {selectedFarm}</p>}
            {notes && <p><strong>Ghi chú:</strong> {notes}</p>}
          </div>
          <Button
            variant="primary"
            className="w-full"
            onClick={() => setShowSuccessModal(false)}
          >
            ĐÃ HIỂU VÀ ĐÓNG
          </Button>
        </div>
      </Modal>
    </div>
  );
}
