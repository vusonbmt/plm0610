   M S B A M L   `   `   `  ����   PLC_Soft    PLC_Soft.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     � Title$  Chat over power line��$	��600��$	��427��$��Arial)�$��13(� � 
ResizeMode$ NoResize=� � Icon$< 6/PLC_Soft;component/Images/network-connection-icon.png��.���  � ColumnDefinitions �� $
��Auto � � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��2* �.+�o� -   $��mainMenu��$��26��$��Tahoma)�$��13(�.@�m� $��_File��.@�m� -   $��Connect��m� -   $��Close��m� $��_Config��.@�m� -   $��RS232 Config��m� -   $��
PLM Config��m� -   $��	IP Config��m� $��_Help��.@�m� -   $
��Help��m� -	   $��About���� -
   $��listFriends��$��1��$	��130��$
��Left=�$��	10,40,0,0q�$	��Top=�$	��226��{�.   �� View �� .P��� $��IP�� �� Width$ 20�� �� DisplayMemberBinding ��  �� Path$ FriendID��� $��Domain��$ 50�� �� $ DomainID��� $��Last Broadcast�� �� $ LastBroadCast��� -   $��rtbChatContent��$��2��$	��300��$��10q�$	��400��"	 �� VerticalScrollBarVisibility$
	 Auto=�
���   �$��1q�{�.  
 �� 
IsReadOnly
 . �� -   $��
txtMessage��$��3��$��23��$
��Left=�$��	10,10,0,0q�$	��Top=�$	��300��
���   �$��1q�{�.  �� -   $��btnSend��$
��Send��$��3��$��23��$��Right=�$��10q�$	��Top=�$��75��{�.  �� $��1��$	��160��$��Right=�$��	0,10,10,0q�$
��Fill=�$	��Top=�$	��160��$<��6/PLC_Soft;component/Images/network-connection-icon.png��$��1��{�.  �� -   $��lbInform��$��Please connect first ....��$��1��$��25��$
��Left=�$��12,9,0,0q�$	��Top=�$	��224��{�.  