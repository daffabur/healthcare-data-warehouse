# 📊 Dashboard Explanation - Healthcare Data Warehouse

Dokumen ini menjelaskan elemen-elemen utama yang terdapat dalam dashboard Power BI (`Dashboard Data Warehouse Healthcare.pbix`) yang dibuat berdasarkan data dari data warehouse.

## 🎯 Tujuan Dashboard
Dashboard ini bertujuan untuk memberikan gambaran menyeluruh terkait jumlah pasien, pembiayaan, dan distribusi layanan kesehatan berdasarkan berbagai dimensi seperti tahun, gender, kondisi medis, rumah sakit, dan lainnya.

---

## 📌 Komponen Dashboard

### 1. **Total Patients & Total Billing Overview**
- Menampilkan metrik utama:
  - Total jumlah pasien.
  - Total biaya perawatan keseluruhan.
- Disajikan dalam bentuk **card visual**.

---

### 2. **Trend Pembiayaan per Tahun**
- Grafik batang yang menunjukkan total billing per tahun.
- Sumber data dari hasil **Roll-Up OLAP Query** berdasarkan tahun.

---

### 3. **Jumlah Pasien Berdasarkan Gender dan Kondisi Medis**
- Tabel pivot visual yang memperlihatkan jumlah pasien pria dan wanita untuk masing-masing kondisi medis.
- Berdasarkan hasil **Pivot Query**.

---

### 4. **Jumlah Pasien per Bulan**
- Line chart yang menggambarkan tren kunjungan pasien per bulan dalam satu tahun.
- Disusun berdasarkan hasil **Drill-Down dari Tahun → Bulan**.

---

### 5. **Distribusi Pasien Berdasarkan Usia dan Golongan Darah**
- Menggunakan **Heatmap atau matrix** untuk menunjukkan total pasien dan pembiayaan berdasarkan range usia dan blood type.
- Berdasarkan **Dice Query** (filter multidimensi).

---

### 6. **Pembiayaan Pasien Berdasarkan Rumah Sakit**
- Pie chart atau bar chart menunjukkan distribusi billing per hospital_name.
- Data dari **Slice Query**.

---

## 🛠️ Tools & Dataset
- **Tool**: Power BI Desktop
- **Sumber Data**: Data hasil ETL dari SSIS ke database `Healthcare_Datware`
- **Model Data**: Star Schema dengan fact table `Fact_Healthcare` dan 5 dimensi

---

## ✅ Kesimpulan
Dashboard ini menyajikan insight penting secara interaktif dan visual yang mendukung analisis performa rumah sakit dan pola pasien berdasarkan data historis. Dashboard dapat digunakan untuk:
- Identifikasi tren pembiayaan.
- Menilai performa rumah sakit.
- Menyusun kebijakan berbasis data.