   M S B A M L   `   `   `  ���� C  ?PLC_Soft, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:PLC_SoftPLC_Soft  9!clr-namespace:PLC_Soft.PropertiesPLC_Soft.Properties      PLC_Soft.frmSTRegister   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     %myclr-namespace:PLC_Soft     8
properties!clr-namespace:PLC_Soft.Properties     -     � Title$%  ST5540/ ST7538 Register Control��$	��500��$	��640�� � 
ResizeMode$ NoResize=� � Icon$< 6/PLC_Soft;component/Images/network-connection-icon.png��.��� $��5q�$
��Auto�� � 	Resources "  PLC_Soft.Properties.Settings   settings   PLC_Soft.ChipTypeConverter  chipTypeConverter   PLC_Soft.RegisterConverter  registerConverter   PLC_Soft.Frequencies  frequencies   PLC_Soft.BaudRates  	baudrates   PLC_Soft.Deviations  
deviations   PLC_Soft.WatchDogs  	watchdogs   PLC_Soft.TXTimeOuts  
txtimeouts	   PLC_Soft.FreqDetTimes  freqdettimes 
   PLC_Soft.ZeroCrossingSYNCs 	 zerocrossingsyncs   PLC_Soft.MainInterfaces 
 maininterfaces   PLC_Soft.OutputClocks  outputclocks   PLC_Soft.SensitiveModes  sensitivemodes   PLC_Soft.InputFilters  inputfilers   PLC_Soft.DetectionMethods  detectionmethods��%�   &	        &	      &	 
     &	      &	      &	      &	      &	 #     &	 (     &		 -     &	
 2     &	 7     &	 <     &	 A     &	 F                     	  
             � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto �.+�� $��0�� � ColumnDefinitions �� $
��Auto ��� $
��Auto �.+��� $��Select ST 7538/7540 : ��$��5q��� -   $��cmbSTSelect��$��1��$��23��$��5q�$	��120�� �� SelectedIndex ��    Default �� Source# Z 	 �� Path$	 SelectedChip�.@��� $��ST 7538���� $��ST 7540���� $��1��$
��Auto��._�� $
��Auto�� �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto � �� $��* ��� $��* ��� $��* ��� $��* �.+��� $��	Frequency��$��2q��� $��Transmission Time Out��$��2q�$��2���� $��Output Clock��$��2q�$��4���� $��Output Vol Level Frezze��$��2q�$��6��y��� 
 �� ElementName$
 cmbSTSelect��$	 SelectedItem� �� Mode$ OneWay=� �� 	Converter# [ �� $��Extended Register��$��2q�$��8��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��	Baud Rate��$��2q�$��1���� $��Sensitive Mode��$��2q�$��1��$��4���� $��Frequency Detection Time��$��2q�$��1��$��2���� $��Frame Header��$��2q�$��1��$��8��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��Header Recognition��$��2q�$��1��$��6��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��	Deviation��$��2q�$��2���� $��Input Filter��$��4��$��2q�$��2���� $��Zero Crossing SYNC��$��2��$��2q�$��2���� $��Frame Length Count��$��6��$��2q�$��2��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��Frame Length��$��8��$��2��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��	Watch Dog��$��2q�$��3���� $��Detection Method��$��4��$��2q�$��3���� $��Interface Mode��$��2��$��2q�$��3���� $��Header Length��$��6��$��2q�$��3��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��cmbFrequency��$��1��$��3q� �� SelectedValuePath$ Value�� �� DisplayMemberPath$ DisplayName�� �� # Z $	 STFrequency����� $	 Freqs�# [ �� -   $��cmbBaudrate��$��3q�$ Value��$ DisplayName��$��1��$��1�� �� # Z $	 
STBaudRate����� $	 Bauds�# [ �� -   $��cmbDeviation��$��3q�$��2��$��1��$ Value��$ DisplayName�� �� # Z $	 STDeviation����� # [ $
	 Devs��� -   $��cmbWatchdog��$��3q�$��3��$��1��$ Value��$ DisplayName�� �� # Z $	 
STWatchDog����� # [ $		 WDs��� -   $��cmbTXTimeout��$��3q�$��3��$ Value��$ DisplayName�� �� # Z $	 STTXTimeout����� # [ $		 TXs��� -   $��cmbFreDetTime��$��3q�$��1��$��3��$ Value��$ DisplayName�� �� # Z $	 STFreqDetTime����� # [ $
	 FDTS��� -	   $��cmbZeroCrossingSYNC��$��3q�$��2��$��3��$ Value��$ DisplayName�� �� # Z $	 STZeroCrossingSYNC����� # [	 $
	 ZCRS��� -
   $��cmbInterface��$��3q�$��3��$��3��$ Value��$ DisplayName�� �� # Z $	 STInterfaceMode����� # [
 $	 Minterfaces��� -   $��cmbOutputClock��$��3q�$��5��$ Value��$ DisplayName�� �� # Z $	 STOutputClock����� # [ $	 
OutputCLKs��� -   $��cmbSensitiveMode��$��3q�$��1��$��5��$ Value��$ DisplayName�� �� # Z $	 STSensitiveMode����� # [ $		 SMs��� -   $��cmbInputFilter��$��3q�$��2��$��5��$ Value��$ DisplayName�� �� # Z $	 STInputFilter����� # [ $	 Inputfilters��� -   $��cmbDetMethod��$��3q�$��3��$��5��$ Value��$ DisplayName�� �� # Z $	 STDetectMethod����� # [ $		 DMs��� -   $��cmbOutputVolFrezze��$��3q�$��7��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��cmbHeaderRec��$��3q�$��1��$��7��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��cmbFrameLengthCount��$��3q�$��2��$��7��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��cmbHeaderCount��$��3q�$��3��$��7��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��	cmbExtReg��$��3q�$��9��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��cmbFrameHeader��$��3q�$��1��$��9��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� -   $��cmbFrameLength��$��3q�$��2��$��9��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��2��$
��Auto��._�� $
��Auto�� �� $
��0.2* ��� $
��0.3* ��� $
��0.3* ��� $
��0.2* � �� $��29 ��� $
��Auto ��� $
��Auto ��� $��36 �.+��� -   $��btnReadRegister��$��Read Register��$��1��$��3��$��	10,4,10,4q��� -   $��btnWriteRegister��$��Write Register��$��2��$��3��$��	10,4,10,4q��� $	��MSB��$��1��$��28��$
��Left=�$��12,5,0,0q�$	��Top=�$��2���� $	��LSB��$��2��$��28��$��Right=�$��0,5,12,0q�$	��Top=�$��2���� $��CONTROL REGISTER��$��1��$��2��$��28��$
��Auto��$��Center=�$	��Top=�$��2���� -   $��txtReg��$��1��$��2��$��1��$��Tahoma)�$��16(�$��24��$
��Left=�$��30,3,0,3q� �� TextAlignment$ Center=�$	��250��$��Center=���`�  `� 	Converter# [ .1��� $
 cmbFrequency��$	 SelectedValue��� $
 cmbBaudrate��$	 SelectedValue��� $
 cmbDeviation��$	 SelectedValue��� $
 cmbWatchdog��$	 SelectedValue��� $
 cmbTXTimeout��$	 SelectedValue��� $
 cmbFreDetTime��$	 SelectedValue��� $
 cmbZeroCrossingSYNC��$	 SelectedValue��� $
 cmbDetMethod��$	 SelectedValue��� $
 cmbInterface��$	 SelectedValue��� $
 cmbOutputClock��$	 SelectedValue��� $
 cmbSensitiveMode��$	 SelectedValue��� $
 cmbInputFilter��$	 SelectedValue��� -   $��txtExtendedReg��$��1��$��2��$��2��$��Tahoma)�$��16(�$��24��$
��Left=�$��30,3,0,3q�$ ��00000000-00000000-00000000��$ Center=�$��Center=�$	��250��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ �� $��	Bit 23-00��$��2��$��1��$��24��$��Right=�$��0,1,5,5q�$��60���� $��	Bit 47-24��$��2��$��2��$��24��$��Right=�$��0,1,5,5q�$��60��y��� $
 cmbSTSelect��$	 SelectedItem�$ OneWay=�# [ 