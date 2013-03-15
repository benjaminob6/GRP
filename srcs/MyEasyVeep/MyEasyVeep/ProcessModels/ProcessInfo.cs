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
        public Boolean AutoMode {get; set;}
        public AxShockwaveFlashObjects.AxShockwaveFlash Movie {get; set;}

        public ProcessInfo(AxShockwaveFlashObjects.AxShockwaveFlash Movie)
        {
            Sensors = new DigitalSensor[16];
            Actuators = new DigitalActuator[16];
            ProcessDescription = "SET DESCRIPTION";
            AutoMode = false;

            this.Movie = Movie;

            PopulateMovieDescription();
            PopulateDigitalSensors();
            PopulateDigitalActuators();
        }


        private void PopulateMovieDescription()
        {
            int ProcessDescriptionIndex = 0;
            string ProcessDescriptionLine = "";
            ProcessDescription = Movie.GetVariable("EprgName");

            //We are going to iterate through the process description variables until we hit and empty one
            do
            {
                //I'm not much for Hungarian, but this means English Program Description
                ProcessDescriptionLine = Movie.GetVariable(String.Format("EprgLeiras{0}", ProcessDescriptionIndex > 0 ? ProcessDescriptionIndex.ToString() : ""));
                ProcessDescription += " " + ProcessDescriptionLine;
                ProcessDescriptionIndex++;

            } while (ProcessDescription != "" && ProcessDescriptionIndex <= 10 );
        }

        private void PopulateDigitalSensors()
        {
            string SensorDescription = "";
            int SensorDescriptionIndex = 1;

            //Keep up the show for Actuators and Outputs
            do
            {
                SensorDescription = Movie.GetVariable(String.Format("EDigSens{0}", SensorDescriptionIndex));
                if ( SensorDescription != "" )
                    AddSensor(SensorDescription, SensorDescriptionIndex);

                SensorDescriptionIndex++;
            } while (SensorDescription != "" && SensorDescriptionIndex <= 16);
        }

        private void PopulateDigitalActuators()
        {
            string ActuatorDescription = "";
            int ActuatorDescriptionIndex = 1;

            //Keep up the show for Actuators and Outputs
            do
            {
                ActuatorDescription = Movie.GetVariable(String.Format("EDigAct{0}", ActuatorDescriptionIndex));
                if ( ActuatorDescription != "" )
                    AddActuator(ActuatorDescription, ActuatorDescriptionIndex);

                ActuatorDescriptionIndex++;
            } while (ActuatorDescription != "" && ActuatorDescriptionIndex <= 16);
        }

        public Boolean ToggleAutoMode()
        {
            string Auto = Movie.GetVariable("auto");
            if (Auto == "1")
            {
                Movie.SetVariable("auto", "0");
                AutoMode = false;
            }
            else
            {
                Movie.SetVariable("auto", "1");
                AutoMode = true;
            }

            return AutoMode;
        }

        public void AddSensor(string SensorRole, int SensorIndex)
        {
            DigitalSensor NewSensor = new DigitalSensor(SensorRole, SensorIndex);
            Sensors[SensorIndex - 1] = NewSensor;
        }

        public void AddSensor(string SensorRole, int SensorIndex, System.Windows.Forms.PictureBox Icon)
        {
            AddSensor(SensorRole,SensorIndex);
            Sensors.Last().Icon = Icon;
        }

        public void AddActuator(string ActuatorRole, int ActuatorIndex)
        {
            DigitalActuator NewActuator = new DigitalActuator(ActuatorRole, ActuatorIndex);
            Actuators[ActuatorIndex - 1] = NewActuator;
        }

        public void AddActuator(string ActuatorRole, int ActuatorIndex, System.Windows.Forms.PictureBox Icon)
        {
            AddActuator(ActuatorRole, ActuatorIndex);
            Actuators.Last().Icon = Icon;
        }

    }
}
