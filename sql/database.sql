-- ============================================
-- Membuat Database
-- ============================================


-- ============================================
-- Tabel Program Studi
-- ============================================

CREATE TABLE program_studi (

    id INT AUTO_INCREMENT PRIMARY KEY,

    nama_prodi VARCHAR(100) NOT NULL UNIQUE

);

-- ============================================
-- Tabel Mahasiswa
-- ============================================

CREATE TABLE mahasiswa (

    nim VARCHAR(20) PRIMARY KEY,

    nama VARCHAR(100) NOT NULL,

    email VARCHAR(100),

    prodi_id INT NOT NULL,

    CONSTRAINT fk_mahasiswa_prodi
        FOREIGN KEY (prodi_id)
        REFERENCES program_studi(id)

        ON UPDATE CASCADE
        ON DELETE RESTRICT

);

-- ============================================
-- Tabel Mata Kuliah
-- ============================================

CREATE TABLE mata_kuliah (

    kode VARCHAR(10) PRIMARY KEY,

    nama_mk VARCHAR(100) NOT NULL,

    sks INT NOT NULL

);

-- ============================================
-- Tabel KRS
-- ============================================

CREATE TABLE krs (

    id INT AUTO_INCREMENT PRIMARY KEY,

    nim VARCHAR(20) NOT NULL,

    kode VARCHAR(10) NOT NULL,

    CONSTRAINT fk_krs_mahasiswa
        FOREIGN KEY (nim)
        REFERENCES mahasiswa(nim)

        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_krs_matakuliah
        FOREIGN KEY (kode)
        REFERENCES mata_kuliah(kode)

        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_krs
        UNIQUE(nim, kode)

);