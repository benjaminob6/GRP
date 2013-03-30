namespace MyEasyVeep
{
    partial class SerialMonitor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.richSerialLogBox = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // richSerialLogBox
            // 
            this.richSerialLogBox.Location = new System.Drawing.Point(12, 11);
            this.richSerialLogBox.Name = "richSerialLogBox";
            this.richSerialLogBox.Size = new System.Drawing.Size(275, 233);
            this.richSerialLogBox.TabIndex = 0;
            this.richSerialLogBox.Text = "";
            // 
            // SerialMonitor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(300, 258);
            this.Controls.Add(this.richSerialLogBox);
            this.Name = "SerialMonitor";
            this.Text = "SerialMonitor";
            this.Load += new System.EventHandler(this.SerialMonitor_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox richSerialLogBox;

    }
}