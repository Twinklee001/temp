-- ============================================================
-- SMART AGRIRENT PLATFORM - SEED DATA TOÀN DIỆN
-- Dựa trên tài liệu: QUY TRÌNH KỸ THUẬT CANH TÁC 10 LOẠI RAU AN TOÀN TỪ A TỚI Z
-- Chuẩn hóa theo Tiêu chuẩn VietGAP (TCVN 11892-1:2017) & Thông tư 25/2024/TT-BNNPTNT
-- Tương thích 100% với smart_agrirent_postgresql_v2.sql
-- ============================================================

SET client_encoding = 'UTF8';

-- ============================================================
-- 1. USERS & ROLES
-- ============================================================

-- Roles đã được insert trong DDL (CUSTOMER: 1, EXPERT: 2, FIELD_WORKER: 3, ADMIN: 4)

INSERT INTO users (user_id, role_id, email, password_hash, full_name, phone_number, address, status, created_at) VALUES
    -- ADMIN
    (1, 4, 'admin@farmely.vn', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'Nguyễn Quản Trị', '0901234567', 'Tòa nhà Farmely, Q.1, TP. Hồ Chí Minh', 'ACTIVE', NOW() - INTERVAL '60 days'),
    -- EXPERTS
    (2, 2, 'expert.thao@farmely.vn', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'ThS. Trần Phương Thảo', '0912345678', 'Viện Khoa học Nông nghiệp, TP. Hồ Chí Minh', 'ACTIVE', NOW() - INTERVAL '60 days'),
    (3, 2, 'expert.duc@farmely.vn', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'TS. Lê Hoàng Đức', '0913456789', 'Khoa Nông học, Đại học Nông Lâm TP.HCM', 'ACTIVE', NOW() - INTERVAL '60 days'),
    -- FIELD WORKERS
    (4, 3, 'worker.nam@farmely.vn', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'Nguyễn Văn Nam', '0922334455', 'Ấp Chợ Cũ, Xã An Nhơn Tây, Củ Chi, TP. HCM', 'ACTIVE', NOW() - INTERVAL '50 days'),
    (5, 3, 'worker.hoa@farmely.vn', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'Lê Thị Hoa', '0933445566', 'Khu Nông nghiệp Công nghệ cao, Đức Hòa, Long An', 'ACTIVE', NOW() - INTERVAL '50 days'),
    -- CUSTOMERS
    (6, 1, 'customer.an@gmail.com', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'Phạm Hoài An', '0988776655', 'Thảo Điền, TP. Thủ Đức, TP. Hồ Chí Minh', 'ACTIVE', NOW() - INTERVAL '40 days'),
    (7, 1, 'customer.minh@gmail.com', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'Đặng Nhật Minh', '0977889900', 'Vinhomes Central Park, Q. Bình Thạnh, TP. Hồ Chí Minh', 'ACTIVE', NOW() - INTERVAL '40 days'),
    (8, 1, 'customer.lan@gmail.com', '$2a$12$e8bQ2wF5XQ3q4k1b2c3d4eZf6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'Vũ Hoàng Lan', '0966554433', 'Khu đô thị Sala, TP. Thủ Đức, TP. Hồ Chí Minh', 'ACTIVE', NOW() - INTERVAL '90 days')
ON CONFLICT (user_id) DO NOTHING;

SELECT setval('users_user_id_seq', (SELECT COALESCE(MAX(user_id), 1) FROM users));

-- ============================================================
-- 2. LANDS & PLOTS
-- ============================================================

INSERT INTO lands (land_id, land_name, address, created_at) VALUES
    (1, 'Nông trại Thực nghiệm Farmely Củ Chi', 'Đường An Nhơn Tây, Xã An Nhơn Tây, Huyện Củ Chi, TP. Hồ Chí Minh', NOW() - INTERVAL '60 days'),
    (2, 'Khu Nông nghiệp Sinh thái Farmely Long An', 'Đường Tỉnh 824, Xã Đức Hòa Thượng, Huyện Đức Hòa, Tỉnh Long An', NOW() - INTERVAL '60 days')
ON CONFLICT (land_id) DO NOTHING;

SELECT setval('lands_land_id_seq', (SELECT COALESCE(MAX(land_id), 1) FROM lands));

INSERT INTO plots (plot_id, land_id, plot_code, area, image_url, price_per_period, status, is_published, created_at) VALUES
    -- Khu A tại Củ Chi (Chuyên canh rau ăn lá, đất tơi xốp, hệ thống tưới phun sương tự động)
    (1, 1, 'CC-A01', 50.00, 'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', 1500000.00, 'AVAIL', TRUE, NOW() - INTERVAL '50 days'),
    (2, 1, 'CC-A02', 50.00, 'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', 1500000.00, 'RENT',  TRUE, NOW() - INTERVAL '50 days'),
    (3, 1, 'CC-A03', 75.00, 'https://images.unsplash.com/photo-1589923188900-85dae523342b?auto=format&fit=crop&w=800&q=80', 2200000.00, 'AVAIL', TRUE, NOW() - INTERVAL '50 days'),
    -- Khu B tại Củ Chi (Trang bị hệ thống cọc tre và giàn leo chữ A cao 2m cho rau ăn quả, dây leo)
    (4, 1, 'CC-B01', 60.00, 'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?auto=format&fit=crop&w=800&q=80', 2000000.00, 'RENT',  TRUE, NOW() - INTERVAL '50 days'),
    (5, 1, 'CC-B02', 60.00, 'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?auto=format&fit=crop&w=800&q=80', 2000000.00, 'AVAIL', TRUE, NOW() - INTERVAL '50 days'),
    (6, 1, 'CC-B03', 80.00, 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?auto=format&fit=crop&w=800&q=80', 2600000.00, 'MAINT', TRUE, NOW() - INTERVAL '50 days'),
    -- Khu C tại Long An (Đất phù sa bồi đắp màu mỡ, diện tích lớn, nhà lưới màng chắn côn trùng hiện đại)
    (7, 2, 'LA-C01', 100.00, 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=800&q=80', 3000000.00, 'RENT',  TRUE, NOW() - INTERVAL '50 days'),
    (8, 2, 'LA-C02', 100.00, 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=800&q=80', 3000000.00, 'AVAIL', TRUE, NOW() - INTERVAL '50 days')
ON CONFLICT (plot_id) DO NOTHING;

SELECT setval('plots_plot_id_seq', (SELECT COALESCE(MAX(plot_id), 1) FROM plots));

-- ============================================================
-- 3. CROPS & VARIETIES (10 LOẠI CÂY CHỦ LỰC TỪ TÀI LIỆU)
-- ============================================================

INSERT INTO crops (crop_id, crop_name, created_at) VALUES
    (1,  'Rau muống cạn',        NOW() - INTERVAL '60 days'),
    (2,  'Cải ngọt / Cải bẹ',    NOW() - INTERVAL '60 days'),
    (3,  'Xà lách xoăn',         NOW() - INTERVAL '60 days'),
    (4,  'Cà chua bi (Cherry)',  NOW() - INTERVAL '60 days'),
    (5,  'Dưa leo baby',         NOW() - INTERVAL '60 days'),
    (6,  'Đậu cô ve',            NOW() - INTERVAL '60 days'),
    (7,  'Mướp hương',           NOW() - INTERVAL '60 days'),
    (8,  'Rau mồng tơi',         NOW() - INTERVAL '60 days'),
    (9,  'Ớt cay / Ớt chỉ thiên',NOW() - INTERVAL '60 days'),
    (10, 'Rau dền (đỏ/cơm)',     NOW() - INTERVAL '60 days')
ON CONFLICT (crop_id) DO NOTHING;

SELECT setval('crops_crop_id_seq', (SELECT COALESCE(MAX(crop_id), 1) FROM crops));

-- Bảng thông số: Giống đề xuất, chu kỳ sinh trưởng (expected_duration) & thời gian nghỉ đất (buffer_time)
INSERT INTO varieties (variety_id, crop_id, variety_name, expected_duration, buffer_time, created_at) VALUES
    (1,  1,  'Rau muống lá tre F1',       30, 4, NOW() - INTERVAL '60 days'),
    (2,  2,  'Cải ngọt bông F1',          35, 4, NOW() - INTERVAL '60 days'),
    (3,  3,  'Xà lách Lollo Bionda F1',   45, 4, NOW() - INTERVAL '60 days'),
    (4,  4,  'Cà chua bi đỏ F1',          85, 7, NOW() - INTERVAL '60 days'),
    (5,  5,  'Dưa leo baby F1',           60, 5, NOW() - INTERVAL '60 days'),
    (6,  6,  'Đậu cô ve lùn siêu trái F1',55, 5, NOW() - INTERVAL '60 days'),
    (7,  7,  'Mướp hương cao sản F1',     70, 7, NOW() - INTERVAL '60 days'),
    (8,  8,  'Mồng tơi lá to F1',         35, 4, NOW() - INTERVAL '60 days'),
    (9,  9,  'Ớt chỉ thiên F1',           90, 7, NOW() - INTERVAL '60 days'),
    (10, 10, 'Rau dền đỏ F1',             30, 4, NOW() - INTERVAL '60 days')
ON CONFLICT (variety_id) DO NOTHING;

SELECT setval('varieties_variety_id_seq', (SELECT COALESCE(MAX(variety_id), 1) FROM varieties));

-- ============================================================
-- 4. PLOT VARIETY COMPATIBILITY (ĐỘ TƯƠNG THÍCH MẢNH ĐẤT VÀ CÂY TRỒNG)
-- ============================================================

INSERT INTO plot_variety_compatibility (plot_id, variety_id) VALUES
    -- Khu A (CC-A01, CC-A02, CC-A03): Đất luống bằng phẳng, tối ưu cho nhóm rau ăn lá (Rau muống, Cải ngọt, Xà lách, Mồng tơi, Rau dền)
    (1, 1), (1, 2), (1, 3), (1, 8), (1, 10),
    (2, 1), (2, 2), (2, 3), (2, 8), (2, 10),
    (3, 1), (3, 2), (3, 3), (3, 8), (3, 10),
    -- Khu B (CC-B01, CC-B02, CC-B03): Đất có giàn cắm cọc chữ A, tối ưu cho nhóm rau ăn quả, dây leo (Cà chua, Dưa leo, Đậu cô ve, Mướp hương, Ớt)
    (4, 4), (4, 5), (4, 6), (4, 7), (4, 9),
    (5, 4), (5, 5), (5, 6), (5, 7), (5, 9),
    (6, 4), (6, 5), (6, 6), (6, 7), (6, 9),
    -- Khu C (LA-C01, LA-C02): Đất phù sa nhà màng quy mô lớn, tương thích với tất cả 10 loại cây trồng
    (7, 1), (7, 2), (7, 3), (7, 4), (7, 5), (7, 6), (7, 7), (7, 8), (7, 9), (7, 10),
    (8, 1), (8, 2), (8, 3), (8, 4), (8, 5), (8, 6), (8, 7), (8, 8), (8, 9), (8, 10)
ON CONFLICT DO NOTHING;

-- ============================================================
-- 5. KNOWLEDGE DOCUMENTS (TÀI LIỆU KỸ THUẬT & QUY CHUẨN NÔNG NGHIỆP)
-- ============================================================

INSERT INTO knowledge_documents (document_id, kd_created_by, title, content, file_url, created_at) VALUES
    (1, 2, 'Tiêu chuẩn VietGAP TCVN 11892-1:2017 & Nguyên tắc Canh tác Rau An Toàn', 
     'Căn cứ pháp lý: Tiêu chuẩn Quốc gia TCVN 11892-1:2017 (Quyết định số 2802/QĐ-BKHCN).
1. Kiểm soát đất và giá thể: Đất phải được xới tơi xốp, rải vôi bột khử trùng và phơi ải tối thiểu 4 ngày giữa 2 chu kỳ vụ mùa.
2. Kiểm soát nước tưới: Nguồn nước đạt tiêu chuẩn nước mặt/ngầm an toàn, không chứa kim loại nặng và E.coli vượt ngưỡng.
3. Nguyên tắc bón phân: Ưu tiên 100% phân trùn quế hoai mục, phân hữu cơ vi sinh phối trộn Trichoderma. Phân bón lá sinh học (đạm cá, dịch chuối, Humic) phải ngưng tưới trước thu hoạch tối thiểu 5 ngày.
4. Nhật ký nông trại: Mọi tác vụ từ gieo hạt, bón phân, tưới nước đến xử lý sâu bệnh phải được ghi chép minh bạch theo thời gian thực.', 
     'https://farmely.vn/docs/vietgap-tcvn-11892-2017.pdf', NOW() - INTERVAL '45 days'),

    (2, 2, 'Danh mục Thuốc BVTV Sinh học An toàn & Thời gian cách ly (Thông tư 25/2024/TT-BNNPTNT)', 
     'Danh mục hoạt chất sinh học được phép sử dụng tại Farmely, đảm bảo thời gian cách ly (PHI) an toàn:
1. Bacillus thuringiensis (BT - Delfin WG, Thuricide HP): Trừ sâu tơ, sâu xanh, sâu khoang ăn lá. PHI: 2 - 3 ngày.
2. Azadirachtin (Dầu Neem sinh học): Xử lý bọ trĩ, rầy mềm, rệp muội, nhện đỏ. PHI: 2 - 3 ngày.
3. Matrine thảo mộc (Wotac 5EC): Đặc trị bọ nhảy sọc cong, sâu cuốn lá, bọ rùa 28 chấm. PHI: 3 ngày.
4. Emamectin benzoate (Tasieu 1.9EC): Trừ sâu đục quả, dòi đục cọng non. PHI: 3 - 5 ngày.
5. Spinetoram xạ khuẩn sinh học (Radiant 60SC): Đặc trị bọ trĩ, sâu đục quả cà chua. PHI: 3 ngày.
6. Trichoderma harzianum (Bio-Green): Nấm đối kháng phòng trừ lở cổ rễ, héo xanh, nấm đất. PHI: 0 ngày.
7. Kasugamycin (Kasumin 2SL): Kháng sinh thực vật trị thối nhũn vi khuẩn, đốm lá. PHI: 3 ngày.
8. Nano Bạc - Đồng hữu cơ: Phòng trị rỉ trắng, sương mai, thán thư, mốc xám. PHI: 1 - 2 ngày.
9. Bả Ferric Phosphate (Snail Kill): Bả diệt ốc sên gốc photphat sắt không độc hại cho môi trường. PHI: 0 ngày.
10. Bẫy Pheromone sinh học (Vizubon-D, bẫy dính vàng): Bẫy ruồi đục quả, rầy phấn trắng ngoài tán cây. PHI: 0 ngày.', 
     'https://farmely.vn/docs/danh-muc-thuoc-bvtv-sinh-hoc-2024.pdf', NOW() - INTERVAL '40 days'),

    (3, 3, 'Cẩm nang Kỹ thuật Vận hành & Nhiệt độ, Độ ẩm 10 Giống Rau Chủ Lực', 
     'Chi tiết khoảng nhiệt độ và độ ẩm đất tối ưu cho hệ thống IoT cảm biến tự động giám sát:
- Rau muống cạn: Nhiệt độ 25-35°C, Độ ẩm đất 70-85%.
- Cải ngọt bông: Nhiệt độ 22-32°C, Độ ẩm đất 65-75%.
- Xà lách xoăn: Nhiệt độ 18-28°C, Độ ẩm đất 60-70% (kỵ ngập úng và nhiệt độ cao gây cháy bìa lá).
- Cà chua bi Cherry: Nhiệt độ 20-30°C, Độ ẩm đất 65-75% (cần tỉa chồi nách, làm cọc đỡ thân).
- Dưa leo baby: Nhiệt độ 25-32°C, Độ ẩm đất 70-80% (không để thiếu nước gây đắng trái).
- Đậu cô ve: Nhiệt độ 20-30°C, Độ ẩm đất 65-75% (chịu hạn khá, không chịu úng).
- Mướp hương: Nhiệt độ 25-35°C, Độ ẩm đất 70-80% (cần bấm ngọn kích nhánh cấp 1 mang hoa cái).
- Rau mồng tơi: Nhiệt độ 25-35°C, Độ ẩm đất 70-85%.
- Ớt chỉ thiên: Nhiệt độ 22-32°C, Độ ẩm đất 65-75% (tỉa cành chạc chữ V, thoát nước tốt).
- Rau dền đỏ: Nhiệt độ 25-35°C, Độ ẩm đất 65-80%.', 
     'https://farmely.vn/docs/cam-nang-10-giong-rau-chu-luc.pdf', NOW() - INTERVAL '35 days')
ON CONFLICT (document_id) DO NOTHING;

SELECT setval('knowledge_documents_document_id_seq', (SELECT COALESCE(MAX(document_id), 1) FROM knowledge_documents));

-- ============================================================
-- 6. PROCESS TEMPLATES (QUY TRÌNH CANH TÁC CHUẨN HÓA CHO 10 GIỐNG)
-- ============================================================

INSERT INTO process_templates (template_id, variety_id, pt_created_by, version, created_at) VALUES
    (1,  1,  2, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Rau muống lá tre F1
    (2,  2,  2, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Cải ngọt bông F1
    (3,  3,  2, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Xà lách Lollo Bionda F1
    (4,  4,  2, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Cà chua bi đỏ F1
    (5,  5,  2, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Dưa leo baby F1
    (6,  6,  2, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Đậu cô ve F1
    (7,  7,  3, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Mướp hương cao sản F1
    (8,  8,  3, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Mồng tơi lá to F1
    (9,  9,  3, '1.0', NOW() - INTERVAL '50 days'),  -- Quy trình Ớt chỉ thiên F1
    (10, 10, 3, '1.0', NOW() - INTERVAL '50 days')   -- Quy trình Rau dền đỏ F1
ON CONFLICT (template_id) DO NOTHING;

SELECT setval('process_templates_template_id_seq', (SELECT COALESCE(MAX(template_id), 1) FROM process_templates));

-- ============================================================
-- 7. TEMPLATE STEPS (CÁC BƯỚC CANH TÁC CHI TIẾT TỪ A TỚI Z CHO TỪNG GIỐNG)
-- Thông số min/max nhiệt độ & độ ẩm đất lấy chính xác từ Bảng Vận Hành Tài Liệu
-- ============================================================

INSERT INTO template_steps (template_id, step_name, description, day_offset, duration_days, task_type, min_temp, max_temp, min_humidity, max_humidity) VALUES
    -- ------------------------------------------------------------
    -- CÂY 1: RAU MUỐNG CẠN (Template 1) | Temp: 25-35°C, Humidity: 70-85%
    -- ------------------------------------------------------------
    (1, 'Chuẩn bị đất & Gieo hạt', 
     'Đất tơi xốp, đánh luống cao 15-20cm, rải vôi bột khử khuẩn + bón lót phân trùn quế trộn nấm Trichoderma. Ngâm hạt nước ấm (2 sôi 3 lạnh) 3-4 giờ, ủ ẩm 10-12 giờ nứt nanh rồi gieo hàng cách 15cm. Tưới đẫm.', 
     0, 1, 'SOIL_PREP_SEEDING', 25.0, 35.0, 70.0, 85.0),
    (1, 'Cây con & Nảy mầm', 
     'Duy trì tưới ẩm ngày 2 lần. Cây đạt 2 lá mầm tỉa thưa giữ khoảng cách cây 4-5cm.', 
     1, 7, 'WATERING_THINNING', 25.0, 35.0, 70.0, 85.0),
    (1, 'Bón thúc lần 1 & Xới váng đất', 
     'Tưới đạm cá hữu cơ hoặc bánh dầu vi sinh pha loãng. Xới nhẹ váng đất bề mặt cho rễ thoáng khí.', 
     8, 8, 'FERTILIZATION', 25.0, 35.0, 70.0, 85.0),
    (1, 'Vươn thân lá & Bón thúc lần 2', 
     'Tưới bổ sung dịch chuối trứng + Humic giúp mập ngọn, xanh lá. Độ ẩm đất duy trì 70-85%. Xử lý sâu xanh bằng BT hoặc dầu Neem nếu có phát sinh.', 
     16, 8, 'FERTILIZATION_CARE', 25.0, 35.0, 70.0, 85.0),
    (1, 'Thu hoạch rau muống an toàn', 
     'Cắt sát gốc chừa 2-3cm để tái sinh hoặc nhổ tỉa. Cách ly phân bón và chế phẩm tối thiểu 5 ngày trước thu hoạch.', 
     25, 5, 'HARVEST', 25.0, 35.0, 70.0, 85.0),

    -- ------------------------------------------------------------
    -- CÂY 2: CẢI NGỌT / CẢI BẸ (Template 2) | Temp: 22-32°C, Humidity: 65-75%
    -- ------------------------------------------------------------
    (2, 'Làm đất & Gieo cấy cây con', 
     'Lên luống cao 20cm, bón lót phân trùn quế 1-1.5kg/m2 + vôi bột khử chua. Gieo hạt sâu 0.5cm hoặc cấy cây con 10 ngày tuổi với mật độ 15x15cm.', 
     0, 4, 'SOIL_PREP_SEEDING', 22.0, 32.0, 65.0, 75.0),
    (2, 'Bén rễ hồi xanh & Kích rễ', 
     'Tưới giữ ẩm đều 2 lần/ngày. Phun kích rễ hữu cơ sinh học (Roots 2 hoặc Humic pha loãng).', 
     4, 8, 'WATERING_ROOTING', 22.0, 32.0, 65.0, 75.0),
    (2, 'Bón thúc phát triển bẹ lá', 
     'Tưới thúc đạm hữu cơ lên men hoặc NPK giàu đạm pha loãng. Làm cỏ và xới xáo nhẹ quanh gốc.', 
     12, 8, 'FERTILIZATION', 22.0, 32.0, 65.0, 75.0),
    (2, 'Bón thúc lần 2 & Nuôi bẹ giòn ngọt', 
     'Bổ sung Amino Acid sinh học để lá mềm giòn, giảm vị hăng đắng. Duy trì độ ẩm đất 65-75%. Phun thảo mộc Matrine (Wotac 5EC) nếu phát hiện bọ nhảy sọc cong.', 
     20, 9, 'FERTILIZATION_PEST', 22.0, 32.0, 65.0, 75.0),
    (2, 'Thu hoạch cải ngọt', 
     'Dùng dao bén cắt sát gốc khi bẹ nở tròn đều trước khi trổ ngồng hoa. Thu hoạch vào sáng sớm khi sương vừa ráo.', 
     30, 5, 'HARVEST', 22.0, 32.0, 65.0, 75.0),

    -- ------------------------------------------------------------
    -- CÂY 3: XÀ LÁCH XOĂN (Template 3) | Temp: 18-28°C, Humidity: 60-70%
    -- ------------------------------------------------------------
    (3, 'Ươm cây giống trên vỉ khay', 
     'Gieo hạt trên vỉ khay giá thể mụn dừa đã xử lý chát. Che lưới đen 2 ngày đầu, sau đó cho tiếp xúc ánh sáng nhẹ.', 
     0, 10, 'NURSERY', 18.0, 28.0, 60.0, 70.0),
    (3, 'Cấy cây ra luống sản xuất', 
     'Cây đạt 3-4 lá thật đem cấy mật độ 20x20cm. Luống cao ráo, rãnh thoát nước tốt. Bón lót phân trùn quế.', 
     11, 4, 'TRANSPLANTING', 18.0, 28.0, 60.0, 70.0),
    (3, 'Phát triển tán lá & Tưới sương', 
     'Tưới phun sương nhẹ nhàng tránh tưới xối làm dập lá non. Bón thúc dịch trùn quế lỏng. Tỉa bỏ lá già chạm đất.', 
     16, 9, 'WATERING_CARE', 18.0, 28.0, 60.0, 70.0),
    (3, 'Tạo bụi xòe & Chống cháy bìa lá', 
     'Phun Canxi - Bo hữu cơ ngừa hiện tượng cháy bìa lá (Tip-burn) do nhiệt độ. Rải bả sinh học Ferric Phosphate quanh bờ luống ngừa ốc sên cắn lá.', 
     26, 13, 'NUTRITION_PROTECTION', 18.0, 28.0, 60.0, 70.0),
    (3, 'Thu hoạch xà lách giòn ngọt', 
     'Tỉa lá ngoài ăn dần hoặc dùng dao cắt trọn bụi vào sáng sớm khi sương vừa tan để lá đạt độ giòn ngọt cao nhất.', 
     40, 5, 'HARVEST', 18.0, 28.0, 60.0, 70.0),

    -- ------------------------------------------------------------
    -- CÂY 4: CÀ CHUA BI (CHERRY) (Template 4) | Temp: 20-30°C, Humidity: 65-75%
    -- ------------------------------------------------------------
    (4, 'Ươm và Cấy cây con ra ruộng', 
     'Ươm vỉ xốp 12-15 ngày. Khi cây cao 10-12cm (4-5 lá thật), cấy ra luống cách cây 45-50cm, hàng cách 70cm. Bón lót trùn quế + vôi + Trichoderma.', 
     0, 15, 'NURSERY_TRANSPLANT', 20.0, 30.0, 65.0, 75.0),
    (4, 'Làm giàn đỡ & Cắm cọc', 
     'Cắm cọc tre hoặc buộc dây treo đỡ thân chính. Cắt bỏ lá gốc sát đất để tránh nấm ẩm. Bón thúc kích rễ.', 
     16, 10, 'TRELLIS_SUPPORT', 20.0, 30.0, 65.0, 75.0),
    (4, 'Tỉa chồi nách & Bón thúc thân', 
     'Vặt bỏ toàn bộ chồi nách phụ, giữ lại 1 thân chính duy nhất. Bón thúc NPK hữu cơ 20-20-15.', 
     26, 15, 'PRUNING_FERTILIZE', 20.0, 30.0, 65.0, 75.0),
    (4, 'Ra hoa & Đậu quả rộ', 
     'Rung nhẹ giàn vào buổi sáng hỗ trợ thụ phấn tự nhiên. Phun Canxi - Bo định kỳ chống rụng hoa và nứt thối đuôi trái.', 
     42, 13, 'FLOWERING_CARE', 20.0, 30.0, 65.0, 75.0),
    (4, 'Nuôi quả & Bón thúc ngọt trái', 
     'Tỉa bớt lá già che chùm quả. Bón thúc Kali hữu cơ (dịch chuối lên men) giúp quả bóng mọng, ngọt đậm. Phun phòng trừ sâu đục quả bằng Spinetoram (Radiant 60SC).', 
     56, 14, 'FRUITING_FERTILIZE', 20.0, 30.0, 65.0, 75.0),
    (4, 'Thu hoạch chùm quả chín đỏ', 
     'Thu hoạch chùm quả chín đỏ từ 80% trở lên bằng kéo cắt cuống. Thu cách ngày 1 lần, bảo quản nơi thoáng mát.', 
     70, 15, 'HARVEST', 20.0, 30.0, 65.0, 75.0),

    -- ------------------------------------------------------------
    -- CÂY 5: DƯA LEO BABY (Template 5) | Temp: 25-32°C, Humidity: 70-80%
    -- ------------------------------------------------------------
    (5, 'Gieo hạt & Chăm sóc cây con', 
     'Gieo bầu ươm hoặc trực tiếp vào hốc cách nhau 40cm. Bón lót phân hữu cơ hoai mục + lân vi sinh. Tưới ẩm đều đặn.', 
     0, 11, 'SEEDING_CARE', 25.0, 32.0, 70.0, 80.0),
    (5, 'Cắm giàn chữ A & Dẫn ngọn leo', 
     'Cắm giàn chữ A cao 1.8-2m. Dẫn ngọn dây leo quấn giàn. Bón thúc đợt 1 kích thích vươn đọt mạnh.', 
     12, 7, 'TRELLIS_TRAINING', 25.0, 32.0, 70.0, 80.0),
    (5, 'Tỉa nhánh nách gốc & Kích hoa', 
     'Tỉa bỏ toàn bộ hoa và nhánh phụ từ nách lá 1 đến 5 để cây tập trung lực lên thân giàn. Bón thúc NPK 16-16-16.', 
     20, 11, 'PRUNING_BRANCHES', 25.0, 32.0, 70.0, 80.0),
    (5, 'Đậu quả & Nuôi trái non', 
     'Bổ sung Kali hữu cơ (dịch chuối/tro bếp ngâm). Duy trì tưới đủ ẩm 70-80%, tuyệt đối không để thiếu nước khiến dưa bị đắng và cong queo.', 
     32, 12, 'FRUITING_WATERING', 25.0, 32.0, 70.0, 80.0),
    (5, 'Thu hoạch rộ dưa leo baby', 
     'Thu hái cách ngày khi trái dài 10-12cm, vỏ còn phấn xanh mướt. Hái sáng sớm để quả giữ độ giòn ngọt tối ưu.', 
     45, 15, 'HARVEST', 25.0, 32.0, 70.0, 80.0),

    -- ------------------------------------------------------------
    -- CÂY 6: ĐẬU CÔ VE (Template 6) | Temp: 20-30°C, Humidity: 65-75%
    -- ------------------------------------------------------------
    (6, 'Làm đất & Gieo hạt hốc', 
     'Lên luống cao 20cm rãnh rộng thoát nước. Bón lót phân chuồng hoai + vôi khử phèn. Hạt không cần ngâm, gieo 2 hạt/hốc, hốc cách nhau 25-30cm.', 
     0, 3, 'SOIL_PREP_SEEDING', 20.0, 30.0, 65.0, 75.0),
    (6, 'Định cây khỏe & Vươn thân', 
     'Tỉa định giữ 1 cây khỏe nhất mỗi hốc. Tưới giữ ẩm vừa phải (đậu cô ve chịu hạn tốt hơn úng). Bón thúc nhẹ đạm cá.', 
     4, 11, 'THINNING_CARE', 20.0, 30.0, 65.0, 75.0),
    (6, 'Cắm giàn leo & Phân cành mầm', 
     'Cắm giàn chữ A cao 1.8m bằng cọc tre/dây cước. Bón thúc đợt 2 bổ sung Lân và Kali hữu cơ kích phân hóa mầm hoa.', 
     16, 13, 'TRELLIS_FLOWERING', 20.0, 30.0, 65.0, 75.0),
    (6, 'Nở hoa rộ & Đậu quả', 
     'Tưới nước đều đặn không để khô đất gây rụng hoa. Phun Bo - Canxi hỗ trợ cuống trái dai chắc, ngừa dòi đục cọng bằng BT sinh học.', 
     30, 14, 'FLOWERING_PROTECTION', 20.0, 30.0, 65.0, 75.0),
    (6, 'Thu hoạch đậu cô ve non', 
     'Thu hoạch khi quả đẫy sức, hạt bên trong chưa gồ rõ, vỏ màu xanh bóng. Thu liên tục cách 2-3 ngày/lần trong 2 tuần.', 
     45, 10, 'HARVEST', 20.0, 30.0, 65.0, 75.0),

    -- ------------------------------------------------------------
    -- CÂY 7: MƯỚP HƯƠNG (Template 7) | Temp: 25-35°C, Humidity: 70-80%
    -- ------------------------------------------------------------
    (7, 'Gieo ươm bầu & Bón lót hố', 
     'Ngâm hạt nước ấm 4-6 giờ, ủ nứt nanh rồi gieo bầu ươm. Đào hố bón lót phân chuồng ủ hoai + lân vi sinh. Khoảng cách hốc 0.8 - 1m.', 
     0, 11, 'NURSERY_PLANTING', 25.0, 35.0, 70.0, 80.0),
    (7, 'Bén rễ & Bắt giàn dây leo', 
     'Khi ngọn mướp vươn dài 20cm tiến hành bắt giàn lưới hoặc giàn mái bằng cao 2m. Cố định dây leo bằng dây mềm.', 
     12, 12, 'TRELLIS_CLIMBING', 25.0, 35.0, 70.0, 80.0),
    (7, 'Bấm ngọn kích nhánh & Bón thúc', 
     'Khi dây leo lên đỉnh giàn, bấm ngọn thân chính để kích thích phát triển nhiều nhánh cấp 1 mang hoa cái. Bón thúc phân hữu cơ đậm đặc.', 
     25, 12, 'PRUNING_TOP', 25.0, 35.0, 70.0, 80.0),
    (7, 'Ra hoa & Thụ phấn đậu quả', 
     'Phun bổ sung Bo vi lượng. Treo bẫy Pheromone (Vizubon-D) xung quanh giàn ngăn ngừa ruồi vàng đục quả non.', 
     38, 16, 'POLLINATION_TRAP', 25.0, 35.0, 70.0, 80.0),
    (7, 'Nuôi trái & Thu hoạch mướp', 
     'Thu hái khi quả nở đẫy, vỏ còn mềm mại, có mùi thơm đặc trưng ngào ngạt. Chăm sóc tưới đều để thu hái kéo dài 1-2 tháng.', 
     55, 15, 'HARVEST', 25.0, 35.0, 70.0, 80.0),

    -- ------------------------------------------------------------
    -- CÂY 8: RAU MỒNG TƠI (Template 8) | Temp: 25-35°C, Humidity: 70-85%
    -- ------------------------------------------------------------
    (8, 'Chuẩn bị đất mùn & Gieo hạt', 
     'Đất nhiều mùn giữ ẩm tốt. Gieo hạt sâu 1cm, hàng cách hàng 20-25cm, hạt cách nhau 10cm. Tưới nước giữ ẩm đẫm bề mặt.', 
     0, 3, 'SOIL_PREP_SEEDING', 25.0, 35.0, 70.0, 85.0),
    (8, 'Cây con nảy mầm & Tỉa dặm', 
     'Hạt nảy mầm sau 3-5 ngày. Cây con 3 lá tỉa định khoảng cách cây 12-15cm. Tưới phân kích rễ loãng.', 
     4, 10, 'THINNING_WATERING', 25.0, 35.0, 70.0, 85.0),
    (8, 'Phát triển thân lá & Bón thúc 1', 
     'Bón thúc đạm cá hữu cơ hoặc phân trùn quế. Độ ẩm đất duy trì 70-85%. Làm sạch cỏ quanh luống.', 
     15, 7, 'FERTILIZATION', 25.0, 35.0, 70.0, 85.0),
    (8, 'Vươn ngọn & Bón thúc lần 2', 
     'Bổ sung dịch chuối hoặc NPK hữu cơ để bẹ lá dày, mọng nước, thân mập mạp. Xử lý sâu khoang bằng BT nếu xuất hiện.', 
     23, 6, 'FERTILIZATION_CARE', 25.0, 35.0, 70.0, 85.0),
    (8, 'Thu hoạch đọt mồng tơi', 
     'Cắt đọt non dài 15-20cm chừa lại 2 nách lá sát gốc để mọc nhánh cho lứa sau. Bón phân trùn quế nhẹ sau mỗi đợt cắt.', 
     30, 5, 'HARVEST', 25.0, 35.0, 70.0, 85.0),

    -- ------------------------------------------------------------
    -- CÂY 9: ỚT CAY / ỚT CHỈ THIÊN (Template 9) | Temp: 22-32°C, Humidity: 65-75%
    -- ------------------------------------------------------------
    (9, 'Ươm giống khay vỉ xốp', 
     'Ngâm hạt nước ấm 6 giờ, gieo khay vỉ xốp. Khi cây có 4-5 lá thật, cao 12-15cm thì chuẩn bị đem trồng ra ruộng.', 
     0, 20, 'NURSERY', 22.0, 32.0, 65.0, 75.0),
    (9, 'Lên luống cao & Cấy cây ra ruộng', 
     'Lên luống cao 25cm rãnh thoát nước sâu chống ngập úng. Bón lót phân chuồng hoai + vôi khử khuẩn. Cây cách cây 40-50cm.', 
     21, 13, 'TRANSPLANTING', 22.0, 32.0, 65.0, 75.0),
    (9, 'Tỉa cành chạc chữ V & Cắm cọc', 
     'Tỉa bỏ toàn bộ lá và chồi phía dưới chạc chữ V đầu tiên để gốc thông thoáng. Cắm cọc chống đổ ngã. Bón thúc đợt 1.', 
     35, 14, 'PRUNING_STAKING', 22.0, 32.0, 65.0, 75.0),
    (9, 'Ra hoa rộ & Đậu trái non', 
     'Phun Canxi - Bo định kỳ 7 ngày/lần chống rụng hoa, thối đuôi trái. Phun phòng trừ bọ trĩ, nhện đỏ xoăn đọt bằng tinh dầu Neem + Abamectin.', 
     50, 19, 'FLOWERING_PROTECTION', 22.0, 32.0, 65.0, 75.0),
    (9, 'Nuôi trái & Thu hoạch ớt chỉ thiên', 
     'Thu hoạch khi trái chuyển màu đỏ đều. Hái nhẹ tay cả cuống. Cây cho thu hoạch liên tục kéo dài nhiều tháng.', 
     70, 20, 'HARVEST', 22.0, 32.0, 65.0, 75.0),

    -- ------------------------------------------------------------
    -- CÂY 10: RAU DỀN (ĐỎ/CƠM) (Template 10) | Temp: 25-35°C, Humidity: 65-80%
    -- ------------------------------------------------------------
    (10, 'Làm đất & Gieo rải hạt mịn', 
     'Hạt dền rất nhỏ, trộn tro bếp hoặc cát mịn để gieo đều trên mặt luống. Bón lót phân trùn quế hoai mục. Phủ rơm rạ mỏng và tưới đẫm.', 
     0, 2, 'SOIL_PREP_SEEDING', 25.0, 35.0, 65.0, 80.0),
    (10, 'Cây con nảy mầm & Tỉa thưa', 
     'Cây nảy mầm nhanh sau 2-3 ngày. Tưới phun sương nhẹ 2 lần/ngày. Khi cây có 2 lá thật tiến hành tỉa bớt chỗ dày.', 
     3, 6, 'THINNING_WATERING', 25.0, 35.0, 65.0, 80.0),
    (10, 'Bón thúc đạm cá lần 1', 
     'Tưới thúc đạm cá lên men hoặc phân bánh dầu hữu cơ pha loãng. Rau dền rất háo đạm hữu cơ để phát triển bộ lá.', 
     10, 7, 'FERTILIZATION', 25.0, 35.0, 65.0, 80.0),
    (10, 'Nuôi bộ lá đỏ tía & Nhổ cỏ', 
     'Bổ sung dịch trùn quế, làm sạch cỏ dại quanh gốc. Lá chuyển màu đỏ tía dày dặn óng ả. Duy trì độ ẩm đất 65-80%.', 
     18, 6, 'CARE_WEEDING', 25.0, 35.0, 65.0, 80.0),
    (10, 'Thu hoạch rau dền an toàn', 
     'Nhổ cả cây hoặc cắt sát gốc chừa lại 3cm nách lá để tái sinh lứa sau. Cách ly dinh dưỡng và chế phẩm trước thu hoạch 4 ngày.', 
     25, 5, 'HARVEST', 25.0, 35.0, 65.0, 80.0)
ON CONFLICT DO NOTHING;

-- ============================================================
-- 8. SENSOR READINGS (DỮ LIỆU IOT MÔ PHỎNG GIÁM SÁT VI KHÍ HẬU)
-- ============================================================

INSERT INTO sensor_readings (plot_id, temperature, air_humidity, soil_humidity, recorded_at) VALUES
    -- Plot CC-A02 (Đang canh tác Cải ngọt bông F1 - Yêu cầu: 22-32°C, độ ẩm 65-75%)
    (2, 26.5, 72.0, 68.5, NOW() - INTERVAL '12 hours'),
    (2, 28.0, 68.0, 67.0, NOW() - INTERVAL '9 hours'),
    (2, 30.5, 65.0, 66.0, NOW() - INTERVAL '6 hours'),
    (2, 27.0, 75.0, 71.0, NOW() - INTERVAL '3 hours'),
    (2, 25.8, 78.0, 70.0, NOW() - INTERVAL '30 minutes'),

    -- Plot CC-B01 (Đang canh tác Cà chua bi đỏ F1 - Yêu cầu: 20-30°C, độ ẩm 65-75%)
    (4, 25.0, 70.0, 68.0, NOW() - INTERVAL '12 hours'),
    (4, 27.5, 66.0, 66.5, NOW() - INTERVAL '9 hours'),
    (4, 29.2, 63.0, 65.0, NOW() - INTERVAL '6 hours'),
    (4, 26.8, 71.0, 69.0, NOW() - INTERVAL '3 hours'),
    (4, 24.5, 74.0, 68.5, NOW() - INTERVAL '30 minutes'),

    -- Plot LA-C01 (Đang canh tác Dưa leo baby F1 - Yêu cầu: 25-32°C, độ ẩm 70-80%)
    (7, 28.5, 78.0, 74.0, NOW() - INTERVAL '12 hours'),
    (7, 30.2, 75.0, 72.5, NOW() - INTERVAL '9 hours'),
    (7, 31.8, 70.0, 71.0, NOW() - INTERVAL '6 hours'),
    (7, 29.0, 77.0, 75.0, NOW() - INTERVAL '3 hours'),
    (7, 27.5, 80.0, 76.0, NOW() - INTERVAL '30 minutes');

-- ============================================================
-- 9. CONTRACTS & RENTALS (HỢP ĐỒNG THUÊ ĐẤT & CANH TÁC)
-- ============================================================

INSERT INTO contracts (contract_id, renter_id, contract_number, total_amount, status, contract_document_url, created_at, updated_at) VALUES
    (1, 6, 'CTR-2026-001', 4500000.00, 'ACTIVE',    'https://farmely.vn/contracts/CTR-2026-001.pdf', NOW() - INTERVAL '30 days', NOW() - INTERVAL '30 days'),
    (2, 7, 'CTR-2026-002', 2000000.00, 'ACTIVE',    'https://farmely.vn/contracts/CTR-2026-002.pdf', NOW() - INTERVAL '40 days', NOW() - INTERVAL '40 days'),
    (3, 8, 'CTR-2026-003', 6000000.00, 'COMPLETED', 'https://farmely.vn/contracts/CTR-2026-003.pdf', NOW() - INTERVAL '80 days', NOW() - INTERVAL '20 days')
ON CONFLICT (contract_id) DO NOTHING;

SELECT setval('contracts_contract_id_seq', (SELECT COALESCE(MAX(contract_id), 1) FROM contracts));

INSERT INTO rentals (rental_id, contract_id, service_id, plot_id, variety_id, parent_rental_id, start_date, end_date, total_price, status, created_at) VALUES
    -- Thuê Plot CC-A02 trồng Cải ngọt bông F1 kèm Dịch vụ chăm sóc trọn gói (FULL)
    (1, 1, 1, 2, 2, NULL, (CURRENT_DATE - INTERVAL '15 days')::DATE, (CURRENT_DATE + INTERVAL '20 days')::DATE, 4500000.00, 'ACTIVE', NOW() - INTERVAL '30 days'),
    -- Thuê Plot CC-B01 trồng Cà chua bi đỏ F1 chế độ tự canh tác (service_id = NULL)
    (2, 2, NULL, 4, 4, NULL, (CURRENT_DATE - INTERVAL '25 days')::DATE, (CURRENT_DATE + INTERVAL '60 days')::DATE, 2000000.00, 'ACTIVE', NOW() - INTERVAL '40 days'),
    -- Thuê Plot LA-C01 trồng Dưa leo baby F1 trọn gói (Đã thu hoạch và hoàn tất)
    (3, 3, 1, 7, 5, NULL, (CURRENT_DATE - INTERVAL '75 days')::DATE, (CURRENT_DATE - INTERVAL '15 days')::DATE, 6000000.00, 'DONE', NOW() - INTERVAL '80 days')
ON CONFLICT (rental_id) DO NOTHING;

SELECT setval('rentals_rental_id_seq', (SELECT COALESCE(MAX(rental_id), 1) FROM rentals));

-- ============================================================
-- 10. SERVICE REQUESTS (YÊU CẦU DỊCH VỤ PHÁT SINH)
-- ============================================================

INSERT INTO service_requests (request_id, rental_id, service_id, scheduled_date, status, created_at) VALUES
    -- Khách hàng tự trồng trên Rental 2 đặt lịch Dịch vụ phòng trừ sâu bệnh sinh học
    (1, 2, 3, (CURRENT_DATE - INTERVAL '10 days')::DATE, 'DONE',     NOW() - INTERVAL '12 days'),
    -- Đặt thêm dịch vụ Bón phân sinh học
    (2, 2, 5, (CURRENT_DATE - INTERVAL '2 days')::DATE,  'DONE',     NOW() - INTERVAL '5 days'),
    -- Đặt dịch vụ Xét nghiệm mẫu đất
    (3, 2, 4, (CURRENT_DATE + INTERVAL '3 days')::DATE,  'ASSIGNED', NOW() - INTERVAL '1 days')
ON CONFLICT (request_id) DO NOTHING;

SELECT setval('service_requests_request_id_seq', (SELECT COALESCE(MAX(request_id), 1) FROM service_requests));

-- ============================================================
-- 11. PAYMENT TRANSACTIONS (GIAO DỊCH THANH TOÁN)
-- ============================================================

INSERT INTO payment_transactions (transaction_id, contract_id, service_request_id, cancellation_request_id, type, amount, payment_method, gateway_ref, status, created_at) VALUES
    (1, 1, NULL, NULL, 'PAYMENT', 4500000.00, 'VNPAY',         'VNPAY_TXN_881239', 'SUCCESS', NOW() - INTERVAL '30 days'),
    (2, 2, NULL, NULL, 'PAYMENT', 2000000.00, 'MOMO',          'MOMO_TXN_449102',  'SUCCESS', NOW() - INTERVAL '40 days'),
    (3, 3, NULL, NULL, 'PAYMENT', 6000000.00, 'BANK_TRANSFER', 'VCB_TXN_1122334', 'SUCCESS', NOW() - INTERVAL '80 days'),
    (4, NULL, 1, NULL, 'PAYMENT', 200000.00,  'MOMO',          'MOMO_TXN_558811',  'SUCCESS', NOW() - INTERVAL '12 days'),
    (5, NULL, 2, NULL, 'PAYMENT', 180000.00,  'VNPAY',         'VNPAY_TXN_992211', 'SUCCESS', NOW() - INTERVAL '5 days')
ON CONFLICT (transaction_id) DO NOTHING;

SELECT setval('payment_transactions_transaction_id_seq', (SELECT COALESCE(MAX(transaction_id), 1) FROM payment_transactions));

-- ============================================================
-- 12. CARE TASKS (CÔNG VIỆC CHĂM SÓC NGOÀI RUỘNG)
-- ============================================================

INSERT INTO care_tasks (task_id, rental_id, step_id, service_request_id, task_assigned_to, due_date, status, evidence_image_url, notes, created_at) VALUES
    -- Công việc tự động sinh ra từ Quy trình Cải ngọt (Rental 1 - Plot CC-A02)
    (1, 1, 6, NULL, 4, (CURRENT_DATE - INTERVAL '15 days')::DATE, 'DONE', 
     'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?auto=format&fit=crop&w=800&q=80', 
     'Đã đánh luống cao 20cm, bón lót phân trùn quế 1.5kg/m2 + vôi bột, gieo cấy hạt cải ngọt bông F1 đúng mật độ 15x15cm', NOW() - INTERVAL '16 days'),
    (2, 1, 7, NULL, 4, (CURRENT_DATE - INTERVAL '10 days')::DATE, 'DONE', 
     'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', 
     'Cây cải con đã bén rễ hồi xanh, tưới giữ ẩm 2 lần/ngày và phun kích rễ hữu cơ sinh học Humic loãng', NOW() - INTERVAL '11 days'),
    (3, 1, 8, NULL, 4, (CURRENT_DATE - INTERVAL '3 days')::DATE,  'DONE', 
     'https://images.unsplash.com/photo-1574943320219-553eb213f72d?auto=format&fit=crop&w=800&q=80', 
     'Tưới thúc đạm cá hữu cơ lên men, làm cỏ xới xáo nhẹ quanh gốc luống', NOW() - INTERVAL '4 days'),
    (4, 1, 9, NULL, 4, (CURRENT_DATE + INTERVAL '5 days')::DATE,  'IN_PROG', 
     NULL, 
     'Chuẩn bị phun bổ sung Amino Acid sinh học để bẹ lá giòn ngọt; theo dõi bọ nhảy sọc cong', NOW() - INTERVAL '1 days'),

    -- Công việc sinh ra từ Service Request cho Rental 2 (Plot CC-B01)
    (5, 2, NULL, 1, 4, (CURRENT_DATE - INTERVAL '10 days')::DATE, 'DONE', 
     'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', 
     'Đã thực hiện phun dầu Neem hữu cơ phòng trừ bọ trĩ và rệp non cho giàn cà chua bi', NOW() - INTERVAL '11 days'),
    (6, 2, NULL, 2, 4, (CURRENT_DATE - INTERVAL '2 days')::DATE,  'DONE', 
     'https://images.unsplash.com/photo-1589923188900-85dae523342b?auto=format&fit=crop&w=800&q=80', 
     'Bón thúc phân NPK hữu cơ 20-20-15 và bổ sung dịch chuối ngâm giàu Kali cho cà chua chuẩn bị ra hoa', NOW() - INTERVAL '3 days')
ON CONFLICT (task_id) DO NOTHING;

SELECT setval('care_tasks_task_id_seq', (SELECT COALESCE(MAX(task_id), 1) FROM care_tasks));

-- ============================================================
-- 13. FARM DIARIES (NHẬT KÝ NÔNG TRẠI MINH BẠCH THEO VIETGAP)
-- ============================================================

INSERT INTO farm_diaries (diary_id, rental_id, task_id, content, image_url, created_at) VALUES
    (1, 1, 1, 'Hoàn thành làm đất, bón lót phân trùn quế và gieo cấy hạt cải ngọt bông F1 theo chuẩn VietGAP.', 
     'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?auto=format&fit=crop&w=800&q=80', NOW() - INTERVAL '15 days'),
    (2, 1, 2, 'Cây con sinh trưởng khỏe mạnh, bén rễ tốt, lá mầm vươn cao đều đặn, độ ẩm đất đo được 71%.', 
     'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', NOW() - INTERVAL '10 days'),
    (3, 1, 3, 'Bón thúc đạm cá vi sinh lần 1 giúp cây đâm bẹ to, lá xanh bóng mượt tự nhiên, không dùng phân hóa học.', 
     'https://images.unsplash.com/photo-1574943320219-553eb213f72d?auto=format&fit=crop&w=800&q=80', NOW() - INTERVAL '3 days'),
    (4, 2, 5, 'Phun dung dịch dầu Neem sinh học kiểm soát rệp muội và bọ trĩ theo yêu cầu dịch vụ của khách hàng.', 
     'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', NOW() - INTERVAL '10 days'),
    (5, 3, NULL, 'Thu hoạch rộ toàn bộ dưa leo baby F1 tại lô LA-C01. Quả xanh bóng, thẳng đều, giòn ngọt, đóng thùng giao khách an toàn.', 
     'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?auto=format&fit=crop&w=800&q=80', NOW() - INTERVAL '16 days')
ON CONFLICT (diary_id) DO NOTHING;

SELECT setval('farm_diaries_diary_id_seq', (SELECT COALESCE(MAX(diary_id), 1) FROM farm_diaries));

-- ============================================================
-- 14. HARVEST RESULTS (KẾT QUẢ THU HOẠCH NÔNG SẢN)
-- ============================================================

INSERT INTO harvest_results (harvest_id, rental_id, entered_by, harvest_date, yield_amount, evidence_image_url, delivery_type, customer_confirmed, created_at) VALUES
    (1, 3, 5, (CURRENT_DATE - INTERVAL '16 days')::DATE, 52.50, 
     'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?auto=format&fit=crop&w=800&q=80', 'DELIVERY', TRUE, NOW() - INTERVAL '16 days')
ON CONFLICT (harvest_id) DO NOTHING;

SELECT setval('harvest_results_harvest_id_seq', (SELECT COALESCE(MAX(harvest_id), 1) FROM harvest_results));

-- ============================================================
-- 15. ISSUE REPORTS (BÁO CÁO SÂU BỆNH & PHƯƠNG ÁN XỬ LÝ SINH HỌC)
-- Đối chiếu trực tiếp với Danh mục thuốc BVTV sinh học trong tài liệu
-- ============================================================

INSERT INTO issue_reports (issue_id, rental_id, reported_by, handled_by, issue_type, description, image_url, status, resolution_notes, resolved_at, created_at) VALUES
    (1, 1, 6, 2, 'SÂU HẠI', 
     'Phát hiện bọ nhảy sọc cong xuất hiện cắn thủng li ti trên các bẹ lá non của luống cải ngọt CC-A02', 
     'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', 
     'RESOLVED', 
     'Chuyên gia Thảo chỉ định: Phun chế phẩm sinh học thảo mộc Matrine (Wotac 5EC), nồng độ 15ml/16L nước vào lúc chiều mát. Tuân thủ thời gian cách ly PHI 3 ngày. Sau 48h kiểm tra bọ nhảy đã bị triệt tiêu hoàn toàn.', 
     NOW() - INTERVAL '8 days', NOW() - INTERVAL '10 days'),

    (2, 2, 7, 3, 'SÂU BỆNH', 
     'Lá non ngọn cây cà chua bi có dấu hiệu xoăn nhẹ, nghi ngờ bị bọ trĩ và nhện đỏ gây hại', 
     'https://images.unsplash.com/photo-1592417817098-8f3d6910985b?auto=format&fit=crop&w=800&q=80', 
     'OPEN', 
     'Chuyên gia Đức đang hướng dẫn: Phun tinh dầu Neem phối hợp Abamectin sinh học (Reasgant 3.6EC), kết hợp rung nhẹ giàn và kiểm tra mặt dưới lá.', 
     NULL, NOW() - INTERVAL '2 days')
ON CONFLICT (issue_id) DO NOTHING;

SELECT setval('issue_reports_issue_id_seq', (SELECT COALESCE(MAX(issue_id), 1) FROM issue_reports));

-- ============================================================
-- 16. CONVERSATIONS & MESSAGES (TƯ VẤN KỸ THUẬT & TRỢ LÝ AI)
-- ============================================================

INSERT INTO conversations (conversation_id, participant_one, participant_two, rental_id, plot_id, type, status, created_at) VALUES
    -- Cuộc hội thoại giữa Khách hàng An (6) và Chuyên gia Thảo (2)
    (1, 6, 2, 1, 2, 'CUST_EXP', 'OPEN', NOW() - INTERVAL '15 days'),
    -- Cuộc hội thoại giữa Khách hàng Minh (7) và AI Trợ lý Nông nghiệp
    (2, 7, NULL, 2, 4, 'AI', 'OPEN', NOW() - INTERVAL '10 days')
ON CONFLICT (conversation_id) DO NOTHING;

SELECT setval('conversations_conversation_id_seq', (SELECT COALESCE(MAX(conversation_id), 1) FROM conversations));

INSERT INTO messages (message_id, conversation_id, sender_id, content, attachment_url, created_at) VALUES
    (1, 1, 6, 'Chào ThS Thảo, cho tôi hỏi phân đạm cá tưới cho cải ngọt thì cần cách ly bao lâu trước khi thu hoạch?', NULL, NOW() - INTERVAL '14 days'),
    (2, 1, 2, 'Chào chị An! Theo đúng quy trình VietGAP tại Farmely, phân đạm cá hữu cơ vi sinh cần cách ly tối thiểu 5 ngày trước khi thu hoạch để đảm bảo an toàn vệ sinh thực phẩm cao nhất cho gia đình nhé!', NULL, NOW() - INTERVAL '14 days' + INTERVAL '15 minutes'),
    (3, 2, 7, 'Tôi đang trồng cà chua bi, thấy các nách lá ra rất nhiều chồi nhánh thì nên xử lý thế nào?', NULL, NOW() - INTERVAL '9 days'),
    (4, 2, NULL, 'Chào anh Minh! Với cà chua bi F1, anh cần vặt bỏ toàn bộ chồi nách phụ (chồi xuất phát từ nách giữa thân và cuống lá), chỉ giữ lại duy nhất 1 thân chính. Việc này giúp dinh dưỡng tập trung nuôi chùm hoa to và quả mọng nước, hạn chế rụng trái non anh nhé!', NULL, NOW() - INTERVAL '9 days' + INTERVAL '10 seconds')
ON CONFLICT (message_id) DO NOTHING;

SELECT setval('messages_message_id_seq', (SELECT COALESCE(MAX(message_id), 1) FROM messages));

-- ============================================================
-- 17. SITE VISITS (ĐẶT LỊCH THĂM QUAN NÔNG TRẠI)
-- ============================================================

INSERT INTO site_visits (visit_id, plot_id, visitor_name, visitor_phone, visit_date, visit_slot, status, created_at) VALUES
    (1, 1, 'Lê Thị Thu Thảo', '0908123456', (CURRENT_DATE + INTERVAL '3 days')::DATE, 'MORNING',   'CONFIRMED', NOW() - INTERVAL '2 days'),
    (2, 5, 'Trần Minh Hoàng', '0918765432', (CURRENT_DATE + INTERVAL '5 days')::DATE, 'AFTERNOON', 'PENDING',   NOW() - INTERVAL '1 days')
ON CONFLICT (visit_id) DO NOTHING;

SELECT setval('site_visits_visit_id_seq', (SELECT COALESCE(MAX(visit_id), 1) FROM site_visits));

-- ============================================================
-- 18. NOTIFICATIONS (THÔNG BÁO HỆ THỐNG ĐẾN NGƯỜI DÙNG)
-- ============================================================

INSERT INTO notifications (notification_id, user_id, title, content, is_read, created_at) VALUES
    (1, 6, 'Nhật ký chăm sóc mới cập nhật', 
     'Nhân viên nông trại vừa hoàn thành tác vụ Bón thúc đạm cá hữu cơ trên luống cải ngọt CC-A02 của bạn.', FALSE, NOW() - INTERVAL '3 days'),
    (2, 8, 'Nông sản đã sẵn sàng bàn giao', 
     'Đợt thu hoạch 52.5 kg Dưa leo baby F1 từ hợp đồng CTR-2026-003 đã được đóng gói và bàn giao thành công.', TRUE, NOW() - INTERVAL '16 days'),
    (3, 4, 'Phân công nhiệm vụ thực địa', 
     'Bạn được giao nhiệm vụ chuẩn bị bón thúc đợt 2 bổ sung Amino Acid cho luống CC-A02 hạn chót ngày tới.', FALSE, NOW() - INTERVAL '1 days')
ON CONFLICT (notification_id) DO NOTHING;

SELECT setval('notifications_notification_id_seq', (SELECT COALESCE(MAX(notification_id), 1) FROM notifications));

-- ============================================================
-- 19. AUDIT LOGS (NHẬT KÝ KIỂM TOÁN VẬN HÀNH AN TOÀN)
-- ============================================================

INSERT INTO audit_logs (log_id, user_id, action, entity_name, entity_id, details, ip_address, created_at) VALUES
    (1, 1, 'SEED_DATABASE', 'SYSTEM', 'ALL', '{"event": "Khởi tạo dữ liệu mẫu chuẩn VietGAP cho 10 loại cây trồng"}', '127.0.0.1', NOW() - INTERVAL '30 days'),
    (2, 6, 'SIGN_CONTRACT', 'contracts', '1', '{"contract_number": "CTR-2026-001", "total_amount": 4500000}', '14.232.208.50', NOW() - INTERVAL '30 days'),
    (3, 4, 'TASK_COMPLETE', 'care_tasks', '3', '{"task_id": 3, "step": "Bón thúc đạm cá hữu cơ lần 1"}', '118.69.182.10', NOW() - INTERVAL '3 days');

SELECT setval('audit_logs_log_id_seq', (SELECT COALESCE(MAX(log_id), 1) FROM audit_logs));

-- ============================================================
-- HOÀN TẤT SEED DATA TOÀN DIỆN FARMELY
-- ============================================================
