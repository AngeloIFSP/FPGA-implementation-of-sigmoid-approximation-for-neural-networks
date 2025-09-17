# FPGA Implementations of the Sigmoid Function

This repository provides a collection of hardware descriptions (in VHDL) of different **sigmoid function implementations on FPGA**.  
The goal is to make available reproducible implementations that allow **comparison of accuracy, resource usage, and performance** across different approximation methodologies.

The implementations include reproductions of published works from the literature as well as two original designs we developed:  
- one optimized for **minimum mean error**,  
- one optimized for **minimum maximum error**.  

---

## References Implemented

- Z. Pan, Z. Gu, X. Jiang, G. Zhu, and D. Ma,  
  *A modular approximation methodology for efficient fixed-point hardware implementation of the sigmoid function*,  
  IEEE Transactions on Industrial Electronics, vol. 69, no. 10, pp. 10694–10703, 2022.

- Z. Li, Y. Zhang, B. Sui, Z. Xing, and Q. Wang,  
  *FPGA implementation for the sigmoid with piecewise linear fitting method based on curvature analysis*,  
  Electronics, vol. 11, no. 9, p. 1365, 2022.

- S. Vassiliadis, M. Zhang, J. G. Delgado-Frias,  
  *Elementary function generators for neural-network emulators*,  
  IEEE Transactions on Neural Networks, vol. 11, no. 6, pp. 1438–1449, 2000.

- F. Liu et al.,  
  *A novel configurable high-precision and low-cost circuit design of sigmoid and tanh activation function*,  
  2021 IEEE International Conference on Integrated Circuits, Technologies and Applications (ICTA), IEEE, 2021.

- A. Vaisnav et al.,  
  *FPGA implementation and comparison of sigmoid and hyperbolic tangent activation functions in an artificial neural network*,  
  2022 International Conference on Electrical, Computer and Energy Technologies (ICECET), IEEE, 2022.

- I. Tsmots, O. Skorokhoda, and V. Rabyk,  
  *Hardware implementation of sigmoid activation functions using FPGA*,  
  2019 IEEE 15th International Conference on the Experience of Designing and Application of CAD Systems (CADSM), IEEE, 2019.

- **Our implementations**:  
  - Sigmoid optimized for **minimum mean error**.  
  - Sigmoid optimized for **minimum maximum error**.  

---

## Structure of the Repository

- `src/` — VHDL source files for each implementation.  
- `docs/` — Additional notes and comparisons.  
- `tests/` — Testbenches and simulation results.  

---

## Usage

Each implementation can be synthesized and tested on FPGA boards from Xilinx, Altera or other compatible devices.  
Instructions on compilation, synthesis, and testing will be provided in the `docs/` folder.  

---

## Citation

If you use or reference this repository in academic work, please cite the corresponding original publications listed above and mention this repository as the source of comparative implementations.  

---

## License

This project is released under the **Apache 2.0** for academic and research purposes.  
Please check the `LICENSE` file for details.
