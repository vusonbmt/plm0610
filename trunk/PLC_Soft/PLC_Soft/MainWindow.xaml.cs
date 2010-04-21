﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using CommunicationCore.RS232;
using System.IO;
using System.IO.Ports;
using System.Threading;
using PLC_Soft.Properties;

namespace PLC_Soft
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		private SerialPort serial = null;
		private string textToSend = "";
		private byte[] bytesToSend;
		private int maxLength;
		private string receiveMessage;
		public MainWindow()
		{
			InitializeComponent();
			maxLength = Settings.Default.MaxLength;
			if (serial == null)
				serial = new SerialPort();
			InitializeControlValue();
			Thread.Sleep(100);
		}

		private void InitializeControlValue()
		{
			try
			{
				serial.BaudRate = Settings.Default.BaudRate;
				serial.DataBits = Settings.Default.DataBits;
				serial.Parity = Settings.Default.Parity;
				serial.StopBits = Settings.Default.StopBits;
				serial.PortName = Settings.Default.PortName;
				serial.WriteTimeout = 500;
				serial.ReadTimeout = 5000;
				OpenPort();
				serial.DataReceived += new SerialDataReceivedEventHandler(serial_DataReceived);
				serial.ErrorReceived += new SerialErrorReceivedEventHandler(serial_ErrorReceived);
			}
			catch (IOException ex)
			{
				MessageBox.Show(this, "Please config RS232 communication.", "Can't connect", MessageBoxButton.OK, MessageBoxImage.Error);
			}

		}

		void serial_ErrorReceived(object sender, SerialErrorReceivedEventArgs e)
		{
			MessageBox.Show(this, "The process has some problems", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
		}

		void serial_DataReceived(object sender, SerialDataReceivedEventArgs e)
		{
			Thread.Sleep(serial.ReadTimeout);
			SerialPort serialPort = sender as SerialPort;
			byte[] buffer = null;
			buffer = RS232Task.ReadData(serialPort);
			rtbChatContent.Dispatcher.BeginInvoke(new Action(delegate()
			{
				receiveMessage = RS232Task.DataProcess(buffer);
				rtbChatContent.AppendText("Friend: ");
				rtbChatContent.AppendText(receiveMessage+"\n");
			}));
		}

		private void OpenPort()
		{
			if (!serial.IsOpen)
				serial.Open();
		}

		private void MenuItem_Click(object sender, RoutedEventArgs e)
		{
			var item = sender as MenuItem;
			switch (item.Header.ToString())
			{
				case "RS232 Config":
					new frmSerialPort().ShowDialog();
					break;
				case "PLM Config":
					new frmSTRegister(serial).ShowDialog();
					break;
				case "IP Config":
					new frmIPConfig().ShowDialog();
					break;
			}
		}

		private void btnSend_Click(object sender, RoutedEventArgs e)
		{
			textToSend = txtMessage.Text;
			if (textToSend.Length < maxLength)
			{
				textToSend.PadLeft(maxLength, ' ');
			}
			bytesToSend = new byte[textToSend.Length + 3];
			System.Text.ASCIIEncoding.ASCII.GetBytes(textToSend, 0, textToSend.Length, bytesToSend, 3);
			bytesToSend[0] = (byte)RS232Command.COM_HEADER;
			bytesToSend[1] = (byte)RS232Command.COM_SET_PLM;
			bytesToSend[2] = (byte)textToSend.Length;
			serial.Write(bytesToSend, 0, bytesToSend.Length);
			rtbChatContent.Dispatcher.BeginInvoke(new Action(delegate()
			{
				rtbChatContent.AppendText("You: ");
				rtbChatContent.AppendText(txtMessage.Text+"\n");
			}));
		}
	}
}