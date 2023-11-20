#include <iostream>
#include "franka_ik_He.hpp"

using namespace std;

/**
 * Converts xyzrpy to transformation matrix in column-major order.
 * @param xyzrpy array of 6 doubles in the order of [x, y, z, roll, pitch, yaw].
 * @return array of 16 doubles in column-major order.
 */
array<double, 16> from_xyzrpy2transformation_matrix(array<double, 6> xyzrpy) {
    array<double, 16> result;
    double x = xyzrpy[0];
    double y = xyzrpy[1];
    double z = xyzrpy[2];
    double roll = xyzrpy[3];
    double pitch = xyzrpy[4];
    double yaw = xyzrpy[5];

    // Convert roll, pitch, and yaw to radians
    roll = roll * M_PI / 180.0;
    pitch = pitch * M_PI / 180.0;
    yaw = yaw * M_PI / 180.0;

    // Calculate transformation matrix elements
    double cosRoll = cos(roll);
    double sinRoll = sin(roll);
    double cosPitch = cos(pitch);
    double sinPitch = sin(pitch);
    double cosYaw = cos(yaw);
    double sinYaw = sin(yaw);

    result[0] = cosYaw * cosPitch;
    result[4] = sinYaw * cosPitch;
    result[8] = -sinPitch;
    result[12] = x;

    result[1] = cosYaw * sinPitch * sinRoll - sinYaw * cosRoll;
    result[5] = sinYaw * sinPitch * sinRoll + cosYaw * cosRoll;
    result[9] = cosPitch * sinRoll;
    result[13] = y;

    result[2] = cosYaw * sinPitch * cosRoll + sinYaw * sinRoll;
    result[6] = sinYaw * sinPitch * cosRoll - cosYaw * sinRoll;
    result[10] = cosPitch * cosRoll;
    result[14] = z;

    result[3] = 0.0;
    result[7] = 0.0;
    result[11] = 0.0;
    result[15] = 1.0;

    return result;
}

/**
 * Computes inverse kinematics for the Panda robot.
 * @param xyzrpy array of 6 doubles in the order of [x, y, z, roll, pitch, yaw].
 * @param q_actual array of 7 doubles representing the current joint angles.
 * @return array of 7 doubles representing the computed joint angles.
 */
array<double, 7> compute_inverse_kinematics(array<double, 6> xyzrpy, array<double, 7> q_actual) {
    // Compute inverse kinematics available solutions
    array<array<double, 7>, 4> available_solutions = franka_IK_EE(from_xyzrpy2transformation_matrix(xyzrpy), 0, q_actual);

    // Discard any solution with nan values
    array<array<double, 7>, 4> filtered_solutions;
    int index = 0;
    for (int i = 0; i < 4; i++) {
        bool has_nan = false;
        for (int j = 0; j < 7; j++) {
            if (isnan(available_solutions[i][j])) {
                has_nan = true;
                break;
            }
        }
        if (!has_nan) {
            filtered_solutions[index] = available_solutions[i];
            index++;
        }
    }

    // If no solutions, return current joint angles
    if (index == 0) {
        // cout << "NO SOLUTIONS FOUND" << endl;
        return q_actual;
    }

    // Select solution with smallest joint angle difference from q_actual
    double min_diff = 1000.0;
    int min_index = 0;
    for (int i = 0; i < index; i++) {
        double diff = 0.0;
        for (int j = 0; j < 7; j++) {
            diff += abs(filtered_solutions[i][j] - q_actual[j]);
        }
        if (diff < min_diff) {
            min_diff = diff;
            min_index = i;
        }
    }

    // Return solution with smallest joint angle difference from q_actual
    return filtered_solutions[min_index];
}

extern "C" {
    /**
     * Computes inverse kinematics for the Panda robot.
     * Same as compute_inverse_kinematics, but instead of returning the result, it stores it in the output array.
     * @param xyzrpy array of 6 doubles in the order of [x, y, z, roll, pitch, yaw].
     * @param q_actual array of 7 doubles representing the current joint angles.
     * @param output array of 7 doubles representing the computed joint angles.
     * @return void.
     */
    void compute_inverse_kinematics_void(const std::array<double, 6> &xyzrpy, const std::array<double, 7> &q_actual, std::array<double, 7> &output) {
        output = compute_inverse_kinematics(xyzrpy, q_actual);
        
        return;
    }
}