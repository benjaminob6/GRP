using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace MyEasyVeep.ProcessModels
{
    public class DigitalSensor
    {
        public int SensorIndex { get; set; }
        public string SensorRole { get; set; }
        public static AxShockwaveFlashObjects.AxShockwaveFlash activeMovie { get; set; }

        public PictureBox Icon {get; set;}

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

        public string UpdateSensorDisplay()
        {
            string CurrentValue = GetSensorValue();

            if (Icon != null)
                Icon.Image = CurrentValue == "1" ? MyEasyVeep.Properties.Resources.Sensor_On : MyEasyVeep.Properties.Resources.Sensor_Off;

            return CurrentValue;
        }

        public void SetSensorValue(string value)
        {
            activeMovie.SetVariable(String.Format("DS{0}", this.SensorIndex),value);
        }

    }
}
