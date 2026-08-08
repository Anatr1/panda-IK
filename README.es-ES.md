

# Panda-IK
<p align="center">
    <img src="assets/panda_ik.gif">
</p>

Basado en [este trabajo](https://github.com/ffall007/franka_analytical_ik), esta biblioteca compartida proporciona una interfaz fácil de usar para el solucionador de cinemática inversa analítica del robot Franka Emika Panda. Las funcionalidades disponibles son invocables tanto desde C++ como desde Python. Un ejemplo en Python se proporciona [aquí](python/example.py).

## Instalación

```
git clone git@github.com:Anatr1/panda-IK.git
cd panda-IK
make configure
make build
make install
```

## Uso

### C++

Para obtener un arreglo de dobles correspondiente a los ángulos articulares del robot para una pose dada del efector final, utiliza la siguiente función:

```cpp
#include <panda_ik.hpp>

// ...

std::array<double, 7> result = compute_inverse_kinematics(array<double, 6> xyzrpy, array<double, 7> q_actual);

```
```xyzrpy``` es un arreglo de dobles que contiene la pose deseada del efector final en el formato [x, y, z, roll, pitch, yaw]. ```q_actual``` es un arreglo de dobles que contiene los ángulos articulares actuales del robot. ```result``` contendrá la solución, en caso de existir, para la entrada proporcionada. Si no se encuentra ninguna solución, la función devolverá los ángulos articulares actuales del robot.

### Python

Para obtener un arreglo de dobles correspondiente a los ángulos articulares del robot para una pose dada del efector final, utiliza la siguiente función:

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

```X, Y, Z, ROLL, PITCH, YAW``` son la pose deseada del efector final. ```Q1, Q2, Q3, Q4, Q5, Q6, Q7``` son los ángulos articulares actuales del robot. ```output``` contendrá la solución, en caso de existir, para la entrada proporcionada. Si no se encuentra ninguna solución, la función devolverá los ángulos articulares actuales del robot.
