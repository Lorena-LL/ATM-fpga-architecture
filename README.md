# ATM-fpga-architecture

This repository contains the VHDL implementation of an ATM (Automated Teller Machine) architecture designed for the **Nexys 4 FPGA**. The project models the core functionalities of an ATM system for banking, including user authentication, account balance inquiries, cash withdrawals, deposits and transfers to another account.

## User Manual
### PIN Entry
Initially, the ATM waits for a 4-digit PIN to be entered using the four switches (sw3, sw2, sw1, sw0), during which the **Insert_PIN** LED will be ON. Once the PIN is entered, pressing the **OK** button will trigger the verification process. 
- If the PIN is **valid**, the **selectOP** LED turns ON, indicating the ATM is waiting for an operation to be selected.
- If the PIN is **invalid**, the **ERROR** LED turns ON.

### Operation Selection
Operations are selected using the **sw0_optiuni** and **sw1_optiuni** switches:
- **00** – Balance Inquiry
- **01** – Withdrawal
- **10** – Deposit
- **11** – Transfer

After selecting an operation, the **OK** button must be pressed. Once an operation is completed, the **OP_FIN** LED turns ON, and the user can press **OK** again to choose another operation. The user can press the **DELETE_EXIT** button to return to PIN entry or reset the entered PIN.

### Balance Inquiry
After pressing **OK**, the account balance is displayed on the **7-segment display**.

### Withdrawal
Users can choose from **six predefined withdrawal amounts** or enter a custom amount using the PIN input switches, in multiples of 10.
- If the requested amount is available in both the user’s account and the ATM, the **calculating** LED turns ON while the ATM determines the required banknotes.
- If the operation **succeeds**, the result is displayed on the **7-segment display**.
- If the operation **fails**, the **ERROR** LED turns ON.

### Deposit
Users specify the number of banknotes of each type they wish to deposit. The ATM’s cash storage is updated accordingly.

### Transfer
- Users first enter the PIN of the target account.
- Then, they input the transfer amount.
- The system checks the balance of the current account.
- If sufficient funds are available, the balance is updated for both accounts.

## Requirements
- **FPGA Board:** Digilent Nexys 4 
- **Development Tools:** Xilinx Vivado 
- **VHDL Simulation:** ModelSim or equivalent simulator

## Getting Started 
1. Clone the repository
2. Create a project in Vivado and add all the .vhd files
3. Add a constraints file for the Nexis 4 board (XC7A100T-1CSG324C)
4. Synthesize and implement the design
5. Program the FPGA and test the functionality

## Acknowledgments
We completed the project under the guidance of the teachers at the Technical University of Cluj-Napoca.
