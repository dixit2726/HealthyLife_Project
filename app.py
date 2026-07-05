import streamlit as st
import pandas as pd
import joblib

# Page Configuration (must come first)
st.set_page_config(
    page_title="HealthyLife Clinic",
    page_icon="🏥",
    layout="wide"
)

# Load Model & Encoders
model = joblib.load("Model/logistic_model.pkl")
city_encoder = joblib.load("Model/city_encoder.pkl")
area_encoder = joblib.load("Model/area_encoder.pkl")
department_encoder = joblib.load("Model/department_encoder.pkl")
risk_encoder = joblib.load("Model/risk_encoder.pkl")

# Sidebar
st.sidebar.title("📊 Project Information")
st.sidebar.info("""
### Machine Learning Project

- Logistic Regression
- ROC-AUC Evaluation
- GridSearchCV
- Power BI Dashboard
- Streamlit Deployment
""")

# Header
st.title("🏥 HealthyLife Clinic")

st.markdown(
    "**Predict whether a patient is likely to churn based on demographic, billing, and visit history.**"
)

st.subheader("Patient Churn Prediction System")

st.write("---")

st.success("✅ Churn Prediction Model Loaded Successfully")
st.header("👤 Patient Information")

col1, col2 = st.columns(2)

with col1:
    age = st.number_input("Age", 1, 100, 30)

    gender = st.selectbox(
        "Gender",
        ["Male", "Female"]
    )

    city = st.selectbox(
        "City",
        city_encoder.classes_
    )

with col2:

    area = st.selectbox(
        "Area",
        area_encoder.classes_
    )

    department = st.selectbox(
        "Department",
        department_encoder.classes_
    )

    patient_status = st.selectbox(
        "Patient Status",
        ["Active Patient", "Churned Patient"]
    )


st.divider()


st.header("📅 Visit Information")

col1, col2 = st.columns(2)

with col1:

    visit_frequency = st.number_input(
        "Visit Frequency",
        min_value=0,
        value=5
    )

    returning_patient = st.selectbox(
        "Returning Patient",
        [0,1]
    )

    followup = st.selectbox(
        "Follow-up Required",
        ["No","Yes"]
    )

with col2:

    appointment_count = st.number_input(
        "Appointment Count",
        min_value=0,
        value=2
    )

    no_show_count = st.number_input(
        "No Show Count",
        min_value=0,
        value=0
    )

    last_visit_gap_days = st.number_input(
        "Last Visit Gap (Days)",
        min_value=0,
        value=30
    )


st.divider()


st.header("💰 Billing Information")

col1, col2 = st.columns(2)

with col1:

    avg_bill = st.number_input(
        "Average Bill Amount (INR)",
        min_value=0.0,
        value=2000.0
    )

    total_billing = st.number_input(
        "Total Billing",
        min_value=0.0,
        value=10000.0
    )

with col2:

    lifetime_value = st.number_input(
        "Lifetime Value (INR)",
        min_value=0.0,
        value=10000.0
    )


st.divider()


st.header("📊 Patient History")

col1, col2 = st.columns(2)

with col1:

    risk_level = st.selectbox(
        "Risk Level",
        risk_encoder.classes_
    )

    patient_tenure_days = st.number_input(
        "Patient Tenure (Days)",
        min_value=1,
        value=365
    )

    first_visit_year = st.number_input(
        "First Visit Year",
        min_value=2020,
        max_value=2035,
        value=2024
    )

    first_visit_month = st.number_input(
        "First Visit Month",
        min_value=1,
        max_value=12,
        value=1
    )

with col2:

    last_visit_year = st.number_input(
        "Last Visit Year",
        min_value=2020,
        max_value=2035,
        value=2025
    )

    last_visit_month = st.number_input(
        "Last Visit Month",
        min_value=1,
        max_value=12,
        value=6
    )
    gender = 0 if gender == "Male" else 1

patient_status = 0 if patient_status == "Active Patient" else 1

followup = 0 if followup == "No" else 1

city = city_encoder.transform([city])[0]
area = area_encoder.transform([area])[0]
department = department_encoder.transform([department])[0]
risk_level = risk_encoder.transform([risk_level])[0]

features = [[
    age,
    gender,
    city,
    area,
    department,
    returning_patient,
    visit_frequency,
    avg_bill,
    lifetime_value,
    patient_status,
    risk_level,
    followup,
    appointment_count,
    no_show_count,
    last_visit_gap_days,
    total_billing,
    patient_tenure_days,
    first_visit_year,
    last_visit_year,
    first_visit_month,
    last_visit_month
]]


if st.button("🔮 Predict Churn"):

    prediction = model.predict(features)[0]
    probability = model.predict_proba(features)[0][1]

    st.write("---")
    st.subheader("📋 Prediction Result")

    if prediction == 0:
        st.success("🟢 Patient is likely to remain ACTIVE")
    else:
        st.error("🔴 Patient is likely to CHURN")

    st.metric(
        "Churn Probability",
        f"{probability*100:.2f}%"
    )

    if probability < 0.30:
        st.success("🟢 Low Risk")
    elif probability < 0.70:
        st.warning("🟡 Medium Risk")
    else:
        st.error("🔴 High Risk")

    st.info(
        "Recommendation: Schedule a follow-up appointment and engage the patient proactively to reduce churn risk."
    )
st.sidebar.info("""
Machine Learning Project

✔ Logistic Regression

✔ Power BI Dashboard

✔ Streamlit Deployment
""")


st.write("---")
st.caption("Developed by Deekshit | HealthyLife Patient Churn Prediction System | 2026")

st.sidebar.title("📊 Project Information")

st.sidebar.success("Model: Logistic Regression")

st.sidebar.write("""
• Hyperparameter Tuning ✔️
• ROC-AUC Evaluation ✔️
• Power BI Dashboard ✔️
• Streamlit Deployment ✔️
""")
st.caption(
    "⚠️ This prediction is generated using a machine learning model and should be used only for educational purposes."
)