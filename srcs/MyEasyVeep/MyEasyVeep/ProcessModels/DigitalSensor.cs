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
        public static AxShockwaveFlashObjects.AxShockwaveFlash activeMovie { get; set; }

        public DigitalSensor(string SensorRole, int SensorIndex)
        {
            this.SensorIndex = SensorIndex;
            this.SensorRole = SensorRole;
        }

        //This may throw exceptions, be ready
        public string GetSensorValue()
        {
            return activeMovie.GetVariable(String.Format("DS{0}", this.SensorIndex));
        }

        public void SetSensorValue(string value)
        {
            activeMovie.SetVariable(String.Format("DS{0}", this.SensorIndex),value);
        }

    }
}
