   M S B A M L   `   `   `  ����H  DDobraNutkaApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:DobraNutkaAppDobraNutkaApp  5   	       DobraNutkaApp.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:DobraNutkaApp     5   	   -   5          � Title$  
MainWindow��5   	   $	��600��6   $	��800��6)    � 	Resources 5	         ordersViewSource��%   &	        �� 5
   
   6   5      .��5      �  � DataContext# [  6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   � -   5         �Name$ grid1��5      # [  6   $
��Left=�6N   $��	10,10,0,0q�6i   $��2��6|   $	��Top=�6�    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#    5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $��	album id:��6   $��0��6(   $
��Left=�68   $��3q�6S   $��0��6^   $��Center=�6k   �� 5      -   5         ��Name$ album_idTextBox��5      $��1��6/   $
��Left=�6?   $��23��6Z   $��3q�6f   $��0��6q   $��Center=�6�   $	��120��6�   ��6~   �� *
album_id+ �� Mode$ TwoWay=� �� NotifyOnValidationError . 	 �� ValidatesOnExceptions	 . 6�   �� 5       $��
client id:��6   $��0��6)   $
��Left=�69   $��3q�6T   $��1��6_   $��Center=�6l   �� 5!      -   5        $ client_idTextBox��5!      $��1��60   $
��Left=�6@   $��23��6[   $��3q�6g   $��1��6r   $��Center=�6�   $	��120��6�   ��6   �� *	client_id+$ TwoWay=� . 	 . 6�   �� 5"      $��employee id:��6   $��0��6+   $
��Left=�6;   $��3q�6V   $��2��6a   $��Center=�6n   �� 5#      -   5        $ employee_idTextBox��5#      $��1��62   $
��Left=�6B   $��23��6]   $��3q�6i   $��2��6t   $��Center=�6�   $	��120��6   ��6�   �� *employee_id+$ TwoWay=� . 	 . 6   �� 5$      $��location id:��6   $��0��6+   $
��Left=�6;   $��3q�6V   $��3��6a   $��Center=�6n   �� 5%      -   5        $ location_idTextBox��5%      $��1��62   $
��Left=�6B   $��23��6]   $��3q�6i   $��3��6t   $��Center=�6�   $	��120��6   ��6�   �� *location_id+$ TwoWay=� . 	 . 6   �� 5&      $��	order id:��6   $��0��6(   $
��Left=�68   $��3q�6S   $��4��6^   $��Center=�6k   �� 5'      -   5        $ order_idTextBox��5'      $��1��6/   $
��Left=�6?   $��23��6Z   $��3q�6f   $��4��6q   $��Center=�6�   $	��120��6�   ��6~   �� *
order_id+$ TwoWay=� . 	 . 6�   5(      &   System.Windows.Controls.DataGrid  5)   
   -   5        
  Name$
 ordersDataGrid��5)         AutoGenerateColumns .     EnableRowVirtualization . $��10,346,0,88q�6~   $��2��6�      RowDetailsVisibilityMode$ VisibleWhenSelected=�6�   ��6f   ��    Columns 5*      0  *System.Windows.Controls.DataGridTextColumn  5+      -	   5        album_idColumn��,  &System.Windows.Controls.DataGridColumn   Header$ album id��5+   Z      Width5  /System.Windows.Controls.DataGridLengthConverter$ SizeToHeader 6l   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6=   �� *
album_id+6l     5,      -
   5        client_idColumn��$ 	client id��5,   \   $ SizeToHeader 6o    6>   �� *	client_id+6o     5-      -   5        employee_idColumn��$ employee id��5-   `   $ SizeToHeader 6u    6@   �� *employee_id+6u     5.      -   5        location_idColumn��$ location id��5.   `   $ SizeToHeader 6u    6@   �� *location_id+6u     5/      -   5        order_idColumn��$ order id��5/   Z   $ SizeToHeader 6l    6=   �� *
order_id+6l   51      52      53      