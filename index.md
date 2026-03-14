---
layout: default
title: Welcome
---

# Charlie Cameron

PhD student in the **SAMBa CDT** at the **University of Bath**, working on mathematical models of spatial biological systems.

My research focuses on **reaction–diffusion models**, which describe how interacting species evolve and spread through space. These models arise in many areas of biology and physics, including population invasion, morphogen gradient formation, and pattern formation in ecological systems.

I develop **hybrid computational methods** that allow these systems to be simulated efficiently while preserving the key dynamics that arise when particle numbers are small.

---

## Research

My work centres on the **Spatial Regime Conversion Method (SRCM)** — a hybrid modelling framework for spatial reaction–diffusion systems.

The method allows different mathematical representations of a system to be used in different regions of space, adapting dynamically during the simulation. Regions with low particle numbers are treated using a stochastic description, while regions with high concentrations are represented using a continuum model. This allows the simulation to retain important stochastic effects while remaining computationally efficient.

Unlike many hybrid approaches, the SRCM does not require a fixed interface between modelling regimes. Instead, the representation used at each location changes automatically according to the local state of the system.

---

## Paper

📄 **The Spatial Regime Conversion Method**

C. G. Cameron, C. A. Smith, C. A. Yates  
*Mathematics*, 13(21), 3406 (2025)

The paper introduces the full mathematical framework for the SRCM, including the conversion mechanisms that allow the stochastic and continuum descriptions to interact consistently. The method is validated on several spatial systems, including diffusion problems, morphogen gradient formation, and travelling waves. :contentReference[oaicite:1]{index=1}

🔗 https://www.mdpi.com/2227-7390/13/21/3406

---

## Code

I maintain a **research codebase implementing the Spatial Regime Conversion Method** for spatial reaction–diffusion systems.

The toolbox includes:

- implementations of the SRCM framework
- example simulations for travelling waves and other spatial systems
- tools for analysing hybrid stochastic–deterministic simulations

🐙 **GitHub**  
https://github.com/cgyc20/SRCM_KPP

---

## Supervision

- **Prof Kit Yates** — Department of Mathematical Sciences, University of Bath  
- **Dr Cameron Smith** — Department of Mathematical Sciences, University of Bath  

---

## Contact

📧 cgyc20@bath.ac.uk  
🐙 https://github.com/cgyc20