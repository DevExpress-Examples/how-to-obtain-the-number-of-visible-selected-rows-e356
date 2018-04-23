#region Using
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
#endregion

public partial class Grid_Selection_VisibleSelectedCount_Default : System.Web.UI.Page {

	public int GetVisibleSelectedRowCount() {
		int size = grid.SettingsPager.PageSize;
		int firstIndex = size * grid.PageIndex;
		int lastIndex = firstIndex + size;
		int result = 0;
		for(int i = firstIndex; i <= lastIndex; i++) {
			if(grid.Selection.IsRowSelected(i))
				result++;
		}
		return result;
	}

	protected void grid_CustomDataCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomDataCallbackEventArgs e) {
		if(e.Parameters == "VisSel")
			e.Result = GetVisibleSelectedRowCount();	
	}

}
