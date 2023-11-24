# Panda-IK
<p align="center">
    <img src="assets/panda_ik.gif">
</p>

Based upon [this work](https://github.com/ffall007/franka_analytical_ik), this shared library provides an easy-to-use interface for the analytical inverse kinematics solver for the Franka Emika Panda robot. The available functionalities are callable from both C++ and Python. A Python example is provided [here](python/example.py).

## Installation

```
git clone git@github.com:Anatr1/panda-IK.git
cd panda-IK
make configure
make build
make install
```

## Usage

### C++

To obtain an array of doubles corresponding to the joint angles of the robot for a given end-effector pose, use the following function:

```cpp
#include <panda_ik.hpp>

// ...

std::array<double, 7> result = compute_inverse_kinematics(array<double, 6> xyzrpy, array<double, 7> q_actual);

```
```xyzrpy``` is an array of doubles containing the desired end-effector pose in the format [x, y, z, roll, pitch, yaw]. ```q_actual``` is an array of doubles containing the current joint angles of the robot. ```result``` will contain the solution, if any, for the given input. If no solution is found, the function will return the current joint angles of the robot.

### Python

To obtain an array of doubles corresponding to the joint angles of the robot for a given end-effector pose, use the following function:

```python
import ctypes

# Load the shared library
pandaik_lib = ctypes.CDLL('/usr/local/diana/lib/libPanda-IK.so')

# Define the argument types and return type
pandaik_lib.compute_inverse_kinematics_void.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
pandaik_lib.compute_inverse_kinematics_void.restype = None

xyzrpy = (ctypes.c_double * 6)(X, Y, Z, ROLL, PITCH, YAW)
q_actual = (ctypes.c_double * 7)(Q1, Q2, Q3, Q4, Q5, Q6, Q7)
output = (ctypes.c_double * 7)()

# Call a function from the library
pandaik_lib.compute_inverse_kinematics_void(xyzrpy, q_actual, output)
```

```X, Y, Z, ROLL, PITCH, YAW``` are the desired end-effector pose. ```Q1, Q2, Q3, Q4, Q5, Q6, Q7``` are the current joint angles of the robot. ```output``` will contain the solution, if any, for the given input. If no solution is found, the function will return the current joint angles of the robot.
