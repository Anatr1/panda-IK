import ctypes

# Load the shared library
pandaik_lib = ctypes.CDLL('/usr/local/diana/lib/libPanda-IK.so')

# Define the argument types and return type
pandaik_lib.compute_inverse_kinematics_void.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
pandaik_lib.compute_inverse_kinematics_void.restype = None

xyzrpy = (ctypes.c_double * 6)(0.4, 0.0, 0.6, 45.0, -45.0, 0.0)
q_actual = (ctypes.c_double * 7)(-0.29, -0.176, -0.232, -0.67, 1.04, 2.56, 0.0)
output = (ctypes.c_double * 7)()

# Call a function from the library
result = pandaik_lib.compute_inverse_kinematics_void(xyzrpy, q_actual, output)
print("Result from C++:", list(output))  # Assuming the function returns an array of 7 doubles
# Should print: Result from C++: [0.8867046650124633, -1.3398493172549706, -0.7760786149655098, -2.652291962842672, 2.2357825028981364, 2.737863867200816, 0.0]
