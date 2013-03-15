using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyEasyVeep.ProcessModels
{
    public class ProcessInfo
    {
        public string ProcessDescription { get; set; }
        public DigitalSensor[] Sensors { get; set; }
        public DigitalActuator[] Actuators { get; set; }

        //private Boolean AutoAvailable;
        //private Boolean Auto;

        public ProcessInfo()
        {
            Sensors = new DigitalSensor[16];
            Actuators = new DigitalActuator[16];
            ProcessDescription = "SET DESCRIPTION";
        }

        public void AddSensor(string SensorRole, int SensorIndex)
        {
            DigitalSensor NewSensor = new DigitalSensor(SensorRole, SensorIndex);
            Sensors[SensorIndex - 1] = NewSensor;
        }

        public void AddActuator(string ActuatorRole, int ActuatorIndex)
        {
            DigitalActuator NewActuator = new DigitalActuator(ActuatorRole, ActuatorIndex);
            Actuators[ActuatorIndex - 1] = NewActuator;
        }
    }
}
