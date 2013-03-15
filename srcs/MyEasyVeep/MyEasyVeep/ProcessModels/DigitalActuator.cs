using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MyEasyVeep.ProcessModels
{
    public class DigitalActuator
    {
        public int ActuatorIndex { get; set; }
        public string ActuatorRole { get; set; }
        public static AxShockwaveFlashObjects.AxShockwaveFlash activeMovie { get; set; }
        public PictureBox Icon {get; set;}

        public DigitalActuator(string ActuatorRole, int ActuatorIndex)
        {
            this.ActuatorIndex = ActuatorIndex;
            this.ActuatorRole = ActuatorRole;

            //Initialize all Actuator Values to Zero to begin. This fixes stuff
            SetActuatorValue("0");
        }                    

        public DigitalActuator(string ActuatorRole, int ActuatorIndex, PictureBox Icon) : this(ActuatorRole,ActuatorIndex)
        {
            if (Icon != null)
            {
                Icon.Enabled = true;
                Icon.Image = MyEasyVeep.Properties.Resources.Actuator_Off;
            }
        }                    


        //This may throw exceptions, be ready
        public string GetActuatorValue()
        {
            return activeMovie.GetVariable(String.Format("DA{0}", this.ActuatorIndex));
        }

        public void SyncActuatorValue()
        {
            if (Icon != null)
                Icon.Image = GetActuatorValue() == "1" ? MyEasyVeep.Properties.Resources.Actuator_On : MyEasyVeep.Properties.Resources.Actuator_Off;
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

            if (Icon != null)
                Icon.Image = NewActuatorValue == 1 ? MyEasyVeep.Properties.Resources.Actuator_On : MyEasyVeep.Properties.Resources.Actuator_Off;

            return NewActuatorValue;
        }
    }
}
