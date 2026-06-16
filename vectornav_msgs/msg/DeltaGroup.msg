# Custom msg field added by Mecatron
# Used to preserve the dtheta, dtime and dvel sent by the IMU

std_msgs/Header header

float32                     deltatheta_dtime
geometry_msgs/Vector3       deltatheta_dtheta
geometry_msgs/Vector3       deltatheta_dvel