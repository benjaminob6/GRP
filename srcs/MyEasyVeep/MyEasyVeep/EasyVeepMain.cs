using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Timers;

using System.Windows.Forms;
using System.IO;

using MyEasyVeep.ProcessModels;
using MyEasyVeep.Properties;

namespace MyEasyVeep
{
    public partial class EasyVeepMain : Form
    {
        private List<PictureBox> SensorIndicators = new List<PictureBox>();
        private List<PictureBox> ActuatorIndicators = new List<PictureBox>();
        private ProcessInfo movieInfo;
        private SerialMonitor MonitorWindow;
        private string LastSensorValues;
        private string CurrentCommand;
        private Boolean EasyPortConnected = false;
        
        public EasyVeepMain()
        {
            InitializeComponent();

            connectionTimeoutTimer.Tick += new EventHandler(connectionTimeoutTimer_Tick);
        }

        /// <summary>
        /// Updates the Configuration -> Serial Device Menu Options
        /// </summary>
        private void UpdateDeviceList()
        {
            string[] portNames = System.IO.Ports.SerialPort.GetPortNames();
            ToolStripItemCollection ComPortMenuItems = serialDeviceToolStripMenuItem.DropDownItems;

            ComPortMenuItems.Clear();

            if (portNames != null && portNames.Length > 0)
            {
                foreach (string ComPort in portNames)
                {
                    ComPortMenuItems.Add(ComPort,null, new EventHandler(ComPortSelected));
                }
            }
            else
            {
                ComPortMenuItems.Add("No Devices Found");
            }
        }


        /// <summary>
        /// Handles the click event when a Serial Device is selected
        /// </summary>
        /// <param name="sender">Dropdown menu sending event</param>
        /// <param name="e">The object which was clicked</param>
        void ComPortSelected(object sender, EventArgs e)
        {
            if (serialEasyPort.IsOpen)
            {
                MessageBox.Show("Please close the existing COM port before selecting a new one.", "Error: COM Port Open");
            }
            else
            {
                ToolStripItem clickedItem = (ToolStripItem)sender;

                serialEasyPort.PortName = clickedItem.Text;
                serialEasyPort.Open();

                //Disable the buttons and auto mode if serial is running.
                groupIOActuators.Enabled = false;
                movieInfo.AutoMode = false;


                MonitorWindow.LogMessage(new SerialLogEvent(String.Format("{0} Port Open",clickedItem.Text),SerialLogEventType.Administration));
                SetupEasyPort(); //Ask the EasyPort to respond

                connectionTimeoutTimer.Stop();
                connectionTimeoutTimer.Interval = 1000;
                connectionTimeoutTimer.Enabled = true;
                connectionTimeoutTimer.Start();


                serialDeviceToolStripMenuItem.DropDownItems.Add("Close COM Port", null, new EventHandler(ComPortCloseSelected));
            }
        }

        void connectionTimeoutTimer_Tick(object sender, EventArgs e)
        {
            CloseComPort();
            connectionTimeoutTimer.Enabled = false;
            connectionTimeoutTimer.Stop();
            EasyPortConnected = false;

            MessageBox.Show("Connection Timeout Exceeded, Closing COM Port");
        }

        /// <summary>
        /// Closes the serial port if it is open
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ComPortCloseSelected(object sender, EventArgs e)
        {
            CloseComPort();
        }

        private void CloseComPort()
        {
            if (serialEasyPort.IsOpen)
            {
                serialEasyPort.Close();
                LogSerialMessage(String.Format("{0} Port Closed",serialEasyPort.PortName),SerialLogEventType.Administration);
            }

            EasyPortConnected = false;

            groupIOActuators.Enabled = true;

            serialDeviceToolStripMenuItem.DropDownItems.RemoveAt(serialDeviceToolStripMenuItem.DropDownItems.Count-1);
        }

        private void SensorValuesChanged()
        {
            WriteSerialOutput("MAW="+this.GetSensorValueWord());
        }

        private void WriteSerialOutput(string BytesOut)
        {
            if (serialEasyPort.IsOpen && EasyPortConnected)
            {
                serialEasyPort.Write(BytesOut + "\r");
                LogSerialMessage(BytesOut, SerialLogEventType.Transmitt);
            }
        }


        private void LogSerialMessage(string Message, SerialLogEventType type)
        {
            if (this.InvokeRequired)
            {
                this.Invoke(new MethodInvoker(() => { LogSerialMessage(Message, type); }));
            }
            else
            {
                MonitorWindow.LogMessage(new SerialLogEvent(Message, type));
            }
        }




        private void Form1_Load(object sender, EventArgs e)
        {
            MonitorWindow = new SerialMonitor();
            MonitorWindow.Show();

            UpdateDeviceList();


            for (int i = 1; i <= 16; i++)
            {
                PictureBox CurrentActuator = (this.Controls.Find("actuatorIndicator" + i, true).FirstOrDefault()) as PictureBox;
                CurrentActuator.Click += new EventHandler(EasyVeepMain_Click);
                ActuatorIndicators.Add(CurrentActuator);

                SensorIndicators.Add((PictureBox)(this.Controls.Find("sensorIndicator" + i, true).FirstOrDefault()));
            }
            
            PopulateProcessBox();
        }



        void EasyVeepMain_Click(object sender, EventArgs e)
        {
            PictureBox ClickedActuator = sender as PictureBox;
            if (ClickedActuator.Enabled)
            {
                int ClickedIndex = ActuatorIndicators.IndexOf(ClickedActuator);
                try
                {
                    movieInfo.Actuators[ClickedIndex].ToggleActuator();
                }
                catch
                {
                    Console.WriteLine("Error Toggeling Actuator " + ClickedIndex);
                }
            }
        }



        private void PopulateProcessBox()
        {
            var swfFiles = Directory.GetFiles(Application.StartupPath + @"\swf");
            List<ProcessListItem> Processes = new List<ProcessListItem>();

            foreach (var swfFile in swfFiles)
            {
                axShockwaveFlash1.LoadMovie(0, swfFile);
                string ProgName = axShockwaveFlash1.GetVariable("EprgName");
                Match FileNumMatch = Regex.Match(swfFile, @"(\d+)\.swf$");
                if (FileNumMatch.Success && FileNumMatch.Groups != null && FileNumMatch.Groups.Count > 1)
                {
                    int fileNumber = Int32.Parse(FileNumMatch.Groups[1].ToString());
                    Processes.Add(new ProcessListItem(ProgName, fileNumber));
                }
                else
                    throw new Exception(String.Format("Unable to parse file number from swf file path {0}", swfFile));
            }

            //Linq has made me a bad programmer
            Processes = Processes.OrderBy(l=>l.Text).ToList();
            var selectionIndex = Processes.IndexOf(Processes.Where(m=>m.Value==1).FirstOrDefault());

            comboBox1.Items.AddRange(Processes.ToArray());

            if (comboBox1.Items.Count > 0)
            {
                comboBox1.SelectedIndex = selectionIndex;

                //Load up the default movie in this case
                axShockwaveFlash1.LoadMovie(0,swfFiles.First());
                axShockwaveFlash1.Play();
                axShockwaveFlash1.GotoFrame(1);
                UpdateProcessInfoDisplay(GetProcessInfo());
            }
            else
            {
                //Do we need to say something, hell yeah we do.
            }

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Stop any timers we have running
            inputUpdateTimer.Stop();

            ProcessListItem CurrentItem = (ProcessListItem)comboBox1.SelectedItem;
            string filePath = String.Format(@"{0}\swf\{1}.swf",Application.StartupPath,CurrentItem.Value);

            axShockwaveFlash1.LoadMovie(0,filePath);
            axShockwaveFlash1.Play();
            DigitalActuator.activeMovie = DigitalSensor.activeMovie = axShockwaveFlash1;

            UpdateProcessInfoDisplay(GetProcessInfo());


            //Spool up the timer
            inputUpdateTimer.Enabled = true;
            inputUpdateTimer.Start();
        }


        private void UpdateProcessInfoDisplay(ProcessInfo Info){
            txtDesc.Text = Info.ProcessDescription;
            DataTable InOutData = new DataTable();

            InOutData.Columns.Add("Index");
            InOutData.Columns.Add("Sensor");
            InOutData.Columns.Add("Actuator");

            for (int i = 1; i <= 16; i++)
            {
                InOutData.Rows.Add(i, (Info.Sensors[i-1] != null ? Info.Sensors[i-1].SensorRole : "" ), ( Info.Actuators[i-1] != null ? Info.Actuators[i-1].ActuatorRole : ""));

                SensorIndicators[i - 1].Image = Info.Sensors[i - 1] != null ? Resources.Sensor_Off : Resources.Indicator_Disabled;
                if (Info.Actuators[i - 1] == null)
                {
                    ActuatorIndicators[i - 1].Image = Resources.Indicator_Disabled;
                    ActuatorIndicators[i - 1].Enabled = false;
                }
            }

            dataGridInOutVal.DataSource = InOutData;
            dataGridInOutVal.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private ProcessInfo GetProcessInfo()
        {
            movieInfo = new ProcessInfo(axShockwaveFlash1);

            //We should always have the same number of Actuator and Sensor Icons, so I unrolled
            //the loop for the Sensors into the one for the actuators.
            for (int i = 0; i < ActuatorIndicators.Count; i++)
            {
                if (movieInfo.Actuators[i] != null)
                {
                    movieInfo.Actuators[i].Icon = ActuatorIndicators[i];
                }

                if (movieInfo.Sensors[i] != null)
                {
                    movieInfo.Sensors[i].Icon = SensorIndicators[i];
                }
            }

            enableAutoModeToolStripMenuItem.Text = "Enable Auto Mode";
            groupIOActuators.Enabled = true;

            return movieInfo;
        }


        private void inputUpdateTimer_Tick(object sender, EventArgs e)
        {
            if (movieInfo.AutoMode)
            {
                axShockwaveFlash1.SetVariable("auto", "1");

                foreach (DigitalActuator da in movieInfo.Actuators)
                {
                    if ( da != null )
                        da.SyncActuatorValue();
                }
            }
            else
            {
                axShockwaveFlash1.SetVariable("auto", "0");
            }

            //Get those sexy sensor values
            foreach (DigitalSensor ds in movieInfo.Sensors)
            {
                if (ds == null)
                    break;

                try
                {
                    ds.UpdateSensorDisplay();
                }
                catch
                {
                    Console.WriteLine("Exception Thrown Getting Sensor Value" + ds.SensorIndex);
                }
            }

            if (this.LastSensorValues != GetSensorValueWord())
            {
                this.SensorValuesChanged();
            }

            this.LastSensorValues = GetSensorValueWord();
        }


        private string GetSensorValueWord()
        {
            UInt16 IntVal = 0;
            for (int i = 0; i < movieInfo.Sensors.Count(); i++ )
            {
                if (movieInfo.Sensors[i] != null)
                {
                    IntVal |= (UInt16)((movieInfo.Sensors[i].GetSensorValue() == "1" ? 1 : 0) << i);
                }
                else
                {
                    break;
                }
            }

            return IntVal.ToString("X4"); 
        }

        private void SetActuatorValues(int ActuatorValues)
        {
            if (this.InvokeRequired)
            {
                this.Invoke(new MethodInvoker(() => { SetActuatorValues(ActuatorValues); }));
            }
            else
            {
                int i = 0;
                foreach (var actuator in movieInfo.Actuators)
                {
                    if (actuator == null)
                        break;

                    var ActVal = (ActuatorValues & (1 << i)) >> i;
                    actuator.SetActuatorValue(ActVal.ToString());
                    actuator.SyncActuatorValue();


                    i++;
                }
            }
        }




        private void SetupEasyPort()
        {
            string command = "RST\rsetup0\r";
            serialEasyPort.Write(command);
            LogSerialMessage(command, SerialLogEventType.Transmitt);
        }



        private void enableAutoModeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            movieInfo.ToggleAutoMode();
            if (movieInfo.AutoMode)
            {
                enableAutoModeToolStripMenuItem.Text = "Disable Auto Mode";
                groupIOActuators.Enabled = false;
            }
            else
            {
                enableAutoModeToolStripMenuItem.Text = "Enable Auto Mode";
                groupIOActuators.Enabled = true;
            }
        }

        private void serialEasyPort_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string availableBytes = CurrentCommand;

            //get all the bytes available
            while (serialEasyPort.BytesToRead > 0)
            {
                availableBytes += (char)serialEasyPort.ReadChar();
            }

            string[] commands = availableBytes.Split('\r'); //Split on command end char
            foreach (string command in commands)
            {
                if (command.Equals("setup1"))
                {
                    connectionTimeoutTimer.Enabled = false; //We have connected
                    EasyPortConnected = true;
                    LogSerialMessage(command, SerialLogEventType.Recieve);
                } else if (command.Contains("EW="))
                {
                    try
                    {
                        int lastIndex = command.LastIndexOf("EW=");
                        string EWCommand = command.Substring(lastIndex, 7);

                        int InputValues = int.Parse(EWCommand.Split('=')[1],System.Globalization.NumberStyles.HexNumber);
                        SetActuatorValues(InputValues);

                   //     LogSerialMessage(EWCommand, SerialLogEventType.Recieve);
                    }
                    catch
                    {
                        LogSerialMessage("Unexpected Error", SerialLogEventType.Administration);
                    }
                }
                else if (command != "" && command.Equals(commands.Last()))
                {
                    CurrentCommand = command;
                }
            }
        }
    }
}
