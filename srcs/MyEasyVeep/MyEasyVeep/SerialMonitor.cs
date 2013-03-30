using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MyEasyVeep
{
    public partial class SerialMonitor : Form
    {
        public SerialMonitor()
        {
            InitializeComponent();
        }

        private void SerialMonitor_Load(object sender, EventArgs e) { }

        /// <summary>
        /// Logs a message to the RichText box in the serial monitor window
        /// </summary>
        /// <param name="e">The SerialLogEvent to print</param>
        public void LogMessage(SerialLogEvent e)
        {
            if (this.IsDisposed)
                return;

            string text =  e.GetMessageText() + Environment.NewLine;

            int currentIndex = richSerialLogBox.TextLength;
            richSerialLogBox.AppendText(text);

            richSerialLogBox.SelectionStart = currentIndex;
            richSerialLogBox.SelectionLength = text.Length;

            switch (e.GetMessageType())
            {
                case SerialLogEventType.Administration:
                    richSerialLogBox.SelectionColor = Color.Black;
                    break;

                case SerialLogEventType.Recieve:
                    richSerialLogBox.SelectionColor = Color.Red;
                    break;

                case SerialLogEventType.Transmitt:
                    richSerialLogBox.SelectionColor = Color.Blue;
                    break;
            }

            richSerialLogBox.SelectionLength = 0;
        }
    }

    /// <summary>
    /// Encapsulates a Log Message for easy time stamping and logging
    /// </summary>
    public class SerialLogEvent
    {
        /// <summary>
        /// Holds the Timestamped Message
        /// </summary>
        private string LogMessage;

        /// <summary>
        /// Stores the type of log message
        /// </summary>
        private SerialLogEventType type;

        /// <summary>
        /// Used to generate the time stamp showing the amount of milliseconds since program startup
        /// </summary>
        private static DateTime LogBaseTime = System.Diagnostics.Process.GetCurrentProcess().StartTime;

        /// <summary>
        /// Creates a new SerialLogEvent
        /// </summary>
        /// <param name="Text">Message Text to Log</param>
        /// <param name="type">Type of Log Message</param>
        public SerialLogEvent(string Text,SerialLogEventType type) 
        {
            this.LogMessage = string.Format("{0}\t{1}", (DateTime.Now - LogBaseTime).TotalMilliseconds.ToString(), Text);
            this.type = type;
        }

        /// <summary>
        /// Returns the message text
        /// </summary>
        /// <returns>The message text with time stamp</returns>
        public string GetMessageText()
        {
            return this.LogMessage;
        }

        /// <summary>
        /// Gets the Message Type
        /// </summary>
        /// <returns>The SerialLogEventType of the messsage</returns>
        public SerialLogEventType GetMessageType()
        {
            return this.type;
        }
    }

    /// <summary>
    /// Used to indentify various types of serial related event
    /// </summary>
    public enum SerialLogEventType
    {
        /// <summary>
        /// Denotes an administrative task, i.e. Opening, closing, updating Baud Rate
        /// </summary>
        Administration,

        /// <summary>
        /// Denotes the result of a recieved message
        /// </summary>
        Recieve,


        /// <summary>
        /// Denotes the result of sending a message
        /// </summary>
        Transmitt
    }
}
