# Modeling Isentropic Flow and Fanno Flow

This repository contains an assignment for the **Fluid Dynamics II (ME455)** course at **Bogazici University**, 
Mechanical Engineering Department. This assignment includes simple engineering models to analyze subsonic and 
supersonic flow in converging-diverging and adiabatic ducts, incorporating isentropic flow, shock positioning, and friction effects using computational methods.

---

## Problem Description

This assignment focuses on the simulation and computational modeling of compressible fluid flow through ducts under varying conditions:

1. **Flow Through a Converging-Diverging Duct**:
   - Air enters subsonically from the standard atmosphere and flows isentropically through a converging-diverging duct with a circular cross-sectional area varying with axial distance.
   - The task involves analyzing a standing normal shock at a specified position and developing an iterative computational method to determine the shock location for various pressure ratios.

2. **Subsonic Flow Through an Adiabatic Duct**:
   - Subsonic airflow accelerates through an adiabatic duct with a given friction factor until it reaches a Mach number of unity.
   - The objective is to compute the required duct lengths for different Mach numbers and analyze the results for two working fluids: air and helium.

An illustration of the converging-diverging duct is provided below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/531b9d73-bc07-451e-b033-beb57a88a7c8" alt="Converging-Diverging Duct" width="600">
</p>

---

## Mathematical Model

### Question 1:

The area variation of the duct is given as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/26ea8a13-c003-4e9b-9331-78b3fcbe1d08" alt="Duct Area Variation" width="450">
</p>

The governing equation relating the critical area and the area of the shock is given below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/54eb1895-1131-4cf0-8877-cb7eb67a9a87" alt="Critical Area and Shock Relation" width="450">
</p>

The ratio of the pressure before (P<sub>x</sub>) and after the shock (P<sub>y</sub>) is given below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/78c47047-02b1-40f4-b4f2-6cd6d245b92c" alt="Pressure Ratio Across the Shock" width="450">
</p>

### Question 2:

The Fanno flow equation governing the relationship between duct length (l) and Mach number (M) is given below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/d99683d4-d062-4399-a87b-560525ee3f54" alt="Fanno Flow Equation" width="450">
</p>

The methodology and the equations are explained more thoroughly in the report.


---

## Task

The following tasks are to be completed as part of this assignment:

### Analysis

**1a. Standing Normal Shock Analysis**:
- Compute the pressure ratio (P<sub>2</sub>/P<sub>01</sub>) for a shock at **x = 0.4 m**.
- Determine stagnation pressure loss across the shock.

**1b. Iterative Shock Location Analysis**:
- Develop an iterative procedure to compute the shock location for pressure ratios **P<sub>2</sub>/P<sub>01</sub> = 0.4, 0.6, 0.8**.
- Plot the pressure ratio against the shock location.

**2. Fanno Flow Analysis**:
- Calculate the duct length required to accelerate flow to Mach 1 for air and helium.
- Analyze and plot the duct length against Mach number at intervals of 0.1 (**0.1 ≤ M ≤ 1**).

---

## Repository Structure

This repository is organized as follows:

1. **`figures/`**: Contains plots and visualizations of the results, such as pressure ratios and Mach number distributions.

2. **`report/`**: Contains the project report explaining the mathematical models, methodology, and analysis of results.

3. **`src/`**: Contains MATLAB scripts for solving and analyzing compressible flow problems, including shock positioning and Fanno flow calculations.

5. **`README.md`**: Provides an overview of the project, objectives, and instructions for using the MATLAB scripts and interpreting the outcomes.

