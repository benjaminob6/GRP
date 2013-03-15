using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zlib;
using System.IO;


namespace MyEasyVeep
{
    class SwfReader
    {
        //From the swf spec
        private static const int UncompressedHeaderLen = 8;

        public SwfReader()
        {
        }

        public void ReadSwf(string swfFilePath)
        {
            try
            {
                //using closes and disposes for you
                using (MemoryStream uncompressedZip = new MemoryStream())
                using (ZOutputStream zlibStream = new ZOutputStream(uncompressedZip))
                using (FileStream compressedSwf = new FileInfo(swfFilePath).OpenRead())
                {
                    byte[] firstHeaderBytes = ChompHeaderBytes(compressedSwf);
                    
                    zlibStream.finish();
                }
            }
            catch (IOException ioe)
            {

            }
            catch (Exception e)
            {

            }
        }

        private byte[] ChompHeaderBytes(Stream OriginalSwf)
        {
            //We'll let something up the line catch any Exceptions for now
            byte[] headerbytes = new byte[UncompressedHeaderLen];
            OriginalSwf.Seek(0, SeekOrigin.Begin);

            OriginalSwf.Read(headerbytes, 0, 8);

            return headerbytes;
        }
    }
}
