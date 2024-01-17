function system(block)
    setup(block);

function setup(block)
    % Define the number of input and output ports
    block.NumInputPorts  = 7;  % Number of input signals
    block.NumOutputPorts = 1;  % Number of output ports for notifications

    % Configure input and output ports
    for i = 1:7
        block.InputPort(i).Dimensions  = 1;  % Each input signal is scalar
    end

    block.OutputPort(1).Dimensions = 1;  % Notification output is scalar

    % Register that the S-function can have one or more output sample times
    block.SampleTimes = [-1 0];  % Inherited sample time

    % Define parameters for the rules (you can customize these)
    engineRPMThreshold = 3000;  % Example threshold for high engine RPM
    throttlePositionThreshold = 40;  % Example threshold for low throttle position
    oxygenSensorThreshold = 0.2;  % Example threshold for low oxygen sensor reading

    % Define example notification messages for each rule
    notificationMessages = {
        'Rule 1: High RPM, Low Throttle, Low Oxygen - Engine misfire or performance degradation',
        'Rule 2: High Coolant Temperature, High Throttle - Engine overheating and potential performance issues',
        'Rule 3: Low Fuel Pressure, High Oxygen Sensor - Fuel system fault',
        'Rule 4: High Exhaust Gas Temperature, Low Throttle - Exhaust or combustion issues',
        'Rule 5: Low RPM or Low Coolant Temperature - Potential engine problems',
        'Rule 6: Low Transmission Gear and Low Fuel Pressure - Power delivery issues',
        'Rule 7: Normal Coolant Temperature, Throttle, and Oxygen Sensor - Normal engine operation',
        'Rule 8: High RPM, Low Coolant Temperature, Normal Throttle - Engine stress',
        'Rule 9: High Fuel Pressure, High Coolant Temperature, Low Oxygen Sensor - Overheating and fuel issues',
        'Rule 10: High Transmission Gear, High Throttle, High Coolant Temperature - Engine stress'
    };

function Outputs(block)
    % Initialize the notification message
    notificationMessage = '';

    % Check each rule and generate a notification message if a rule is satisfied
    if (block.InputPort(1).Data > engineRPMThreshold) && ...
       (block.InputPort(2).Data < throttlePositionThreshold) && ...
       (block.InputPort(3).Data < oxygenSensorThreshold)
        notificationMessage = notificationMessages{1};
    elseif ...  % Add conditions for other rules here
        ...
    end

    % Output the notification message
    block.OutputPort(1).Data = notificationMessage;
