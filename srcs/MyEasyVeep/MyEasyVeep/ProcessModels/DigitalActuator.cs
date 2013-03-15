using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyEasyVeep.ProcessModels
{
    public class DigitalActuator
    {
        public int ActuatorIndex { get; set; }
        public string ActuatorRole { get; set; }
        public static AxShockwaveFlashObjects.AxShockwaveFlash activeMovie { get; set; }

        public DigitalActuator(string ActuatorRole, int ActuatorIndex)
        {
            this.ActuatorIndex = ActuatorIndex;
            this.ActuatorRole = ActuatorRole;
        }                    

        //This may throw exceptions, be ready
        public string GetActuatorValue()
        {
            return activeMovie.GetVariable(String.Format("DA{0}", this.ActuatorIndex));
        }

        public void SetActuatorValue(string value)
        {
            activeMovie.SetVariable(String.Format("DA{0}", this.ActuatorIndex),value);
        }

        public int ToggleActuator()
        {
            string CurrentValue = GetActuatorValue();
            int NewActuatorValue = CurrentValue == "1" ? 0 : 1;

            SetActuatorValue(NewActuatorValue.ToString());

            return NewActuatorValue;
        }
    }
}
