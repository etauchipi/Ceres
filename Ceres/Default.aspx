<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb"  Inherits="Ceres._Default" ViewStateMode="Enabled" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            Consulta de cargos</h1>
        <p class="lead">Digite los datos en las casillas correspondientes y presione &quot;BUSCAR&quot;</p>
        <asp:UpdatePanel ID="updp_txtBuscar" runat="server">
            <ContentTemplate>
                <table class="nav-justified">
                    <tr>
                        <td style="width: 20%"><b>Historia</b></td>
                        <td style="width: 25%">
                            <asp:TextBox ID="tb_historia" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%"><b>Ingreso</b></td>
                        <td>
                            <asp:TextBox ID="tb_ingreso" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%"><b>Identificación</b></td>
                        <td style="width: 25%">
                            <asp:TextBox ID="tb_identifica" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%"><b>Cargo</b></td>
                        <td>
                            <asp:TextBox ID="tb_documento" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; height: 46px;"><b>Concepto</b></td>
                        <td style="height: 25%; width: 216px;">
                            <asp:ListBox ID="lb_concepto" runat="server" Rows="1" Width="90%" ViewStateMode="Enabled" CausesValidation="True"></asp:ListBox>
                        </td>
                        <td style="height: 20%; width: 168px;"><b>Empresa</b></td>
                        <td style="height: 25%">
                            <asp:ListBox ID="lb_empresa" runat="server" CausesValidation="True" Rows="1" ValidateRequestMode="Enabled" ViewStateMode="Enabled" Width="90%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; height: 46px;"><b>Cuenta</b></td>
                        <td style="height: 25%; width: 216px;">
                            <asp:ListBox ID="lb_estado" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="60%">
                                <asp:ListItem Value="0">Todas</asp:ListItem>
                                <asp:ListItem Value="1">Abierta</asp:ListItem>
                                <asp:ListItem Value="2">Cerrada</asp:ListItem>
                            </asp:ListBox>
                        </td>
                        <td style="height: 46px; width: 168px;"><b>Facturado</b></td>
                        <td style="height: 46px">
                            <asp:ListBox ID="lb_facturado" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="60%">
                                <asp:ListItem Value="0">Todas</asp:ListItem>
                                <asp:ListItem Value="1">Facturado</asp:ListItem>
                                <asp:ListItem Value="2">No facturado</asp:ListItem>
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; height: 46px;"><b>Fecha cargo Desde</b></td>
                        <td style="height: 25%; width: 216px;">
                            <asp:ListBox ID="lb_anod" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="60%"></asp:ListBox>
                            <br />
                            <asp:ListBox ID="lb_mesd" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="60%">
                                <asp:ListItem Value="-1">Seleccione...</asp:ListItem>
                                <asp:ListItem Value="1">Enero</asp:ListItem>
                                <asp:ListItem Value="2">Febrero</asp:ListItem>
                                <asp:ListItem Value="3">Marzo</asp:ListItem>
                                <asp:ListItem Value="4">Abril</asp:ListItem>
                                <asp:ListItem Value="5">Mayo</asp:ListItem>
                                <asp:ListItem Value="6">Junio</asp:ListItem>
                                <asp:ListItem Value="7">Julio</asp:ListItem>
                                <asp:ListItem Value="8">Agosto</asp:ListItem>
                                <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:ListBox>
                            <br />
                            <asp:ListBox ID="lb_diad" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="40%">
                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                            </asp:ListBox>
                        </td>
                        <td style="height: 20%; width: 168px;"><b>Fecha cargo Hasta</b></td>
                        <td style="height: 25%">
                            <asp:ListBox ID="lb_anoh" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="60%"></asp:ListBox>
                            <br />
                            <asp:ListBox ID="lb_mesh" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="60%">
                                <asp:ListItem Value="-1">Seleccione...</asp:ListItem>
                                <asp:ListItem Value="1">Enero</asp:ListItem>
                                <asp:ListItem Value="2">Febrero</asp:ListItem>
                                <asp:ListItem Value="3">Marzo</asp:ListItem>
                                <asp:ListItem Value="4">Abril</asp:ListItem>
                                <asp:ListItem Value="5">Mayo</asp:ListItem>
                                <asp:ListItem Value="6">Junio</asp:ListItem>
                                <asp:ListItem Value="7">Julio</asp:ListItem>
                                <asp:ListItem Value="8">Agosto</asp:ListItem>
                                <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:ListBox>
                            <br />
                            <asp:ListBox ID="lb_diah" runat="server" CausesValidation="True" Rows="1" ViewStateMode="Enabled" Width="40%">
                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                            </asp:ListBox>
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_buscar" runat="server" Text="Buscar" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_limpiar" runat="server" Text="Limpiar" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lb_empresa" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="lb_concepto" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="bt_buscar" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <div class="row" >
        <div class="col-md-4">
        <asp:UpdatePanel ID="updp_data" runat="server" RenderMode="Block">
            
            <ContentTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <rsweb:ReportViewer ID="rptv_cargos" runat="server" ShowCredentialPrompts="False" ShowRefreshButton="False" SizeToReportContent="True" ToolTip="Cargos no facturados" Width="95%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                    

 
                </rsweb:ReportViewer>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="rptv_cargos" EventName="ReportRefresh" />
                <asp:AsyncPostBackTrigger ControlID="rptv_cargos" EventName="Load" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
        <div class="col-md-4">
        </div>
    </div>

</asp:Content>

