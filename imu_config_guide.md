# VectorNav VN-100 Configuration Guide
## This guide focuses on two primary adjustments: controlling the output frequency and selecting which data packets (bits) are sent by the sensor.
## Edit the launch file to use the vn_100_800hz.yaml, since that is what we are going to be using for our robots. 

## 1. Binary Output Register
The VN-100 that we are using has only 1 binary output register, so don't worry bout B02 and B03, focus on B01. 

## 2. Controlling the Frequency
The output frequency of the VN-100 is determined by the internal clock of the IMU (fixed at 800 Hz in the vn_100_800hz.yaml) and the rateDivisor parameter. The only thing we can change here is the rateDivisor parameter. 
The resulting frequency is 800 / rateDivisor. So if you want a frequency of 400, set rateDivisor to 2. 

## 3. Configuring the bits in B01
The commonField parameter uses a 16-bit bitmask to determine which data types are included in the binary message. Each bit corresponds to a specific sensor measurement. 
To turn a data field ON, the set its bit to 1. To turn it OFF, set it to 0.
However, from the operator side, this is not what we actually change in the .yaml file. We need to change the hex value at the commonField for it to take effect. 

## How to calculate the necessary Hex value: 

### I. Identify your bits: 
For example, sensor_msgs/Imu (Orientation, Gyro, Accel) + Startup Time, you need bits 0, 4, 5, and 8. 

### II. Create the Binary string 
Place a 1 in the positions of the bits you want (reading right to left).
Bits: 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
We want to turn on bits 0, 4, 5, and 8, so we set them to 1 at the 16-bit mask. 
Binary: 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 1 → 0000000100110001

### III. Convert to Hex
Divide the mask into quadruplets
0000 = 0
0001 = 1
0011 = 3
0001 = 1

Result: 0x0131

### IV. Update the commonField
commonField = 0x0131


