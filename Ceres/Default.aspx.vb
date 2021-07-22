
Imports Microsoft.Reporting.WebForms
Imports System.Drawing
Imports wsCeresProxy.wsCeres

Public Class _Default
    Inherits Page

    Private sCadena As String
    Private sds As String
    Private Compresion As Compresion.Compresion
    Private appProxy As wsCeresProxy.IwsCeresClient
    Private fFormato As AppGeneral.AppGeneral.FormatoFecha
    Private ds As DataSet
    Private dse As DataSet
    Private dst As DataSet
    Private ldtParams As dtParams

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Me.Title = "Ceres - Clínica de la Mujer"
            inicializa_ctrls()
            reiniciar()

        End If

    End Sub

    Private Sub inicializa_ctrls()

        CargaConceptos()
        CargaEmpresas()
        cargaAnos()

    End Sub

    Protected Sub bt_buscar_Click(sender As Object, e As EventArgs) Handles bt_buscar.Click

        Dim sds As String
        Dim rds As ReportDataSource

        ds = New DataSet
        sds = String.Empty
        Compresion = New Compresion.Compresion
        appProxy = New wsCeresProxy.IwsCeresClient
        ldtParams = New dtParams

        inicie_Param(ldtParams)
        carga_Param(ldtParams)

        Try
            sds = appProxy.get_data(ldtParams)
        Catch ex As Exception
            sds = String.Empty
        Finally
            'Mensaje de error
        End Try

        If sds <> String.Empty Then
            Try
                ds = Compresion.DescomprimirDataset(sds)
            Catch ex As Exception
                sds = String.Empty
            Finally
            End Try
        End If

        If sds <> String.Empty Then
            Try

                rds = New ReportDataSource
                rptv_cargos.ProcessingMode = ProcessingMode.Local
                rptv_cargos.LocalReport.ReportEmbeddedResource = "Ceres.rpt_cargos.rdlc"
                rptv_cargos.LocalReport.DataSources.Clear()
                rptv_cargos.LocalReport.DataSources.Add(rds)
                rptv_cargos.LocalReport.DataSources(0).Name = "DataSet1"
                rptv_cargos.LocalReport.DataSources(0).Value = ds.Tables(0)
                rptv_cargos.LocalReport.DataSources(0).DataMember = "Table1"
                rptv_cargos.LocalReport.Refresh()

            Catch ex As Exception
                rptv_cargos.LocalReport.Dispose()

            Finally
            End Try

        End If

        'reiniciar()

    End Sub

    Private Sub reiniciar()

        tb_documento.Text = String.Empty
        tb_historia.Text = String.Empty
        tb_identifica.Text = String.Empty
        tb_ingreso.Text = String.Empty
        lb_concepto.SelectedIndex = -1
        lb_empresa.SelectedIndex = -1
        lb_estado.SelectedIndex = -1
        lb_facturado.SelectedValue = 0
        cargaAnos()
        rptv_cargos.LocalReport.Dispose()
        bt_buscar.Enabled = True

    End Sub

    Private Sub inicie_Param(ByRef ldtParams As dtParams)

        ldtParams.desde = CType("1900-01-01", Date)
        ldtParams.hasta = CType("1900-01-01", Date)
        ldtParams.historia = 0
        ldtParams.ingreso = 0
        ldtParams.documento = 0
        ldtParams.identificacion = "-"
        ldtParams.concepto = "-"
        ldtParams.empresa = "-"
        ldtParams.facturado = 0
        ldtParams.filtro = 0
        bt_buscar.Enabled = False

    End Sub

    Private Sub carga_Param(ByRef ldtParams As dtParams)

        Dim sCadena As String
        Dim nnum As Integer
        Dim ndays As Integer

        sCadena = String.Empty
        nnum = 0
        ndays = 0

        If ((lb_anod.SelectedValue > 0) And (lb_mesd.SelectedValue > 0) And (lb_diad.SelectedValue > 0)) Then
            If ((lb_anoh.SelectedValue > 0) And (lb_mesh.SelectedValue > 0) And (lb_diah.SelectedValue > 0)) Then
                ldtParams.desde = New Date(lb_anod.SelectedValue, lb_mesd.SelectedValue, lb_diad.SelectedValue)
                ldtParams.hasta = New Date(lb_anoh.SelectedValue, lb_mesh.SelectedValue, lb_diah.SelectedValue)
            Else
                ldtParams.desde = CType("1900-01-01", Date)
                ldtParams.hasta = CType("1900-01-01", Date)
            End If
            'ldtParams.desde = New Date(lb_anod.SelectedValue, lb_mesd.SelectedValue, lb_diad.SelectedValue)
        Else
            ldtParams.desde = CType("2000-01-01", Date)
            ldtParams.hasta = Now() 'CType("1900-01-01", Date)
        End If

        nnum = Val(Trim(tb_historia.Text))
        ldtParams.historia = IIf(nnum > 0, nnum, 0)

        nnum = Val(Trim(tb_ingreso.Text))
        ldtParams.ingreso = IIf(nnum > 0, nnum, 0)

        nnum = Val(Trim(tb_documento.Text))
        ldtParams.documento = IIf(nnum > 0, nnum, 0)

        sCadena = String.Empty
        sCadena = Trim(lb_concepto.SelectedValue)
        nnum = Len(sCadena)
        ldtParams.concepto = IIf(nnum > 0, sCadena, "-")

        sCadena = String.Empty
        sCadena = Trim(lb_empresa.SelectedValue)
        nnum = Len(sCadena)
        ldtParams.empresa = IIf(nnum > 0, sCadena, "-")

        sCadena = String.Empty
        sCadena = Trim(tb_identifica.Text)
        nnum = Len(sCadena)
        ldtParams.identificacion = IIf(nnum > 0, sCadena, "-")

        ldtParams.facturado = lb_facturado.SelectedValue

        ldtParams.filtro = 0 'No lleva ningún filtro

        nnum = Val(Trim(lb_estado.SelectedValue))
        ldtParams.estado = IIf(nnum > 0, nnum, 0)

        ndays = (ldtParams.hasta - ldtParams.desde).Days

        'If (ndays > 90) Then
        'Response.Redirect("~\Home")
        'End If

    End Sub

    Sub CargaConceptos()

        Dim sds As String
        Dim li As ListItem

        dst = New DataSet
        sds = String.Empty
        Compresion = New Compresion.Compresion
        appProxy = New wsCeresProxy.IwsCeresClient

        Try
            sds = appProxy.Get_conceptos()
        Catch ex As Exception
            sds = String.Empty
        Finally
            'Mensaje de error
        End Try

        If sds <> String.Empty Then
            Try
                dst = Compresion.DescomprimirDataset(sds)
            Catch ex As Exception
                sds = String.Empty
            Finally
            End Try
        End If

        If sds <> String.Empty Then

            lb_concepto.Items.Clear()
            li = New ListItem("Seleccione..", "")
            lb_concepto.Items.Add(li)

            For i As Integer = 0 To (dst.Tables(0).Rows.Count - 1) Step 1
                li = New ListItem(dst.Tables(0).Rows(i).Item("connom").ToString, dst.Tables(0).Rows(i).Item("concod").ToString)
                lb_concepto.Items.Add(li)
            Next

        End If

        lb_concepto.SelectedIndex = -1

    End Sub

    Sub CargaEmpresas()

        Dim sds As String
        Dim li As ListItem

        dse = New DataSet
        sds = String.Empty
        Compresion = New Compresion.Compresion
        appProxy = New wsCeresProxy.IwsCeresClient

        Try
            sds = appProxy.Get_empresas()
        Catch ex As Exception
            sds = String.Empty
        Finally
            'Mensaje de error
        End Try

        If sds <> String.Empty Then
            Try
                dse = Compresion.DescomprimirDataset(sds)
            Catch ex As Exception
                sds = String.Empty
            Finally
            End Try
        End If

        If sds <> String.Empty Then

            lb_empresa.Items.Clear()
            li = New ListItem("Seleccione..", "")
            lb_empresa.Items.Add(li)

            For i As Integer = 0 To (dse.Tables(0).Rows.Count - 1) Step 1
                li = New ListItem(dse.Tables(0).Rows(i).Item("empnom").ToString, dse.Tables(0).Rows(i).Item("empcod").ToString)
                lb_empresa.Items.Add(li)
            Next

        End If

        lb_empresa.SelectedIndex = -1

    End Sub

    Sub cargaAnos()

        Dim litem As ListItem
        lb_anod.Items.Clear()
        lb_anoh.Items.Clear()

        lb_anod.Items.Add(New ListItem("Seleccione...", 0))
        lb_anoh.Items.Add(New ListItem("Seleccione...", 0))

        For n As Integer = Now().Date.Year To (Now().Date.Year - 10) Step -1
            litem = New ListItem(n, n)
            lb_anod.Items.Add(litem)
            lb_anoh.Items.Add(litem)
        Next

    End Sub
    Protected Sub bt_limpiar_Click(sender As Object, e As EventArgs) Handles bt_limpiar.Click

        Response.Redirect("~\Home")

    End Sub

End Class