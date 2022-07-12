CREATE TABLE patients(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name VARCHAR(100), date_of_birth date);

CREATE TABLE medical_histories(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, admitted_at timestamp, patient_id INT, status VARCHAR(100), CONSTRAINT FK_patients_medhistories FOREIGN KEY(patient_id) REFERENCES patients(id));

CREATE INDEX idx_patient_id ON medical_histories (patient_id);

CREATE TABLE invoices(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, total_amount decimal, generated_at timestamp, payed_at timestamp, medical_history_id INT, CONSTRAINT FK_history_invoice FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id), UNIQUE(medical_history_id));

CREATE INDEX idx_medical_history_id ON invoices (medical_history_id ASC);

CREATE TABLE treatments(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, type VARCHAR(50), name VARCHAR(100));

CREATE TABLE treatment_histories(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, history_id INT, treatment_id INT, FOREIGN KEY(history_id) REFERENCES medical_histories(id), FOREIGN KEY(treatment_id) REFERENCES treatments(id));

CREATE INDEX idx_treatment_id ON treatment_histories (treatment_id);
CREATE INDEX idx_history_id ON treatment_histories (history_id);

CREATE TABLE invoice_items(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, unit_price decimal, quantity INT, total_price decimal, invoice_id INT, treatment_id INT, FOREIGN KEY(invoice_id) REFERENCES invoices(id), FOREIGN KEY(treatment_id) REFERENCES treatments(id));

CREATE INDEX idx_invoice_id ON invoice_items (invoice_id ASC);
CREATE INDEX idx_treatment_id ON invoice_items (treatment_id);
