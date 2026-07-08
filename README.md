## Project: Patient Retention and Lifetime Value (LTV) Optimization
built during Ziro Digital Internship


# 🏥 HealthyLife Clinic – Patient Churn Prediction System

A complete Machine Learning and Data Analytics project that predicts whether a patient is likely to churn using demographic information, visit history, billing details, and patient behavior.

The project combines **Python, MySQL, Machine Learning, Power BI, and Streamlit** to help healthcare organizations identify high-risk patients and improve patient retention through data-driven decisions.

# ⚡ Quick Start

## 1. Clone the Repository

```bash
git clone https://github.com/dixit2726/HealthyLife_Project.git
```

---

## 2. Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 3. Project Structure

```text
HealthyLife_Project/
│
├── Dataset/
│   ├── Fact_Patient_LTV.csv
│   ├── Dim_Patient.csv
│   ├── Dim_Date.csv
│   ├── Dim_Department.csv
│   ├── Dim_Location.csv
│   └── Dim_Risk.csv
│
├── database/
│   └── master.sql
│
├── images/
│   ├── Dashboard_Page1.png
│   ├── Dashboard_Page2.png
│   └── Streamlit_App.png
│
├── models/
│   ├── logistic_model.pkl
│   ├── city_encoder.pkl
│   ├── area_encoder.pkl
│   ├── department_encoder.pkl
│   └── risk_encoder.pkl
│
├── app.py
├── HealthyLife_Project.ipynb
├── HealthyLife_Dashboard.pbix
├── README.md
└── requirements.txt
```

---

## 4. Run the Streamlit Application

### Clone the Repository

```bash
git clone https://github.com/dixit2726/HealthyLife_Project.git
```

### Navigate to the Project Folder

```bash
cd HealthyLife_Project
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Run the Application

```bash
streamlit run app.py
```

After running the command, open:

http://localhost:8501ealthyLife_Project/


---

# 📌 Problem Statement

Healthcare organizations often lose existing patients without identifying early warning signs.

Acquiring a new patient costs significantly more than retaining an existing one.

This project predicts patient churn in advance so clinics can improve retention through follow-up reminders, personalized engagement, and proactive healthcare services.

---

# 📊 Dataset Overview

**Dataset Type**

Synthetic Healthcare Dataset

**Total Records**

20,000+ Patient Records

---

# 📂 Data Columns Used

| Column | Description |
|----------|-------------|
| Age | Patient Age |
| Gender | Male / Female |
| City | Patient City |
| Area | Residential Area |
| Department | Medical Department |
| Visit_Frequency | Number of Visits |
| Returning_Patient | Existing Patient |
| Followup_Required | Follow-up Required |
| Appointment_Count | Total Appointments |
| No_Show_Count | Missed Appointments |
| Avg_Bill_Amount | Average Bill Amount |
| Total_Billing | Total Revenue Generated |
| Lifetime_Value | Patient Lifetime Value |
| Risk_Level | Low / Medium / High |
| Patient_Tenure | Days with Clinic |
| First_Visit_Year | First Visit Year |
| First_Visit_Month | First Visit Month |
| Last_Visit_Year | Last Visit Year |
| Last_Visit_Month | Last Visit Month |
| Patient_Status | Active / Churned (Target) |

---

# 🤖 Machine Learning

### Data Preprocessing

- Data Cleaning
- Missing Value Handling
- Label Encoding
- Feature Engineering

### Model

- Logistic Regression

### Hyperparameter Tuning

- GridSearchCV

### Model Evaluation

- Accuracy Score
- ROC-AUC Score
- Confusion Matrix
- Classification Report

---

# 📊 Power BI Dashboard

The project contains **2 Interactive Dashboard Pages**.

### Dashboard 1

- KPI Cards
- Total Patients
- Active Patients
- Churn Rate
- Revenue Analysis
- Department Analysis

### Dashboard 2

- Patient Risk Analysis
- Visit Frequency Analysis
- Billing Trends
- Monthly Analysis
- Interactive Filters

---

# 🌐 Streamlit Application

Features included:

- Patient Information Form
- Visit Information
- Billing Information
- Patient History
- Churn Prediction
- Churn Probability
- Risk Classification
- Recommendation System

---

# 🗄 MySQL

Database Operations:

- Database Creation
- Table Creation
- Data Import
- SQL Queries
- Data Validation

---

# 🛠 Tech Stack

- 🐍 Python
- 📊 Pandas
- 🔢 NumPy
- 🤖 Scikit-learn
- 📈 Power BI
- 🗄 MySQL
- 🌐 Streamlit
- 💾 Joblib
- 📓 Jupyter Notebook

---

# 🚀 Project Workflow

```
Healthcare Dataset
        │
        ▼
     MySQL Database
        │
        ▼
 Data Cleaning & EDA
        │
        ▼
 Feature Engineering
        │
        ▼
 Logistic Regression
        │
        ▼
 Hyperparameter Tuning
 (GridSearchCV)
        │
        ▼
 Saved Model (.pkl)
        │
        ▼
 Streamlit Application
        │
        ▼
 Patient Churn Prediction
```

# 📸 Project Screenshots

## 📊 Power BI Dashboard

### Dashboard - Page 1

![Dashboard Page 1](images/Dashboard_Page1.png)

---

### Dashboard - Page 2

![Dashboard Page 2](images/Dashboard_Page2.png)

---

## 🌐 Streamlit Application

![Streamlit App](images/Streamlit_App.png)

---

# 👨‍💻 Developed By

## Deekshit Vaddepally

**Machine Learning | Data Analytics | Power BI | MySQL | Streamlit | Python**

GitHub:
https://github.com/dixit2726

Project Repository:
https://github.com/dixit2726/HealthyLife_Project

---

⭐ **If you found this project helpful, please consider giving it a Star on GitHub!**
