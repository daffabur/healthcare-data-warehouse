CREATE TABLE Dim_Patient (
  patient_id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(100),
  age VARCHAR(3),
  gender VARCHAR(10),
  blood_type VARCHAR(5),
  medical_condition VARCHAR(100)
);

CREATE TABLE Dim_Doctor (
  doctor_id VARCHAR(50) PRIMARY KEY,
  doctor_name VARCHAR(100)
);

CREATE TABLE Dim_Hospital (
  hospital_id VARCHAR(50) PRIMARY KEY,
  hospital_name VARCHAR(100)
);

CREATE TABLE Dim_Insurance (
  insurance_id VARCHAR(50) PRIMARY KEY,
  insurance_provider VARCHAR(100)
);

CREATE TABLE Dim_Date (
  date_id VARCHAR(50) PRIMARY KEY,
  admission_date VARCHAR(50),
  discharge_date VARCHAR(50)
);

CREATE TABLE Fact_Healthcare (
  patient_id VARCHAR(50),
  doctor_id VARCHAR(50),
  hospital_id VARCHAR(50),
  insurance_id VARCHAR(50),
  date_id VARCHAR(50),
  room_number VARCHAR(10),
  medication VARCHAR(50),
  admission_type VARCHAR(50),
  test_results VARCHAR(50),
  billing_amount VARCHAR(50),
  FOREIGN KEY (patient_id) REFERENCES Dim_Patient(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES Dim_Doctor(doctor_id),
  FOREIGN KEY (hospital_id) REFERENCES Dim_Hospital(hospital_id),
  FOREIGN KEY (insurance_id) REFERENCES Dim_Insurance(insurance_id),
  FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id)
);
