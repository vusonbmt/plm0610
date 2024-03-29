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
using System.Windows.Shapes;
using PLC_Soft.Properties;
using System.IO.Ports;
using System.IO;
using CommunicationCore.RS232;
using System.Threading;
using CommunicationCore.PLM;

namespace PLC_Soft
{
	/// <summary>
	/// Interaction logic for frmSTRegister.xaml
	/// </summary>
	public partial class frmSTRegister : Window
	{
		private SerialPort serial = null;
		private SerialPort oldSerial = null;
		private string reg;
		private bool closeNow = false;
		private Thread subThread = null;
		#region Construtor

		/// <summary>
		/// ham khoi tao khong tham so
		/// </summary>
		public frmSTRegister()
		{
			InitializeComponent();
			if (serial == null)
				serial = new SerialPort();
			InitializeControlValue();
			Thread.Sleep(100);
		}

		/// <summary>
		/// ham khoi tao
		/// </summary>
		/// <param name="serialPort"></param>
		public frmSTRegister(SerialPort serialPort, Thread thread)
		{
			InitializeComponent();
			this.oldSerial = serialPort;
			if (this.oldSerial != null)
			{
				this.oldSerial.Close();
				subThread = thread;
				//subThread.Suspend();
				
			}

			if (serial == null)
				serial = new SerialPort();

			InitializeControlValue();
			Thread.Sleep(100);
		}

		#endregion

		#region Private Methods

		/// <summary>
		/// mo port de giao tiep
		/// </summary>
		private void OpenPort()
		{
			if (!serial.IsOpen)
				serial.Open();
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
				serial.ReadTimeout = 500;
				OpenPort();
				serial.DataReceived += new SerialDataReceivedEventHandler(serial_DataReceived);
				serial.ErrorReceived += new SerialErrorReceivedEventHandler(serial_ErrorReceived);
			}
			catch (IOException ex)
			{
				MessageBox.Show(this, "Please check the connection and try to config RS232 communication.", "Can't connect", MessageBoxButton.OK, MessageBoxImage.Error);
				closeNow = true;
			}
		}

		/// <summary>
		/// xu ly thong tin nhan duoc de phuc vu hien thi
		/// </summary>
		/// <param name="registerData"></param>
		void ControlProcess(string registerData)
		{
			string[] bytes = registerData.Split('-');

			int frequencyIndex = CalculateReg(bytes[0], 7, 0) + CalculateReg(bytes[0], 6, 1) + CalculateReg(bytes[0], 5, 2);

			int baudrateIndex = CalculateReg(bytes[0], 4, 0) + CalculateReg(bytes[0], 3, 1);

			int deviationIndex = CalculateReg(bytes[0], 2, 0);

			int watchdogIndex = CalculateReg(bytes[0], 1, 0);

			int transmitTimeoutIndex = CalculateReg(bytes[0], 0, 0) + CalculateReg(bytes[1], 7, 0);

			int freqDetectionTimeIndex = CalculateReg(bytes[1], 6, 0) + CalculateReg(bytes[1], 5, 1);

			int zeroCrossingIndex = CalculateReg(bytes[1], 4, 0);

			int detectMethodIndex = CalculateReg(bytes[1], 3, 0) + CalculateReg(bytes[1], 2, 1);

			int interfaceModeIndex = CalculateReg(bytes[1], 1, 0);

			int outputClockIndex = CalculateReg(bytes[1], 0, 0) + CalculateReg(bytes[2], 7, 1);

			int sensitiveModeIndex = CalculateReg(bytes[2], 1, 0);

			int inputFilterIndex = CalculateReg(bytes[2], 0, 0);


			cmbFrequency.SelectedIndex = frequencyIndex;
			cmbBaudrate.SelectedIndex = baudrateIndex;
			cmbWatchdog.SelectedIndex = watchdogIndex;
			cmbDeviation.SelectedIndex = deviationIndex;
			cmbTXTimeout.SelectedIndex = transmitTimeoutIndex;
			cmbDetMethod.SelectedIndex = detectMethodIndex;
			cmbFreDetTime.SelectedIndex = freqDetectionTimeIndex;
			cmbZeroCrossingSYNC.SelectedIndex = zeroCrossingIndex;
			cmbInterface.SelectedIndex = interfaceModeIndex;
			cmbOutputClock.SelectedIndex = outputClockIndex;
			cmbSensitiveMode.SelectedIndex = sensitiveModeIndex;
			cmbInputFilter.SelectedIndex = inputFilterIndex;
		}

		/// <summary>
		/// tinh toan gia tri de hien thi len cac combobox
		/// </summary>
		/// <param name="bByte"></param>
		/// <param name="position"></param>
		/// <param name="powerValue"></param>
		/// <returns></returns>
		int CalculateReg(string bByte, int position, int powerValue)
		{
			return (int)Math.Pow(2, powerValue) * (int)Convert.ToInt16(bByte[position].ToString());
		}


		#endregion

		#region Events

		void serial_ErrorReceived(object sender, SerialErrorReceivedEventArgs e)
		{
			MessageBox.Show(this, "The process has some problems", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
		}

		void serial_DataReceived(object sender, SerialDataReceivedEventArgs e)
		{
			Thread.Sleep(500);

			SerialPort serialPort = sender as SerialPort;
			byte[] buffer = null;
			buffer = RS232Task.ReadData(serialPort);
			try
			{
				if (RS232Task.GetCommand(buffer) == (byte)RS232Command.COM_GET_CTR)
				{
					reg = RS232Task.GetPLMRegister(buffer);
					txtReg.Dispatcher.BeginInvoke(new Action(delegate()
					{
						ControlProcess(reg);
					}));
				}
			}
			catch (IOException ex)
			{
				MessageBox.Show(this, "The process has some problems/nPlease check the connection and try again", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}
		private void btnReadRegister_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				byte[] command = new byte[3];
				command[0] = (byte)RS232Command.COM_HEADER;
				command[1] = (byte)RS232Command.COM_GET_CTR;
				command[2] = 0;

				serial.Write(command, 0, 3);
			}
			catch (IOException ex)
			{
				MessageBox.Show(this, "Can't read the ST register", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void btnWriteRegister_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				string regValue = txtReg.Text;
				string[] bytes = regValue.Split('-');
				byte[] regByte = new byte[7];
				regByte[6] = 0;
				regByte[5] = (byte)Convert.ToInt16(bytes[0], 2);
				regByte[4] = (byte)Convert.ToInt16(bytes[1], 2);
				regByte[3] = (byte)Convert.ToInt16(bytes[2], 2);

				regByte[2] = 4;
				regByte[1] = (byte)RS232Command.COM_SET_CTR;
				regByte[0] = (byte)RS232Command.COM_HEADER;

				serial.Write(regByte, 0, 7);

			}
			catch (IOException ex)
			{
				MessageBox.Show(this, "Can't write the ST register", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		/// <summary>
		/// xu ly mo lai port cho chuon trinh chinh khi dong
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
			try
			{
				this.serial.Close();
				if (this.oldSerial != null)
				{
					this.oldSerial.Open();
					//subThread.Resume();
				}

			}
			catch (IOException ex)
			{
				MessageBox.Show(this, "Please check the connection.", "Can't connect", MessageBoxButton.OK, MessageBoxImage.Error);
			}

		}

		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			if (closeNow)
				this.Close();
		}


		#endregion

	}
}
