using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyEasyVeep.ProcessModels
{
    public class ProcessListItem {
        public int Value { get; set; }
        public string Text { get; set; }

        public ProcessListItem(string Text, int Value)
        {
            this.Value = Value;
            this.Text = Text;
        }

        public override string ToString()
        {
            return this.Text;
        }
    }
}
