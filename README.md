# FPGA Implementations of the Sigmoid Function

This repository provides a collection of hardware descriptions (in VHDL) of different **sigmoid function implementations on FPGA**.  
The goal is to make available reproducible implementations that allow **comparison of accuracy, resource usage, and performance** across different approximation methodologies.

The implementations include reproductions of published works from the literature as well as two original designs we developed:  
- one optimized for **minimum average error** (also available in Verilog),  
- one optimized for **minimum maximum error**.  

---

## Structure of the Repository

- `src/` — VHDL source files for each implementation.  
  - Each implementation is provided as a **pair of files**:  
    - one file containing the **sigmoid description** in VHDL,  
    - one file containing the **constant definitions** used in that implementation.  

- `tools/` — Utility programs. Includes:  
  - `searchBoundaries.m` — An Octave script that calculates the **approximation boundaries** for the approximation proposed, according to the optimization goal (minimizing either **mean error** or **maximum error**).  

---

## Associated Publication

The methods and results implemented in this repository are described in the following peer-reviewed article:

> **An Area-Efficient and Low-Error FPGA-Based Sigmoid Function Approximation**  
> Vinicius de Azevedo Bosso, Ricardo Masson Nardini, Miguel Angelo de Abreu de Sousa,  
> Sara Dereste dos Santos, Ricardo Pires  
> *Applied Sciences*, vol. 15, no. 21, article 11551, 2025.  
> DOI: https://doi.org/10.3390/app152111551

---

## Citation

If you find this code useful in your research, **please consider citing**:

BibTeX example:

```bibtex
@article{Bosso2025SigmoidFPGA,
  title   = {An Area-Efficient and Low-Error FPGA-Based Sigmoid Function Approximation},
  author  = {Bosso, Vinicius de Azevedo and Nardini, Ricardo Masson and Sousa, Miguel Angelo de Abreu de and Santos, Sara Dereste dos and Pires, Ricardo},
  journal = {Applied Sciences},
  volume  = {15},
  number  = {21},
  pages   = {11551},
  year    = {2025},
  doi     = {10.3390/app152111551}
}

---

## License

This project is released under the **Apache 2.0** for academic and research purposes.  
Please check the `LICENSE` file for details.
