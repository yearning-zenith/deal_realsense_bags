%deal with intel realsense .bag file
trace_1=rosbag('20191022_154452.bag');

%bagselect1 = select(trace_1,'Topic','/device_0/sensor_1/Color_0/image/data');
bagselect1 = select(trace_1,'Topic','/device_0/sensor_0/Depth_0/image/data');
%bagselect1 = select(trace_1,'Topic','/device_0/sensor_2/Gyro_0/imu/data');

%select time
start_time = 9;
end_time = 10;
bagselect3 = select(bagselect1, 'Time', [start_time end_time]);

msgs = readMessages(bagselect3);
size_imgs = size(msgs);
for i=1:size_imgs(1)
    read_image=readImage(msgs{1,1});
    imwrite(read_image, sprintf('depth/%06f_depth.png',i));
    %imshow(read_image);
end
