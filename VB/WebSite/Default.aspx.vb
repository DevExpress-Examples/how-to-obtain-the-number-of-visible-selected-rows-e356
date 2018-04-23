#Region "Using"

Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
#End Region

Partial Public Class Grid_Selection_VisibleSelectedCount_Default
	Inherits System.Web.UI.Page

	Public Function GetVisibleSelectedRowCount() As Integer
		Dim size As Integer = grid.SettingsPager.PageSize
		Dim firstIndex As Integer = size * grid.PageIndex
		Dim lastIndex As Integer = firstIndex + size
		Dim result As Integer = 0
		For i As Integer = firstIndex To lastIndex
			If grid.Selection.IsRowSelected(i) Then
				result += 1
			End If
		Next i
		Return result
	End Function

	Protected Sub grid_CustomDataCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomDataCallbackEventArgs)
		If e.Parameters = "VisSel" Then
			e.Result = GetVisibleSelectedRowCount()
		End If
	End Sub

End Class
