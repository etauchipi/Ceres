Imports System.Web.Optimization
Imports System.Globalization
Imports System.Threading
Imports System.Web.Routing

Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(sender As Object, e As EventArgs)
        ' Se desencadena al iniciar la aplicación

        Dim newCulture As CultureInfo

        RouteConfig.RegisterRoutes(RouteTable.Routes)
        BundleConfig.RegisterBundles(BundleTable.Bundles)

        newCulture = System.Threading.Thread.CurrentThread.CurrentCulture.Clone()
        newCulture.DateTimeFormat.ShortDatePattern = "dd-MMM-yyyy"
        newCulture.DateTimeFormat.DateSeparator = "-"
        newCulture.NumberFormat.CurrencyDecimalDigits = 2
        newCulture.NumberFormat.CurrencyDecimalSeparator = "."
        newCulture.NumberFormat.CurrencyGroupSeparator = ","
        newCulture.NumberFormat.NumberDecimalSeparator = "."
        newCulture.NumberFormat.NumberGroupSeparator = ","

        Thread.CurrentThread.CurrentCulture = newCulture
        RegisterRoutes(RouteTable.Routes)

    End Sub

    Shared Sub RegisterRoutes(ByVal routes As RouteCollection)

        routes.MapPageRoute("Home", "Home", "~/default.aspx")

    End Sub
End Class