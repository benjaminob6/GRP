using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyEasyVeep.ProcessModels
{
    public class DigitalSensor
    {
        public int SensorIndex { get; set; }
        public string SensorRole { get; set; }

        public DigitalSensor(string SensorRole, int SensorIndex)
        {
            this.SensorIndex = SensorIndex;
            this.SensorRole = SensorRole;
        }                    
    }
}
