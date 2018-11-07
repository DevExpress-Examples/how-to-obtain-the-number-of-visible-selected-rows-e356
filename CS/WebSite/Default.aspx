<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Selection_VisibleSelectedCount_Default" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>How to obtain the number of visible selected rows</title>
<script type="text/javascript">
function onCallback(result) {
	alert(result);
}
</script>    
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<%-- BeginRegion ASPxGridView --%>
		<dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"
			DataSourceID="AccessDataSource1" KeyFieldName="ProductID" ClientInstanceName="grid" OnCustomDataCallback="grid_CustomDataCallback">
			<Columns>
				<dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
				</dxwgv:GridViewCommandColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
			</Columns>
		</dxwgv:ASPxGridView>
		<%-- EndRegion --%>
		<br />
		<input type="button" value="Get visible selected row count" onclick="grid.GetValuesOnCustomCallback('VisSel', onCallback);" />
		<%-- BeginRegion AccessDataSource --%>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [ProductName], [ProductID], [UnitPrice] FROM [Products]"></asp:AccessDataSource>    
		<%-- EndRegion --%>
    </div>
    </form>
</body>
</html>
