using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DobraNutkaApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            System.Windows.Data.CollectionViewSource ordersViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("ordersViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            // ordersViewSource.Source = [generic data source]
            System.Windows.Data.CollectionViewSource artistsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("artistsViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            // artistsViewSource.Source = [generic data source]
            System.Windows.Data.CollectionViewSource showClients_ResultViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("showClients_ResultViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            // showClients_ResultViewSource.Source = [generic data source]
        }
    }
}
